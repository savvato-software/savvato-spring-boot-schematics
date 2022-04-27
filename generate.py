#!/usr/bin/env python3

import argparse
import datetime
import subprocess

from stringutils import StringUtils;
from m4nicator import m4nicator;
from output_writer import outputWriter;

######################################################################
#
# Spring Boot Schematics
#
# ~/src/savvato-schematics/savvato-spring-boot-schematics/generate.py --package=org.haxwell.votingapp --name=Topic
#
# This will generate the CRUD necessary to add a domain object to the backend.
#
# APPLICATION ARCHITECTURE:
#   We use m4 to process template files into java source code, xml, etc.
#
#   This script has a list of m4 files, and the associated output file. For each element in the list, it calls the m4
#   processor for the file, and then saves its output using another function.
#
#   You should run this from the project root (the dir containing ./src/main/java)
#
#####

parser = argparse.ArgumentParser(conflict_handler='resolve')
parser.add_argument("--package")
parser.add_argument("--name")
parser.add_argument("--databasename")

args = parser.parse_args()

if vars(args)["package"] is not None and vars(args)["name"] is not None and vars(args)["databasename"] is not None:

    package = vars(args)["package"]
    name = vars(args)["name"]
    databaseName = vars(args)["databasename"]

    name_lowerCamelCase = StringUtils.getLowerCamelCase(name)
    name_upperCamelCase = StringUtils.getCapitalCamelCase(name)

    mmddyy = datetime.datetime.now().strftime('%y%m%d%H%M%S');

    prepath = "src/main/java/" + package.replace(".","/")


    pathPairs = []
    pathPairs.append(('/controllers/APIController.m4', prepath + '/controllers/' + name_upperCamelCase + "APIController.java"))
    pathPairs.append(('/controllers/dto/Request.m4', prepath + '/controllers/dto/' + name_upperCamelCase + "Request.java"))
    pathPairs.append(('/dto/DTO.m4', prepath + '/dto/' + name_upperCamelCase + "DTO.java"))
    pathPairs.append(('/repositories/Repository.m4', prepath + '/repositories/' + name_upperCamelCase + "Repository.java"))
    pathPairs.append(('/services/Service.m4', prepath + '/services/' + name_upperCamelCase + "Service.java"))
    pathPairs.append(('/services/ServiceImpl.m4', prepath + '/services/' + name_upperCamelCase + "ServiceImpl.java"))
    pathPairs.append(('/entities/entity.m4', prepath + '/entities/' + name_upperCamelCase + ".java"))

    # TODO also need to update the main changelog.xml file with this new addition.
    pathPairs.append(('/migrations/liquibase.m4', 'src/main/resources/db/migration/changelog-' + mmddyy + '.xml'))

    for i in pathPairs:
        m4Path = i[0]
        output = m4nicator.doIt(m4Path, package, name_lowerCamelCase, name_upperCamelCase, databaseName)

        outputWriter.doIt(output.stdout.decode("utf-8"), i[1])

    command = "sed -i '/^<\/databaseChangeLog>/i \t<include file=\"changelog-" + mmddyy + ".xml\"    relativeToChangelogFile=\"true\"\/>' src/main/resources/db/migration/changelog-master.xml"

    print(command);
    output = subprocess.run(command, capture_output=True, shell=True)

else:
    print("\npackage, name, and databasename parameters are all required.\n")


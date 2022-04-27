import os
import subprocess

class m4nicator:

    def doIt(m4Path, package, name_lowercase, name_uppercase, databasename) :
        # os.chdir(config[reponame]["path"])
        main_script_path = os.path.dirname(os.path.realpath(__file__))
        command = "m4 -DPACKAGE=" + package + " -DDATABASENAME=" + databasename + " -DOBJNAME_LOWERCAMELCASE=" + name_lowercase + " -DOBJNAME_CAPITALCAMELCASE=" + name_uppercase + " < " + main_script_path + m4Path

        print(command);
        output = subprocess.run(command, capture_output=True, shell=True)

        print("===== " )
        print(output.stdout.decode("utf-8"))

        return output

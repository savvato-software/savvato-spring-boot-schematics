<?xml version="1.0" encoding="UTF-8"?>
<databaseChangeLog
  xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
                      http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.1.xsd">

	<changeSet author="savvato-spring-boot-schematics" id="vDATE-1">
		<createTable tableName="OBJNAME_LOWERCAMELCASE" catalogName="DATABASENAME" >
			<column name="id" type="BIGINT(20)" autoIncrement="true">
				<constraints nullable="false" primaryKey="true"/>
			</column>
			<column name="user_id" type="BIGINT(20)">
                <constraints nullable="false" foreignKeyName="OBJNAME_LOWERCAMELCASE()_fk1" references="user(id)"/>
			</column>
			<column name="name" type="VARCHAR(128)">
				<constraints nullable="false"/>
			</column>
			<column name="description" type="VARCHAR(4096)">
				<constraints nullable="false"/>
			</column>
            <column name="created" type="DATETIME" defaultValueComputed="CURRENT_TIMESTAMP">
            	<constraints nullable="false"/>
            </column>
            <column name="last_updated" type="DATETIME" defaultValueComputed="CURRENT_TIMESTAMP">
            	<constraints nullable="false"/>
            </column>
		</createTable>
    </changeSet>

  	<changeSet author="savvato-spring-boot-schematics" id="vDATE-2" context="test">
		<sql dbms="mysql">
			insert into OBJNAME_LOWERCAMELCASE (id, user_id, name, description, created, last_updated) values (1, 1, "OBJNAME_CAPITALCAMELCASE 1", "OBJNAME_CAPITALCAMELCASE 1 Desc", NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY);
			insert into OBJNAME_LOWERCAMELCASE (id, user_id, name, description, created, last_updated) values (2, 1, "OBJNAME_CAPITALCAMELCASE 2", "OBJNAME_CAPITALCAMELCASE 2 Desc", NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY);
			insert into OBJNAME_LOWERCAMELCASE (id, user_id, name, description, created, last_updated) values (3, 1, "OBJNAME_CAPITALCAMELCASE 3", "OBJNAME_CAPITALCAMELCASE 3 Desc", NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY);
		</sql>
	</changeSet>

</databaseChangeLog>


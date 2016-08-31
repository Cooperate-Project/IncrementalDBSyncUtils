#Hibernate MySQL Trigger Generator

This utility tool takes a xml file, generated by Hibernate (*hibernate.hbm.xml*) and generates a sql file.
This sql-file contains statements to create triggers and tables to listen to changes in the database persistence.

##Usage

You can get this help dialog by executing: `java -jar HibernateTrigger.jar --help`.
Although this tool is written in Scala, the library is embedded - you'll only need the JAVA 8 JRE.

```
Hibernate XML to SQL Trigger Generator
Usage: HibernateTrigger [options] <input xml> <output sql>

  <input xml>              Specify input hibernate xml file
  <output sql>             Specify output sql file
  -p, --prefix <prefix>    Table and trigger name prefix in database
  -c, --clear              Creates statements to empty all trigger tables
  -v, --verbose            Enables detailed console output
  -d, --debug <file>       Prints all parsed Tables and Columns into an debug file
  -e, --exclude <type>,<type>,...
                           Does not print specific hibernate-types (ID, Property, ManyToOne, Bag, CompositeID). Default: Bag
  -r, --reset              Creates statements to drop all tables and triggers
```
import java.io.{File, PrintWriter}

import parser.HibernateTypes.HibernateTypes
import parser.{HibernateTypes, Parser}
import trigger.Trigger

object HibernateTrigger {

  implicit val excludeRead: scopt.Read[HibernateTypes.Value] =
    scopt.Read.reads(HibernateTypes withName _.toLowerCase)
  val argsParser = new scopt.OptionParser[Config]("HibernateTrigger") {
    head("Hibernate XML to SQL Trigger Generator")

    arg[File]("<input xml>").required().action((x, c) =>
      c.copy(inputFile = x)).
      validate(x => if (x.exists()) success else failure("Input file not found")).
      text("Specify input hibernate xml file")

    arg[File]("<output sql>").optional().action((x, c) =>
      c.copy(outputFile = x)).text("Specify output sql file")

    opt[String]('p', "prefix").valueName("<prefix>").action((x, c) =>
      c.copy(prefix = x)).text("Table and trigger name prefix in database")

    opt[Unit]('c', "clear").action((_, c) =>
      c.copy(clear = true)).text("Creates statements to empty all trigger tables")

    opt[Unit]('v', "verbose").action((_, c) =>
      c.copy(verbose = true)).text("Enables detailed console output")

    opt[File]('d', "debug").valueName("<file>").action((x, c) =>
      c.copy(debug = x)).text("Prints all parsed Tables and Columns into an debug file")

    opt[Seq[HibernateTypes]]('e', "exclude").valueName("<type>,<type>,...").action((x, c) =>
      c.copy(exclude = x)).text("Does not print specific hibernate-types (ID, Property, ManyToOne, Bag)")

    opt[Unit]('r', "reset").action((_, c) =>
      c.copy(reset = true)).text("Creates statements to drop all tables and triggers")

    help("help").hidden().text("prints help")

  }

  def main(args: Array[String]): Unit = {

    argsParser.parse(args, Config()) match {
      case None => // argument fail
      case Some(config) =>

        // Create Parser and parse hibernate xml
        println("Step 1 of 3: Parsing Hibernate XML File")
        val parser = new Parser(config.inputFile, config.verbose)
        val tables = parser.parseXML

        if (config.debug != null)
          saveDebugOutput(tables, config.debug)

        // Create Trigger Objects
        println("Step 2 of 3: Creating Triggers")
        val triggers = for (table <- tables) yield new Trigger(table)


        // TODO

        // Create Statements
        println("Step 3 of 3: Writing SQL File")

      // TODO

    }


  }

  private def saveDebugOutput(tables: List[parser.Table], debugFile: File): Unit = {

    println("Generating Debug Output...")

    var outputString: String = "Info: The Debug Output ignores the exclude-flag!\n"

    for (table <- tables) {

      outputString += "\n" + table.tableName

      outputString += "\n\tbags:\t\t"
      for (bag <- table.bags) outputString += bag + ", "

      outputString += "\n\tids:\t\t"
      for (id <- table.ids) outputString += id + ", "

      outputString += "\n\tproperties:\t"
      for (prop <- table.properties) outputString += prop + ", "

      outputString += "\n\tonetomanys:\t"
      for (otm <- table.manyToOnes) outputString += otm + ", "

    }

    println("Generated Debug File. Saving now...")

    try {
      new PrintWriter(debugFile) {
        write(outputString)
        close()
      }
      println("Saved debug file to " + debugFile.getAbsolutePath)
    } catch {
      case e: Exception => println("ERROR while saving debug file!")
    }

  }


  case class Config(prefix: String = "",
                    clear: Boolean = false,
                    verbose: Boolean = false,
                    debug: File = null,
                    exclude: Seq[HibernateTypes] = Seq(),
                    reset: Boolean = false,
                    inputFile: File = null,
                    outputFile: File = null
                   )

}

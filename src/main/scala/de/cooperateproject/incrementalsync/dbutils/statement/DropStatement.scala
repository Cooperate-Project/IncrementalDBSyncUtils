package de.cooperateproject.incrementalsync.dbutils.statement

import de.cooperateproject.incrementalsync.dbutils.statement.DropTypes.DropTypes

/**
  * A sql de.cooperateproject.incrementalsync.dbutils.statement to drop a table or a de.cooperateproject.incrementalsync.dbutils.trigger.
  *
  * @param name     the name of the table or de.cooperateproject.incrementalsync.dbutils.trigger
  * @param dropType the typ of the drop de.cooperateproject.incrementalsync.dbutils.statement (TABLE or TRIGGER)
  */
class DropStatement(val name: String, val dropType: DropTypes) extends Statement {

  /**
    * Creates the textual representation of the sql de.cooperateproject.incrementalsync.dbutils.statement for MySQL Database Systems.
    *
    * @return A String, ready to be executed.
    */
  override def toString: String = "DROP " + dropType.toString + " IF EXISTS `" + name + "`;"

}

/**
  * Represents the types of a drop de.cooperateproject.incrementalsync.dbutils.statement.
  */
object DropTypes extends Enumeration {
  type DropTypes = Value
  val TABLE, TRIGGER, EVENT = Value
}
package statement

import statement.TriggerTypes.TriggerTypes

class CreateTriggerStatement(val triggerName: String,
                             val triggerType: TriggerTypes,
                             val tableName: String,
                             val forEachRow: Boolean,
                             val code: String) extends Statement {

  override def toString: String = {
    var returnString = "DELIMITER $\nCREATE TRIGGER `" + triggerName + "` AFTER " +
      triggerType.toString + " ON `" + tableName + "`\n"

    if (forEachRow) returnString += "FOR EACH ROW\n"

    returnString += "BEGIN\n" + code + "\nEND $\nDELIMITER ;"

    returnString
  }

}

object TriggerTypes extends Enumeration {
  type TriggerTypes = Value
  val UPDATE, INSERT, DELETE = Value
}

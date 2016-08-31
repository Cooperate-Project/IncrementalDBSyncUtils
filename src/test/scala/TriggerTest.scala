import org.scalatest.FunSuite
import parser.{HibernateTypes, Table}
import trigger.Trigger

class TriggerTest extends FunSuite {

  val testTable = new Table("tableName", List("ID"), List("propA", "propB"), List("mto"), List("myBag", "yourBag"), List())

  test("A trigger creates three Create- and four Drop-Statements.") {
    val trigger = new Trigger(testTable, "t_", Seq())

    assert(trigger.getCreateTriggerStatements.length == 3)
    assert(trigger.getDropStatements.length == 4)
  }


  test("The created update trigger works with column names.") {

    val trigger = new Trigger(testTable, "t_", Seq())

    val updateTriggerStatement = trigger.getCreateTriggerStatements(1).toString

    assert(updateTriggerStatement.contains("ID") && updateTriggerStatement.contains("propA"))
  }

  test("The created update trigger excludes HibernateTypes correctly!") {

    val trigger = new Trigger(testTable, "t_", Seq(HibernateTypes.property, HibernateTypes.manytoone))

    val updateTriggerStatement = trigger.getCreateTriggerStatements(1).toString

    assert(!updateTriggerStatement.contains("propA"))
    assert(!updateTriggerStatement.contains("mto"))
  }


}

/*------------------------------------------------------------*/
/* Generated by HibernateTrigger (Sebastian Hahner)           */
/* Created on: Wed Aug 10 18:33:18 CEST 2016                  */
/* DBMS      : MySql                                          */
/* Notes     : Creates Tables and Triggers from Hibernate XML */
/*------------------------------------------------------------*/


DROP TABLE IF EXISTS `ht_t_attribute`;

DROP TRIGGER IF EXISTS `ht_t_attributeTrigger`;

DROP TABLE IF EXISTS `ht_t_attributeconstraints`;

DROP TRIGGER IF EXISTS `ht_t_attributeconstraintsTrigger`;

DROP TABLE IF EXISTS `ht_t_attributetag`;

DROP TRIGGER IF EXISTS `ht_t_attributetagTrigger`;

DROP TABLE IF EXISTS `ht_t_connector`;

DROP TRIGGER IF EXISTS `ht_t_connectorTrigger`;

DROP TABLE IF EXISTS `ht_t_diagram`;

DROP TRIGGER IF EXISTS `ht_t_diagramTrigger`;

DROP TABLE IF EXISTS `ht_t_diagramlinks`;

DROP TRIGGER IF EXISTS `ht_t_diagramlinksTrigger`;

DROP TABLE IF EXISTS `ht_t_diagramobjects`;

DROP TRIGGER IF EXISTS `ht_t_diagramobjectsTrigger`;

DROP TABLE IF EXISTS `ht_t_object`;

DROP TRIGGER IF EXISTS `ht_t_objectTrigger`;

DROP TABLE IF EXISTS `ht_t_operation`;

DROP TRIGGER IF EXISTS `ht_t_operationTrigger`;

DROP TABLE IF EXISTS `ht_t_operationparams`;

DROP TRIGGER IF EXISTS `ht_t_operationparamsTrigger`;

DROP TABLE IF EXISTS `ht_t_package`;

DROP TRIGGER IF EXISTS `ht_t_packageTrigger`;

CREATE TABLE `ht_t_attribute`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_attributeTrigger` AFTER UPDATE ON `t_attribute`
FOR EACH ROW
  BEGIN
    IF NEW.Object_ID <> OLD.Object_ID OR
       NEW.AllowDuplicates <> OLD.AllowDuplicates OR
       NEW.ea_guid <> OLD.ea_guid OR
       NEW.Classifier <> OLD.Classifier OR
       NEW.Container <> OLD.Container OR
       NEW.Containment <> OLD.Containment OR
       NEW.Default <> OLD.Default OR
       NEW.IsCollection <> OLD.IsCollection OR
       NEW.Const <> OLD.Const OR
       NEW.Derived <> OLD.Derived OR
       NEW.IsOrdered <> OLD.IsOrdered OR
       NEW.IsStatic <> OLD.IsStatic OR
       NEW.Length <> OLD.Length OR
       NEW.LowerBound <> OLD.LowerBound OR
       NEW.Name <> OLD.Name OR
       NEW.Notes <> OLD.Notes OR
       NEW.Pos <> OLD.Pos OR
       NEW.Precision <> OLD.Precision OR
       NEW.Scale <> OLD.Scale OR
       NEW.Stereotype <> OLD.Stereotype OR
       NEW.Style <> OLD.Style OR
       NEW.StyleEx <> OLD.StyleEx OR
       NEW.Type <> OLD.Type OR
       NEW.UpperBound <> OLD.UpperBound OR
       NEW.Scope <> OLD.Scope OR
       NEW.GenOption <> OLD.GenOption OR
       NEW.ID <> OLD.ID OR
       NEW.ID <> OLD.ID OR
       NEW.ElementID <> OLD.ElementID
    THEN
      REPLACE INTO ht_t_attribute VALUES (OLD.ID, NOW());
    END IF;
  END;

CREATE TABLE `ht_t_attributeconstraints`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_attributeconstraintsTrigger` AFTER UPDATE ON `t_attributeconstraints`
FOR EACH ROW
  BEGIN
    IF NEW.Object_ID <> OLD.Object_ID OR
       NEW.AttName <> OLD.AttName OR
       NEW.Notes <> OLD.Notes OR
       NEW.Type <> OLD.Type
    THEN
      REPLACE INTO ht_t_attributeconstraints VALUES (OLD.Object_ID, NOW());
    END IF;
  END;

CREATE TABLE `ht_t_attributetag`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_attributetagTrigger` AFTER UPDATE ON `t_attributetag`
FOR EACH ROW
  BEGIN
    IF NEW.ElementID <> OLD.ElementID OR
       NEW.Property <> OLD.Property OR
       NEW.NOTES <> OLD.NOTES OR
       NEW.ea_guid <> OLD.ea_guid OR
       NEW.VALUE <> OLD.VALUE OR
       NEW.PropertyID <> OLD.PropertyID
    THEN
      REPLACE INTO ht_t_attributetag VALUES (OLD.PropertyID, NOW());
    END IF;
  END;

CREATE TABLE `ht_t_connector`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_connectorTrigger` AFTER UPDATE ON `t_connector`
FOR EACH ROW
  BEGIN
    IF NEW.Start_Object_ID <> OLD.Start_Object_ID OR
       NEW.End_Object_ID <> OLD.End_Object_ID OR
       NEW.ea_guid <> OLD.ea_guid OR
       NEW.Direction <> OLD.Direction OR
       NEW.PtEndX <> OLD.PtEndX OR
       NEW.PtEndY <> OLD.PtEndY OR
       NEW.EventFlags <> OLD.EventFlags OR
       NEW.IsLeaf <> OLD.IsLeaf OR
       NEW.IsRoot <> OLD.IsRoot OR
       NEW.IsSpec <> OLD.IsSpec OR
       NEW.Name <> OLD.Name OR
       NEW.Notes <> OLD.Notes OR
       NEW.RouteStyle <> OLD.RouteStyle OR
       NEW.SeqNo <> OLD.SeqNo OR
       NEW.PtStartX <> OLD.PtStartX OR
       NEW.PtStartY <> OLD.PtStartY OR
       NEW.ActionFlags <> OLD.ActionFlags OR
       NEW.StateFlags <> OLD.StateFlags OR
       NEW.Stereotype <> OLD.Stereotype OR
       NEW.StyleEx <> OLD.StyleEx OR
       NEW.SubType <> OLD.SubType OR
       NEW.Connector_Type <> OLD.Connector_Type OR
       NEW.VirtualInheritance <> OLD.VirtualInheritance OR
       NEW.SourceCard <> OLD.SourceCard OR
       NEW.SourceAccess <> OLD.SourceAccess OR
       NEW.SourceElement <> OLD.SourceElement OR
       NEW.SourceRole <> OLD.SourceRole OR
       NEW.SourceRoleType <> OLD.SourceRoleType OR
       NEW.SourceRoleNote <> OLD.SourceRoleNote OR
       NEW.SourceContainment <> OLD.SourceContainment OR
       NEW.SourceIsAggregate <> OLD.SourceIsAggregate OR
       NEW.SourceIsOrdered <> OLD.SourceIsOrdered OR
       NEW.SourceQualifier <> OLD.SourceQualifier OR
       NEW.SourceChangeable <> OLD.SourceChangeable OR
       NEW.SourceConstraint <> OLD.SourceConstraint OR
       NEW.SourceIsNavigable <> OLD.SourceIsNavigable OR
       NEW.SourceStereotype <> OLD.SourceStereotype OR
       NEW.SourceStyle <> OLD.SourceStyle OR
       NEW.SourceTS <> OLD.SourceTS OR
       NEW.DestCard <> OLD.DestCard OR
       NEW.DestAccess <> OLD.DestAccess OR
       NEW.DestElement <> OLD.DestElement OR
       NEW.DestRole <> OLD.DestRole OR
       NEW.DestRoleType <> OLD.DestRoleType OR
       NEW.DestRoleNote <> OLD.DestRoleNote OR
       NEW.DestContainment <> OLD.DestContainment OR
       NEW.DestIsAggregate <> OLD.DestIsAggregate OR
       NEW.DestIsOrdered <> OLD.DestIsOrdered OR
       NEW.DestQualifier <> OLD.DestQualifier OR
       NEW.DestChangeable <> OLD.DestChangeable OR
       NEW.DestConstraint <> OLD.DestConstraint OR
       NEW.DestIsNavigable <> OLD.DestIsNavigable OR
       NEW.DestStereotype <> OLD.DestStereotype OR
       NEW.DestStyle <> OLD.DestStyle OR
       NEW.DestTS <> OLD.DestTS OR
       NEW.Top_Start_Label <> OLD.Top_Start_Label OR
       NEW.Top_Mid_Label <> OLD.Top_Mid_Label OR
       NEW.Top_End_Label <> OLD.Top_End_Label OR
       NEW.Btm_Start_Label <> OLD.Btm_Start_Label OR
       NEW.Btm_Mid_Label <> OLD.Btm_Mid_Label OR
       NEW.Btm_End_Label <> OLD.Btm_End_Label OR
       NEW.Start_Edge <> OLD.Start_Edge OR
       NEW.End_Edge <> OLD.End_Edge OR
       NEW.HeadStyle <> OLD.HeadStyle OR
       NEW.LineStyle <> OLD.LineStyle OR
       NEW.DispatchAction <> OLD.DispatchAction OR
       NEW.PDATA1 <> OLD.PDATA1 OR
       NEW.PDATA2 <> OLD.PDATA2 OR
       NEW.PDATA3 <> OLD.PDATA3 OR
       NEW.PDATA4 <> OLD.PDATA4 OR
       NEW.PDATA5 <> OLD.PDATA5 OR
       NEW.Connector_ID <> OLD.Connector_ID
    THEN
      REPLACE INTO ht_t_connector VALUES (OLD.Connector_ID, NOW());
    END IF;
  END;

CREATE TABLE `ht_t_diagram`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_diagramTrigger` AFTER UPDATE ON `t_diagram`
FOR EACH ROW
  BEGIN
    IF NEW.Package_ID <> OLD.Package_ID OR
       NEW.Author <> OLD.Author OR
       NEW.CreatedDate <> OLD.CreatedDate OR
       NEW.cx <> OLD.cx OR
       NEW.cy <> OLD.cy OR
       NEW.ea_guid <> OLD.ea_guid OR
       NEW.Name <> OLD.Name OR
       NEW.Notes <> OLD.Notes OR
       NEW.Orientation <> OLD.Orientation OR
       NEW.Scale <> OLD.Scale OR
       NEW.Stereotype <> OLD.Stereotype OR
       NEW.StyleEx <> OLD.StyleEx OR
       NEW.Swimlanes <> OLD.Swimlanes OR
       NEW.Diagram_Type <> OLD.Diagram_Type OR
       NEW.Version <> OLD.Version OR
       NEW.Diagram_ID <> OLD.Diagram_ID OR
       NEW.DiagramID <> OLD.DiagramID OR
       NEW.Diagram_ID <> OLD.Diagram_ID
    THEN
      REPLACE INTO ht_t_diagram VALUES (OLD.Diagram_ID, NOW());
    END IF;
  END;

CREATE TABLE `ht_t_diagramlinks`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_diagramlinksTrigger` AFTER UPDATE ON `t_diagramlinks`
FOR EACH ROW
  BEGIN
    IF NEW.ConnectorID <> OLD.ConnectorID OR
       NEW.DiagramID <> OLD.DiagramID OR
       NEW.Geometry <> OLD.Geometry OR
       NEW.Hidden <> OLD.Hidden OR
       NEW.Path <> OLD.Path OR
       NEW.Style <> OLD.Style OR
       NEW.Instance_ID <> OLD.Instance_ID
    THEN
      REPLACE INTO ht_t_diagramlinks VALUES (OLD.Instance_ID, NOW());
    END IF;
  END;

CREATE TABLE `ht_t_diagramobjects`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_diagramobjectsTrigger` AFTER UPDATE ON `t_diagramobjects`
FOR EACH ROW
  BEGIN
    IF NEW.Diagram_ID <> OLD.Diagram_ID OR
       NEW.Object_ID <> OLD.Object_ID OR
       NEW.RectBottom <> OLD.RectBottom OR
       NEW.RectLeft <> OLD.RectLeft OR
       NEW.RectRight <> OLD.RectRight OR
       NEW.Sequence <> OLD.Sequence OR
       NEW.ObjectStyle <> OLD.ObjectStyle OR
       NEW.RectTop <> OLD.RectTop OR
       NEW.Instance_ID <> OLD.Instance_ID
    THEN
      REPLACE INTO ht_t_diagramobjects VALUES (OLD.Instance_ID, NOW());
    END IF;
  END;

CREATE TABLE `ht_t_object`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_objectTrigger` AFTER UPDATE ON `t_object`
FOR EACH ROW
  BEGIN
    IF NEW.Classifier <> OLD.Classifier OR
       NEW.Package_ID <> OLD.Package_ID OR
       NEW.ParentID <> OLD.ParentID OR
       NEW.Abstract <> OLD.Abstract OR
       NEW.ActionFlags <> OLD.ActionFlags OR
       NEW.Alias <> OLD.Alias OR
       NEW.Author <> OLD.Author OR
       NEW.Classifier_guid <> OLD.Classifier_guid OR
       NEW.Complexity <> OLD.Complexity OR
       NEW.CreatedDate <> OLD.CreatedDate OR
       NEW.ea_guid <> OLD.ea_guid OR
       NEW.EventFlags <> OLD.EventFlags OR
       NEW.GenFile <> OLD.GenFile OR
       NEW.Genlinks <> OLD.Genlinks OR
       NEW.GenType <> OLD.GenType OR
       NEW.IsActive <> OLD.IsActive OR
       NEW.IsLeaf <> OLD.IsLeaf OR
       NEW.IsSpec <> OLD.IsSpec OR
       NEW.ModifiedDate <> OLD.ModifiedDate OR
       NEW.Multiplicity <> OLD.Multiplicity OR
       NEW.Name <> OLD.Name OR
       NEW.Note <> OLD.Note OR
       NEW.Persistence <> OLD.Persistence OR
       NEW.Phase <> OLD.Phase OR
       NEW.RunState <> OLD.RunState OR
       NEW.Status <> OLD.Status OR
       NEW.Stereotype <> OLD.Stereotype OR
       NEW.StyleEx <> OLD.StyleEx OR
       NEW.TPos <> OLD.TPos OR
       NEW.Object_Type <> OLD.Object_Type OR
       NEW.Version <> OLD.Version OR
       NEW.Visibility <> OLD.Visibility OR
       NEW.Style <> OLD.Style OR
       NEW.Backcolor <> OLD.Backcolor OR
       NEW.BorderStyle <> OLD.BorderStyle OR
       NEW.BorderWidth <> OLD.BorderWidth OR
       NEW.Fontcolor <> OLD.Fontcolor OR
       NEW.Bordercolor <> OLD.Bordercolor OR
       NEW.Cardinality <> OLD.Cardinality OR
       NEW.Concurrency <> OLD.Concurrency OR
       NEW.PDATA1 <> OLD.PDATA1 OR
       NEW.Object_ID <> OLD.Object_ID OR
       NEW.Object_ID <> OLD.Object_ID OR
       NEW.ParentID <> OLD.ParentID OR
       NEW.Object_ID <> OLD.Object_ID OR
       NEW.Start_Object_ID <> OLD.Start_Object_ID
    THEN
      REPLACE INTO ht_t_object VALUES (OLD.Object_ID, NOW());
    END IF;
  END;

CREATE TABLE `ht_t_operation`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_operationTrigger` AFTER UPDATE ON `t_operation`
FOR EACH ROW
  BEGIN
    IF NEW.Object_ID <> OLD.Object_ID OR
       NEW.Abstract <> OLD.Abstract OR
       NEW.Behaviour <> OLD.Behaviour OR
       NEW.Classifier <> OLD.Classifier OR
       NEW.Code <> OLD.Code OR
       NEW.Const <> OLD.Const OR
       NEW.IsLeaf <> OLD.IsLeaf OR
       NEW.Pure <> OLD.Pure OR
       NEW.IsQuery <> OLD.IsQuery OR
       NEW.IsRoot <> OLD.IsRoot OR
       NEW.IsStatic <> OLD.IsStatic OR
       NEW.Synchronized <> OLD.Synchronized OR
       NEW.ea_guid <> OLD.ea_guid OR
       NEW.Name <> OLD.Name OR
       NEW.Notes <> OLD.Notes OR
       NEW.Pos <> OLD.Pos OR
       NEW.ReturnArray <> OLD.ReturnArray OR
       NEW.Type <> OLD.Type OR
       NEW.StateFlags <> OLD.StateFlags OR
       NEW.Stereotype <> OLD.Stereotype OR
       NEW.Style <> OLD.Style OR
       NEW.StyleEx <> OLD.StyleEx OR
       NEW.Throws <> OLD.Throws OR
       NEW.Scope <> OLD.Scope OR
       NEW.Concurrency <> OLD.Concurrency OR
       NEW.GenOption <> OLD.GenOption OR
       NEW.OperationID <> OLD.OperationID OR
       NEW.OperationID <> OLD.OperationID
    THEN
      REPLACE INTO ht_t_operation VALUES (OLD.OperationID, NOW());
    END IF;
  END;

CREATE TABLE `ht_t_operationparams`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_operationparamsTrigger` AFTER UPDATE ON `t_operationparams`
FOR EACH ROW
  BEGIN
    IF NEW.ea_guid <> OLD.ea_guid OR
       NEW.OperationID <> OLD.OperationID OR
       NEW.Type <> OLD.Type OR
       NEW.Name <> OLD.Name
    THEN
      REPLACE INTO ht_t_operationparams VALUES (OLD.Name, NOW());
    END IF;
  END;

CREATE TABLE `ht_t_package`
(
  `ID`        INT,
  `Timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TRIGGER `t_packageTrigger` AFTER UPDATE ON `t_package`
FOR EACH ROW
  BEGIN
    IF NEW.Parent_ID <> OLD.Parent_ID OR
       NEW.ea_guid <> OLD.ea_guid OR
       NEW.BatchLoad <> OLD.BatchLoad OR
       NEW.BatchSave <> OLD.BatchSave OR
       NEW.CodePath <> OLD.CodePath OR
       NEW.CreatedDate <> OLD.CreatedDate OR
       NEW.PackageFlags <> OLD.PackageFlags OR
       NEW.IsControlled <> OLD.IsControlled OR
       NEW.Namespace <> OLD.Namespace OR
       NEW.Protected <> OLD.Protected OR
       NEW.LastLoadDate <> OLD.LastLoadDate OR
       NEW.LastSaveDate <> OLD.LastSaveDate OR
       NEW.LogXML <> OLD.LogXML OR
       NEW.ModifiedDate <> OLD.ModifiedDate OR
       NEW.Name <> OLD.Name OR
       NEW.Notes <> OLD.Notes OR
       NEW.PkgOwner <> OLD.PkgOwner OR
       NEW.TPos <> OLD.TPos OR
       NEW.UMLVersion <> OLD.UMLVersion OR
       NEW.UseDTD <> OLD.UseDTD OR
       NEW.Version <> OLD.Version OR
       NEW.XMLPath <> OLD.XMLPath OR
       NEW.Package_ID <> OLD.Package_ID OR
       NEW.Parent_ID <> OLD.Parent_ID OR
       NEW.Package_ID <> OLD.Package_ID OR
       NEW.Package_ID <> OLD.Package_ID
    THEN
      REPLACE INTO ht_t_package VALUES (OLD.Package_ID, NOW());
    END IF;
  END;

CREATE TABLE biobank.NCORPSite (
  NCORPSiteId INT NOT NULL AUTO_INCREMENT,
  NCORPSiteName VARCHAR(128) NOT NULL,
  CTEPId VARCHAR(5) NOT NULL,
  IsActive TINYINT(4) NOT NULL DEFAULT (0),
  LastRevisedDate DATETIME NOT NULL DEFAULT NOW(),
  LastRevisedUser INT(11) NOT NULL,
  ParentSiteId INT(11) NULL,
  StreetAddressLine1 VARCHAR(128) NOT NULL,
  StreetAddressLine2 VARCHAR(128)  NULL,
  City VARCHAR(32) NOT NULL,
  State VARCHAR(24) NOT NULL,
  ZipCode VARCHAR(10) NOT NULL,
  PhoneNumber VARCHAR(10) NOT NULL,
  POCName VARCHAR(32) NOT NULL,
  Latitude VARCHAR(11) NOT NULL,
  Longitude VARCHAR(11) NOT NULL,
  PRIMARY KEY (NCORPSiteId),
  INDEX FK_NCORPSite_LastRevisedUserId_idx (LastRevisedUser ASC) VISIBLE,
  CONSTRAINT FK_NCORPSite_ParentSiteId
    FOREIGN KEY (ParentSiteId)
    REFERENCES biobank.NCORPSite (NCORPSiteId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_NCORPSite_LastRevisedUserId
    FOREIGN KEY (LastRevisedUser)
    REFERENCES biobank.User (UserId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
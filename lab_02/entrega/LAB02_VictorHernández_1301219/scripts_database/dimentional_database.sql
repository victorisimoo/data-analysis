CREATE TABLE `Retail Sales Facts`(
  `saleId` BIGINT,
  `dateId` BIGINT,
  `storedId` INT,
  `contributorId` INT,
  `productId` INT,
  `promotionId` INT,
  `paymentId` INT,
  `saleNumber` VARCHAR(100),
  `contributorCode` VARCHAR(100),
  `costProduct` DECIMAL,
  `countSale` DECIMAL,
  iva DECIMAL,
  discount DECIMAL,
  `subtotalSale` DECIMAL,
  `totalSale` DECIMAL,
  `profitOnSale` DECIMAL,
  PRIMARY KEY(`saleId`)
);

CREATE TABLE `DateDimension`(
  dateid BIGINT,
  `year` INT,
  `month` INT,
  `day` INT,
  `week` INT,
  `dayofweek` INT,
  daynumofmonth INT,
  daynumofyear INT,
  weeknumofyear INT,
  monthnumofyear INT,
  calendarquarterofyear INT,
  calendarsemesterofy INT,
  calendaryear INT,
  calendaryearweek INT,
  calendaryearmonth INT,
  calendaryearquarter INT,
  calendaryearsemester INT,
  calendaryeardesc VARCHAR(250),
  PRIMARY KEY(dateid)
);

CREATE TABLE `StoreDimension`(
  `storedId` INT,
  `storeNumber` BIGINT,
  `storeName` VARCHAR(150),
  `storeDescription` VARCHAR(250),
  `storeZoneName` VARCHAR(150),
  `storeZoneDescription` VARCHAR(250),
  `storeZoneExtension` DECIMAL,
  `storeZonePopulation` INT,
  `storeZoneLatitude` BIGINT,
  `storeZoneLongitude` BIGINT,
  `stateName` VARCHAR(150),
  `stateDescription` VARCHAR(250),
  `stateAreaCode` INT,
  `sateExtension` DECIMAL,
  `stateTimeZone` VARCHAR(100),
  `statePopulation` INT,
  `stateLatitude` BIGINT,
  `stateLongitude` BIGINT,
  PRIMARY KEY(`storedId`)
);

CREATE TABLE `CashierDimension`(
  `contributorId` INT,
  `contributorCode` VARCHAR(100),
  `contributorName` VARCHAR(100),
  `contributorLastName` VARCHAR(100),
  `dateOfHire` VARCHAR(100),
  `date of birth` DATETIME,
  `dateOfLastPromotion` DATETIME,
  `monthOfBirth` INT,
  `dayOfBirth` INT,
  `yearOfBirth` INT,
  `zodiacalSign` VARCHAR(90),
  `workArea` VARCHAR(90),
  `workDay` VARCHAR(90),
  `daysWorkedPerYear` INT,
  `daysPerYearRested` INT,
  PRIMARY KEY(`contributorId`)
);

CREATE TABLE `ProductDimension`(
  `productId` INT,
  `productSKU` VARCHAR(150),
  `productName` VARCHAR(150),
  `descriptionProduct` VARCHAR(150),
  `categoryProduct` VARCHAR(150),
  `categoryDescription` VARCHAR(150),
  `departmentProduct` VARCHAR(150),
  `departmentDescription` VARCHAR(250),
  `nameSupplierProduct` VARCHAR(150),
  `companyNameProducer` VARCHAR(150),
  `addressSupplier` VARCHAR(250),
  `priceProduct` DECIMAL,
  `costProduct` DECIMAL,
  `quantityProduct` INT,
  `expirationDate` DATETIME,
  `dayExpirationDate` INT,
  `monthExpirationDate` INT,
  `yearExpirationDate` INT,
  `orderNumberPayProduct` BIGINT,
  `countProductPay` BIGINT,
  `dateOrderProduct` DATETIME,
  PRIMARY KEY(`productId`)
);

CREATE TABLE `PromotionDimension`(
  `promotionId` INT,
  `namePromotion` VARCHAR(150),
  `descriptionPromotion` VARCHAR(250),
  `percentagePromotion` DECIMAL,
  `startDate` DATETIME,
  `dayStartPromotion` INT,
  `monthStartPromotion` INT,
  `yearStartPromotion` INT,
  `endDatePromotion` DATETIME,
  `dayEndPromotion` INT,
  `monthEndPromotion` INT,
  `yearEndPromotion` INT,
  `justificationForPromotion` VARCHAR(250),
  PRIMARY KEY(`promotionId`)
);

CREATE TABLE `PaymentMethodDimension`(
  `paymentId` INT,
  `amountPay` DECIMAL,
  `cardNumberPay` BIGINT,
  `cardName` VARCHAR(350),
  `yearCard` INT,
  `monthCard` INT,
  `brandCard` VARCHAR(150),
  `paymentInCash` BOOLEAN,
  `change` BOOLEAN,
  `amountOfChange` DECIMAL,
  `typeOfCard` VARCHAR(150),
  `identityVerificationDocument` VARCHAR(150),
  PRIMARY KEY(`paymentId`)
);

ALTER TABLE `Retail Sales Facts`
  ADD CONSTRAINT `DateDimension_Retail Sales Facts`
    FOREIGN KEY (`dateId`) REFERENCES `DateDimension` (dateid);

ALTER TABLE `Retail Sales Facts`
  ADD CONSTRAINT `StoreDimension_Retail Sales Facts`
    FOREIGN KEY (`storedId`) REFERENCES `StoreDimension` (`storedId`);

ALTER TABLE `Retail Sales Facts`
  ADD CONSTRAINT `CashierDimension_Retail Sales Facts`
    FOREIGN KEY (`contributorId`) REFERENCES `CashierDimension` (`contributorId`)
  ;

ALTER TABLE `Retail Sales Facts`
  ADD CONSTRAINT `ProductDimension_Retail Sales Facts`
    FOREIGN KEY (`productId`) REFERENCES `ProductDimension` (`productId`);

ALTER TABLE `Retail Sales Facts`
  ADD CONSTRAINT `PromotionDimension_Retail Sales Facts`
    FOREIGN KEY (`promotionId`) REFERENCES `PromotionDimension` (`promotionId`);

ALTER TABLE `Retail Sales Facts`
  ADD CONSTRAINT `PaymentMethodDimension_Retail Sales Facts`
    FOREIGN KEY (`paymentId`) REFERENCES `PaymentMethodDimension` (`paymentId`);

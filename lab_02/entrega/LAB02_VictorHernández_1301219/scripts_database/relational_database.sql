CREATE TABLE `State`(
  `stateId` BIGINT,
  `stateName` VARCHAR(150),
  `description` VARCHAR(250),
  `areaCode` INT,
  extension INT,
  `timeZone` VARCHAR(100),
  population INT,
  latitude BIGINT,
  longitude BIGINT,
  PRIMARY KEY(`stateId`)
);

CREATE TABLE `StateZone`(
  `stateZoneId` BIGINT,
  `stateId` BIGINT,
  `stateZoneName` VARCHAR(150),
  `description` VARCHAR(250),
  extension BIGINT,
  population INT,
  latitude BIGINT,
  longitude BIGINT,
  PRIMARY KEY(`stateZoneId`)
);

CREATE TABLE `Store`(
  `storeId` BIGINT,
  `zoneId` BIGINT,
  `storeNumber` BIGINT,
  `storeName` VARCHAR(150),
  `description` VARCHAR(350),
  address VARCHAR(250),
  PRIMARY KEY(`storeId`)
);

CREATE TABLE `Product`(
  `productId` BIGINT,
  `categoryId` BIGINT,
  `departmentId` BIGINT,
  `supplierId` BIGINT,
  `productSKU` VARCHAR(150),
  `productName` VARCHAR(150),
  decription VARCHAR(250),
  PRIMARY KEY(`productId`)
);

CREATE TABLE `Category`(
  `categoryId` BIGINT,
  `nameCategory` VARCHAR(150),
  `description` VARCHAR(250),
  PRIMARY KEY(`categoryId`)
);

CREATE TABLE `Department`(
  `departmentId` BIGINT,
  `nameDepartment` VARCHAR(150),
  `description` VARCHAR(250),
  PRIMARY KEY(`departmentId`)
);

CREATE TABLE `ProductInventary`(
  `productInventaryId` INT,
  `storeId` BIGINT,
  `productId` BIGINT,
  price DECIMAL,
  cost DECIMAL,
  quantity INT,
  `expirationDate` DATETIME,
  PRIMARY KEY(`productInventaryId`)
);

CREATE TABLE `Supplier`(
  `supplierId` BIGINT,
  `stateZoneId` BIGINT,
  `nameSupplier` VARCHAR(150),
  `companyName` VARCHAR(150),
  address VARCHAR(250),
  PRIMARY KEY(`supplierId`)
);

CREATE TABLE `Order`(
  `orderId` BIGINT,
  `supplierId` BIGINT,
  `productId` BIGINT,
  `orderNumber` BIGINT,
  `countProduct` INT,
  `costProduct` DECIMAL,
  `dateOrder` DATETIME,
  PRIMARY KEY(`orderId`)
);

CREATE TABLE `Customer`(
  `customerId` BIGINT,
  `customerNit` VARCHAR(20),
  `customerName` VARCHAR(100),
  `customerLastName` VARCHAR(150),
  address VARCHAR(350),
  PRIMARY KEY(`customerId`)
);

CREATE TABLE `Sale`(
  `saleId` BIGINT,
  `customerId` BIGINT,
  `promotionId` BIGINT,
  `contributorId` BIGINT,
  `paymentId` INT,
  `saleNumber` VARCHAR(50),
  `date` DATETIME,
  iva DECIMAL,
  discount DECIMAL,
  `totalSale` DECIMAL,
  PRIMARY KEY(`saleId`)
);

CREATE TABLE `Promotion`(
  `promotionId` BIGINT,
  `namePromotion` VARCHAR(150),
  `description` VARCHAR(250),
  percentage DECIMAL,
  PRIMARY KEY(`promotionId`)
);

CREATE TABLE `SaleDescription`(
  `saleDescriptionId` BIGINT,
  `productId` BIGINT,
  `promotionId` BIGINT,
  `saleId` BIGINT,
  `count` INT,
  PRIMARY KEY(`saleDescriptionId`)
);

CREATE TABLE `Contributor`(
  `contributorId` BIGINT,
  `contributorCode` VARCHAR(100),
  `contName` VARCHAR(100),
  `contLastName` VARCHAR(100),
  `dateOfHire` DATETIME,
  PRIMARY KEY(`contributorId`)
);

CREATE TABLE `Payment`(
  `paymentId` INT,
  amount DECIMAL,
  `cardNumber` BIGINT,
  cardname VARCHAR(250),
  `date` DATETIME,
  PRIMARY KEY(`paymentId`)
);

ALTER TABLE `StateZone`
  ADD CONSTRAINT state_statezone
    FOREIGN KEY (`stateId`) REFERENCES `State` (`stateId`);

ALTER TABLE `Store`
  ADD CONSTRAINT stateid_store
    FOREIGN KEY (`zoneId`) REFERENCES `StateZone` (`stateZoneId`);

ALTER TABLE `Product`
  ADD CONSTRAINT `Category_Product`
    FOREIGN KEY (`categoryId`) REFERENCES `Category` (`categoryId`);

ALTER TABLE `Product`
  ADD CONSTRAINT `Department_Product`
    FOREIGN KEY (`departmentId`) REFERENCES `Department` (`departmentId`);

ALTER TABLE `ProductInventary`
  ADD CONSTRAINT `Store_ProductInventary`
    FOREIGN KEY (`storeId`) REFERENCES `Store` (`storeId`);

ALTER TABLE `ProductInventary`
  ADD CONSTRAINT `Product_ProductInventary`
    FOREIGN KEY (`productId`) REFERENCES `Product` (`productId`);

ALTER TABLE `Supplier`
  ADD CONSTRAINT `StateZone_Supplier`
    FOREIGN KEY (`stateZoneId`) REFERENCES `StateZone` (`stateZoneId`);

ALTER TABLE `Product`
  ADD CONSTRAINT `Supplier_Product`
    FOREIGN KEY (`supplierId`) REFERENCES `Supplier` (`supplierId`);

ALTER TABLE `Order`
  ADD CONSTRAINT `Supplier_Order`
    FOREIGN KEY (`supplierId`) REFERENCES `Supplier` (`supplierId`);

ALTER TABLE `Order`
  ADD CONSTRAINT `Product_Order`
    FOREIGN KEY (`productId`) REFERENCES `Product` (`productId`);

ALTER TABLE `Sale`
  ADD CONSTRAINT `Customer_Sale`
    FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`);

ALTER TABLE `Sale`
  ADD CONSTRAINT `Promotion_Sale`
    FOREIGN KEY (`promotionId`) REFERENCES `Promotion` (`promotionId`);

ALTER TABLE `SaleDescription`
  ADD CONSTRAINT `Product_SaleDescription`
    FOREIGN KEY (`productId`) REFERENCES `Product` (`productId`);

ALTER TABLE `SaleDescription`
  ADD CONSTRAINT `Sale_SaleDescription`
    FOREIGN KEY (`saleId`) REFERENCES `Sale` (`saleId`);

ALTER TABLE `SaleDescription`
  ADD CONSTRAINT `Promotion_SaleDescription`
    FOREIGN KEY (`promotionId`) REFERENCES `Promotion` (`promotionId`);

ALTER TABLE `Sale`
  ADD CONSTRAINT `Contributor_Sale`
    FOREIGN KEY (`contributorId`) REFERENCES `Contributor` (`contributorId`);

ALTER TABLE `Sale`
  ADD CONSTRAINT `Payment_Sale`
    FOREIGN KEY (`paymentId`) REFERENCES `Payment` (`paymentId`);

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `ZtaUzt13` ;
CREATE SCHEMA IF NOT EXISTS `ZtaUzt13` DEFAULT CHARACTER SET utf8 ;
USE `ZtaUzt13` ;

GRANT ALL PRIVILEGES ON ZtaUzt13.* TO 'ikasle'@'localhost' IDENTIFIED BY 'zta';

-- -----------------------------------------------------
-- Table `ZtaUzt13`.`Produktua`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZtaUzt13`.`Produktua` ;

CREATE  TABLE IF NOT EXISTS `ZtaUzt13`.`Produktua` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `izena` VARCHAR(255) NOT NULL ,
  `deskribapena` VARCHAR(1000) NULL ,
  `kategoria` VARCHAR(255) NULL ,
  `prezioa` FLOAT NOT NULL ,
  `stocka` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

LOCK TABLES `Produktua` WRITE;
INSERT INTO `Produktua` VALUES (1,'Huawei Ascend Y300','Android smartphone askea (4\" 800x480 ukipen-pantaila, 5 Mp-ko kamara, 4 GB-eko gaitasuna, 1 GHz-tako 2 prozesagailu, 512 MB-eko RAM) beltza','Elektronika',130.00,3),(2,'SanDisk Cruzer Blade','32 GB-eko USB 2.0 memoria','Elektronika',14.01,10),(6,'Samsung Galaxy S III mini (I8190)','Smartphone libre Android (pantalla táctil de 4,0\" 480x800, cámara 5 MP, 8 GB de capacidad, 2 procesadores de 1 GHz, 1 GB de RAM, S.O. Android 4.1 con Touchwiz) color blanco','Elektronika',226.71,3),(3,'Eraztunen Jauna I','JRR Tolkien idazlearen liburu-bildumarik ezagunenaren 1. alea','Liburua',18.90,5),(4,'Eraztunen Jauna II','JRR Tolkien idazlearen liburu-bildumarik ezagunenaren 2. alea','Liburua',21.37,2),(5,'Eraztunen Jauna II','JRR Tolkien idazlearen liburu-bildumarik ezagunenaren 3. alea','Liburua',16.15,2);
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `ZtaUzt13`.`Eskaera`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZtaUzt13`.`Eskaera` ;

CREATE  TABLE IF NOT EXISTS `ZtaUzt13`.`Eskaera` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `izena` VARCHAR(45) NOT NULL ,
  `na` VARCHAR(45) NOT NULL ,
  `helbidea` VARCHAR(45) NOT NULL ,
  `kopurua` INT NOT NULL ,
  `produktua` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `producto_idx` (`produktua` ASC) ,
  CONSTRAINT `produktua`
    FOREIGN KEY (`produktua` )
    REFERENCES `ZtaUzt13`.`Produktua` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

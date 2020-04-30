SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `ZtaMai14` ;
CREATE SCHEMA IF NOT EXISTS `ZtaMai14` DEFAULT CHARACTER SET latin1 ;
USE `ZtaMai14` ;

GRANT ALL PRIVILEGES ON ZtaMai14.* TO 'ikasle'@'localhost' IDENTIFIED BY 'zta';

-- -----------------------------------------------------
-- Table `ZtaMai14`.`Ikaslea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZtaMai14`.`Ikaslea` ;

CREATE  TABLE IF NOT EXISTS `ZtaMai14`.`Ikaslea` (
  `na` VARCHAR(45) NOT NULL ,
  `abizenak` VARCHAR(45) NOT NULL ,
  `izena` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`na`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

LOCK TABLES `Ikaslea` WRITE;
/*!40000 ALTER TABLE `Ikaslea` DISABLE KEYS */;
INSERT INTO `Ikaslea` VALUES ('12341234A','Igartiburu Clemente','Antxon'),('12345678N','Garcia Perez','Carlos'),('87654321N','Sanchez Gutierrez','Filomeno');
/*!40000 ALTER TABLE `Ikaslea` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `ZtaMai14`.`Irakasgaia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZtaMai14`.`Irakasgaia` ;

CREATE  TABLE IF NOT EXISTS `ZtaMai14`.`Irakasgaia` (
  `idIrakasgaia` INT(11) NOT NULL AUTO_INCREMENT ,
  `izena` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`idIrakasgaia`) )
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = latin1;

LOCK TABLES `Irakasgaia` WRITE;
/*!40000 ALTER TABLE `Irakasgaia` DISABLE KEYS */;
INSERT INTO `Irakasgaia` VALUES (6,'Sistema Eragileak'),(7,'Programazioaren Oinarriak'),(8,'Ingurune Banatuetako Programazioa'),(9,'Zerbitzu Telematiko Aurreratuak');
/*!40000 ALTER TABLE `Irakasgaia` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `ZtaMai14`.`Nota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZtaMai14`.`Nota` ;

CREATE  TABLE IF NOT EXISTS `ZtaMai14`.`Nota` (
  `idNota` INT(11) NOT NULL AUTO_INCREMENT ,
  `nota` DOUBLE NOT NULL ,
  `irakasgaia` INT(11) NOT NULL ,
  `ikaslea` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idNota`) ,
  INDEX `fk_Nota_Irakasgaia_idx` (`irakasgaia` ASC) ,
  INDEX `fk_Nota_Ikaslea1_idx` (`ikaslea` ASC) ,
  CONSTRAINT `fk_Nota_Irakasgaia`
    FOREIGN KEY (`irakasgaia` )
    REFERENCES `ZtaMai14`.`Irakasgaia` (`idIrakasgaia` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Nota_Ikaslea`
    FOREIGN KEY (`ikaslea` )
    REFERENCES `ZtaMai14`.`Ikaslea` (`na` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = latin1;

LOCK TABLES `Nota` WRITE;
/*!40000 ALTER TABLE `Nota` DISABLE KEYS */;
INSERT INTO `Nota` VALUES (10,6,6,'12345678N'),(11,9,6,'87654321N'),(12,8,7,'87654321N');
/*!40000 ALTER TABLE `Nota` ENABLE KEYS */;
UNLOCK TABLES;

USE `ZtaMai14` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ZTA_1718_2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ZTA_1718_2` ;

-- -----------------------------------------------------
-- Schema ZTA_1718_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ZTA_1718_2` DEFAULT CHARACTER SET utf8 ;
USE `ZTA_1718_2` ;

-- -----------------------------------------------------
-- Table `ZTA_1718_2`.`Journal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZTA_1718_2`.`Journal` ;

CREATE TABLE IF NOT EXISTS `ZTA_1718_2`.`Journal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `abbr` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZTA_1718_2`.`Author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZTA_1718_2`.`Author` ;

CREATE TABLE IF NOT EXISTS `ZTA_1718_2`.`Author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZTA_1718_2`.`Publication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZTA_1718_2`.`Publication` ;

CREATE TABLE IF NOT EXISTS `ZTA_1718_2`.`Publication` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `journal` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Publication_Journal_idx` (`journal` ASC),
  CONSTRAINT `fk_Publication_Journal`
    FOREIGN KEY (`journal`)
    REFERENCES `ZTA_1718_2`.`Journal` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZTA_1718_2`.`Relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZTA_1718_2`.`Relation` ;

CREATE TABLE IF NOT EXISTS `ZTA_1718_2`.`Relation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `publication` INT NOT NULL,
  `author` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Relation_Publication1_idx` (`publication` ASC),
  INDEX `fk_Relation_Author1_idx` (`author` ASC),
  CONSTRAINT `fk_Relation_Publication1`
    FOREIGN KEY (`publication`)
    REFERENCES `ZTA_1718_2`.`Publication` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Relation_Author1`
    FOREIGN KEY (`author`)
    REFERENCES `ZTA_1718_2`.`Author` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

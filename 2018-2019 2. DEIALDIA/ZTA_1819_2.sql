-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ZTA_1819_2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ZTA_1819_2` ;

-- -----------------------------------------------------
-- Schema ZTA_1819_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ZTA_1819_2` DEFAULT CHARACTER SET utf8 ;
USE `ZTA_1819_2` ;

-- -----------------------------------------------------
-- Table `ZTA_1819_2`.`Exam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZTA_1819_2`.`Exam` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(255) NOT NULL,
  `totalStudents` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `subject_UNIQUE` (`subject` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZTA_1819_2`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZTA_1819_2`.`Room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZTA_1819_2`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZTA_1819_2`.`Booking` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Exam_id` INT NOT NULL,
  `Room_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Booking_Exam1_idx` (`Exam_id` ASC),
  INDEX `fk_Booking_Room1_idx` (`Room_id` ASC),
  UNIQUE INDEX `Room_id_UNIQUE` (`Room_id` ASC),
  CONSTRAINT `fk_Booking_Exam1`
    FOREIGN KEY (`Exam_id`)
    REFERENCES `ZTA_1819_2`.`Exam` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Booking_Room1`
    FOREIGN KEY (`Room_id`)
    REFERENCES `ZTA_1819_2`.`Room` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZTA_1819_2`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZTA_1819_2`.`Student` (
  `name` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZTA_1819_2`.`Submission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZTA_1819_2`.`Submission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Exam_id` INT NOT NULL,
  `Student_name` VARCHAR(45) NOT NULL,
  `response` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Submission_Student1_idx` (`Student_name` ASC),
  INDEX `fk_Submission_Exam1_idx` (`Exam_id` ASC),
  CONSTRAINT `fk_Submission_Student1`
    FOREIGN KEY (`Student_name`)
    REFERENCES `ZTA_1819_2`.`Student` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Submission_Exam1`
    FOREIGN KEY (`Exam_id`)
    REFERENCES `ZTA_1819_2`.`Exam` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `ZTA_1819_2`.`Exam`
-- -----------------------------------------------------
START TRANSACTION;
USE `ZTA_1819_2`;
INSERT INTO `ZTA_1819_2`.`Exam` (`id`, `subject`, `totalStudents`) VALUES (DEFAULT, 'Zerbitzu Telematiko Aurreratuak', 40);
INSERT INTO `ZTA_1819_2`.`Exam` (`id`, `subject`, `totalStudents`) VALUES (DEFAULT, 'Ingurune Banatuetako Programazioa', 80);
INSERT INTO `ZTA_1819_2`.`Exam` (`id`, `subject`, `totalStudents`) VALUES (DEFAULT, 'Programazioaren Oinarriak', 80);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ZTA_1819_2`.`Room`
-- -----------------------------------------------------
START TRANSACTION;
USE `ZTA_1819_2`;
INSERT INTO `ZTA_1819_2`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B10I', 28);
INSERT INTO `ZTA_1819_2`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B11I', 28);
INSERT INTO `ZTA_1819_2`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B12I', 20);
INSERT INTO `ZTA_1819_2`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B14I', 55);
INSERT INTO `ZTA_1819_2`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B16I', 24);
INSERT INTO `ZTA_1819_2`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B17I', 41);
INSERT INTO `ZTA_1819_2`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B18I', 32);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ZTA_1819_2`.`Student`
-- -----------------------------------------------------
START TRANSACTION;
USE `ZTA_1819_2`;
INSERT INTO `ZTA_1819_2`.`Student` (`name`, `mail`) VALUES ('jon', 'jon@ehu.eus');
INSERT INTO `ZTA_1819_2`.`Student` (`name`, `mail`) VALUES ('miren', 'miren@ehu.eus');
INSERT INTO `ZTA_1819_2`.`Student` (`name`, `mail`) VALUES ('luis', 'luis@ehu.eus');
INSERT INTO `ZTA_1819_2`.`Student` (`name`, `mail`) VALUES ('ana', 'ana@ehu.eus');

COMMIT;


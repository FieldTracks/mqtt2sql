-- MySQL Script generated by MySQL Workbench
-- 2018-08-18T20:50:12 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema jellingstone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jellingstone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jellingstone` DEFAULT CHARACTER SET utf8 ;
USE `jellingstone` ;

-- -----------------------------------------------------
-- Table `jellingstone`.`stone_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jellingstone`.`stone_events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mac` VARCHAR(17) NULL,
  `major` INT NULL,
  `minor` INT NULL,
  `timestmp` DATETIME NULL,
  `comment` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `uuid` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `jellingstone`.`sensor_contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jellingstone`.`sensor_contacts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stone_event_id` INT NULL,
  `min` INT NULL,
  `max` INT NULL,
  `avg` INT NULL,
  `remoteRssi` INT NULL,
  `major` INT NULL,
  `minor` INT NULL,
  `uuid` VARCHAR(255) NULL,
  `mac` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

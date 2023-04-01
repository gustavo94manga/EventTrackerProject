-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema onepiecedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `onepiecedb` ;

-- -----------------------------------------------------
-- Schema onepiecedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `onepiecedb` DEFAULT CHARACTER SET utf8 ;
USE `onepiecedb` ;

-- -----------------------------------------------------
-- Table `devil_fruit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `devil_fruit` ;

CREATE TABLE IF NOT EXISTS `devil_fruit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `devil_fruit_type` VARCHAR(45) NOT NULL,
  `ability` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `organization` ;

CREATE TABLE IF NOT EXISTS `organization` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `organization_name` VARCHAR(45) NULL,
  `organization_type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `show_character`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `show_character` ;

CREATE TABLE IF NOT EXISTS `show_character` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `age` INT NULL,
  `title_or_rank` VARCHAR(45) NULL,
  `image_url` VARCHAR(2000) NULL,
  `last_updated` DATETIME NULL,
  `date_added` DATETIME NULL,
  `devil_fruit_id` INT NULL,
  `organization_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_show_character_devil_fruit_idx` (`devil_fruit_id` ASC),
  INDEX `fk_show_character_organization1_idx` (`organization_id` ASC),
  CONSTRAINT `fk_show_character_devil_fruit`
    FOREIGN KEY (`devil_fruit_id`)
    REFERENCES `devil_fruit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_character_organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS luffy@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'luffy'@'localhost' IDENTIFIED BY 'luffy';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'luffy'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `devil_fruit`
-- -----------------------------------------------------
START TRANSACTION;
USE `onepiecedb`;
INSERT INTO `devil_fruit` (`id`, `name`, `devil_fruit_type`, `ability`) VALUES (1, 'Gomu Gomu no Mi', 'Paramecia - Mythical', 'Made out of rubber, can stretch an insanely large distance, once awoken, he has the mythical powers of the Sun God Nika. This devil fruit user allows the user to fight based off of the users imagination. The possibilities could be endless.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `organization`
-- -----------------------------------------------------
START TRANSACTION;
USE `onepiecedb`;
INSERT INTO `organization` (`id`, `organization_name`, `organization_type`) VALUES (1, 'Straw Hats', 'Pirates');
INSERT INTO `organization` (`id`, `organization_name`, `organization_type`) VALUES (2, 'Red Hair', 'Pirates');
INSERT INTO `organization` (`id`, `organization_name`, `organization_type`) VALUES (3, 'Marines', 'World Government');
INSERT INTO `organization` (`id`, `organization_name`, `organization_type`) VALUES (4, 'Navy', 'World Governement');
INSERT INTO `organization` (`id`, `organization_name`, `organization_type`) VALUES (5, 'Celestial Dragon', 'World Noble');
INSERT INTO `organization` (`id`, `organization_name`, `organization_type`) VALUES (6, 'Revolutionary Army', 'Revolutionaries');
INSERT INTO `organization` (`id`, `organization_name`, `organization_type`) VALUES (7, 'Kidd Pirates', 'Pirates');
INSERT INTO `organization` (`id`, `organization_name`, `organization_type`) VALUES (8, 'Heart', 'Pirates');

COMMIT;


-- -----------------------------------------------------
-- Data for table `show_character`
-- -----------------------------------------------------
START TRANSACTION;
USE `onepiecedb`;
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`, `organization_id`) VALUES (1, 'Luffy', 'Monkey', 19, 'Captain', NULL, NULL, NULL, 1, 1);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`, `organization_id`) VALUES (2, 'Zoro', 'Roronoa', 21, 'Swordsman', NULL, NULL, NULL, NULL, 1);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`, `organization_id`) VALUES (3, 'Nami', NULL, 20, 'Navigator', NULL, NULL, NULL, NULL, 1);

COMMIT;


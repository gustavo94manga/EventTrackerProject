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
  PRIMARY KEY (`id`),
  INDEX `fk_show_character_devil_fruit_idx` (`devil_fruit_id` ASC),
  CONSTRAINT `fk_show_character_devil_fruit`
    FOREIGN KEY (`devil_fruit_id`)
    REFERENCES `devil_fruit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Data for table `show_character`
-- -----------------------------------------------------
START TRANSACTION;
USE `onepiecedb`;
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (1, 'Luffy', 'Monkey D.', 19, 'Captain', 'https://i.pinimg.com/564x/9b/19/da/9b19dab3e5063e446c7801d3d7d965be.jpg', NULL, NULL, 1);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (2, 'Zoro', 'Roronoa', 21, 'Swordsman', 'https://i.pinimg.com/564x/5b/e4/d9/5be4d9d1b0f4b8ec5130892490c8fa5a.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (3, 'Nami', NULL, 20, 'Navigator', 'https://i.pinimg.com/564x/d5/c4/15/d5c4150a5fc59b27f9762a60c4d0d274.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (4, 'Usopp', NULL, 19, 'Sniper', 'https://i.pinimg.com/564x/d7/41/1f/d7411ff1cce3ceffda9d17a0a92394e7.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (5, 'Sanji', 'Vinsmoke', 21, 'Cook', 'https://i.pinimg.com/564x/e2/35/38/e2353879ff4a21b1ab989eb1e3ae1267.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (6, 'Chopper', 'Tony Tony', 17, 'Doctor', 'https://i.pinimg.com/564x/25/e5/13/25e513fc1c5edbc3ecc159525f2d22b1.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (7, 'Robin', 'Nico', 30, 'Archeologist', 'https://i.pinimg.com/564x/a3/0a/68/a30a6876716a3b2fc8c242edaeb42be3.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (8, 'Franky', NULL, 35, 'Shipwright', 'https://i.pinimg.com/564x/de/9a/4b/de9a4b6a2a9be2a9b228e0db494d87f3.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (9, 'Brook', NULL, 90, 'Musician', 'https://i.pinimg.com/564x/59/d8/cc/59d8ccb398958fb814d2106bd8b8089f.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (10, 'Ace', 'Roger', 20, '2nd Division Commander - Whitebeard', 'https://i.pinimg.com/564x/f6/5e/d3/f65ed395fbd4e302d7ad9d33998572ae.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (11, 'Garp', 'Monkey D.', 78, 'Marine - Vice Admiral', 'https://i.pinimg.com/564x/44/64/5f/44645f677900a4c6783da913a09cb0be.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (12, 'Hancock', 'Boa', 31, 'Warlord', 'https://i.pinimg.com/564x/c0/7d/e1/c07de103f87739e8151a2539128f3efe.jpg', NULL, NULL, NULL);
INSERT INTO `show_character` (`id`, `first_name`, `last_name`, `age`, `title_or_rank`, `image_url`, `last_updated`, `date_added`, `devil_fruit_id`) VALUES (13, 'Trafalgar', 'Law', 25, 'Worst Generation', 'https://i.pinimg.com/564x/f2/cc/1f/f2cc1f82903fef6381e541fbdb0d4ab8.jpg', NULL, NULL, NULL);

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


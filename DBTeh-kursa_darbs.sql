-- MySQL Script generated by MySQL Workbench
-- Sun Dec  2 23:17:09 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DBTeh-kursa_darbs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DBTeh-kursa_darbs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DBTeh-kursa_darbs` DEFAULT CHARACTER SET utf8 ;
USE `DBTeh-kursa_darbs` ;

-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`lietotaji`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`lietotaji` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `vards` VARCHAR(255) NULL,
  `uzvards` VARCHAR(255) NULL,
  `epasts` VARCHAR(255) NULL,
  `lietotajvards` VARCHAR(255) NULL,
  `parole` VARCHAR(255) NULL,
  `telefona_numurs` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`lomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`lomas` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `loma` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`transportlidzekli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`transportlidzekli` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `kategorija` ENUM('B', 'C', 'D') NULL,
  `marka` VARCHAR(255) NULL,
  `gads` YEAR(4) NULL,
  `krasa` VARCHAR(255) NULL,
  `numura_zime` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`lietotajiem_ir_transportlidzekli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`lietotajiem_ir_transportlidzekli` (
  `lietotaji_ID` INT NOT NULL,
  `transportlidzekli_ID` INT NOT NULL,
  INDEX `fk_lietotaji_has_transportlidzekli_transportlidzekli1_idx` (`transportlidzekli_ID` ASC),
  INDEX `fk_lietotaji_has_transportlidzekli_lietotaji1_idx` (`lietotaji_ID` ASC),
  PRIMARY KEY (`transportlidzekli_ID`),
  CONSTRAINT `fk_lietotaji_has_transportlidzekli_lietotaji1`
    FOREIGN KEY (`lietotaji_ID`)
    REFERENCES `DBTeh-kursa_darbs`.`lietotaji` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lietotaji_has_transportlidzekli_transportlidzekli1`
    FOREIGN KEY (`transportlidzekli_ID`)
    REFERENCES `DBTeh-kursa_darbs`.`transportlidzekli` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`marsruti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`marsruti` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `transportlidzekli_ID` INT NULL,
  `no_valsts` VARCHAR(255) NULL,
  `no_pilseta` VARCHAR(255) NULL,
  `uz_valsts` VARCHAR(255) NULL,
  `uz_pilseta` VARCHAR(255) NULL,
  `no_adrese` VARCHAR(255) NULL,
  `uz_adrese` VARCHAR(255) NULL,
  `izbrauksanas_laiks` DATETIME NULL,
  `cena` DECIMAL NULL,
  `sedvietas` INT NULL,
  `irIzpildits` TINYINT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_marsruti_transportlidzekli1_idx` (`transportlidzekli_ID` ASC),
  CONSTRAINT `fk_marsruti_transportlidzekli1`
    FOREIGN KEY (`transportlidzekli_ID`)
    REFERENCES `DBTeh-kursa_darbs`.`transportlidzekli` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`lietotajiem_ir_marsruti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`lietotajiem_ir_marsruti` (
  `lietotaji_ID` INT NOT NULL,
  `marsruti_ID` INT NOT NULL,
  INDEX `fk_lietotaji_has_marsruti_marsruti1_idx` (`marsruti_ID` ASC),
  INDEX `fk_lietotaji_has_marsruti_lietotaji1_idx` (`lietotaji_ID` ASC),
  PRIMARY KEY (`marsruti_ID`),
  CONSTRAINT `fk_lietotaji_has_marsruti_lietotaji1`
    FOREIGN KEY (`lietotaji_ID`)
    REFERENCES `DBTeh-kursa_darbs`.`lietotaji` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lietotaji_has_marsruti_marsruti1`
    FOREIGN KEY (`marsruti_ID`)
    REFERENCES `DBTeh-kursa_darbs`.`marsruti` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`lietotajiem_ir_lomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`lietotajiem_ir_lomas` (
  `lietotaji_ID` INT NOT NULL,
  `lomas_ID` INT NOT NULL,
  PRIMARY KEY (`lietotaji_ID`, `lomas_ID`),
  INDEX `fk_lietotaji_has_lomas_lomas1_idx` (`lomas_ID` ASC),
  INDEX `fk_lietotaji_has_lomas_lietotaji1_idx` (`lietotaji_ID` ASC),
  CONSTRAINT `fk_lietotaji_has_lomas_lietotaji1`
    FOREIGN KEY (`lietotaji_ID`)
    REFERENCES `DBTeh-kursa_darbs`.`lietotaji` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lietotaji_has_lomas_lomas1`
    FOREIGN KEY (`lomas_ID`)
    REFERENCES `DBTeh-kursa_darbs`.`lomas` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`valstis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`valstis` (
  `ID` INT NOT NULL,
  `nosaukums` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`pilsetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`pilsetas` (
  `ID` INT NOT NULL,
  `valstis_ID` INT NOT NULL,
  `nosaukums` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`, `valstis_ID`),
  INDEX `fk_pilsetas_valstis1_idx` (`valstis_ID` ASC),
  CONSTRAINT `fk_pilsetas_valstis1`
    FOREIGN KEY (`valstis_ID`)
    REFERENCES `DBTeh-kursa_darbs`.`valstis` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`atsauksmes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`atsauksmes` (
  `ID` INT NOT NULL,
  `punkti` TINYINT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBTeh-kursa_darbs`.`lietotajiem_ir_atsauksmes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`lietotajiem_ir_atsauksmes` (
  `lietotaji_ID` INT NOT NULL,
  `atsauksmes_ID` INT NOT NULL,
  PRIMARY KEY (`atsauksmes_ID`),
  INDEX `fk_lietotaji_has_atsauksmes_atsauksmes1_idx` (`atsauksmes_ID` ASC),
  INDEX `fk_lietotaji_has_atsauksmes_lietotaji1_idx` (`lietotaji_ID` ASC),
  CONSTRAINT `fk_lietotaji_has_atsauksmes_lietotaji1`
    FOREIGN KEY (`lietotaji_ID`)
    REFERENCES `DBTeh-kursa_darbs`.`lietotaji` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lietotaji_has_atsauksmes_atsauksmes1`
    FOREIGN KEY (`atsauksmes_ID`)
    REFERENCES `DBTeh-kursa_darbs`.`atsauksmes` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `DBTeh-kursa_darbs` ;

-- -----------------------------------------------------
-- Placeholder table for view `DBTeh-kursa_darbs`.`visi_soferi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`visi_soferi` (`ID` INT, `vards` INT, `uzvards` INT, `epasts` INT, `lietotajvards` INT, `parole` INT, `telefona_numurs` INT, `lietotaji_ID` INT, `lomas_ID` INT);

-- -----------------------------------------------------
-- Placeholder table for view `DBTeh-kursa_darbs`.`visi_pasazieri`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`visi_pasazieri` (`ID` INT, `vards` INT, `uzvards` INT, `epasts` INT, `lietotajvards` INT, `parole` INT, `telefona_numurs` INT, `lietotaji_ID` INT, `lomas_ID` INT);

-- -----------------------------------------------------
-- Placeholder table for view `DBTeh-kursa_darbs`.`visi_soferu_marsruti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`visi_soferu_marsruti` (`lietotaji_ID` INT, `marsruti_ID` INT);

-- -----------------------------------------------------
-- Placeholder table for view `DBTeh-kursa_darbs`.`visi_pasazieru_marsruti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBTeh-kursa_darbs`.`visi_pasazieru_marsruti` (`lietotaji_ID` INT, `marsruti_ID` INT);

-- -----------------------------------------------------
-- View `DBTeh-kursa_darbs`.`visi_soferi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBTeh-kursa_darbs`.`visi_soferi`;
USE `DBTeh-kursa_darbs`;
CREATE  OR REPLACE VIEW `visi_soferi` AS
SELECT * FROM `lietotaji` 
JOIN `lietotajiem_ir_lomas` ON ID=lietotaji_ID WHERE lomas_ID=2;

-- -----------------------------------------------------
-- View `DBTeh-kursa_darbs`.`visi_pasazieri`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBTeh-kursa_darbs`.`visi_pasazieri`;
USE `DBTeh-kursa_darbs`;
CREATE  OR REPLACE VIEW `visi_pasazieri` AS
SELECT * FROM `lietotaji` 
JOIN `lietotajiem_ir_lomas` ON ID=lietotaji_ID WHERE lomas_ID=1;

-- -----------------------------------------------------
-- View `DBTeh-kursa_darbs`.`visi_soferu_marsruti`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBTeh-kursa_darbs`.`visi_soferu_marsruti`;
USE `DBTeh-kursa_darbs`;
CREATE  OR REPLACE VIEW `visi_soferu_marsruti` AS
SELECT * FROM lietotajiem_ir_marsruti WHERE (SELECT lietotaji_ID FROM visi_soferi)=lietotaji_ID;

-- -----------------------------------------------------
-- View `DBTeh-kursa_darbs`.`visi_pasazieru_marsruti`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DBTeh-kursa_darbs`.`visi_pasazieru_marsruti`;
USE `DBTeh-kursa_darbs`;
CREATE  OR REPLACE VIEW `visi_pasazieru_marsruti` AS
SELECT * FROM lietotajiem_ir_marsruti WHERE (SELECT lietotaji_ID FROM visi_pasazieri)=lietotaji_ID;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `DBTeh-kursa_darbs`.`lomas`
-- -----------------------------------------------------
START TRANSACTION;
USE `DBTeh-kursa_darbs`;
INSERT INTO `DBTeh-kursa_darbs`.`lomas` (`ID`, `loma`) VALUES (3, 'administrators');
INSERT INTO `DBTeh-kursa_darbs`.`lomas` (`ID`, `loma`) VALUES (2, 'soferis');
INSERT INTO `DBTeh-kursa_darbs`.`lomas` (`ID`, `loma`) VALUES (1, 'pasazieris');

COMMIT;


-- -----------------------------------------------------
-- Data for table `DBTeh-kursa_darbs`.`valstis`
-- -----------------------------------------------------
START TRANSACTION;
USE `DBTeh-kursa_darbs`;
INSERT INTO `DBTeh-kursa_darbs`.`valstis` (`ID`, `nosaukums`) VALUES (1, 'Estonia');
INSERT INTO `DBTeh-kursa_darbs`.`valstis` (`ID`, `nosaukums`) VALUES (2, 'Latvia');
INSERT INTO `DBTeh-kursa_darbs`.`valstis` (`ID`, `nosaukums`) VALUES (3, 'Lithuania');

COMMIT;


-- -----------------------------------------------------
-- Data for table `DBTeh-kursa_darbs`.`pilsetas`
-- -----------------------------------------------------
START TRANSACTION;
USE `DBTeh-kursa_darbs`;
INSERT INTO `DBTeh-kursa_darbs`.`pilsetas` (`ID`, `valstis_ID`, `nosaukums`) VALUES (1, 1, 'Tallinn');
INSERT INTO `DBTeh-kursa_darbs`.`pilsetas` (`ID`, `valstis_ID`, `nosaukums`) VALUES (2, 1, 'Tartu');
INSERT INTO `DBTeh-kursa_darbs`.`pilsetas` (`ID`, `valstis_ID`, `nosaukums`) VALUES (3, 2, 'Ventspils');
INSERT INTO `DBTeh-kursa_darbs`.`pilsetas` (`ID`, `valstis_ID`, `nosaukums`) VALUES (4, 2, 'Riga');
INSERT INTO `DBTeh-kursa_darbs`.`pilsetas` (`ID`, `valstis_ID`, `nosaukums`) VALUES (5, 2, 'Liepaja');
INSERT INTO `DBTeh-kursa_darbs`.`pilsetas` (`ID`, `valstis_ID`, `nosaukums`) VALUES (6, 3, 'Vilnius');
INSERT INTO `DBTeh-kursa_darbs`.`pilsetas` (`ID`, `valstis_ID`, `nosaukums`) VALUES (7, 3, 'Kaunas');

COMMIT;


-- MySQL Script generated by MySQL Workbench
-- Thu Nov 18 22:54:27 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyecto_integrador
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `proyecto_integrador` ;

-- -----------------------------------------------------
-- Schema proyecto_integrador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_integrador` DEFAULT CHARACTER SET utf8 ;
USE `proyecto_integrador` ;

-- -----------------------------------------------------
-- Table `proyecto_integrador`.`brands`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador`.`brands` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador`.`brands` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador`.`categories` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador`.`products` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `type` VARCHAR(40) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `create_date` DATE NOT NULL,
  `modified_date` DATE NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `categories_id` INT NOT NULL,
  `brands_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_products_categories_idx` (`categories_id` ASC) VISIBLE,
  INDEX `fk_products_brands1_idx` (`brands_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_categories`
    FOREIGN KEY (`categories_id`)
    REFERENCES `proyecto_integrador`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_brands1`
    FOREIGN KEY (`brands_id`)
    REFERENCES `proyecto_integrador`.`brands` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador`.`products_car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador`.`products_car` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador`.`products_car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `products_id` INT NOT NULL,
  `shopping_cart_id` INT NOT NULL,
  PRIMARY KEY (`id`, `products_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_products_car_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_products_car_shopping_cart1_idx` (`shopping_cart_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_car_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `proyecto_integrador`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_car_shopping_cart1`
    FOREIGN KEY (`shopping_cart_id`)
    REFERENCES `proyecto_integrador`.`shopping_cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador`.`shopping_cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador`.`shopping_cart` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador`.`shopping_cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_date` DATE NOT NULL,
  `modified_date` DATE NOT NULL,
  `state` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador`.`users` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(24) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(16) NOT NULL,
  `create_date` DATE NOT NULL,
  `shopping_cart_id` INT NOT NULL,
  PRIMARY KEY (`id`, `shopping_cart_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_users_shopping_cart1_idx` (`shopping_cart_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_shopping_cart1`
    FOREIGN KEY (`shopping_cart_id`)
    REFERENCES `proyecto_integrador`.`shopping_cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
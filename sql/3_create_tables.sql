-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema interview_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema interview_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `interview_db` DEFAULT CHARACTER SET utf8;
USE `interview_db`;

-- -----------------------------------------------------
-- Table `interview_db`.`employment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(25) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `interview_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`
(
    `id`         INT          NOT NULL AUTO_INCREMENT,
    `login`      VARCHAR(254) NOT NULL,
    `password`   VARCHAR(50)  NOT NULL,
    /**
     * 0 - администратор (Role.ADMINISTRATOR)
	 * 1 - директор (Role.DIRECTOR)
     * 2 - интервьюер (Role.INTERVIEWER)
     * 3 - пользователь (Role.USER)
     */
    `role`       TINYINT      NOT NULL CHECK (`role` IN (0, 1, 2, 3)) DEFAULT 3,
    `name`       VARCHAR(23)  NOT NULL,
    `vacancy_id` INT          NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
    INDEX `user_vacancy_id_fk_idx` (`vacancy_id` ASC) VISIBLE,
    CONSTRAINT `user_vacancy_id_fk`
        FOREIGN KEY (`vacancy_id`)
            REFERENCES `interview_db`.`vacancy` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `interview_db`.`platforms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `platforms`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(25) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `interview_db`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schedule`
(
    `id`        INT         NOT NULL AUTO_INCREMENT,
    `timetable` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `interview_db`.`vacancy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vacancy`
(
    `id`                      INT          NOT NULL AUTO_INCREMENT,
    `topic`                   VARCHAR(50)  NOT NULL,
    `experience`              VARCHAR(5)   NULL     DEFAULT NULL,
    `employment_id`           INT          NOT NULL DEFAULT '1',
    `schedule_id`             INT          NOT NULL DEFAULT '1',
    `description`             VARCHAR(300) NOT NULL,
    `requirements`            VARCHAR(500) NOT NULL,
    `additional_requirements` VARCHAR(500) NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `employment_id_fk_idx` (`employment_id` ASC) VISIBLE,
    INDEX `dad_idx` (`schedule_id` ASC) VISIBLE,
    CONSTRAINT `employment_id_fk`
        FOREIGN KEY (`employment_id`)
            REFERENCES `employment` (`id`)
            ON DELETE RESTRICT,
    CONSTRAINT `schedule_id_fk`
        FOREIGN KEY (`schedule_id`)
            REFERENCES `schedule` (`id`)
            ON DELETE RESTRICT
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `interview_db`.`interview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `interview`
(
    `id`          INT         NOT NULL AUTO_INCREMENT,
    `vacancy_id`  INT         NOT NULL,
    `interviewer_id`     INT         NOT NULL,
    `topic`       VARCHAR(50) NOT NULL,
    `date`        DATE        NOT NULL,
    `start_time`  TIME        NOT NULL,
    `end_time`    TIME        NOT NULL,
    `platform_id` INT         NOT NULL,
    `happen`      BIT(1)      NULL DEFAULT NULL,
    `user_id` INT NULL,
    PRIMARY KEY (`id`),
    INDEX `platform_id_fk_idx` (`platform_id` ASC) VISIBLE,
    INDEX `interviewer_id_fk_idx` (`user_id` ASC) VISIBLE,
    INDEX `vacancy_id_fk_idx` (`vacancy_id` ASC) VISIBLE,
    INDEX `user_id_fk_idx` (`user_id` ASC) VISIBLE,
    CONSTRAINT `interviewer_id_fk`
        FOREIGN KEY (`user_id`)
            REFERENCES `users` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `platform_id_fk`
        FOREIGN KEY (`platform_id`)
            REFERENCES `platforms` (`id`)
            ON DELETE RESTRICT,
    CONSTRAINT `vacancy_id_fk`
        FOREIGN KEY (`vacancy_id`)
            REFERENCES `interview_db`.`vacancy` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `user_id_fk`
        FOREIGN KEY (`user_id`)
            REFERENCES `interview_db`.`users` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `interview_db`.`feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feedback`
(
    `id`                      INT          NOT NULL AUTO_INCREMENT,
    `interview_id`            INT          NOT NULL,
    `user_id`                 INT          NOT NULL,
    `description`             VARCHAR(500) NOT NULL,
    `additional_requirements` BIT(1)       NOT NULL,
    `mark`                    BIT(10)      NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `interview_id_fk_idx` (`interview_id` ASC) VISIBLE,
    UNIQUE INDEX `interview_id_UNIQUE` (`interview_id` ASC) VISIBLE,
    INDEX `user_id_fk_idx` (`user_id` ASC) VISIBLE,
    CONSTRAINT `interview_id_fk`
        FOREIGN KEY (`interview_id`)
            REFERENCES `interview` (`id`),
    CONSTRAINT `interviewer_feedback_fk`
        FOREIGN KEY (`user_id`)
            REFERENCES `users` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE

)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;

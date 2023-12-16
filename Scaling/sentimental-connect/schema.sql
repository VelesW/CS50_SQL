CREATE TABLE IF NOT EXISTS `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(64) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    INDEX `username_index` (`username`),
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(32),
    `est_year` YEAR,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'business') NOT NULL,
    `location` VARCHAR(32),
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `connections_with_people` (
    `user_id_1` INT UNSIGNED,
    `user_id_2` INT UNSIGNED,
    PRIMARY KEY (`user_id_1`, `user_id_2`),
    FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
	FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`)
    -- primary key implies that it enforces
    -- the rule that a connection between two users should be unique
);

CREATE TABLE IF NOT EXISTS `connections_with_schools` (
    `user_id` INT UNSIGNED,
    `school_id` INT UNSIGNED,
    `start_date` DATE,
    `end_date` DATE,
    `status` ENUM('earned', 'pursued'),
    `type` ENUM('BA', 'MA', 'PhD'),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE IF NOT EXISTS `connections_with_companies` (
    `user_id` INT UNSIGNED,
    `company_id` INT UNSIGNED,
    `start_date` DATE,
    `end_date` DATE,
    `title` VARCHAR(32) NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
);

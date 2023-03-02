
CREATE TABLE genre_table (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(250) NOT NULL
);
CREATE TABLE artist_table (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(250) NOT NULL
);
CREATE TABLE album_table (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(250) NOT NULL,
    'year' INT(11) NOT NULL
);
CREATE TABLE tracks_table (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(250) NOT NULL,
    `album_id` INT(11) NOT NULL,
    `duration` INT(11) NOT NULL,
    FOREIGN KEY (`album_id`) REFERENCES album_table(`id`)
);
CREATE TABLE collection_table (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(250) NOT NULL,
    `year` INT(11) NOT NULL
);
CREATE TABLE collection_track_binding_table (
    `collection_id` INT(11) NOT NULL,
    `track_id` INT(11) NOT NULL,
    FOREIGN KEY (`collection_id`) REFERENCES collection_table(`id`),
    FOREIGN KEY (`track_id`) REFERENCES tracks_table(`id`)
);
CREATE TABLE artist_genre_binding_table (
    `artist_id` INT(11) NOT NULL,
    `genre_id` INT(11) NOT NULL,
    FOREIGN KEY (`artist_id`) REFERENCES artist_table(`id`),
    FOREIGN KEY (`genre_id`) REFERENCES genre_table(`id`)
);
CREATE TABLE album_artist_binding_table (
    `album_id` INT(11) NOT NULL,
    `artist_id` INT(11) NOT NULL,
    FOREIGN KEY (`album_id`) REFERENCES album_table(`id`),
    FOREIGN KEY (`artist_id`) REFERENCES artist_table(`id`)
);
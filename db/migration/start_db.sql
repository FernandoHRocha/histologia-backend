CREATE DATABASE histologia;

USE histologia;

CREATE TABLE sheet_group (
    idsheet_group INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE sheet (
    idsheet INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL UNIQUE,
    description VARCHAR(255),
    thumbnail MEDIUMBLOB NOT NULL
);

CREATE TABLE slide (
    idslide INT AUTO_INCREMENT PRIMARY KEY,
    sheet_idsheet INT NOT NULL,
    level INT NOT NULL,
    row INT NOT NULL,
    col INT NOT NULL,
    content MEDIUMBLOB NOT NULL,
    CONSTRAINT FK_slide_sheet_idsheet
        FOREIGN KEY (sheet_idsheet)
        REFERENCES sheet (idsheet)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- CREATE TABLE slide (
--     idslide INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(120) NOT NULL UNIQUE
-- );

-- CREATE TABLE slide_tile (
--     idslide_tile INT AUTO_INCREMENT PRIMARY KEY,
--     slide_idslide INT NOT NULL,
--     row INT NOT NULL,
--     `column` INT NOT NULL,
--     zoom_level INT NOT NULL,
--     raw_slide VARCHAR(MAX) NOT NULL,
--     CONSTRAINT FK_slide_tile_slide_idslide
--         FOREIGN KEY (slide_idslide)
--         REFERENCES slide (idslide)
--         ON DELETE CASCADE
--         ON UPDATE CASCADE
-- );

-- CREATE TABLE slide_place (
--     idslide_place INT AUTO_INCREMENT PRIMARY KEY,
--     slide_idslide INT NOT NULL,
--     name VARCHAR(120) NOT NULL,
--     description VARCHAR(250) NOT NULL,
--     place_x DECIMAL(6,2) NOT NULL,
--     place_y DECIMAL(6,2) NOT NULL,
--     CONSTRAINT FK_slide_place_slide_idslide
--         FOREIGN KEY (slide_idslide)
--         REFERENCES slide (idslide)
--         ON DELETE CASCADE
--         ON UPDATE CASCADE
-- );
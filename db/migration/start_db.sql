CREATE DATABASE histologia;

CREATE TABLE lamina (
    idlamina INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE slide (
    idslide INT AUTO_INCREMENT PRIMARY KEY,
    lamina_idlamina INT NOT NULL,
    level INT NOT NULL,
    row INT NOT NULL,
    col INT NOT NULL,
    content MEDIUMBLOB NOT NULL,
    CONSTRAINT FK_slide_lamina_idlamina
        FOREIGN KEY (lamina_idlamina)
        REFERENCES lamina (idlamina)
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
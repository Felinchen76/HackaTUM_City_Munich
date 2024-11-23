
-- Lösche die Datenbank, falls sie bereits existiert, und erstelle sie neu
DROP DATABASE IF EXISTS user_management_db_hackatum;
CREATE DATABASE IF NOT EXISTS user_management_db_hackatum;

-- Verwende die soeben erstellte Datenbank
USE user_management_db_hackatum;

-- Ändere das Passwort für den root-Benutzer
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';

-- Berechtigungen für root gewähren
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

-- Privilegien neu laden
FLUSH PRIVILEGES;

-- Table for the city parts
CREATE TABLE IF NOT EXISTS city_parts (
    city_part_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- table for the organizations
-- Tabelle für Organisationen erstellen
CREATE TABLE IF NOT EXISTS organizations (
    orga_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- table for the users
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
	surname VARCHAR(100) NOT NULL,
    telegram_id BIGINT UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    city_part_id INT,
    radius_preference INT DEFAULT 1,
    FOREIGN KEY (city_part_id) REFERENCES city_parts(city_part_id)
) ENGINE=InnoDB;

-- Tabelle für Posts erstellen
CREATE TABLE IF NOT EXISTS posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    orga_id INT,
    title VARCHAR(255),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    city_part_id INT,
    FOREIGN KEY (orga_id) REFERENCES organizations(orga_id),
    FOREIGN KEY (city_part_id) REFERENCES city_parts(city_part_id)
) ENGINE=InnoDB;

-- Tabelle für Kategorien erstellen
CREATE TABLE IF NOT EXISTS categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,       -- Primärschlüssel (Auto-Inkrement)
    name VARCHAR(255) UNIQUE                           -- Name der Kategorie, muss einzigartig sein
) ENGINE=InnoDB;

-- Tabelle für die Verknüpfung zwischen Posts und Kategorien erstellen
CREATE TABLE IF NOT EXISTS post_categories (
    post_id INT,                                      -- Fremdschlüssel, der auf die Post-Tabelle verweist
    category_id INT,                                  -- Fremdschlüssel, der auf die Kategorie-Tabelle verweist
    PRIMARY KEY (post_id, category_id),               -- Kombinierter Primärschlüssel
    FOREIGN KEY (post_id) REFERENCES posts(post_id), -- Verknüpfung zu Posts
    FOREIGN KEY (category_id) REFERENCES categories(category_id) -- Verknüpfung zu Kategorien
) ENGINE=InnoDB;

-- Tabelle für die Verknüpfung zwischen Benutzern und ihren Interessen (Kategorien)
CREATE TABLE IF NOT EXISTS user_interests (
    user_id INT,
    category_id INT,
    PRIMARY KEY (user_id, category_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);



-- Mapping of neighboring city parts
CREATE TABLE IF NOT EXISTS city_part_neighbors (
    city_part_id INT,
    neighbor_id INT,
    FOREIGN KEY (city_part_id) REFERENCES city_parts(city_part_id),
    FOREIGN KEY (neighbor_id) REFERENCES city_parts(city_part_id),
    PRIMARY KEY (city_part_id, neighbor_id)
) ENGINE=InnoDB;

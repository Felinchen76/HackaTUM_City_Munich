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

-- Tabelle für Organisationen erstellen
CREATE TABLE IF NOT EXISTS organizations (
    orga_id INT AUTO_INCREMENT PRIMARY KEY,           -- Primärschlüssel (Auto-Inkrement)
    name VARCHAR(100) NOT NULL,                        -- Name der Organisation
    email VARCHAR(100) NOT NULL UNIQUE,                -- E-Mail der Organisation, muss einzigartig sein
    password VARCHAR(255) NOT NULL,                    -- Passwort der Organisation
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP    -- Zeitstempel, wenn der Datensatz erstellt wird
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,           -- Primärschlüssel (Auto-Inkrement)
    name VARCHAR(100) NOT NULL,                        -- Vorname des Benutzers
    surname VARCHAR(100) NOT NULL,                     -- Nachname des Benutzers
    telegram_id BIGINT UNIQUE,                        -- Telegram ID, muss einzigartig sein
	phone_number VARCHAR(15),                          -- Telefonnummer des Benutzers
    password VARCHAR(255) NOT NULL,                    -- Passwort des Benutzers
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP    -- Zeitstempel, wenn der Datensatz erstellt wird
) ENGINE=InnoDB;


-- Tabelle für Posts erstellen
CREATE TABLE IF NOT EXISTS posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,           -- Primärschlüssel (Auto-Inkrement)
    orga_id INT,                                      -- Fremdschlüssel, der auf die Organisation verweist
    title VARCHAR(255),                               -- Titel des Posts
    content TEXT,                                     -- Inhalt des Posts
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   -- Zeitstempel, wann der Post erstellt wurde
    FOREIGN KEY (orga_id) REFERENCES organizations(orga_id) ON DELETE CASCADE -- Verknüpfung zu Organisationen
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
    user_id INT,                                      -- Fremdschlüssel, der auf die Benutzer-Tabelle verweist
    category_id INT,                                  -- Fremdschlüssel, der auf die Kategorie-Tabelle verweist
    PRIMARY KEY (user_id, category_id),               -- Kombinierter Primärschlüssel
    FOREIGN KEY (user_id) REFERENCES users(user_id), -- Verknüpfung zu Benutzern
    FOREIGN KEY (category_id) REFERENCES categories(category_id) -- Verknüpfung zu Kategorien
) ENGINE=InnoDB;

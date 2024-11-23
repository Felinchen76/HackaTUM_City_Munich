CREATE DATABASE IF NOT EXISTS user_management_db_hackatum;

USE user_management_db_hackatum;

-- table for the users
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
	surname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- table for the organizations
CREATE TABLE IF NOT EXISTS organizations (
    orga_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- table for the posts
CREATE TABLE IF NOT EXISTS posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    orga_id INT,
    title VARCHAR(255),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (orga_id) REFERENCES organizations(orga_id)
);

-- table for the different categories
CREATE TABLE IF NOT EXISTS categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE
);

-- link between post and the categories
CREATE TABLE IF NOT EXISTS post_categories (
    post_id INT,
    category_id INT,
    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- link between the user and his/her interests
CREATE TABLE IF NOT EXISTS user_interests (
    user_id INT,
    category_id INT,
    PRIMARY KEY (user_id, category_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
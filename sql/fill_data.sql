-- Dummy Daten für die Users Tabelle

SET foreign_key_checks = 0;

DELETE FROM user_interests;
DELETE FROM post_categories;
DELETE FROM posts;
DELETE FROM organizations;
DELETE FROM categories;
DELETE FROM users;

ALTER TABLE user_interests AUTO_INCREMENT = 1;
ALTER TABLE post_categories AUTO_INCREMENT = 1;
ALTER TABLE posts AUTO_INCREMENT = 1;
ALTER TABLE organizations AUTO_INCREMENT = 1;
ALTER TABLE categories AUTO_INCREMENT = 1;
ALTER TABLE users AUTO_INCREMENT = 1;

INSERT INTO users (name, surname, telegram_id, password, birthdate, phone_number)
VALUES 
    ('John', 'Doe', 7098929783, 'password123', '1990-01-01', '1234567890'),
    ('Jane', 'Smith', NULL, 'abc123', '1992-03-05', '1234567891'),
    ('Michael', 'Johnson', NULL, 'qwerty', '1988-07-10', '1234567892'),
    ('Emily', 'Williams', NULL, 'letmein', '1995-09-15', '1234567893'),
    ('David', 'Brown', NULL, '123456789', '1993-11-20', '1234567894'),
    ('Laura', 'Jones', NULL, 'sunshine', '1985-06-25', '1234567895'),
    ('Daniel', 'Garcia', NULL, 'password1', '1998-02-28', '1234567896'),
    ('Sarah', 'Martinez', NULL, 'iloveyou', '1997-12-12', '1234567897'),
    ('James', 'Hernandez', NULL, 'hello123', '1989-05-05', '1234567898'),
    ('Sophia', 'Lopez', NULL, 'qwertz', '1996-03-22', '1234567899'),
    ('William', 'Miller', NULL, 'welcome2023', '1994-07-30', '1234567810'),
    ('Olivia', 'Davis', NULL, '123qwe', '1990-10-18', '1234567811'),
    ('Ethan', 'Gonzalez', NULL, 'letmein123', '1992-11-14', '1234567812'),
    ('Isabella', 'Wilson', NULL, 'ilove123', '1987-04-19', '1234567813'),
    ('Benjamin', 'Moore', NULL, 'password987', '1993-08-24', '1234567814'),
    ('Charlotte', 'Taylor', NULL, 'securepass', '1991-01-09', '1234567815'),
    ('Liam', 'Anderson', NULL, 'iloveyou1', '1988-02-11', '1234567816'),
    ('Avery', 'Thomas', NULL, 'admin123', '1995-12-06', '1234567817'),
    ('Mason', 'Jackson', NULL, 'qwertyuiop', '1999-09-27', '1234567818'),
    ('Amelia', 'White', NULL, 'strongpass2024', '1986-03-13', '1234567819'),
    ('Lucas', 'Harris', NULL, 'guest1234', '1994-05-08', '1234567820'),
    ('Mia', 'Clark', NULL, 'abc1234', '1991-06-21', '1234567821'),
    ('Alexander', 'Lewis', NULL, 'mypassword', '1989-07-12', '1234567822'),
    ('Harper', 'Young', NULL, '1234abcd', '1997-08-03', '1234567823'),
    ('Henry', 'Allen', NULL, 'secur3pass', '1985-11-09', '1234567824'),
    ('Ella', 'King', NULL, 'thebestpassword', '1998-04-07', '1234567825'),
    ('Sebastian', 'Scott', NULL, 'ilovemyself', '1996-02-26', '1234567826'),
    ('Jack', 'Green', NULL, 'adminpass', '1987-05-17', '1234567827'),
    ('Aiden', 'Adams', NULL, 'hello321', '1993-06-15', '1234567828'),
    ('Zoe', 'Nelson', NULL, 'greenlight', '1990-10-29', '1234567829'),
    ('Matthew', 'Baker', NULL, 'mypass4321', '1994-12-19', '1234567830'),
    ('Lily', 'Perez', NULL, 'goodpassword', '1988-03-25', '1234567831'),
    ('Samuel', 'Carter', NULL, '12345password', '1991-07-20', '1234567832'),
    ('Sophie', 'Mitchell', NULL, 'brightday', '1999-08-28', '1234567833'),
    ('Jack', 'Roberts', NULL, 'blackhole', '1986-09-14', '1234567834'),
    ('Levi', 'Phillips', NULL, 'p@ssw0rd', '1987-12-05', '1234567835'),
    ('Ella', 'Evans', NULL, 'greatpass', '1992-01-18', '1234567836'),
    ('Nathan', 'Turner', NULL, 'secure2023', '1989-02-10', '1234567837'),
    ('Chloe', 'Collins', NULL, 'passwordx', '1996-04-23', '1234567838'),
    ('Isaac', 'Rogers', NULL, 'darknight', '1994-07-16', '1234567839'),
    ('Madison', 'Graham', NULL, 'myname123', '1995-09-05', '1234567840'),
    ('Dylan', 'Rivera', NULL, 'mypass999', '1988-11-25', '1234567841'),
    ('Archer', 'Cooper', NULL, 'mysecurepass', '1991-06-14', '1234567842'),
    ('Scarlett', 'Ward', NULL, 'passwordqwert', '1993-03-11', '1234567843'),
    ('Nathaniel', 'Flores', NULL, '123abc456', '1998-05-29', '1234567844'),
    ('Grace', 'Simmons', NULL, 'whatsup2023', '1990-02-06', '1234567845');

    -- Dummy Daten für die Organizations Tabelle
INSERT INTO organizations (name, email, password)
VALUES 
    ('Tech Corp', 'contact@techcorp.com', 'techpassword1'),
    ('Innovative Solutions', 'info@innosolutions.com', 'innovative2023'),
    ('Digital Nexus', 'support@digitalnexus.com', 'digitalnexus123'),
    ('Green Industries', 'green@industries.com', 'greenpass'),
    ('Cloud Innovations', 'cloud@innovations.com', 'cloudsolutions'),
    ('Techie Labs', 'hello@techielabs.com', 'techie1234'),
    ('Creative Minds', 'info@creativeminds.com', 'creative@2023'),
    ('Alpha Enterprises', 'alpha@enterprises.com', 'enterpr@se2024'),
    ('Future Systems', 'future@systems.com', 'futuresys234'),
    ('Blue Horizon', 'contact@bluehorizon.com', 'bluehorizon!'),
    ('Quantum Solutions', 'quantum@solutions.com', 'quantum321'),
    ('TechSphere', 'techsphere@domain.com', 'sphere@2024'),
    ('NextGen Technologies', 'contact@nextgen.com', 'nextgen2023'),
    ('DataVision', 'info@datavision.com', 'datavision$'),
    ('Smart Ventures', 'smart@ventures.com', 'smart1234'),
    ('Eco Innovations', 'eco@innovations.com', 'eco2024'),
    ('Virtual Dynamics', 'contact@virtualdynamics.com', 'virtual1234'),
    ('Global Enterprises', 'global@enterprises.com', 'globalpass2023'),
    ('TechWorld', 'info@techworld.com', 'techworld!'),
    ('Digital Future', 'contact@digitalfuture.com', 'digitalfuture123'),
    ('Modern Labs', 'modern@labs.com', 'modernlabs@123'),
    ('Cyber Networks', 'cyber@networks.com', 'cyber2024'),
    ('Revolution Inc.', 'revolution@inc.com', 'revolutionX'),
    ('FutureWorks', 'contact@futureworks.com', 'futurework2024'),
    ('Secure Tech', 'secure@tech.com', 'securetech!'),
    ('Innovative Global', 'info@innovativeglobal.com', 'innovativeglobal'),
    ('NextTech Solutions', 'contact@nexttechsolutions.com', 'nexttech2024'),
    ('Urban Innovations', 'urban@innovations.com', 'urban2023'),
    ('Visionary Enterprises', 'visionary@enterprises.com', 'visionary2024'),
    ('SmartCloud', 'contact@smartcloud.com', 'smartcloud123'),
    ('Energy Solutions', 'info@energysolutions.com', 'energy2023'),
    ('SmartWorks', 'info@smartworks.com', 'smartwork2024'),
    ('Mega Technologies', 'mega@technologies.com', 'megatech2024'),
    ('Virtual Enterprises', 'virtual@enterprises.com', 'virtualent2023'),
    ('Infinite Solutions', 'info@infinite.com', 'infinitepass'),
    ('Tech Innovations', 'tech@innovations.com', 'techinnovation2024'),
    ('Big Data Labs', 'contact@bigdatalabs.com', 'bigdata@2024'),
    ('Cyber Vision', 'cyber@vision.com', 'cybervision123'),
    ('Techie Innovations', 'techie@innovations.com', 'techie1234'),
    ('Advanced Tech', 'contact@advancedtech.com', 'advanced2023'),
    ('Pioneers Inc.', 'contact@pioneers.com', 'pioneerspass'),
    ('Cyber Tech Solutions', 'cyber@techsolutions.com', 'cybertechpass'),
    ('TechStart', 'info@techstart.com', 'techstartpass');

    INSERT INTO posts (orga_id, title, content) VALUES
(1, 'Post Title 1', 'This is the content of the first post.'),
(2, 'Post Title 2', 'This is the content of the second post.'),
(3, 'Post Title 3', 'This is the content of the third post.'),
(4, 'Post Title 4', 'This is the content of the fourth post.'),
(5, 'Post Title 5', 'This is the content of the fifth post.'),
(6, 'Post Title 6', 'This is the content of the sixth post.'),
(7, 'Post Title 7', 'This is the content of the seventh post.'),
(8, 'Post Title 8', 'This is the content of the eighth post.'),
(9, 'Post Title 9', 'This is the content of the ninth post.'),
(10, 'Post Title 10', 'This is the content of the tenth post.'),
(11, 'Post Title 11', 'This is the content of the eleventh post.'),
(12, 'Post Title 12', 'This is the content of the twelfth post.'),
(13, 'Post Title 13', 'This is the content of the thirteenth post.'),
(14, 'Post Title 14', 'This is the content of the fourteenth post.'),
(15, 'Post Title 15', 'This is the content of the fifteenth post.'),
(16, 'Post Title 16', 'This is the content of the sixteenth post.'),
(17, 'Post Title 17', 'This is the content of the seventeenth post.'),
(18, 'Post Title 18', 'This is the content of the eighteenth post.'),
(19, 'Post Title 19', 'This is the content of the nineteenth post.'),
(20, 'Post Title 20', 'This is the content of the twentieth post.'),
(21, 'Post Title 21', 'This is the content of the twenty-first post.'),
(22, 'Post Title 22', 'This is the content of the twenty-second post.'),
(23, 'Post Title 23', 'This is the content of the twenty-third post.'),
(24, 'Post Title 24', 'This is the content of the twenty-fourth post.'),
(25, 'Post Title 25', 'This is the content of the twenty-fifth post.'),
(26, 'Post Title 26', 'This is the content of the twenty-sixth post.'),
(27, 'Post Title 27', 'This is the content of the twenty-seventh post.'),
(28, 'Post Title 28', 'This is the content of the twenty-eighth post.'),
(29, 'Post Title 29', 'This is the content of the twenty-ninth post.'),
(30, 'Post Title 30', 'This is the content of the thirtieth post.'),
(31, 'Post Title 31', 'This is the content of the thirty-first post.'),
(32, 'Post Title 32', 'This is the content of the thirty-second post.'),
(33, 'Post Title 33', 'This is the content of the thirty-third post.'),
(34, 'Post Title 34', 'This is the content of the thirty-fourth post.'),
(35, 'Post Title 35', 'This is the content of the thirty-fifth post.'),
(36, 'Post Title 36', 'This is the content of the thirty-sixth post.'),
(37, 'Post Title 37', 'This is the content of the thirty-seventh post.'),
(38, 'Post Title 38', 'This is the content of the thirty-eighth post.'),
(39, 'Post Title 39', 'This is the content of the thirty-ninth post.'),
(40, 'Post Title 40', 'This is the content of the fortieth post.'),
(41, 'Post Title 41', 'This is the content of the forty-first post.'),
(42, 'Post Title 42', 'This is the content of the forty-second post.'),
(43, 'Post Title 43', 'This is the content of the forty-third post.'),
(44, 'Post Title 44', 'This is the content of the forty-fourth post.'),
(45, 'Post Title 45', 'This is the content of the forty-fifth post.'),
(46, 'Post Title 46', 'This is the content of the forty-sixth post.'),
(47, 'Post Title 47', 'This is the content of the forty-seventh post.'),
(48, 'Post Title 48', 'This is the content of the forty-eighth post.'),
(49, 'Post Title 49', 'This is the content of the forty-ninth post.'),
(50, 'Post Title 50', 'This is the content of the fiftieth post.');


-- Dummy Daten für die Categories Tabelle
INSERT INTO categories (name)
VALUES 
    ('Technology'),
    ('Health'),
    ('Finance'),
    ('Education'),
    ('Sports'),
    ('Music'),
    ('Gaming'),
    ('Politics'),
    ('Entertainment'),
    ('Business'),
    ('Environment'),
    ('Travel'),
    ('Lifestyle'),
    ('Food'),
    ('Culture'),
    ('Science'),
    ('Art'),
    ('News'),
    ('History'),
    ('Fashion'),
    ('Software'),
    ('Hardware'),
    ('Books'),
    ('Social Media'),
    ('Movies'),
    ('Investing'),
    ('Economy'),
    ('Marketing'),
    ('Startups'),
    ('Philosophy'),
    ('Psychology'),
    ('Animals'),
    ('Fitness'),
    ('Programming'),
    ('AI & ML'),
    ('Cryptocurrency'),
    ('Astronomy'),
    ('Geography'),
    ('Climate Change'),
    ('Social Issues'),
    ('Language'),
    ('Design'),
    ('Interior Design'),
    ('Architecture'),
    ('Human Rights'),
    ('Technology Trends'),
    ('Research'),
    ('Photography'),
    ('Motivation'),
    ('Web Development');

-- Dummy Daten für die Post Categories Tabelle
INSERT INTO  post_categories (post_id, category_id)
VALUES 
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8),
    (5, 9),
    (5, 10),
    (6, 11),
    (6, 12),
    (7, 13),
    (7, 14),
    (8, 15),
    (8, 16),
    (9, 17),
    (9, 18),
    (10, 19),
    (10, 20),
    (11, 21),
    (11, 22),
    (12, 23),
    (12, 24),
    (13, 25),
    (13, 26),
    (14, 27),
    (14, 28),
    (15, 29),
    (15, 30),
    (16, 31),
    (16, 32),
    (17, 33),
    (17, 34),
    (18, 35),
    (18, 36),
    (19, 37),
    (19, 38),
    (20, 39),
    (20, 40),
    (21, 41),
    (21, 42),
    (22, 43),
    (22, 44),
    (23, 45),
    (23, 46),
    (24, 47),
    (24, 48),
    (25, 49),
    (25, 50);

-- Dummy Daten für die User Interests Tabelle
INSERT INTO user_interests (user_id, category_id)
VALUES 
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8),
    (5, 9),
    (5, 10),
    (6, 11),
    (6, 12),
    (7, 13),
    (7, 14),
    (8, 15),
    (8, 16),
    (9, 17),
    (9, 18),
    (10, 19),
    (10, 20),
    (11, 21),
    (11, 22),
    (12, 23),
    (12, 24),
    (13, 25),
    (13, 26),
    (14, 27),
    (14, 28),
    (15, 29),
    (15, 30),
    (16, 31),
    (16, 32),
    (17, 33),
    (17, 34),
    (18, 35),
    (18, 36),
    (19, 37),
    (19, 38),
    (20, 39),
    (20, 40),
    (21, 41),
    (21, 42),
    (22, 43),
    (22, 44),
    (23, 45),
    (23, 46),
    (24, 47),
    (24, 48),
    (25, 49),
    (25, 50);

INSERT INTO city_parts (name)
VALUES 
    ('Altstadt-Lehel'),
    ('Ludwigsvorstadt-Isarvorstadt'),
    ('Maxvorstadt'),
    ('Schwabing-West'),
    ('Schwabing-Freimann'),
    ('Neuhausen-Nymphenburg'),
    ('Sendling'),
    ('Sendling-Westpark'),
    ('Thalkirchen-Obersendling-Forstenried-Fürstenried-Solln'),
    ('Hadern'),
    ('Pasing-Obermenzing'),
    ('Aubing-Lochhausen-Langwied'),
    ('Moosach'),
    ('Milbertshofen-Am Hart'),
    ('Bogenhausen'),
    ('Berg am Laim'),
    ('Trudering-Riem'),
    ('Ramersdorf-Perlach'),
    ('Obergiesing-Fasangarten'),
    ('Untergiesing-Harlaching');

-- Neighbor relationships for city parts
INSERT INTO city_part_neighbors (city_part_id, neighbor_id)
VALUES
    (1, 2),  -- Altstadt-Lehel and Ludwigsvorstadt-Isarvorstadt are neighbors
    (2, 1),  -- Ludwigsvorstadt-Isarvorstadt and Altstadt-Lehel are neighbors
    (2, 3),  -- Ludwigsvorstadt-Isarvorstadt and Maxvorstadt are neighbors
    (3, 2),  -- Maxvorstadt and Ludwigsvorstadt-Isarvorstadt are neighbors
    (3, 4),  -- Maxvorstadt and Schwabing-West are neighbors
    (4, 3),  -- Schwabing-West and Maxvorstadt are neighbors
    (4, 5),  -- Schwabing-West and Schwabing-Freimann are neighbors
    (5, 4),  -- Schwabing-Freimann and Schwabing-West are neighbors
    (5, 6),  -- Schwabing-Freimann and Neuhausen-Nymphenburg are neighbors
    (6, 5),  -- Neuhausen-Nymphenburg and Schwabing-Freimann are neighbors
    (6, 7),  -- Neuhausen-Nymphenburg and Sendling are neighbors
    (7, 6),  -- Sendling and Neuhausen-Nymphenburg are neighbors
    (7, 8),  -- Sendling and Sendling-Westpark are neighbors
    (8, 7),  -- Sendling-Westpark and Sendling are neighbors
    (8, 9),  -- Sendling-Westpark and Thalkirchen-Obersendling-Forstenried-Fürstenried-Solln are neighbors
    (9, 8),  -- Thalkirchen-Obersendling-Forstenried-Fürstenried-Solln and Sendling-Westpark are neighbors
    (9, 10), -- Thalkirchen-Obersendling-Forstenried-Fürstenried-Solln and Hadern are neighbors
    (10, 9), -- Hadern and Thalkirchen-Obersendling-Forstenried-Fürstenried-Solln are neighbors
    (10, 11), -- Hadern and Pasing-Obermenzing are neighbors
    (11, 10), -- Pasing-Obermenzing and Hadern are neighbors
    (11, 12), -- Pasing-Obermenzing and Aubing-Lochhausen-Langwied are neighbors
    (12, 11), -- Aubing-Lochhausen-Langwied and Pasing-Obermenzing are neighbors
    (12, 13), -- Aubing-Lochhausen-Langwied and Moosach are neighbors
    (13, 12), -- Moosach and Aubing-Lochhausen-Langwied are neighbors
    (13, 14), -- Moosach and Milbertshofen-Am Hart are neighbors
    (14, 13), -- Milbertshofen-Am Hart and Moosach are neighbors
    (14, 15), -- Milbertshofen-Am Hart and Bogenhausen are neighbors
    (15, 14), -- Bogenhausen and Milbertshofen-Am Hart are neighbors
    (15, 16), -- Bogenhausen and Berg am Laim are neighbors
    (16, 15), -- Berg am Laim and Bogenhausen are neighbors
    (16, 17), -- Berg am Laim and Trudering-Riem are neighbors
    (17, 16), -- Trudering-Riem and Berg am Laim are neighbors
    (17, 18), -- Trudering-Riem and Ramersdorf-Perlach are neighbors
    (18, 17), -- Ramersdorf-Perlach and Trudering-Riem are neighbors
    (18, 19), -- Ramersdorf-Perlach and Obergiesing-Fasangarten are neighbors
    (19, 18), -- Obergiesing-Fasangarten and Ramersdorf-Perlach are neighbors
    (19, 20), -- Obergiesing-Fasangarten and Untergiesing-Harlaching are neighbors
    (20, 19); -- Untergiesing-Harlaching and Obergiesing-Fasangarten are neighbors
SET foreign_key_checks = 1;

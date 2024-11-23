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

INSERT INTO users (name, surname, email, password)
VALUES 
    ('John', 'Doe', 'john.doe@example.com', 'password123'),
    ('Jane', 'Smith', 'jane.smith@example.com', 'abc123'),
    ('Michael', 'Johnson', 'michael.johnson@example.com', 'qwerty'),
    ('Emily', 'Williams', 'emily.williams@example.com', 'letmein'),
    ('David', 'Brown', 'david.brown@example.com', '123456789'),
    ('Laura', 'Jones', 'laura.jones@example.com', 'sunshine'),
    ('Daniel', 'Garcia', 'daniel.garcia@example.com', 'password1'),
    ('Sarah', 'Martinez', 'sarah.martinez@example.com', 'iloveyou'),
    ('James', 'Hernandez', 'james.hernandez@example.com', 'hello123'),
    ('Sophia', 'Lopez', 'sophia.lopez@example.com', 'qwertz'),
    ('William', 'Miller', 'william.miller@example.com', 'welcome2023'),
    ('Olivia', 'Davis', 'olivia.davis@example.com', '123qwe'),
    ('Ethan', 'Gonzalez', 'ethan.gonzalez@example.com', 'letmein123'),
    ('Isabella', 'Wilson', 'isabella.wilson@example.com', 'ilove123'),
    ('Benjamin', 'Moore', 'benjamin.moore@example.com', 'password987'),
    ('Charlotte', 'Taylor', 'charlotte.taylor@example.com', 'securepass'),
    ('Liam', 'Anderson', 'liam.anderson@example.com', 'iloveyou1'),
    ('Avery', 'Thomas', 'avery.thomas@example.com', 'admin123'),
    ('Mason', 'Jackson', 'mason.jackson@example.com', 'qwertyuiop'),
    ('Amelia', 'White', 'amelia.white@example.com', 'strongpass2024'),
    ('Lucas', 'Harris', 'lucas.harris@example.com', 'guest1234'),
    ('Mia', 'Clark', 'mia.clark@example.com', 'abc1234'),
    ('Alexander', 'Lewis', 'alexander.lewis@example.com', 'mypassword'),
    ('Harper', 'Young', 'harper.young@example.com', '1234abcd'),
    ('Henry', 'Allen', 'henry.allen@example.com', 'secur3pass'),
    ('Ella', 'King', 'ella.king@example.com', 'thebestpassword'),
    ('Sebastian', 'Scott', 'sebastian.scott@example.com', 'ilovemyself'),
    ('Jack', 'Green', 'jack.green@example.com', 'adminpass'),
    ('Aiden', 'Adams', 'aiden.adams@example.com', 'hello321'),
    ('Zoe', 'Nelson', 'zoe.nelson@example.com', 'greenlight'),
    ('Matthew', 'Baker', 'matthew.baker@example.com', 'mypass4321'),
    ('Lily', 'Perez', 'lily.perez@example.com', 'goodpassword'),
    ('Samuel', 'Carter', 'samuel.carter@example.com', '12345password'),
    ('Sophie', 'Mitchell', 'sophie.mitchell@example.com', 'brightday'),
    ('Jack', 'Roberts', 'jack.roberts@example.com', 'blackhole'),
    ('Levi', 'Phillips', 'levi.phillips@example.com', 'p@ssw0rd'),
    ('Ella', 'Evans', 'ella.evans@example.com', 'greatpass'),
    ('Nathan', 'Turner', 'nathan.turner@example.com', 'secure2023'),
    ('Chloe', 'Collins', 'chloe.collins@example.com', 'passwordx'),
    ('Isaac', 'Rogers', 'isaac.rogers@example.com', 'darknight'),
    ('Madison', 'Graham', 'madison.graham@example.com', 'myname123'),
    ('Dylan', 'Rivera', 'dylan.rivera@example.com', 'mypass999'),
    ('Archer', 'Cooper', 'archer.cooper@example.com', 'mysecurepass'),
    ('Scarlett', 'Ward', 'scarlett.ward@example.com', 'passwordqwert'),
    ('Nathaniel', 'Flores', 'nathaniel.flores@example.com', '123abc456'),
    ('Grace', 'Simmons', 'grace.simmons@example.com', 'whatsup2023');

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
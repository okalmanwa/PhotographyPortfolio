-- database: ../test.sqlite
-- Database: ../test.sqlite
-- Users for login
CREATE TABLE users (
  id INTEGER NOT NULL UNIQUE,
  username TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT)
);

-- password: monkey
INSERT INTO
  users (id, username, password)
VALUES
  (
    1,
    'admin',
    '$2y$10$QtCybkpkzh7x5VN11APHned4J8fu78.eFXlyAMmahuAaNcbwZ7FH.'
  );
  
 --- Sessions ---
CREATE TABLE sessions (
  id INTEGER NOT NULL UNIQUE,
  user_id INTEGER NOT NULL,
  session TEXT NOT NULL UNIQUE,
  last_login TEXT NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT) FOREIGN KEY(user_id) REFERENCES users(id)
);




-- Note: Do not delete the line above! It is helpful for testing your init.sql file.
--Photo Entries Table
CREATE TABLE photo_entries (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    date_posted DATE NOT NULL,
    file_name TEXT NOT NULL,
    file_ext TEXT NOT NULL,
    source TEXT
);


--Tags Table
CREATE TABLE tags (
    id INTEGER NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE,
    PRIMARY KEY(id AUTOINCREMENT)
);

--Photo Tags Table
CREATE TABLE photo_tags (
    id INTEGER NOT NULL UNIQUE,
    tag_id INTEGER NOT NULL,
    photo_entries_id INTEGER NOT NULL,
    PRIMARY KEY(id AUTOINCREMENT) FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (photo_entries_id) REFERENCES photo_entries(id)
);

-- Inserting seed data into photo_entries with all details included
INSERT INTO photo_entries (title, description, date_posted, file_name, file_ext, source) VALUES
('Sunset at the Lake', 'A serene sunset over the calm waters of the lake.', '2023-01-15', 'sunset_lake', 'jpg', 'https://www.pexels.com/photo/lake-in-cove-island-park-at-sunset-18885393/'),
('The Urban Jungle', 'Exploring the bustling life of the city.', '2023-02-20', 'urban_jungle', 'jpg', 'https://www.bdcnetwork.com/sites/default/files/AdobeStock_624499925.jpg'),
('Starry Night Camping', 'A night under the stars, away from the city lights.', '2023-03-05', 'starry_night_camping', 'jpg', 'https://images.ctfassets.net/cnu0m8re1exe/6rkPDdVnHFMDz29XtjWXuY/fc31afa24685cb2babdb2a32dc2bfa7d/shutterstock_169805951.jpg?fm=jpg&fl=progressive&w=660&h=433&fit=fill'),
('Misty Mountains', 'Early morning fog wrapping around the mountain peaks.', '2023-04-10', 'misty_mountains', 'jpg', 'https://iso.500px.com/wp-content/uploads/2018/03/500px_misty_mountain_tutorial.jpg'),
('Autumn Leaves', 'The warm colors of fall enveloping the forest.', '2023-05-15', 'autumn_leaves', 'jpg', 'https://www.usatoday.com/gcdn/media/2020/09/11/USATODAY/usatsports/ghows_gallery-WL-822009996-7ffc2013.jpg?crop=1440,810,x0,y495&width=1440&height=810&format=pjpg&auto=webp'),
('City Lights', 'The vibrant life of the city captured at night.', '2023-06-20', 'city_lights', 'jpg', 'https://www.komar.de/media/catalog/product/cache/5/image/9df78eab33525d08d6e5fb8d27136e95/8/5/8516_1.jpg'),
('Snowy Path', 'A peaceful path blanketed in snow, untouched and serene.', '2023-07-25', 'snowy_path', 'jpg', 'https://i1.wp.com/cornellsun.com/wp-content/uploads/2019/12/SNOWDAY-Michael-Li-16.jpg?fit=1170%2C780&ssl=1'),
('Desert Dunes', 'The majestic and ever-changing dunes of the desert.', '2023-08-30', 'desert_dunes', 'jpg', 'https://www.pexels.com/search/desert%20dunes/'),
('Blooming Spring', 'Spring brings life, colors, and beauty to the world.', '2023-09-05', 'blooming_spring', 'jpg', 'https://miro.medium.com/v2/resize:fit:1125/1*7OoPTVRCd_dgV1diR1DGlg.jpeg'),
('Rustic Countryside', 'Exploring the simplicity and charm of countryside life.', '2023-10-10', 'rustic_countryside', 'jpg', 'https://i0.wp.com/racinecountyeye.com/wp-content/uploads/2021/06/TangentMaterials-70791-Tips-Moving-Countryside-image1.jpg'),
('Ocean Horizons', 'The endless view of the ocean meeting the sky at the horizon.', '2023-11-01', 'ocean_horizons', 'jpg', 'https://www.pexels.com/search/ocean%20horizons/'),
('Golden Gate at Dusk', 'The iconic bridge basked in the warm colors of the setting sun.', '2023-11-15', 'golden_gate_dusk', 'jpg', 'https://www.pexels.com/photo/silhouette-of-golden-gate-bridge-during-golden-hour-1485894/'),
('Rainforest Canopy', 'The lush greenery of the rainforest from a bird’s eye view.', '2023-12-01', 'rainforest_canopy', 'jpg', 'https://cdn.mos.cms.futurecdn.net/AzLw36m6K3JSvLYCdCPL94.jpg'),
('Northern Lights', 'A magical display of the aurora borealis in the night sky.', '2023-12-15', 'northern_lights', 'jpg', 'https://www.pexels.com/search/northern%20lights/'),
('Wildflower Meadow', 'A field full of vibrant wildflowers swaying in the breeze.', '2024-01-10', 'wildflower_meadow', 'jpg', 'https://www.pexels.com/search/wildflower%20meadow/'),
('Glacial Wonders', 'The majestic beauty of glaciers under the bright sun.', '2024-01-25', 'glacial_wonders', 'jpg', 'https://www.pexels.com/search/glacial%20wonders/'),
('Underwater Coral', 'The vivid colors and life found in a coral reef.', '2024-02-10', 'underwater_coral', 'jpg', 'https://www.barrierreef.org/generated/1280w-3-2/000202003-sea-fan-side-view6-reef-images-with-red-tones-jpg.jpg?1675309500'),
('Windy Desert Sands', 'Sand patterns formed by the relentless desert winds.', '2024-02-25', 'windy_desert_sands', 'jpg', 'https://scx2.b-cdn.net/gfx/news/hires/2023/dust-storm.jpg'),
('Highland Vistas', 'Expansive views from atop rolling highland hills.', '2024-03-12', 'highland_vistas', 'jpg', 'https://www.inspiringtravelscotland.com/wp-content/uploads/2019/05/Quiraing-Skye-Scottish-Highlands.jpg'),
('Ancient City Ruins', 'The remains of an ancient civilization, standing the test of time.', '2024-03-26', 'ancient_city_ruins', 'jpg', 'https://turkishmuseums.com/Uploads//Blog/Foto/Foto%C4%9Fraflar/029480d1-648c-4608-97a4-d18d4f98c29f.jpg');

-- Seed data for Tags
INSERT INTO
    tags (name)
VALUES
    ('Nature');

INSERT INTO
    tags (name)
VALUES
    ('Urban');

INSERT INTO
    tags (name)
VALUES
    ('Camping');

INSERT INTO
    tags (name)
VALUES
    ('Sunset');

INSERT INTO
    tags (name)
VALUES
    ('Mountains');

INSERT INTO
    tags (name)
VALUES
    ('Warm');

INSERT INTO
    tags (name)
VALUES
    ('Cool');

INSERT INTO
    tags (name)
VALUES
    ('Night');

INSERT INTO
    tags (name)
VALUES
    ('Water');

INSERT INTO
    tags (name)
VALUES
    ('Day');

-- Seed data for photo Tags
INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 1);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (4, 1);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (2, 2);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (8, 2);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (3, 3);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (8, 3);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 4);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (5, 4);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 5);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (6, 5);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (2, 6);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (8, 6);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (7, 7);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 7);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 8);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (10, 8);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 9);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (9, 9);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 10);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (10, 10);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (9, 11);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 11);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (4, 12);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (2, 12);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 13);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (9, 13);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (8, 14);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (7, 14);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 15);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (10, 15);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (7, 16);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 16);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (9, 17);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 17);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 18);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (10, 18);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (1, 19);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (5, 19);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (2, 20);

INSERT INTO
    photo_tags (tag_id, photo_entries_id)
VALUES
    (10, 20);

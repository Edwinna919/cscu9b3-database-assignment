-- Create database
CREATE DATABASE IF NOT EXISTS art_exhibition_db;
USE art_exhibition_db;

-- 1. Create Artist table
CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50)
);

-- 2. Create Artwork table
CREATE TABLE Artwork (
    artwork_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    creation_year INT,
    medium VARCHAR(100),
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

-- 3. Create Exhibition table
CREATE TABLE Exhibition (
    exhibition_id INT PRIMARY KEY,
    exhibition_name VARCHAR(200) NOT NULL,
    start_date DATE,
    end_date DATE,
    venue VARCHAR(100)
);

-- 4. Create Exhibition_Artwork associative table with composite key
CREATE TABLE Exhibition_Artwork (
    exhibition_id INT,
    artwork_id INT,
    loan_fee DECIMAL(10,2),
    insurance_value DECIMAL(10,2),
    PRIMARY KEY (exhibition_id, artwork_id),
    FOREIGN KEY (exhibition_id) REFERENCES Exhibition(exhibition_id),
    FOREIGN KEY (artwork_id) REFERENCES Artwork(artwork_id)
);
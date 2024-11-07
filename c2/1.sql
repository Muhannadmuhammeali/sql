CREATE TABLE Event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    Descr VARCHAR(255),
    city VARCHAR(50)
);

CREATE TABLE Participant (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    event_id INT,
    gender ENUM('M', 'F'),
    year INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE TABLE Prizes (
    prize_id INT PRIMARY KEY AUTO_INCREMENT,
    money INT,
    event_id INT,
    raank INT,
    year INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE TABLE Winners (
    prize_id INT,
    player_id INT,
    FOREIGN KEY (prize_id) REFERENCES Prizes(prize_id),
    FOREIGN KEY (player_id) REFERENCES Participant(player_id)
);

DELIMITER //

CREATE TRIGGER create_prizes_after_insert_event
AFTER INSERT ON Event
FOR EACH ROW
BEGIN
  INSERT INTO Prizes (money, event_id, raank, year)
  VALUES (1500, NEW.event_id, 1, YEAR(CURDATE())),
         (1000, NEW.event_id, 2, YEAR(CURDATE())),
         (500, NEW.event_id, 3, YEAR(CURDATE()));
END //

DELIMITER;

INSERT INTO Event (name, descr, city)
VALUES
    ('Chess Tournament', 'Annual Chess Championship', 'New York');

INSERT INTO Participant (name, event_id, gender, year)
VALUES
    ('John Doe', 1, 'M', 2023),
    ('Jane Smith', 1, 'F', 2023);

INSERT INTO Prizes (money, event_id, raank, year)
VALUES
    (1000, 1, 1, 2023),
    (500, 1, 2, 2023),
    (250, 1, 3, 2023);

INSERT INTO Winners (prize_id, player_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);


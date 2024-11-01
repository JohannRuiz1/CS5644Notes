CREATE TABLE People(
    id          VARCHAR(10) PRIMARY KEY,
    name        VARCHAR(255),
    age         INT,
    address     TEXT
);

CREATE TABLE Courses(
    id          VARCHAR(10) PRIMARY KEY,
    name        VARCHAR(255),
    department  VARCHAR(255)
);

CREATE TABLE Grades(
    pid         VARCHAR(10),
    cid         VARCHAR(10),
    grade       DECIMAL(3,2),
    FOREIGN KEY (pid) REFERENCES People(id),
    FOREIGN KEY (cid) REFERENCES Courses(id)
);
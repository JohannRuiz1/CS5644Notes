INSERT INTO People (id, name, age, address)
VALUES  ('p1', 'Tom Martin', 24, '11, Integer Avenue, Fractions, MA'),
        ('p2', 'Al Smith', 33, '26, Main Street, Noman''s Land, PA'),
        ('p3', 'Kim Burton', 40, '45, Elm Steet, Blacksburg, VA');


INSERT INTO Courses (id, name, department)
VALUES  ('c1', 'Systematic Torture', 'MATH'),
        ('c2', 'Pretty Painful', 'CS'),
        ('c3', 'Not so Bad', 'MATH'),
        ('c4', 'Big Data', 'CS');

INSERT INTO Grades (pid, cid, grade)
VALUES  ('p1', 'c1', 3.5),
        ('p1', 'c2', 3.6),
        ('p1', 'c3', 2.6),
        ('p1', 'c4', 3.7),
        ('p2', 'c3', 2.5),
        ('p3', 'c2', 4.0),
        ('p3', 'c4', 3.85);

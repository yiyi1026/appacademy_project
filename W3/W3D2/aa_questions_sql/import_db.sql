CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname VARCHAR (100) NOT NULL,
  lname VARCHAR (100) NOT NULL
);

CREATE TABLE  questions(
  id INTEGER PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  body VARCHAR(500) NOT NULL,
  author_id INTEGER,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE  question_follows(
  id INTEGER PRIMARY KEY,
  follower_id INTEGER,
  question_id INTEGER,
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  author_id INTEGER,
  parent_id INTEGER,
  body VARCHAR(500) NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (author_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  liker_id INTEGER,
  question_id INTEGER,
  FOREIGN KEY (liker_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Chris', 'Sql'),
  ('Hui', 'Mission'),
  ('Jared', 'from Silicon Valley'),
  ('Keyser Shosay', 'from Usual Suspects'),
  ('Wonder', 'Woman');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('questions1', 'ace', 1),
  ('questions2', 'base', 2),
  ('questions3', 'case', 1),
  ('questions4', 'mase', 5),
  ('questions5', 'lace', 3),
  ('questions6', 'race', 3);

INSERT INTO
  question_follows(follower_id, question_id)
VALUES
  (1, 1),
  (1, 3),
  (2, 1),
  (2, 2),
  (2, 4),
  (3, 3),
  (3, 1),
  (4, 3),
  (5, 2),
  (5, 4);

INSERT INTO
  replies(question_id, author_id, parent_id, body)
VALUES
  (1, 2, 0, 'lkasjflakjflaksjflaksjdflk'),
  (1, 1, 1, '7079079807980'),
  (1, 5, 2, '10101010101010101010101'),
  (2, 5, 0, 'zzzzzzzzzzzzz'),
  (2, 4, 4, 'ALSKDFJALKSDJFLAKSJF');

INSERT INTO
  question_likes(liker_id, question_id)
VALUES
(1, 4),
(1, 6),
(2, 1),
(2, 3),
(2, 3),
(3, 6),
(3, 2),
(4, 1),
(5, 3),
(5, 6);

CREATE TABLE accounts(
  id integer PRIMARY KEY,
  user_id text,
  password text);

CREATE TABLE bulletin_boards(
  id integer PRIMARY KEY,
  user_id text,
  page_name text,
  url text);

INSERT INTO accounts(id,user_id,password)
  VALUES(2,"kaneko","yasuyuki");

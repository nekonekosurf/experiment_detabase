CREATE TABLE accounts(
  id integer PRIMARY KEY,
  user_id text,
  password text);

CREATE TABLE bulletin_boards(
  id integer PRIMARY KEY,
  user_id text,
  message text,
  taimu text);

INSERT INTO accounts(id,user_id,password)
  VALUES(1,"neko","nyaa");

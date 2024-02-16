CREATE TABLE IF NOT EXISTS Жанры (
  ID_жанра SERIAL PRIMARY KEY,
  название_жанра VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Исполнители (
  ID_исполнителя SERIAL PRIMARY KEY,
  имя_исполнителя VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Альбомы (
  ID_альбома SERIAL PRIMARY KEY,
  название_альбома VARCHAR(100) NOT NULL,
  год_выпуска INTEGER CHECK (год_выпуска >= 1950) NOT NULL
);

CREATE TABLE IF NOT EXISTS Треки (
  ID_трека SERIAL PRIMARY KEY,
  название_трека VARCHAR(100) NOT NULL,
  длительность NUMERIC(1, 2) CHECK (длительность > 0) NOT NULL,
  ID_альбома INTEGER UNIQUE,
  FOREIGN KEY (ID_альбома) REFERENCES Альбомы(ID_альбома)
);

CREATE TABLE IF NOT EXISTS Сборники (
  ID_сборника SERIAL PRIMARY KEY,
  название_сборника VARCHAR(100) NOT NULL,
  год_выпуска INTEGER CHECK (год_выпуска >= 1950) NOT NULL
);

CREATE TABLE IF NOT EXISTS Исполнители_Жанры (
  ID_исполнителя INTEGER,
  ID_жанра INTEGER,
  FOREIGN KEY (ID_исполнителя) REFERENCES Исполнители(ID_исполнителя),
  FOREIGN KEY (ID_жанра) REFERENCES Жанры(ID_жанра),
  PRIMARY KEY (ID_исполнителя, ID_жанра)
);

CREATE TABLE IF NOT EXISTS Исполнители_Альбомы (
  ID_исполнителя INTEGER,
  ID_альбома INTEGER,
  FOREIGN KEY (ID_исполнителя) REFERENCES Исполнители(ID_исполнителя),
  FOREIGN KEY (ID_альбома) REFERENCES Альбомы(ID_альбома),
  PRIMARY KEY (ID_исполнителя, ID_альбома)
);

CREATE TABLE IF NOT EXISTS Сборники_Треки (
  ID_сборника INTEGER,
  ID_трека INTEGER,
  FOREIGN KEY (ID_сборника) REFERENCES Сборники(ID_сборника),
  FOREIGN KEY (ID_трека) REFERENCES Треки(ID_трека),
  PRIMARY KEY (ID_сборника, ID_трека)
);
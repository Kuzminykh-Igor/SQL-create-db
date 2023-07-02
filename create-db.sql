CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(64) UNIQUE NOT NULL
);
	
CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_artist (
	genre_id INTEGER REFERENCES genre(id),
	artist_id INTEGER REFERENCES artist(id),
	CONSTRAINT genre_artist_pk PRIMARY KEY (genre_id, artist_id)
);
	
CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(64) NOT NULL,
	year_release SMALLINT NOT NULL
);
	
CREATE TABLE IF NOT EXISTS album_artist (
	artist_id INTEGER REFERENCES artist(id),
	album_id INTEGER REFERENCES album(id),
	CONSTRAINT album_artist_pk PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	name VARCHAR(64) NOT NULL,
	duration TIME NOT NULL,
	album_id INTEGER REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(64) NOT NULL,
	year_release SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS track_collection (
	track_id INTEGER REFERENCES track(id),
	collection_id INTEGER REFERENCES collection(id),
	CONSTRAINT track_collection_pk PRIMARY KEY (track_id, collection_id)
);
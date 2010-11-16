DROP TABLE users;
CREATE TABLE users (
	  id                  SERIAL                   PRIMARY KEY
	, email	              VARCHAR                  NOT NULL UNIQUE
	, zipcode		      CHAR(5)                  NOT NULL
	, password            CHAR(32)                 NOT NULL
	, locked              BOOLEAN                  NOT NULL DEFAULT 'false'
	, locked_reason       VARCHAR
	, confirmation_code   CHAR(32)                 NOT NULL
	, confirmation_expire TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()+'1 hour'::INTERVAL
	, confirmed           BOOLEAN                  NOT NULL DEFAULT 'false'
);

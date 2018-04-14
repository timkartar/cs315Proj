-- CREATE DATABASE cs315;

use cs315;


CREATE TABLE IF NOT EXISTS users (
	name VARCHAR(30) NOT NULL,
	username VARCHAR(30) NOT NULL PRIMARY KEY,
	email VARCHAR(50) NOT NULL,
	password TEXT NOT NULL,
	location VARCHAR(50),
	date TIMESTAMP
);

CREATE TABLE IF NOT EXISTS branches (
	 branch_ID INT UNSIGNED NOT NULL PRIMARY KEY,
	 address VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS books (
	book_ID INT UNSIGNED NOT NULL PRIMARY KEY,
	book_name VARCHAR(30) NOT NULL,
  author VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS book_issues (
	issue_ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	book_ID INT UNSIGNED NOT NULL ,
	branch_ID INT UNSIGNED NOT NULL ,
	username VARCHAR(30) NOT NULL ,
	issue_date DATE NOT NULL,
	due_date DATE NOT NULL ,
	return_date DATE NOT NULL,
	FOREIGN KEY (book_ID) REFERENCES books(book_ID) ON DELETE CASCADE,
	FOREIGN KEY (branch_ID) REFERENCES branches(branch_ID) ON DELETE CASCADE,
	FOREIGN KEY (username) REFERENCES users(username)
);


CREATE TABLE IF NOT EXISTS copies (
	 book_ID INT UNSIGNED NULL ,
	 branch_ID INT UNSIGNED NULL ,
	 num_copies INT UNSIGNED NULL ,
	 PRIMARY KEY (book_ID, branch_ID),
	 FOREIGN KEY (book_ID) REFERENCES books(book_ID) ON DELETE CASCADE,
 	 FOREIGN KEY (branch_ID) REFERENCES branches(branch_ID) ON DELETE CASCADE
 );


CREATE TABLE IF NOT EXISTS staff (
	 username VARCHAR(50)  PRIMARY KEY,
	 password TEXT NOT NULL,
	 branch_ID INT UNSIGNED NOT NULL,
	 FOREIGN KEY (branch_ID) REFERENCES branches(branch_ID) ON DELETE CASCADE
);

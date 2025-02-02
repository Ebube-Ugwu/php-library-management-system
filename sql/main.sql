CREATE DATABASE if not exists library_ms_app;
USE library_ms_app;

CREATE TABLE IF NOT EXISTS admins (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(256) NOT NULL,
    UNIQUE (email),
    password VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at  DATETIME DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS students (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    `class` VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at  DATETIME DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS books (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    image VARCHAR(255),
    pages INT,
    created_at DATETIME DEFAULT NOW(),
    updated_at  DATETIME DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS book_requests (
    book_id INT NOT NULL,
    student_id INT NOT NULL,
    is_approved BOOL default 0,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    PRIMARY KEY (book_id, student_id),
    created_at DATETIME DEFAULT NOW(),
    updated_at  DATETIME DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS borrowed_books (
    book_id INT NOT NULL,
    student_id INT NOT NULL,
    due_date DATE NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    PRIMARY KEY (book_id, student_id),
    created_at DATETIME DEFAULT NOW(),
    updated_at  DATETIME DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS messages (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    student_id INT NOT NULL,
    body TEXT NOT NULL,
    is_seen TINYINT NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at  DATETIME DEFAULT NOW(),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);    
    
CREATE TABLE IF NOT EXISTS suspensions (
    remark VARCHAR(50) NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    expiry_date DATETIME NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at  DATETIME DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS pardons (
    book_id INT NOT NULL,
    remark VARCHAR(50) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    expiry_date DATETIME NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at  DATETIME DEFAULT NOW()
);

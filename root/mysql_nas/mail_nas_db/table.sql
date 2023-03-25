-- 사용자 정보 테이블
CREATE TABLE users (
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- 메일 정보 테이블
CREATE TABLE messages (
    id INT(11) NOT NULL AUTO_INCREMENT,
    sender_id INT(11) NOT NULL,
    recipient_id INT(11) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    sent_at DATETIME NOT NULL,
    read_at DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (recipient_id) REFERENCES users(id)
);

-- 메일함 정보 테이블
CREATE TABLE folders (
    id INT(11) NOT NULL AUTO_INCREMENT,
    user_id INT(11) NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 메일 첨부파일 정보 테이블
CREATE TABLE attachments (
    id INT(11) NOT NULL AUTO_INCREMENT,
    message_id INT(11) NOT NULL,
    filename VARCHAR(255) NOT NULL,
    content_type VARCHAR(50) NOT NULL,
    data BLOB NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (message_id) REFERENCES messages(id)
);

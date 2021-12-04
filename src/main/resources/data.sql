CREATE TABLE IF NOT EXISTS document(
                                       id int AUTO_INCREMENT PRIMARY KEY,
                                       name varchar(45) NOT NULL,
    code varchar(2) NOT NULL
    );

CREATE TABLE IF NOT EXISTS country(
                                      id int AUTO_INCREMENT PRIMARY KEY,
                                      name nvarchar(45) NOT NULL,
    code varchar(3) NOT NULL
    );

CREATE TABLE IF NOT EXISTS organization (
                                            id bigint AUTO_INCREMENT PRIMARY KEY,
                                            name nvarchar(45) NOT NULL,
    full_name nvarchar(45) NOT NULL,
    inn varchar(12) NOT NULL,
    kpp varchar(9) NOT NULL,
    address nvarchar(255) NOT NULL,
    phone varchar(20),
    isActive bool DEFAULT true
    );

CREATE TABLE IF NOT EXISTS office(
                                     id bigint AUTO_INCREMENT PRIMARY KEY,
                                     organization_id bigint NOT NULL,
                                     name nvarchar(45),
    address nvarchar(255),
    phone varchar(20),
    is_active bool DEFAULT true,
    FOREIGN KEY(organization_id) REFERENCES organization(id)
    );

CREATE TABLE IF NOT EXISTS user(
                                   id bigint AUTO_INCREMENT PRIMARY KEY,
                                   office_id bigint NOT NULL,
                                   first_name nvarchar(25) NOT NULL,
    second_name nvarchar(25) NOT NULL,
    middle_name nvarchar(25),
    position nvarchar(25),
    phone varchar(20),
    user_document_id bigint,
    country_id int,
    is_identified bool DEFAULT false,
    FOREIGN KEY(office_id) REFERENCES office(id),
    FOREIGN KEY(country_id) REFERENCES country(id)
    );

CREATE TABLE IF NOT EXISTS user_document(
                                            id bigint AUTO_INCREMENT PRIMARY KEY,
                                            user_id bigint NOT NULL,
                                            document_id int NOT NULL,
                                            serial_number varchar(25) NOT NULL,
    date_of_issue date NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(document_id) REFERENCES document(id)
    );
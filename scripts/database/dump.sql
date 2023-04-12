DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS transactions;

CREATE TABLE clients (
    id varchar(255) primary key, 
    name varchar(255) not null,
    email varchar(255) not null,
    created_at datetime not null
);

CREATE TABLE accounts(
    id varchar(255) primary key,
    client_id varchar(255) not null,
    balance float not null,
    created_at datetime not null,

    CONSTRAINT FK_ClientAccount FOREIGN KEY (client_id)
    REFERENCES clients(id) ON DELETE CASCADE    
);

CREATE TABLE transactions (
    id varchar(255) primary key,
    account_id_from varchar(255) not null,
    account_id_to varchar(255) not null,
    amount float not null,
    created_at datetime not null,

    CONSTRAINT FK_AccountFrom FOREIGN KEY (account_id_from)
    REFERENCES accounts(id) ON DELETE CASCADE,

    CONSTRAINT FK_AccountTo FOREIGN KEY (account_id_to)
    REFERENCES accounts(id) ON DELETE CASCADE        
);

INSERT INTO clients (id, name, email, created_at) values ('8f11f884-1ec3-49e3-82c7-d51057983d83', 'John Doe', 'john@j.com', now());
INSERT INTO clients (id, name, email, created_at) values ('d81ecac7-9af9-4005-b58c-1fd51f6a4720', 'Jane Doe', 'jane@j.com', now());

INSERT INTO accounts (id, client_id, balance, created_at) values ('8f11f884-1ec3-49e3-82c7-d51057983d83', 'd81ecac7-9af9-4005-b58c-1fd51f6a4720', 1000, now());
INSERT INTO accounts (id, client_id, balance, created_at) values ('d81ecac7-9af9-4005-b58c-1fd51f6a4720', '8f11f884-1ec3-49e3-82c7-d51057983d83', 1000, now());
-- Database: auth

-- DROP DATABASE IF EXISTS auth;

CREATE DATABASE auth
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Argentina.1252'
    LC_CTYPE = 'Spanish_Argentina.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Table: public.customer

-- DROP TABLE IF EXISTS public.customer;

CREATE TABLE IF NOT EXISTS public.customer
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(45) COLLATE pg_catalog."default" NOT NULL,
    pwd character varying(200) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cust_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customer
    OWNER to postgres;

-- Table: public.authorities

-- DROP TABLE IF EXISTS public.authorities;

CREATE TABLE IF NOT EXISTS public.authorities
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    customer_id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT authorities_pkey PRIMARY KEY (id),
    CONSTRAINT authorities_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES public.customer (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.authorities
    OWNER to postgres;

-------------------------
-------- INSERTS --------
-------------------------

INSERT INTO customer (email, pwd)  VALUES ('aurbainsky@gmail.com', '1234')

-- If you want to use authorities (Individual permissions)

INSERT INTO authorities (customer_id, name)
VALUES (1, 'VIEWACCOUNT');

INSERT INTO authorities (`customer_id`, name)
VALUES (1, 'VIEWCARDS');

INSERT INTO authorities (customer_id, name)
VALUES (1, 'VIEWLOANS');

INSERT INTO authorities (customer_id, name)
VALUES (1, 'VIEWBALANCE');

DELETE FROM authorities;

-- if you want to use Role (group of permissions)

INSERT INTO authorities (customer_id, name)
VALUES (1,'ROLE_USER');

INSERT INTO authorities (customer_id, name)
VALUES (1, 'ROLE_ADMIN');




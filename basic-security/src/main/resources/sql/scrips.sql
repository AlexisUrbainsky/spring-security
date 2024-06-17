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

-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password character varying(500) COLLATE pg_catalog."default" NOT NULL,
    enabled boolean NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;

-- Table: public.authorities

-- DROP TABLE IF EXISTS public.authorities;

CREATE TABLE IF NOT EXISTS public.authorities
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    authority character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT authorities_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.authorities
    OWNER to postgres;

CREATE TABLE customer (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
  email varchar(45) NOT NULL,
  pwd varchar(200) NOT NULL,
  role varchar(45) NOT NULL,
  CONSTRAINT cust_pkey PRIMARY KEY (id)
);

INSERT INTO customer (email, pwd, role)  VALUES ('johndoe@example.com', '54321', 'admin')



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

-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password character varying(500) COLLATE pg_catalog."default" NOT NULL,
    enabled boolean NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;

-- Table: public.authorities

-- DROP TABLE IF EXISTS public.authorities;

CREATE TABLE IF NOT EXISTS public.authorities
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    authority character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT authorities_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.authorities
    OWNER to postgres;

CREATE TABLE customer (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
  email varchar(45) NOT NULL,
  pwd varchar(200) NOT NULL,
  role varchar(45) NOT NULL,
  CONSTRAINT cust_pkey PRIMARY KEY (id)
);

INSERT INTO customer (email, pwd, role)  VALUES ('johndoe@example.com', '54321', 'admin')




--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    name character varying(25) NOT NULL,
    number_of_guesses integer NOT NULL,
    played_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'phoo', 13, '2024-11-30 15:58:35.138467');
INSERT INTO public.games VALUES (2, 'user_1732982330292', 746, '2024-11-30 15:58:50.431149');
INSERT INTO public.games VALUES (3, 'user_1732982330292', 709, '2024-11-30 15:58:50.560794');
INSERT INTO public.games VALUES (4, 'user_1732982330291', 642, '2024-11-30 15:58:50.661356');
INSERT INTO public.games VALUES (5, 'user_1732982330291', 965, '2024-11-30 15:58:50.814283');
INSERT INTO public.games VALUES (6, 'user_1732982330292', 586, '2024-11-30 15:58:50.930931');
INSERT INTO public.games VALUES (7, 'user_1732982330292', 58, '2024-11-30 15:58:51.012664');
INSERT INTO public.games VALUES (8, 'user_1732982330292', 722, '2024-11-30 15:58:51.146847');
INSERT INTO public.games VALUES (9, 'user_1732982364957', 561, '2024-11-30 15:59:25.096232');
INSERT INTO public.games VALUES (10, 'user_1732982364957', 282, '2024-11-30 15:59:25.207378');
INSERT INTO public.games VALUES (11, 'user_1732982364956', 29, '2024-11-30 15:59:25.262755');
INSERT INTO public.games VALUES (12, 'user_1732982364956', 253, '2024-11-30 15:59:25.36196');
INSERT INTO public.games VALUES (13, 'user_1732982364957', 957, '2024-11-30 15:59:25.555137');
INSERT INTO public.games VALUES (14, 'user_1732982364957', 686, '2024-11-30 15:59:25.701114');
INSERT INTO public.games VALUES (15, 'user_1732982364957', 926, '2024-11-30 15:59:25.869657');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1732981626292', 2, 111);
INSERT INTO public.users VALUES ('user_1732981626293', 5, 466);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 15, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--


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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type (
    type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.type OWNER TO freecodecamp;

--
-- Name: dictionary_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dictionary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dictionary_id_seq OWNER TO freecodecamp;

--
-- Name: dictionary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dictionary_id_seq OWNED BY public.type.type_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type_id integer,
    approximate_radius_ly integer,
    no_stars_bln integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    circulation numeric(5,1),
    stellar_size numeric(4,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    weight numeric(5,2),
    radius numeric(5,2),
    moons integer,
    type_id integer,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    weight numeric(5,2),
    radius numeric(5,2),
    type_id integer,
    planets boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: type type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type ALTER COLUMN type_id SET DEFAULT nextval('public.dictionary_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Andromeda', 5, 110000, 1000000000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 4, 7000, 30);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 1, 1000, 1);
INSERT INTO public.galaxy VALUES (1, 'Mily Way', 2, 100000, 250);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Spherodial', 3, 2000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 5, 30000, 40);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1.0, -12.6);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.3, 11.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1.3, 12.4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 7.2, 4.6);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 16.7, 5.6);
INSERT INTO public.moon VALUES (6, 'Io', 5, 1.8, 5.0);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 3.6, 5.3);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 0.5, 14.1);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 250.6, 14.6);
INSERT INTO public.moon VALUES (10, 'Thebe', 5, 0.7, 16.1);
INSERT INTO public.moon VALUES (11, 'Elara', 5, 259.6, 16.3);
INSERT INTO public.moon VALUES (12, 'Pasiphae', 5, 735.2, 17.0);
INSERT INTO public.moon VALUES (13, 'Metis', 5, 735.2, 17.0);
INSERT INTO public.moon VALUES (14, 'Titan', 6, 16.0, 8.4);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 4.5, 9.7);
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, 79.3, 10.2);
INSERT INTO public.moon VALUES (17, 'Dione', 6, 2.7, 10.4);
INSERT INTO public.moon VALUES (18, 'Tethys', 6, 1.9, 10.2);
INSERT INTO public.moon VALUES (19, 'Titania', 7, 8.7, 13.9);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 5.9, 13.5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.05, 0.38, 0, 9, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.81, 0.95, 0, 9, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, 1.00, 1, 9, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.11, 0.53, 2, 9, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 317.83, NULL, 95, 10, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.16, NULL, 83, 10, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.54, NULL, 27, 10, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.15, NULL, 14, 10, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, 0.18, 5, 11, false, 1);
INSERT INTO public.planet VALUES (10, 'Eris', NULL, 0.18, 1, 11, false, 1);
INSERT INTO public.planet VALUES (11, 'Makemake', NULL, 0.12, 1, 11, false, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', NULL, 0.13, 2, 11, false, 1);
INSERT INTO public.planet VALUES (13, 'Ceres', NULL, 0.07, 0, 11, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.00, 1.00, 6, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 0.12, 0.14, 7, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1.10, 1.22, 6, false, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 0.91, 0.86, 8, false, 1);
INSERT INTO public.star VALUES (5, 'Bernards Star', 0.16, 0.20, 7, true, 1);
INSERT INTO public.star VALUES (6, 'Woilf 359', 0.09, 0.16, 7, false, 1);


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type VALUES (1, 'Irregular', 'Type of galaxy');
INSERT INTO public.type VALUES (2, 'Barred Spiral', 'Type of galaxy');
INSERT INTO public.type VALUES (3, 'Elliptical', 'Type of galaxy');
INSERT INTO public.type VALUES (4, 'Dwarf Irregular', 'Type of galaxy');
INSERT INTO public.type VALUES (5, 'Spiral', 'Type of galaxy');
INSERT INTO public.type VALUES (6, 'G-type', 'G-type main-sequence star or Yellow Dwarf');
INSERT INTO public.type VALUES (7, 'M-type', 'Red dwarf star');
INSERT INTO public.type VALUES (8, 'K-type', 'Orange dwarf star');
INSERT INTO public.type VALUES (9, 'Terrestrial', 'Planet type');
INSERT INTO public.type VALUES (10, 'Gas giant', 'Planet type');
INSERT INTO public.type VALUES (11, 'Dwarf planet', 'Planet type');


--
-- Name: dictionary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dictionary_id_seq', 11, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: type dictionary_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT dictionary_name_key UNIQUE (name);


--
-- Name: type dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT dictionary_pkey PRIMARY KEY (type_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(type_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(type_id);


--
-- PostgreSQL database dump complete
--


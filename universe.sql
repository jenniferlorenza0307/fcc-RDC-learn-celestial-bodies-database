--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    notes text,
    diameter_ly numeric,
    galaxy_group_name character varying(50),
    galaxy_group_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_group; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_group (
    galaxy_group_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellations character varying(100),
    number_of_galaxies integer
);


ALTER TABLE public.galaxy_group OWNER TO freecodecamp;

--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_group_galaxy_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_group_galaxy_group_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_group_galaxy_group_id_seq OWNED BY public.galaxy_group.galaxy_group_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mean_radius_km numeric,
    numeral_orbital integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    has_life boolean,
    mass_to_earth numeric,
    has_moon boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth_ly numeric,
    confirmed_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_group galaxy_group_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group ALTER COLUMN galaxy_group_id SET DEFAULT nextval('public.galaxy_group_galaxy_group_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SBbc', 'Home galaxy of Earth. Barred spiral galaxy.', 87400, 'Local Group', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda M31', 'SA(s)b', 'Largest galaxy in the Local group, with at least 19 satellite galaxies. Barred spiral galaxy.', 152000, 'Local Group', 1);
INSERT INTO public.galaxy VALUES (3, 'Pegasus Dwarf Spheroidal', 'dSph', 'Satellite of Andromeda', NULL, 'Local Group', 1);
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf', 'Irr', 'Satellite of Milky Way (accretion by Milky Way)', NULL, 'Local Group', 1);
INSERT INTO public.galaxy VALUES (5, 'Segue 2', 'dSph', 'Satellite of Milky Way, one of the known smallest galaxies', 220, 'Local Group', 1);
INSERT INTO public.galaxy VALUES (6, 'NGC 300', 'SA(s)d', 'Closest spiral galaxy to Local Group, forms pair with NGC 55', 94000, 'between Local Group and Sculptor Group', NULL);
INSERT INTO public.galaxy VALUES (7, 'NGC 55', 'SB(s)m', 'Forms pair with NGC 300', 70000, 'between Local Group and Sculptor Group', NULL);


--
-- Data for Name: galaxy_group; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_group VALUES (1, 'Local Group', NULL, 30);
INSERT INTO public.galaxy_group VALUES (2, 'Stephan''s Quintet', 'Pegasus', 5);
INSERT INTO public.galaxy_group VALUES (3, 'Robert''s Quartet', 'Phoenix', 4);
INSERT INTO public.galaxy_group VALUES (4, 'Bullet Group', 'Hydra', NULL);
INSERT INTO public.galaxy_group VALUES (5, 'Sculptor Group', 'Sculptor, Cetus', 13);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 1738, 1);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 11.267, 1);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 6.2, 2);
INSERT INTO public.moon VALUES (4, 5, 'Io', 1821.6, 1);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 1560.8, 2);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 2634.1, 3);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 2410.3, 4);
INSERT INTO public.moon VALUES (8, 5, 'Amalthea', 83.5, 5);
INSERT INTO public.moon VALUES (9, 5, 'Himalia', 69.8, 6);
INSERT INTO public.moon VALUES (10, 5, 'Carme', 23, 11);
INSERT INTO public.moon VALUES (11, 5, 'Ananke', 14, 12);
INSERT INTO public.moon VALUES (12, 6, 'Rhea', 763.8, 5);
INSERT INTO public.moon VALUES (13, 6, 'Iapetus', 735.6, 8);
INSERT INTO public.moon VALUES (14, 6, 'Titan', 2574.73, 6);
INSERT INTO public.moon VALUES (15, 6, 'Mimas', 198.2, 1);
INSERT INTO public.moon VALUES (16, 6, 'Enceladus', 252.1, 2);
INSERT INTO public.moon VALUES (17, 7, 'Oberon', 761.4, 4);
INSERT INTO public.moon VALUES (18, 7, 'Miranda', 235.8, 5);
INSERT INTO public.moon VALUES (19, 7, 'Titania', 788.9, 3);
INSERT INTO public.moon VALUES (20, 8, 'Triton', 1353.4, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', false, 0.0553, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', false, 0.815, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', true, 1, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', false, 0.107, true);
INSERT INTO public.planet VALUES (5, 1, 'Jupyter', false, 317.8, true);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', false, 95.2, true);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', false, 14.5, true);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', false, 17.1, true);
INSERT INTO public.planet VALUES (9, 2, 'Proxima Centauri b', false, 1.07, NULL);
INSERT INTO public.planet VALUES (10, 2, 'Proxima Centauri d', false, 0.26, NULL);
INSERT INTO public.planet VALUES (11, 3, 'YZ Ceti b', false, 0.7, NULL);
INSERT INTO public.planet VALUES (12, 3, 'YZ Ceti c', false, 1.14, NULL);
INSERT INTO public.planet VALUES (13, 3, 'YZ Ceti d', false, 1.09, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 4572, 0.000016, 8);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 4850, 4.244, 2);
INSERT INTO public.star VALUES (3, 1, 'YZ Ceti', 4000, 11.74, 3);
INSERT INTO public.star VALUES (4, 2, 'Alpheratz', 60, 97, NULL);
INSERT INTO public.star VALUES (5, 2, 'Mirach', NULL, 199, NULL);
INSERT INTO public.star VALUES (6, 1, 'HD 219134', 12660, 21, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_group_galaxy_group_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_group galaxy_groups_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_groups_name_key UNIQUE (name);


--
-- Name: galaxy_group galaxy_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_groups_pkey PRIMARY KEY (galaxy_group_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


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
-- Name: galaxy galaxy_galaxy_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_group_id_fkey FOREIGN KEY (galaxy_group_id) REFERENCES public.galaxy_group(galaxy_group_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


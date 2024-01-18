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
    name character varying NOT NULL,
    galaxy_types character varying,
    constellation character varying(30),
    distance_from_earth_lightyears integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    has_life boolean,
    distance_from_earth_mkm numeric,
    rotation_period integer,
    planet_id integer NOT NULL
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
    name character varying NOT NULL,
    description text,
    has_life boolean,
    age_million_years numeric,
    planet_types character varying,
    star_id integer NOT NULL
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
-- Name: reference; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.reference (
    reference_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.reference OWNER TO freecodecamp;

--
-- Name: reference_reference_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.reference_reference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reference_reference_id_seq OWNER TO freecodecamp;

--
-- Name: reference_reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.reference_reference_id_seq OWNED BY public.reference.reference_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    distance_from_earth integer,
    age_million_year integer,
    galaxy_id integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: reference reference_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.reference ALTER COLUMN reference_id SET DEFAULT nextval('public.reference_reference_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Sagittarius', 26000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral', 'Andromeda', 5);
INSERT INTO public.galaxy VALUES (3, 'Condor Galaxy', 'Spiral', 'Pavo', 665300);
INSERT INTO public.galaxy VALUES (4, 'Eye of Sauron', 'spiral Seyfert galaxy', 'Canes Venatici', 62000000);
INSERT INTO public.galaxy VALUES (5, 'Bode Galaxy', 'Spiral', 'Ursa Major', 12000000);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 'elongated elliptical', 'Ursa Major', 12000000);
INSERT INTO public.galaxy VALUES (7, 'Eye of God', 'Helix', 'Eridanus', 695);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Io', false, 628, 2, 5);
INSERT INTO public.moon VALUES (1, 'Moon', false, 0.38, 28, 3);
INSERT INTO public.moon VALUES (3, 'Phobos', false, 77.79, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Demios', false, 77.79, 1, 4);
INSERT INTO public.moon VALUES (5, 'Europa', false, 628.3, 3, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 628.3, 7, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', false, 628.3, 16, 5);
INSERT INTO public.moon VALUES (8, 'Themisto', false, 628.3, 130, 5);
INSERT INTO public.moon VALUES (9, 'Leda', false, 628.3, 241, 5);
INSERT INTO public.moon VALUES (10, 'Himalia', false, 628.3, 250, 5);
INSERT INTO public.moon VALUES (11, 'Pandia', false, 628.3, 251, 5);
INSERT INTO public.moon VALUES (12, 'Lysithea', false, 628.3, 259, 5);
INSERT INTO public.moon VALUES (13, 'Carpo', false, 628.3, 456, 5);
INSERT INTO public.moon VALUES (14, 'Titan', false, 1200, 16, 6);
INSERT INTO public.moon VALUES (15, 'Enceladus', false, 1272, 1, 6);
INSERT INTO public.moon VALUES (16, 'Tethys', false, 1272, 2, 6);
INSERT INTO public.moon VALUES (17, 'Dione', false, 1272, 3, 6);
INSERT INTO public.moon VALUES (18, 'Ariel', false, 2600, 2, 7);
INSERT INTO public.moon VALUES (19, 'Titania', false, 2600, 9, 7);
INSERT INTO public.moon VALUES (20, 'Triton', false, 4338, 6, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in solar system', false, 4503, 'terrestrial planet', 2);
INSERT INTO public.planet VALUES (2, 'Venus', 'Densest Atmosphere of planet in solar system', false, 4503, 'terrestrial planet', 2);
INSERT INTO public.planet VALUES (3, 'Earth', 'Only planet having life', true, 4503, 'terrestrial planet', 2);
INSERT INTO public.planet VALUES (4, 'Mars', 'Also known as Red Planet', false, 4503, 'terrestrial planet', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in Solar System', false, 4503, 'gas giant', 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Second Largest planet in Solar System', false, 4503, 'gas giant', 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Cyan coloured planet in Solar System', false, 4503, 'gas giant', 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Fourth largest planet in Solar System', false, 4503, 'ice giant', 2);
INSERT INTO public.planet VALUES (9, 'Candidate 1', 'Orbital inclination of ~70° relative to Earth', false, 5000, 'exoplnet', 3);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Dwarf planet in Kuiper belt', false, 4500, 'ice giant', 2);
INSERT INTO public.planet VALUES (11, 'Sedna', 'Dwarf planet in outermost reaches of inner solar system', false, 4500, 'dwarf planet', 2);
INSERT INTO public.planet VALUES (12, 'Orcus', 'A trans-neptune object', false, 4500, 'dwarf planet', 2);


--
-- Data for Name: reference; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.reference VALUES (1, 'Milky Way', 1);
INSERT INTO public.reference VALUES (2, 'Andromeda Galaxy', 2);
INSERT INTO public.reference VALUES (3, 'Condor Galaxy', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 0, 5000, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 4, 5500, 1);
INSERT INTO public.star VALUES (4, 'UY Scuti', 10, 1, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 9, 245, 1);
INSERT INTO public.star VALUES (6, 'Alpheratz', 97, 60, 2);
INSERT INTO public.star VALUES (7, 'Mirach', 200, NULL, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: reference_reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.reference_reference_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: reference reference_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: reference reference_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_pkey PRIMARY KEY (reference_id);


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
-- Name: reference reference_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


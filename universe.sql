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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size numeric,
    is_near_earth boolean,
    orbit_duration integer,
    material text,
    planet_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    tail_length numeric,
    is_visible boolean,
    orbital_period integer,
    composition text,
    star_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter numeric,
    is_observable boolean,
    has_rings boolean,
    distance_from_earth integer,
    galaxy_type text
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
    name character varying(255) NOT NULL,
    radius numeric NOT NULL,
    is_ice boolean,
    has_atmosphere boolean,
    orbit_period integer,
    composition text,
    planet_id integer
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
    name character varying(255) NOT NULL,
    mass numeric,
    is_habitable boolean,
    has_moons boolean,
    orbit_period integer,
    atmosphere text,
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
    name character varying(255) NOT NULL,
    temperature numeric,
    is_dwarf boolean,
    is_main_sequence boolean,
    luminosity integer,
    spectral_class text,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_id_seq'::regclass);


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939, false, 1680, 'Rocky', 11);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, false, 1325, 'Rocky', 12);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, false, 1682, 'Rocky', 13);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (4, 'Halley', 24, true, 75, 'Dust and Ice', 1);
INSERT INTO public.comet VALUES (5, 'Hale-Bopp', 60, true, 2533, 'Dust and Ice', 1);
INSERT INTO public.comet VALUES (6, 'Hyakutake', 20, true, 17000, 'Dust and Ice', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 105700, true, false, 0, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 220000, true, false, 2537000, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 60000, true, false, 3000000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 76000, true, true, 23000000, 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'Sombrero', 49000, true, true, 31200000, 'Spiral');
INSERT INTO public.galaxy VALUES (8, 'Black Eye', 60000, true, false, 17000000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.1, false, false, 27, 'Rocky', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.1, false, false, 0, 'Rocky', 5);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, false, false, 1, 'Rocky', 5);
INSERT INTO public.moon VALUES (4, 'Io', 1821.6, false, true, 2, 'Rocky', 6);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.8, true, true, 4, 'Ice and Rock', 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.1, true, true, 7, 'Ice and Rock', 6);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.3, true, true, 17, 'Ice and Rock', 6);
INSERT INTO public.moon VALUES (8, 'Titan', 2575.5, true, true, 16, 'Ice and Rock', 7);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252.1, true, true, 1, 'Ice', 7);
INSERT INTO public.moon VALUES (10, 'Mimas', 198.2, false, false, 1, 'Rocky', 7);
INSERT INTO public.moon VALUES (11, 'Triton', 1353.4, true, true, 6, 'Ice and Rock', 9);
INSERT INTO public.moon VALUES (12, 'Charon', 606, true, false, 6, 'Ice and Rock', 10);
INSERT INTO public.moon VALUES (13, 'Oberon', 761.4, true, false, 14, 'Ice and Rock', 8);
INSERT INTO public.moon VALUES (14, 'Titania', 788.4, true, false, 9, 'Ice and Rock', 8);
INSERT INTO public.moon VALUES (15, 'Rhea', 764.5, true, false, 5, 'Ice and Rock', 7);
INSERT INTO public.moon VALUES (16, 'Iapetus', 734.5, true, false, 79, 'Ice and Rock', 7);
INSERT INTO public.moon VALUES (17, 'Dione', 561.4, true, false, 3, 'Ice and Rock', 7);
INSERT INTO public.moon VALUES (18, 'Tethys', 531.1, true, false, 2, 'Ice and Rock', 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', 584.7, true, false, 4, 'Ice and Rock', 8);
INSERT INTO public.moon VALUES (20, 'Ariel', 578.9, true, false, 3, 'Ice and Rock', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5.972, true, true, 365, 'Nitrogen-Oxygen', 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 0.330, false, false, 88, 'None', 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4.87, false, false, 225, 'Carbon Dioxide', 1);
INSERT INTO public.planet VALUES (5, 'Mars', 0.642, false, true, 687, 'Carbon Dioxide', 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1898, false, true, 4333, 'Hydrogen and Helium', 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 568, false, true, 10759, 'Hydrogen and Helium', 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 86.8, false, true, 30687, 'Hydrogen, Helium and Methane', 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 102, false, true, 60190, 'Hydrogen, Helium and Methane', 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 0.0146, false, true, 90560, 'Nitrogen and Methane', 1);
INSERT INTO public.planet VALUES (11, 'Ceres', 0.00016, false, false, 1680, 'None', 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 0.000701, false, false, 103774, 'None', 1);
INSERT INTO public.planet VALUES (13, 'Makemake', 0.000643, false, false, 112897, 'Methane and Ethane', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, false, true, 1, 'G2V', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 5790, false, true, 2, 'G2V', 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 5260, false, true, 1, 'K1V', 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 3042, true, true, 0, 'M5.5Ve', 1);
INSERT INTO public.star VALUES (12, 'Betelgeuse', 3500, false, false, 126000, 'M2Iab', 1);
INSERT INTO public.star VALUES (13, 'Sirius', 9940, false, true, 25, 'A1V', 1);
INSERT INTO public.star VALUES (14, 'Rigel', 12100, false, false, 120000, 'B8Ia', 1);


--
-- Name: asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_id_seq', 3, true);


--
-- Name: comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_id_seq', 6, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 8, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 25, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 14, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: asteroid fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: comet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


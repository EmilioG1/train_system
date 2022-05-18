--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: cities; Type: TABLE; Schema: public; Owner: emiliogonzales
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying,
    state character varying
);


ALTER TABLE public.cities OWNER TO emiliogonzales;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: emiliogonzales
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO emiliogonzales;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emiliogonzales
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: cities_trains; Type: TABLE; Schema: public; Owner: emiliogonzales
--

CREATE TABLE public.cities_trains (
    id integer NOT NULL,
    train_id integer,
    city_id integer
);


ALTER TABLE public.cities_trains OWNER TO emiliogonzales;

--
-- Name: cities_trains_id_seq; Type: SEQUENCE; Schema: public; Owner: emiliogonzales
--

CREATE SEQUENCE public.cities_trains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_trains_id_seq OWNER TO emiliogonzales;

--
-- Name: cities_trains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emiliogonzales
--

ALTER SEQUENCE public.cities_trains_id_seq OWNED BY public.cities_trains.id;


--
-- Name: passengers; Type: TABLE; Schema: public; Owner: emiliogonzales
--

CREATE TABLE public.passengers (
    id integer NOT NULL,
    name character varying,
    ticket_id integer
);


ALTER TABLE public.passengers OWNER TO emiliogonzales;

--
-- Name: passengers_id_seq; Type: SEQUENCE; Schema: public; Owner: emiliogonzales
--

CREATE SEQUENCE public.passengers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passengers_id_seq OWNER TO emiliogonzales;

--
-- Name: passengers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emiliogonzales
--

ALTER SEQUENCE public.passengers_id_seq OWNED BY public.passengers.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: emiliogonzales
--

CREATE TABLE public.tickets (
    id integer NOT NULL,
    train_id integer,
    passenger_id integer,
    cost integer
);


ALTER TABLE public.tickets OWNER TO emiliogonzales;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: emiliogonzales
--

CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO emiliogonzales;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emiliogonzales
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: times; Type: TABLE; Schema: public; Owner: emiliogonzales
--

CREATE TABLE public.times (
    id integer NOT NULL,
    arrive_time time without time zone
);


ALTER TABLE public.times OWNER TO emiliogonzales;

--
-- Name: times_id_seq; Type: SEQUENCE; Schema: public; Owner: emiliogonzales
--

CREATE SEQUENCE public.times_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.times_id_seq OWNER TO emiliogonzales;

--
-- Name: times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emiliogonzales
--

ALTER SEQUENCE public.times_id_seq OWNED BY public.times.id;


--
-- Name: trains; Type: TABLE; Schema: public; Owner: emiliogonzales
--

CREATE TABLE public.trains (
    id integer NOT NULL,
    name character varying,
    time_id integer
);


ALTER TABLE public.trains OWNER TO emiliogonzales;

--
-- Name: trains_id_seq; Type: SEQUENCE; Schema: public; Owner: emiliogonzales
--

CREATE SEQUENCE public.trains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trains_id_seq OWNER TO emiliogonzales;

--
-- Name: trains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emiliogonzales
--

ALTER SEQUENCE public.trains_id_seq OWNED BY public.trains.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: cities_trains id; Type: DEFAULT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.cities_trains ALTER COLUMN id SET DEFAULT nextval('public.cities_trains_id_seq'::regclass);


--
-- Name: passengers id; Type: DEFAULT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.passengers ALTER COLUMN id SET DEFAULT nextval('public.passengers_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Name: times id; Type: DEFAULT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.times ALTER COLUMN id SET DEFAULT nextval('public.times_id_seq'::regclass);


--
-- Name: trains id; Type: DEFAULT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.trains ALTER COLUMN id SET DEFAULT nextval('public.trains_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: emiliogonzales
--

COPY public.cities (id, name, state) FROM stdin;
\.


--
-- Data for Name: cities_trains; Type: TABLE DATA; Schema: public; Owner: emiliogonzales
--

COPY public.cities_trains (id, train_id, city_id) FROM stdin;
\.


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: emiliogonzales
--

COPY public.passengers (id, name, ticket_id) FROM stdin;
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: emiliogonzales
--

COPY public.tickets (id, train_id, passenger_id, cost) FROM stdin;
\.


--
-- Data for Name: times; Type: TABLE DATA; Schema: public; Owner: emiliogonzales
--

COPY public.times (id, arrive_time) FROM stdin;
\.


--
-- Data for Name: trains; Type: TABLE DATA; Schema: public; Owner: emiliogonzales
--

COPY public.trains (id, name, time_id) FROM stdin;
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emiliogonzales
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- Name: cities_trains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emiliogonzales
--

SELECT pg_catalog.setval('public.cities_trains_id_seq', 1, false);


--
-- Name: passengers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emiliogonzales
--

SELECT pg_catalog.setval('public.passengers_id_seq', 1, false);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emiliogonzales
--

SELECT pg_catalog.setval('public.tickets_id_seq', 1, false);


--
-- Name: times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emiliogonzales
--

SELECT pg_catalog.setval('public.times_id_seq', 1, false);


--
-- Name: trains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emiliogonzales
--

SELECT pg_catalog.setval('public.trains_id_seq', 1, false);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: cities_trains cities_trains_pkey; Type: CONSTRAINT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.cities_trains
    ADD CONSTRAINT cities_trains_pkey PRIMARY KEY (id);


--
-- Name: passengers passengers_pkey; Type: CONSTRAINT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: times times_pkey; Type: CONSTRAINT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.times
    ADD CONSTRAINT times_pkey PRIMARY KEY (id);


--
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: public; Owner: emiliogonzales
--

ALTER TABLE ONLY public.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


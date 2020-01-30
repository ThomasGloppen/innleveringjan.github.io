--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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
-- Name: bestilling; Type: TABLE; Schema: public; Owner: bib
--

CREATE TABLE public.bestilling (
    bestillingid integer NOT NULL,
    kplass text NOT NULL,
    brukernavn text NOT NULL,
    bdato date
);


ALTER TABLE public.bestilling OWNER TO bib;

--
-- Name: bestilling_bestillingid_seq; Type: SEQUENCE; Schema: public; Owner: bib
--

CREATE SEQUENCE public.bestilling_bestillingid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bestilling_bestillingid_seq OWNER TO bib;

--
-- Name: bestilling_bestillingid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bib
--

ALTER SEQUENCE public.bestilling_bestillingid_seq OWNED BY public.bestilling.bestillingid;


--
-- Name: billett; Type: TABLE; Schema: public; Owner: bib
--

CREATE TABLE public.billett (
    kplass text NOT NULL,
    stedid integer,
    dato date NOT NULL,
    type text,
    pris integer
);


ALTER TABLE public.billett OWNER TO bib;

--
-- Name: kunde; Type: TABLE; Schema: public; Owner: bib
--

CREATE TABLE public.kunde (
    brukernavn text NOT NULL,
    fornavn text NOT NULL,
    etternavn text NOT NULL,
    adresse text,
    epost text,
    tlf text,
    kjonn text
);


ALTER TABLE public.kunde OWNER TO bib;

--
-- Name: sted; Type: TABLE; Schema: public; Owner: bib
--

CREATE TABLE public.sted (
    stedid integer NOT NULL,
    navn text NOT NULL,
    adresse text
);


ALTER TABLE public.sted OWNER TO bib;

--
-- Name: sted_stedid_seq; Type: SEQUENCE; Schema: public; Owner: bib
--

CREATE SEQUENCE public.sted_stedid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sted_stedid_seq OWNER TO bib;

--
-- Name: sted_stedid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bib
--

ALTER SEQUENCE public.sted_stedid_seq OWNED BY public.sted.stedid;


--
-- Name: bestilling bestillingid; Type: DEFAULT; Schema: public; Owner: bib
--

ALTER TABLE ONLY public.bestilling ALTER COLUMN bestillingid SET DEFAULT nextval('public.bestilling_bestillingid_seq'::regclass);


--
-- Name: sted stedid; Type: DEFAULT; Schema: public; Owner: bib
--

ALTER TABLE ONLY public.sted ALTER COLUMN stedid SET DEFAULT nextval('public.sted_stedid_seq'::regclass);


--
-- Data for Name: bestilling; Type: TABLE DATA; Schema: public; Owner: bib
--

COPY public.bestilling (bestillingid, kplass, brukernavn, bdato) FROM stdin;
1	haugesund	torbeno123	\N
2	haugesund	torbeno123	\N
3	london	vrdv	\N
4	london	vrdv	\N
\.


--
-- Data for Name: billett; Type: TABLE DATA; Schema: public; Owner: bib
--

COPY public.billett (kplass, stedid, dato, type, pris) FROM stdin;
london	1	2020-01-31	VIP	12938
haugesund	2	2020-01-31	VIP	2356
\.


--
-- Data for Name: kunde; Type: TABLE DATA; Schema: public; Owner: bib
--

COPY public.kunde (brukernavn, fornavn, etternavn, adresse, epost, tlf, kjonn) FROM stdin;
torbeno123	Torben	Surgås	Surgåsvegen 3	ola@veldigsurgås.sur	45876512	mann
vrdv	Torben	Surgås	Surgåsvegen 3	ola@veldigsurgås.sur	45876512	mann
\.


--
-- Data for Name: sted; Type: TABLE DATA; Schema: public; Owner: bib
--

COPY public.sted (stedid, navn, adresse) FROM stdin;
1	London	Surgåsvegen 3
2	Haugesund	London Eye
\.


--
-- Name: bestilling_bestillingid_seq; Type: SEQUENCE SET; Schema: public; Owner: bib
--

SELECT pg_catalog.setval('public.bestilling_bestillingid_seq', 4, true);


--
-- Name: sted_stedid_seq; Type: SEQUENCE SET; Schema: public; Owner: bib
--

SELECT pg_catalog.setval('public.sted_stedid_seq', 2, true);


--
-- Name: bestilling bestilling_pkey; Type: CONSTRAINT; Schema: public; Owner: bib
--

ALTER TABLE ONLY public.bestilling
    ADD CONSTRAINT bestilling_pkey PRIMARY KEY (bestillingid);


--
-- Name: billett billett_pkey; Type: CONSTRAINT; Schema: public; Owner: bib
--

ALTER TABLE ONLY public.billett
    ADD CONSTRAINT billett_pkey PRIMARY KEY (kplass);


--
-- Name: kunde kunde_pkey; Type: CONSTRAINT; Schema: public; Owner: bib
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_pkey PRIMARY KEY (brukernavn);


--
-- Name: sted sted_pkey; Type: CONSTRAINT; Schema: public; Owner: bib
--

ALTER TABLE ONLY public.sted
    ADD CONSTRAINT sted_pkey PRIMARY KEY (stedid);


--
-- Name: bestilling bestilling_brukernavn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bib
--

ALTER TABLE ONLY public.bestilling
    ADD CONSTRAINT bestilling_brukernavn_fkey FOREIGN KEY (brukernavn) REFERENCES public.kunde(brukernavn);


--
-- PostgreSQL database dump complete
--


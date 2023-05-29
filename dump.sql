--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: accommodations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accommodations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "pricePerDay" integer,
    "locationId" integer,
    description text,
    "mainPictureId" integer,
    CONSTRAINT "accommodations_pricePerDay_check" CHECK (("pricePerDay" > 0))
);


--
-- Name: accommodationsConveniences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."accommodationsConveniences" (
    id integer NOT NULL,
    "accommodationId" integer,
    "convenienceId" integer
);


--
-- Name: accommodationsPictures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."accommodationsPictures" (
    id integer NOT NULL,
    "accommodationId" integer NOT NULL,
    url text NOT NULL
);


--
-- Name: accommodationsPictures_accommodationId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."accommodationsPictures_accommodationId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accommodationsPictures_accommodationId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."accommodationsPictures_accommodationId_seq" OWNED BY public."accommodationsPictures"."accommodationId";


--
-- Name: accommodationsPictures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."accommodationsPictures_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accommodationsPictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."accommodationsPictures_id_seq" OWNED BY public."accommodationsPictures".id;


--
-- Name: accommodations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accommodations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accommodations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accommodations_id_seq OWNED BY public.accommodations.id;


--
-- Name: accomodationsConveniences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."accomodationsConveniences_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accomodationsConveniences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."accomodationsConveniences_id_seq" OWNED BY public."accommodationsConveniences".id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    county character varying(255) NOT NULL
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: conveniences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conveniences (
    id integer NOT NULL,
    name character varying(255)
);


--
-- Name: conveniences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conveniences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conveniences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conveniences_id_seq OWNED BY public.conveniences.id;


--
-- Name: flightCompanies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."flightCompanies" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: flightCompanies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."flightCompanies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flightCompanies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."flightCompanies_id_seq" OWNED BY public."flightCompanies".id;


--
-- Name: flightPictures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."flightPictures" (
    id integer NOT NULL,
    "flightId" integer NOT NULL,
    url text NOT NULL
);


--
-- Name: flightPictures_flightId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."flightPictures_flightId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flightPictures_flightId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."flightPictures_flightId_seq" OWNED BY public."flightPictures"."flightId";


--
-- Name: flightPictures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."flightPictures_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flightPictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."flightPictures_id_seq" OWNED BY public."flightPictures".id;


--
-- Name: flights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flights (
    id integer NOT NULL,
    "originId" integer,
    "destinationId" integer,
    "departureTime" timestamp without time zone NOT NULL,
    "arrivalTime" timestamp without time zone NOT NULL,
    price integer,
    "flightCompanyId" integer,
    CONSTRAINT fligths_price_check CHECK ((price > 0))
);


--
-- Name: fligths_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fligths_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fligths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fligths_id_seq OWNED BY public.flights.id;


--
-- Name: accommodations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accommodations ALTER COLUMN id SET DEFAULT nextval('public.accommodations_id_seq'::regclass);


--
-- Name: accommodationsConveniences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accommodationsConveniences" ALTER COLUMN id SET DEFAULT nextval('public."accomodationsConveniences_id_seq"'::regclass);


--
-- Name: accommodationsPictures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accommodationsPictures" ALTER COLUMN id SET DEFAULT nextval('public."accommodationsPictures_id_seq"'::regclass);


--
-- Name: accommodationsPictures accommodationId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accommodationsPictures" ALTER COLUMN "accommodationId" SET DEFAULT nextval('public."accommodationsPictures_accommodationId_seq"'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: conveniences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conveniences ALTER COLUMN id SET DEFAULT nextval('public.conveniences_id_seq'::regclass);


--
-- Name: flightCompanies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."flightCompanies" ALTER COLUMN id SET DEFAULT nextval('public."flightCompanies_id_seq"'::regclass);


--
-- Name: flightPictures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."flightPictures" ALTER COLUMN id SET DEFAULT nextval('public."flightPictures_id_seq"'::regclass);


--
-- Name: flightPictures flightId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."flightPictures" ALTER COLUMN "flightId" SET DEFAULT nextval('public."flightPictures_flightId_seq"'::regclass);


--
-- Name: flights id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights ALTER COLUMN id SET DEFAULT nextval('public.fligths_id_seq'::regclass);


--
-- Data for Name: accommodations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accommodations VALUES (1, 'Hotel A', 100, 1, 'Ótimo hotel com vista para o mar no Rio de Janeiro.', 1);
INSERT INTO public.accommodations VALUES (2, 'Hotel B', 150, 2, 'Luxuoso hotel no centro de São Paulo.', 1);
INSERT INTO public.accommodations VALUES (3, 'Hotel C', 90, 3, 'Confortável hotel em Brasília com ótimas comodidades.', 1);
INSERT INTO public.accommodations VALUES (4, 'Hotel D', 80, 4, 'Hotel econômico em Salvador com café da manhã gratuito.', 1);
INSERT INTO public.accommodations VALUES (5, 'Hotel E', 70, 5, 'Confortável hotel em Fortaleza com vista para o mar.', 1);
INSERT INTO public.accommodations VALUES (6, 'Hotel F', 80, 6, 'Hotel de luxo em Manaus com café da manhã incluído.', 1);
INSERT INTO public.accommodations VALUES (7, 'Hotel G', 90, 7, 'Hotel boutique em Curitiba com ótimo atendimento ao cliente.', 1);
INSERT INTO public.accommodations VALUES (8, 'Hotel H', 100, 8, 'Aconchegante hotel em Porto Alegre perto do centro da cidade.', 1);
INSERT INTO public.accommodations VALUES (9, 'Hotel I', 120, 1, 'Hotel de luxo no Rio de Janeiro com vista para o mar.', 1);
INSERT INTO public.accommodations VALUES (10, 'Hotel J', 80, 2, 'Hotel boutique em São Paulo com ótimo café da manhã.', 1);
INSERT INTO public.accommodations VALUES (11, 'Hotel K', 70, 3, 'Hotel econômico em Brasília com wifi gratuito.', 1);
INSERT INTO public.accommodations VALUES (12, 'Hotel L', 90, 4, 'Hotel confortável em Salvador com estacionamento gratuito.', 1);
INSERT INTO public.accommodations VALUES (13, 'Hotel M', 110, 5, 'Hotel de luxo em Fortaleza com spa e academia.', 1);
INSERT INTO public.accommodations VALUES (14, 'Hotel N', 60, 6, 'Hotel econômico em Manaus com café da manhã incluído.', 1);
INSERT INTO public.accommodations VALUES (15, 'Hotel O', 100, 7, 'Hotel confortável em Curitiba com estacionamento gratuito.', 1);
INSERT INTO public.accommodations VALUES (16, 'Hotel P', 120, 8, 'Hotel de luxo em Porto Alegre com vista para o lago.', 1);
INSERT INTO public.accommodations VALUES (17, 'Hotel Q', 85, 1, 'Hotel com ótimo custo-benefício no Rio de Janeiro com wifi gratuito.', 1);
INSERT INTO public.accommodations VALUES (18, 'Hotel R', 95, 2, 'Hotel em São Paulo com estacionamento e café da manhã incluído.', 1);
INSERT INTO public.accommodations VALUES (19, 'Hotel S', 100, 1, 'Hotel confortável com estacionamento e café da manhã incluídos.', 8);
INSERT INTO public.accommodations VALUES (20, 'Hotel Feijoada', 100, 2, 'Hotel confortável com estacionamento e café da manhã incluídos.', 10);
INSERT INTO public.accommodations VALUES (23, 'Hotel da feijuca', 100, 1, 'Hotel confortável com estacionamento e café da manhã incluídos.', 15);
INSERT INTO public.accommodations VALUES (21, 'Hotel Feijoada 2', 100, 1, 'Hotel confortável com estacionamento e café da manhã incluídos.', 12);
INSERT INTO public.accommodations VALUES (22, 'Hotel do feijao', 100, 1, 'Hotel confortável com estacionamento e café da manhã incluídos.', 14);


--
-- Data for Name: accommodationsConveniences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."accommodationsConveniences" VALUES (1, 1, 1);
INSERT INTO public."accommodationsConveniences" VALUES (2, 1, 2);
INSERT INTO public."accommodationsConveniences" VALUES (3, 2, 2);
INSERT INTO public."accommodationsConveniences" VALUES (4, 2, 3);
INSERT INTO public."accommodationsConveniences" VALUES (5, 3, 4);
INSERT INTO public."accommodationsConveniences" VALUES (6, 4, 1);
INSERT INTO public."accommodationsConveniences" VALUES (7, 4, 3);
INSERT INTO public."accommodationsConveniences" VALUES (8, 5, 5);
INSERT INTO public."accommodationsConveniences" VALUES (9, 5, 6);
INSERT INTO public."accommodationsConveniences" VALUES (10, 6, 6);
INSERT INTO public."accommodationsConveniences" VALUES (11, 6, 7);
INSERT INTO public."accommodationsConveniences" VALUES (12, 7, 8);
INSERT INTO public."accommodationsConveniences" VALUES (13, 8, 5);
INSERT INTO public."accommodationsConveniences" VALUES (14, 8, 7);
INSERT INTO public."accommodationsConveniences" VALUES (40, 9, 5);
INSERT INTO public."accommodationsConveniences" VALUES (41, 9, 6);
INSERT INTO public."accommodationsConveniences" VALUES (42, 10, 4);
INSERT INTO public."accommodationsConveniences" VALUES (43, 10, 3);
INSERT INTO public."accommodationsConveniences" VALUES (44, 11, 1);
INSERT INTO public."accommodationsConveniences" VALUES (45, 11, 3);
INSERT INTO public."accommodationsConveniences" VALUES (46, 12, 2);
INSERT INTO public."accommodationsConveniences" VALUES (47, 12, 4);
INSERT INTO public."accommodationsConveniences" VALUES (48, 13, 5);
INSERT INTO public."accommodationsConveniences" VALUES (49, 13, 6);
INSERT INTO public."accommodationsConveniences" VALUES (50, 13, 7);
INSERT INTO public."accommodationsConveniences" VALUES (51, 14, 3);
INSERT INTO public."accommodationsConveniences" VALUES (52, 14, 4);
INSERT INTO public."accommodationsConveniences" VALUES (53, 15, 2);
INSERT INTO public."accommodationsConveniences" VALUES (54, 15, 4);
INSERT INTO public."accommodationsConveniences" VALUES (55, 16, 5);
INSERT INTO public."accommodationsConveniences" VALUES (56, 16, 6);
INSERT INTO public."accommodationsConveniences" VALUES (57, 17, 7);
INSERT INTO public."accommodationsConveniences" VALUES (58, 17, 8);
INSERT INTO public."accommodationsConveniences" VALUES (59, 18, 1);
INSERT INTO public."accommodationsConveniences" VALUES (60, 18, 3);
INSERT INTO public."accommodationsConveniences" VALUES (61, 19, 1);
INSERT INTO public."accommodationsConveniences" VALUES (62, 19, 2);
INSERT INTO public."accommodationsConveniences" VALUES (63, 19, 3);
INSERT INTO public."accommodationsConveniences" VALUES (64, 20, 1);
INSERT INTO public."accommodationsConveniences" VALUES (65, 20, 3);
INSERT INTO public."accommodationsConveniences" VALUES (66, 20, 2);
INSERT INTO public."accommodationsConveniences" VALUES (67, 21, 1);
INSERT INTO public."accommodationsConveniences" VALUES (68, 21, 2);
INSERT INTO public."accommodationsConveniences" VALUES (69, 21, 3);
INSERT INTO public."accommodationsConveniences" VALUES (70, 23, 1);
INSERT INTO public."accommodationsConveniences" VALUES (71, 23, 2);
INSERT INTO public."accommodationsConveniences" VALUES (72, 23, 3);


--
-- Data for Name: accommodationsPictures; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."accommodationsPictures" VALUES (1, 1, 'https://pix10.agoda.net/hotelImages/124/1246280/1246280_16061017110043391702.jpg?ca=6&ce=1&s=1024x768');
INSERT INTO public."accommodationsPictures" VALUES (2, 1, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/413880810.jpg?k=41463a2760ca79634b44f3d8bf8360a96ac9d02b9ae78df666dd6a4f1394b13f&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (3, 1, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/453919632.jpg?k=596e2ed77163322f2e5c41931b6642a1f5dcaf34afa3ab06b613287ac0b10285&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (4, 2, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/453919732.jpg?k=45841158fc6626a2c01bc5d5185156cf9190a562181cbc8b44f447801ade717b&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (5, 2, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/453919706.jpg?k=b857c2ffb02c4c304f3c724c368de58578ed9108a8b5475ef325051e2ff0a8a7&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (6, 3, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/413880820.jpg?k=5ce8c5228416cd68392c1efec10d11935faa0a5452885f007baac477e76057fb&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (7, 3, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/413880817.jpg?k=54040e614360efe5ac9e7c4f3272ca0331594bc58f9771a1370e3355d3d1af47&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (8, 19, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/419421609.jpg?k=8d21e0bd831493c1e3ab2f89164d9e0c5ba1a86584c31bdb196d279e9d1d1a07&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (9, 19, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/419421568.jpg?k=1b733bff84ed551ea1e691b43c4f25f805768dbf6bad249b12e90cfd2b6d892e&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (10, 20, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/419421609.jpg?k=8d21e0bd831493c1e3ab2f89164d9e0c5ba1a86584c31bdb196d279e9d1d1a07&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (11, 20, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/419421568.jpg?k=1b733bff84ed551ea1e691b43c4f25f805768dbf6bad249b12e90cfd2b6d892e&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (12, 21, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/419421609.jpg?k=8d21e0bd831493c1e3ab2f89164d9e0c5ba1a86584c31bdb196d279e9d1d1a07&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (13, 21, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/419421568.jpg?k=1b733bff84ed551ea1e691b43c4f25f805768dbf6bad249b12e90cfd2b6d892e&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (14, 22, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/419421609.jpg?k=8d21e0bd831493c1e3ab2f89164d9e0c5ba1a86584c31bdb196d279e9d1d1a07&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (15, 23, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/419421609.jpg?k=8d21e0bd831493c1e3ab2f89164d9e0c5ba1a86584c31bdb196d279e9d1d1a07&o=&hp=1');
INSERT INTO public."accommodationsPictures" VALUES (16, 23, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/419421568.jpg?k=1b733bff84ed551ea1e691b43c4f25f805768dbf6bad249b12e90cfd2b6d892e&o=&hp=1');


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cities VALUES (1, 'Rio de Janeiro', 'Rio de Janeiro', 'Brazil');
INSERT INTO public.cities VALUES (2, 'São Paulo', 'São Paulo', 'Brazil');
INSERT INTO public.cities VALUES (3, 'Brasília', 'Federal District', 'Brazil');
INSERT INTO public.cities VALUES (4, 'Salvador', 'Bahia', 'Brazil');
INSERT INTO public.cities VALUES (5, 'Fortaleza', 'Ceará', 'Brail');
INSERT INTO public.cities VALUES (6, 'Manaus', 'Amazonas', 'Brail');
INSERT INTO public.cities VALUES (7, 'Curitiba', 'Paraná', 'Brail');
INSERT INTO public.cities VALUES (8, 'Porto Alegre', 'Rio Grande do Sul', 'Brail');


--
-- Data for Name: conveniences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.conveniences VALUES (1, 'WiFi grátis');
INSERT INTO public.conveniences VALUES (2, 'Estacionamento grátis');
INSERT INTO public.conveniences VALUES (3, 'Café da manhã gratuito');
INSERT INTO public.conveniences VALUES (4, 'Piscina');
INSERT INTO public.conveniences VALUES (5, 'Academia');
INSERT INTO public.conveniences VALUES (6, 'Spa');
INSERT INTO public.conveniences VALUES (7, 'Restaurante no local');
INSERT INTO public.conveniences VALUES (8, 'Serviço de quarto');
INSERT INTO public.conveniences VALUES (9, 'Academia');
INSERT INTO public.conveniences VALUES (10, 'Spa');
INSERT INTO public.conveniences VALUES (11, 'Restaurante no local');
INSERT INTO public.conveniences VALUES (12, 'Serviço de quarto');


--
-- Data for Name: flightCompanies; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."flightCompanies" VALUES (1, 'Air Company A');
INSERT INTO public."flightCompanies" VALUES (2, 'Air Company B');
INSERT INTO public."flightCompanies" VALUES (3, 'Air Company C');
INSERT INTO public."flightCompanies" VALUES (4, 'Air Company D');


--
-- Data for Name: flightPictures; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."flightPictures" VALUES (2, 2, 'https://flapinternational.ig.com.br/wp-content/uploads/2022/09/737-max-8-gol.jpg');
INSERT INTO public."flightPictures" VALUES (6, 6, 'https://flapinternational.ig.com.br/wp-content/uploads/2022/09/737-max-8-gol.jpg');
INSERT INTO public."flightPictures" VALUES (1, 1, 'https://flapinternational.ig.com.br/wp-content/uploads/2022/09/737-max-8-gol.jpg');
INSERT INTO public."flightPictures" VALUES (3, 3, 'https://flapinternational.ig.com.br/wp-content/uploads/2022/09/737-max-8-gol.jpg');
INSERT INTO public."flightPictures" VALUES (5, 5, 'https://flapinternational.ig.com.br/wp-content/uploads/2022/09/737-max-8-gol.jpg');
INSERT INTO public."flightPictures" VALUES (4, 4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvsiTWa1wmt-x65-SWBRD_FQKfdFqXfTBlrzFQ9ugvpUkavNbnNLQVgYsqUDyIlo6mshc&usqp=CAU');
INSERT INTO public."flightPictures" VALUES (7, 43, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (8, 44, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (9, 45, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (10, 46, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (11, 47, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (12, 48, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (13, 49, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (14, 50, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (15, 51, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (16, 52, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (17, 53, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (18, 54, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (19, 55, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (20, 56, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (21, 57, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');
INSERT INTO public."flightPictures" VALUES (22, 58, 'https://content.presspage.com/uploads/2431/1920_emiratesa380-3.jpg?10000');


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.flights VALUES (1, 1, 2, '2023-06-01 09:00:00', '2023-06-01 10:30:00', 100, 1);
INSERT INTO public.flights VALUES (2, 2, 1, '2023-06-01 15:00:00', '2023-06-01 16:30:00', 100, 1);
INSERT INTO public.flights VALUES (3, 1, 3, '2023-06-02 09:00:00', '2023-06-02 11:30:00', 200, 2);
INSERT INTO public.flights VALUES (4, 3, 1, '2023-06-02 15:00:00', '2023-06-02 17:30:00', 200, 2);
INSERT INTO public.flights VALUES (5, 2, 4, '2023-06-03 09:00:00', '2023-06-03 11:00:00', 150, 1);
INSERT INTO public.flights VALUES (6, 4, 2, '2023-06-03 15:00:00', '2023-06-03 17:00:00', 150, 1);
INSERT INTO public.flights VALUES (7, 5, 6, '2023-06-04 09:00:00', '2023-06-04 10:30:00', 100, 3);
INSERT INTO public.flights VALUES (8, 6, 5, '2023-06-04 15:00:00', '2023-06-04 16:30:00', 100, 3);
INSERT INTO public.flights VALUES (9, 5, 7, '2023-06-05 09:00:00', '2023-06-05 11:30:00', 200, 4);
INSERT INTO public.flights VALUES (10, 7, 5, '2023-06-05 15:00:00', '2023-06-05 17:30:00', 200, 4);
INSERT INTO public.flights VALUES (11, 6, 8, '2023-06-06 09:00:00', '2023-06-06 11:00:00', 150, 3);
INSERT INTO public.flights VALUES (12, 8, 6, '2023-06-06 15:00:00', '2023-06-06 17:00:00', 150, 3);
INSERT INTO public.flights VALUES (13, 1, 5, '2023-06-07 09:00:00', '2023-06-07 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (14, 5, 1, '2023-06-07 15:00:00', '2023-06-07 17:30:00', 150, 1);
INSERT INTO public.flights VALUES (15, 2, 6, '2023-06-08 09:00:00', '2023-06-08 11:30:00', 200, 2);
INSERT INTO public.flights VALUES (16, 6, 2, '2023-06-08 15:00:00', '2023-06-08 17:30:00', 200, 2);
INSERT INTO public.flights VALUES (17, 3, 7, '2023-06-09 09:00:00', '2023-06-09 11:30:00', 250, 3);
INSERT INTO public.flights VALUES (18, 7, 3, '2023-06-09 15:00:00', '2023-06-09 17:30:00', 250, 3);
INSERT INTO public.flights VALUES (19, 4, 8, '2023-06-10 09:00:00', '2023-06-10 11:30:00', 200, 4);
INSERT INTO public.flights VALUES (20, 8, 4, '2023-06-10 15:00:00', '2023-06-10 17:30:00', 200, 4);
INSERT INTO public.flights VALUES (21, 1, 7, '2023-06-11 09:00:00', '2023-06-11 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (22, 7, 1, '2023-06-11 15:00:00', '2023-06-11 17:30:00', 150, 1);
INSERT INTO public.flights VALUES (23, 1, 8, '2023-06-12 09:00:00', '2023-06-12 11:30:00', 250, 2);
INSERT INTO public.flights VALUES (24, 8, 1, '2023-06-12 15:00:00', '2023-06-12 17:30:00', 250, 2);
INSERT INTO public.flights VALUES (25, 2, 5, '2023-06-13 09:00:00', '2023-06-13 11:30:00', 200, 1);
INSERT INTO public.flights VALUES (26, 5, 2, '2023-06-13 15:00:00', '2023-06-13 17:30:00', 200, 1);
INSERT INTO public.flights VALUES (27, 3, 6, '2023-06-14 09:00:00', '2023-06-14 11:30:00', 300, 4);
INSERT INTO public.flights VALUES (28, 6, 3, '2023-06-14 15:00:00', '2023-06-14 17:30:00', 300, 4);
INSERT INTO public.flights VALUES (29, 4, 7, '2023-06-15 09:00:00', '2023-06-15 11:30:00', 200, 3);
INSERT INTO public.flights VALUES (30, 7, 4, '2023-06-15 15:00:00', '2023-06-15 17:30:00', 200, 3);
INSERT INTO public.flights VALUES (31, 1, 6, '2023-06-16 09:00:00', '2023-06-16 11:30:00', 250, 1);
INSERT INTO public.flights VALUES (32, 6, 1, '2023-06-16 15:00:00', '2023-06-16 17:30:00', 250, 1);
INSERT INTO public.flights VALUES (33, 2, 7, '2023-06-17 09:00:00', '2023-06-17 11:30:00', 300, 2);
INSERT INTO public.flights VALUES (34, 7, 2, '2023-06-17 15:00:00', '2023-06-17 17:30:00', 300, 2);
INSERT INTO public.flights VALUES (35, 3, 5, '2023-06-18 09:00:00', '2023-06-18 11:30:00', 200, 1);
INSERT INTO public.flights VALUES (36, 5, 3, '2023-06-18 15:00:00', '2023-06-18 17:30:00', 200, 1);
INSERT INTO public.flights VALUES (37, 4, 8, '2023-06-19 09:00:00', '2023-06-19 11:30:00', 250, 2);
INSERT INTO public.flights VALUES (38, 8, 4, '2023-06-19 15:00:00', '2023-06-19 17:30:00', 250, 2);
INSERT INTO public.flights VALUES (39, 1, 7, '2023-06-20 09:00:00', '2023-06-20 11:30:00', 300, 3);
INSERT INTO public.flights VALUES (40, 7, 1, '2023-06-20 15:00:00', '2023-06-20 17:30:00', 300, 3);
INSERT INTO public.flights VALUES (41, 2, 8, '2023-06-21 09:00:00', '2023-06-21 11:30:00', 200, 4);
INSERT INTO public.flights VALUES (42, 8, 2, '2023-06-21 15:00:00', '2023-06-21 17:30:00', 200, 4);
INSERT INTO public.flights VALUES (43, 1, 2, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (44, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (45, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (46, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (47, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (48, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (49, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (50, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (51, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (52, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (53, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (54, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (55, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (56, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (57, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);
INSERT INTO public.flights VALUES (58, 3, 1, '2023-07-01 09:00:00', '2023-07-01 11:30:00', 150, 1);


--
-- Name: accommodationsPictures_accommodationId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."accommodationsPictures_accommodationId_seq"', 1, false);


--
-- Name: accommodationsPictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."accommodationsPictures_id_seq"', 16, true);


--
-- Name: accommodations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accommodations_id_seq', 23, true);


--
-- Name: accomodationsConveniences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."accomodationsConveniences_id_seq"', 72, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 8, true);


--
-- Name: conveniences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conveniences_id_seq', 12, true);


--
-- Name: flightCompanies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."flightCompanies_id_seq"', 4, true);


--
-- Name: flightPictures_flightId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."flightPictures_flightId_seq"', 1, false);


--
-- Name: flightPictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."flightPictures_id_seq"', 22, true);


--
-- Name: fligths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fligths_id_seq', 58, true);


--
-- Name: accommodationsPictures accommodationsPictures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accommodationsPictures"
    ADD CONSTRAINT "accommodationsPictures_pkey" PRIMARY KEY (id);


--
-- Name: accommodations accommodations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT accommodations_pkey PRIMARY KEY (id);


--
-- Name: accommodationsConveniences accomodationsConveniences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accommodationsConveniences"
    ADD CONSTRAINT "accomodationsConveniences_pkey" PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: conveniences conveniences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conveniences
    ADD CONSTRAINT conveniences_pkey PRIMARY KEY (id);


--
-- Name: flightCompanies flightCompanies_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."flightCompanies"
    ADD CONSTRAINT "flightCompanies_name_key" UNIQUE (name);


--
-- Name: flightCompanies flightCompanies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."flightCompanies"
    ADD CONSTRAINT "flightCompanies_pkey" PRIMARY KEY (id);


--
-- Name: flightPictures flightPictures_flightId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."flightPictures"
    ADD CONSTRAINT "flightPictures_flightId_key" UNIQUE ("flightId");


--
-- Name: flightPictures flightPictures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."flightPictures"
    ADD CONSTRAINT "flightPictures_pkey" PRIMARY KEY (id);


--
-- Name: flights fligths_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT fligths_pkey PRIMARY KEY (id);


--
-- Name: accommodationsPictures accommodationsPictures_accommodationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accommodationsPictures"
    ADD CONSTRAINT "accommodationsPictures_accommodationId_fkey" FOREIGN KEY ("accommodationId") REFERENCES public.accommodations(id);


--
-- Name: accommodations accommodations_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT "accommodations_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.cities(id);


--
-- Name: accommodations accommodations_mainPictureId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT "accommodations_mainPictureId_fkey" FOREIGN KEY ("mainPictureId") REFERENCES public."accommodationsPictures"(id);


--
-- Name: accommodationsConveniences accomodationsConveniences_accommodationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accommodationsConveniences"
    ADD CONSTRAINT "accomodationsConveniences_accommodationId_fkey" FOREIGN KEY ("accommodationId") REFERENCES public.accommodations(id);


--
-- Name: accommodationsConveniences accomodationsConveniences_convenienceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accommodationsConveniences"
    ADD CONSTRAINT "accomodationsConveniences_convenienceId_fkey" FOREIGN KEY ("convenienceId") REFERENCES public.conveniences(id);


--
-- Name: flightPictures flightPictures_flightId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."flightPictures"
    ADD CONSTRAINT "flightPictures_flightId_fkey" FOREIGN KEY ("flightId") REFERENCES public.flights(id);


--
-- Name: flights fligths_destinationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT "fligths_destinationId_fkey" FOREIGN KEY ("destinationId") REFERENCES public.cities(id);


--
-- Name: flights fligths_flightCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT "fligths_flightCompanyId_fkey" FOREIGN KEY ("flightCompanyId") REFERENCES public."flightCompanies"(id);


--
-- Name: flights fligths_originId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT "fligths_originId_fkey" FOREIGN KEY ("originId") REFERENCES public.cities(id);


--
-- PostgreSQL database dump complete
--


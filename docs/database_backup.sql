--
-- PostgreSQL database dump
--

\restrict 2xZkjgc8bwwpWa45btB3wADY5jqMyXA7tFDlYSWMayjNARcvRfBe2dWWheNwifh

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-10 03:39:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 241 (class 1259 OID 24750)
-- Name: accommodations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accommodations (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 240 (class 1259 OID 24749)
-- Name: accommodations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accommodations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 240
-- Name: accommodations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accommodations_id_seq OWNED BY public.accommodations.id;


--
-- TOC entry 225 (class 1259 OID 24622)
-- Name: cache; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 24633)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 24703)
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 234 (class 1259 OID 24702)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 234
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 231 (class 1259 OID 24675)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 24674)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 230
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 245 (class 1259 OID 24783)
-- Name: hotel_rooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hotel_rooms (
    id bigint NOT NULL,
    hotel_id bigint NOT NULL,
    room_type_accommodation_id bigint NOT NULL,
    quantity integer NOT NULL,
    status character varying(255) DEFAULT 'Activo'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 244 (class 1259 OID 24782)
-- Name: hotel_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hotel_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 244
-- Name: hotel_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hotel_rooms_id_seq OWNED BY public.hotel_rooms.id;


--
-- TOC entry 237 (class 1259 OID 24718)
-- Name: hotels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hotels (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    address character varying(255) NOT NULL,
    city_id bigint NOT NULL,
    nit character varying(20) NOT NULL,
    max_rooms integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


--
-- TOC entry 236 (class 1259 OID 24717)
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 236
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- TOC entry 229 (class 1259 OID 24660)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


--
-- TOC entry 228 (class 1259 OID 24645)
-- Name: jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 24644)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 227
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 220 (class 1259 OID 24577)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 24576)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 223 (class 1259 OID 24601)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- TOC entry 247 (class 1259 OID 24808)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name text NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 246 (class 1259 OID 24807)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 246
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 243 (class 1259 OID 24761)
-- Name: room_type_accommodations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room_type_accommodations (
    id bigint NOT NULL,
    room_type_id bigint NOT NULL,
    accommodation_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 242 (class 1259 OID 24760)
-- Name: room_type_accommodations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_type_accommodations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 242
-- Name: room_type_accommodations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_type_accommodations_id_seq OWNED BY public.room_type_accommodations.id;


--
-- TOC entry 239 (class 1259 OID 24738)
-- Name: room_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room_types (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 238 (class 1259 OID 24737)
-- Name: room_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 238
-- Name: room_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_types_id_seq OWNED BY public.room_types.id;


--
-- TOC entry 224 (class 1259 OID 24610)
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 24694)
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 232 (class 1259 OID 24693)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 232
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 222 (class 1259 OID 24587)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 221 (class 1259 OID 24586)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4839 (class 2604 OID 24753)
-- Name: accommodations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accommodations ALTER COLUMN id SET DEFAULT nextval('public.accommodations_id_seq'::regclass);


--
-- TOC entry 4836 (class 2604 OID 24706)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 4833 (class 2604 OID 24678)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4841 (class 2604 OID 24786)
-- Name: hotel_rooms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_rooms ALTER COLUMN id SET DEFAULT nextval('public.hotel_rooms_id_seq'::regclass);


--
-- TOC entry 4837 (class 2604 OID 24721)
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- TOC entry 4832 (class 2604 OID 24648)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4830 (class 2604 OID 24580)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4843 (class 2604 OID 24811)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 4840 (class 2604 OID 24764)
-- Name: room_type_accommodations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type_accommodations ALTER COLUMN id SET DEFAULT nextval('public.room_type_accommodations_id_seq'::regclass);


--
-- TOC entry 4838 (class 2604 OID 24741)
-- Name: room_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_types ALTER COLUMN id SET DEFAULT nextval('public.room_types_id_seq'::regclass);


--
-- TOC entry 4835 (class 2604 OID 24697)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 4831 (class 2604 OID 24590)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5076 (class 0 OID 24750)
-- Dependencies: 241
-- Data for Name: accommodations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accommodations (id, name, created_at, updated_at) VALUES (1, 'Single', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.accommodations (id, name, created_at, updated_at) VALUES (2, 'Double', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.accommodations (id, name, created_at, updated_at) VALUES (3, 'Triple', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.accommodations (id, name, created_at, updated_at) VALUES (4, 'Quadruple', '2026-05-10 04:04:32', '2026-05-10 04:04:32');


--
-- TOC entry 5060 (class 0 OID 24622)
-- Dependencies: 225
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5061 (class 0 OID 24633)
-- Dependencies: 226
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5070 (class 0 OID 24703)
-- Dependencies: 235
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (1, 'Cartagena', 1, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (2, 'Magangué', 1, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (3, 'Turbaco', 1, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (4, 'Santa Marta', 2, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (5, 'Ciénaga', 2, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (6, 'Fundación', 2, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (7, 'San Andrés', 3, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (8, 'Providencia', 3, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (9, 'Leticia', 4, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (10, 'Medellín', 5, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (11, 'Rionegro', 5, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (12, 'Envigado', 5, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (13, 'Bogotá', 6, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (14, 'Girardot', 6, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (15, 'Villeta', 6, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (16, 'Armenia', 7, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (17, 'Montenegro', 7, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (18, 'Salento', 7, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (19, 'Cali', 8, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (20, 'Buenaventura', 8, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (21, 'Barranquilla', 9, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.cities (id, name, state_id, created_at, updated_at) VALUES (22, 'Puerto Colombia', 9, '2026-05-10 04:04:32', '2026-05-10 04:04:32');


--
-- TOC entry 5066 (class 0 OID 24675)
-- Dependencies: 231
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5080 (class 0 OID 24783)
-- Dependencies: 245
-- Data for Name: hotel_rooms; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hotel_rooms (id, hotel_id, room_type_accommodation_id, quantity, status, created_at, updated_at) VALUES (2, 1, 8, 10, 'Activo', '2026-05-10 06:49:02', '2026-05-10 06:49:02');


--
-- TOC entry 5072 (class 0 OID 24718)
-- Dependencies: 237
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hotels (id, name, address, city_id, nit, max_rooms, created_at, updated_at, deleted_at) VALUES (1, 'Decameron', 'Bocagrande', 1, '806.000.179-3', 40, '2026-05-10 04:07:34', '2026-05-10 04:07:34', NULL);


--
-- TOC entry 5064 (class 0 OID 24660)
-- Dependencies: 229
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5063 (class 0 OID 24645)
-- Dependencies: 228
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5055 (class 0 OID 24577)
-- Dependencies: 220
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations (id, migration, batch) VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (4, '2026_05_07_015147_create_states_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (5, '2026_05_07_015212_create_cities_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (6, '2026_05_07_015229_create_hotels_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (7, '2026_05_07_015249_create_room_types_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (8, '2026_05_07_015305_create_accommodations_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (9, '2026_05_07_015323_create_room_type_accommodations_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (10, '2026_05_07_015336_create_hotel_rooms_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (11, '2026_05_07_032424_create_personal_access_tokens_table', 1);


--
-- TOC entry 5058 (class 0 OID 24601)
-- Dependencies: 223
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5082 (class 0 OID 24808)
-- Dependencies: 247
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (3, 'App\Models\User', 1, 'auth_token', 'affc9f04c56711193238d51803b6c4ca358a1e4bf6292dcaf733fb0680a61744', '["*"]', '2026-05-10 07:55:30', NULL, '2026-05-10 06:31:53', '2026-05-10 07:55:30');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (1, 'App\Models\User', 1, 'auth_token', '360c2f6143d3d58d8174b2ebbfa82a47d1f66d9aedcc48d3d14d20fd524618f6', '["*"]', '2026-05-10 06:20:55', NULL, '2026-05-10 04:06:02', '2026-05-10 06:20:55');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (2, 'App\Models\User', 1, 'auth_token', 'da8ead0bdc1b79b319fb4ed920aafe44342747240af8f696a428ced4b6aab208', '["*"]', '2026-05-10 06:31:39', NULL, '2026-05-10 06:31:12', '2026-05-10 06:31:39');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (4, 'App\Models\User', 1, 'auth_token', '69317683ebcfafe5a87c1acc171eaa4252d41686a86e84bda328aaca78e8a246', '["*"]', '2026-05-10 07:58:51', NULL, '2026-05-10 07:56:01', '2026-05-10 07:58:51');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (5, 'App\Models\User', 1, 'auth_token', 'bfbb3916b63454dfb4863cf2ac4931302825cd50d3cd9a99e20a9d56305cc5a2', '["*"]', '2026-05-10 08:00:50', NULL, '2026-05-10 08:00:27', '2026-05-10 08:00:50');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (6, 'App\Models\User', 1, 'auth_token', 'fc98137c2565059712b5ea82d85a58dff038dc6e33b0b719e68ba003e02becf3', '["*"]', '2026-05-10 08:20:28', NULL, '2026-05-10 08:11:08', '2026-05-10 08:20:28');


--
-- TOC entry 5078 (class 0 OID 24761)
-- Dependencies: 243
-- Data for Name: room_type_accommodations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room_type_accommodations (id, room_type_id, accommodation_id, created_at, updated_at) VALUES (1, 1, 1, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.room_type_accommodations (id, room_type_id, accommodation_id, created_at, updated_at) VALUES (3, 2, 3, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.room_type_accommodations (id, room_type_id, accommodation_id, created_at, updated_at) VALUES (4, 2, 4, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.room_type_accommodations (id, room_type_id, accommodation_id, created_at, updated_at) VALUES (5, 3, 1, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.room_type_accommodations (id, room_type_id, accommodation_id, created_at, updated_at) VALUES (6, 3, 2, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.room_type_accommodations (id, room_type_id, accommodation_id, created_at, updated_at) VALUES (7, 3, 3, '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.room_type_accommodations (id, room_type_id, accommodation_id, created_at, updated_at) VALUES (8, 1, 2, NULL, NULL);


--
-- TOC entry 5074 (class 0 OID 24738)
-- Dependencies: 239
-- Data for Name: room_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room_types (id, name, created_at, updated_at) VALUES (1, 'Standard', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.room_types (id, name, created_at, updated_at) VALUES (2, 'Junior', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.room_types (id, name, created_at, updated_at) VALUES (3, 'Suite', '2026-05-10 04:04:32', '2026-05-10 04:04:32');


--
-- TOC entry 5059 (class 0 OID 24610)
-- Dependencies: 224
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5068 (class 0 OID 24694)
-- Dependencies: 233
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.states (id, name, created_at, updated_at) VALUES (1, 'Bolívar', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.states (id, name, created_at, updated_at) VALUES (2, 'Magdalena', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.states (id, name, created_at, updated_at) VALUES (3, 'Archipiélago de San Andrés', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.states (id, name, created_at, updated_at) VALUES (4, 'Amazonas', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.states (id, name, created_at, updated_at) VALUES (5, 'Antioquia', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.states (id, name, created_at, updated_at) VALUES (6, 'Cundinamarca', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.states (id, name, created_at, updated_at) VALUES (7, 'Quindío', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.states (id, name, created_at, updated_at) VALUES (8, 'Valle del Cauca', '2026-05-10 04:04:32', '2026-05-10 04:04:32');
INSERT INTO public.states (id, name, created_at, updated_at) VALUES (9, 'Atlántico', '2026-05-10 04:04:32', '2026-05-10 04:04:32');


--
-- TOC entry 5057 (class 0 OID 24587)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (1, 'Admin Decameron', 'admin@gmail.com', NULL, '$2y$12$EULvNGBHEaFqi.nZLS98wu6H6f5JfuBv39/vvqyHK2oJwh05sT3oe', NULL, '2026-05-10 04:04:23', '2026-05-10 04:04:23');
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (2, 'Test User', 'test@example.com', '2026-05-10 04:04:31', '$2y$12$D0nzmDptNQdFPiiGMPNuv.tEPa7yyws9HzyRWk9xDdS0eNVfqONLy', 'yLiPIzpPGn', '2026-05-10 04:04:31', '2026-05-10 04:04:31');


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 240
-- Name: accommodations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accommodations_id_seq', 4, true);


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 234
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 22, true);


--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 230
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 244
-- Name: hotel_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hotel_rooms_id_seq', 2, true);


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 236
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hotels_id_seq', 1, true);


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 227
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 11, true);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 246
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 6, true);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 242
-- Name: room_type_accommodations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_type_accommodations_id_seq', 8, true);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 238
-- Name: room_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_types_id_seq', 3, true);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 232
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 9, true);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 4884 (class 2606 OID 24759)
-- Name: accommodations accommodations_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT accommodations_name_unique UNIQUE (name);


--
-- TOC entry 4886 (class 2606 OID 24757)
-- Name: accommodations accommodations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT accommodations_pkey PRIMARY KEY (id);


--
-- TOC entry 4861 (class 2606 OID 24642)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4858 (class 2606 OID 24631)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4874 (class 2606 OID 24711)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 24690)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4870 (class 2606 OID 24692)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4892 (class 2606 OID 24806)
-- Name: hotel_rooms hotel_room_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_room_unique UNIQUE (hotel_id, room_type_accommodation_id);


--
-- TOC entry 4894 (class 2606 OID 24794)
-- Name: hotel_rooms hotel_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 4876 (class 2606 OID 24736)
-- Name: hotels hotels_nit_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_nit_unique UNIQUE (nit);


--
-- TOC entry 4878 (class 2606 OID 24729)
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4866 (class 2606 OID 24673)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4863 (class 2606 OID 24658)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4845 (class 2606 OID 24585)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4851 (class 2606 OID 24609)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 4897 (class 2606 OID 24820)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4899 (class 2606 OID 24823)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 4888 (class 2606 OID 24769)
-- Name: room_type_accommodations room_type_accommodations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type_accommodations
    ADD CONSTRAINT room_type_accommodations_pkey PRIMARY KEY (id);


--
-- TOC entry 4880 (class 2606 OID 24747)
-- Name: room_types room_types_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_name_unique UNIQUE (name);


--
-- TOC entry 4882 (class 2606 OID 24745)
-- Name: room_types room_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4890 (class 2606 OID 24781)
-- Name: room_type_accommodations rta_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type_accommodations
    ADD CONSTRAINT rta_unique UNIQUE (room_type_id, accommodation_id);


--
-- TOC entry 4854 (class 2606 OID 24619)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4872 (class 2606 OID 24701)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 4847 (class 2606 OID 24600)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4849 (class 2606 OID 24598)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4856 (class 1259 OID 24632)
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- TOC entry 4859 (class 1259 OID 24643)
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- TOC entry 4864 (class 1259 OID 24659)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4895 (class 1259 OID 24824)
-- Name: personal_access_tokens_expires_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX personal_access_tokens_expires_at_index ON public.personal_access_tokens USING btree (expires_at);


--
-- TOC entry 4900 (class 1259 OID 24821)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 4852 (class 1259 OID 24621)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4855 (class 1259 OID 24620)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 4901 (class 2606 OID 24712)
-- Name: cities cities_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_id_foreign FOREIGN KEY (state_id) REFERENCES public.states(id) ON DELETE CASCADE;


--
-- TOC entry 4905 (class 2606 OID 24795)
-- Name: hotel_rooms hotel_rooms_hotel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_hotel_id_foreign FOREIGN KEY (hotel_id) REFERENCES public.hotels(id) ON DELETE CASCADE;


--
-- TOC entry 4906 (class 2606 OID 24800)
-- Name: hotel_rooms hotel_rooms_room_type_accommodation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_room_type_accommodation_id_foreign FOREIGN KEY (room_type_accommodation_id) REFERENCES public.room_type_accommodations(id) ON DELETE RESTRICT;


--
-- TOC entry 4902 (class 2606 OID 24730)
-- Name: hotels hotels_city_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_city_id_foreign FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- TOC entry 4903 (class 2606 OID 24775)
-- Name: room_type_accommodations room_type_accommodations_accommodation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type_accommodations
    ADD CONSTRAINT room_type_accommodations_accommodation_id_foreign FOREIGN KEY (accommodation_id) REFERENCES public.accommodations(id) ON DELETE CASCADE;


--
-- TOC entry 4904 (class 2606 OID 24770)
-- Name: room_type_accommodations room_type_accommodations_room_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type_accommodations
    ADD CONSTRAINT room_type_accommodations_room_type_id_foreign FOREIGN KEY (room_type_id) REFERENCES public.room_types(id) ON DELETE CASCADE;


-- Completed on 2026-05-10 03:39:54

--
-- PostgreSQL database dump complete
--

\unrestrict 2xZkjgc8bwwpWa45btB3wADY5jqMyXA7tFDlYSWMayjNARcvRfBe2dWWheNwifh


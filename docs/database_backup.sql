--
-- PostgreSQL database dump
--

\restrict af27Gz4e4rFBiIWktD5FjY09RC1mGMt95cjNeh4Akoa77GGy7TDsSAcBSzD0230

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-09 16:19:48

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
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 241 (class 1259 OID 16846)
-- Name: accommodations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accommodations (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 240 (class 1259 OID 16845)
-- Name: accommodations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accommodations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 240
-- Name: accommodations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accommodations_id_seq OWNED BY public.accommodations.id;


--
-- TOC entry 225 (class 1259 OID 16719)
-- Name: cache; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16730)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 16800)
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
-- TOC entry 234 (class 1259 OID 16799)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 234
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 231 (class 1259 OID 16772)
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
-- TOC entry 230 (class 1259 OID 16771)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 230
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 245 (class 1259 OID 16879)
-- Name: hotel_rooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hotel_rooms (
    id bigint NOT NULL,
    hotel_id bigint NOT NULL,
    room_type_accommodation_id bigint NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 244 (class 1259 OID 16878)
-- Name: hotel_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hotel_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 244
-- Name: hotel_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hotel_rooms_id_seq OWNED BY public.hotel_rooms.id;


--
-- TOC entry 237 (class 1259 OID 16815)
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
-- TOC entry 236 (class 1259 OID 16814)
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 236
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- TOC entry 229 (class 1259 OID 16757)
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
-- TOC entry 228 (class 1259 OID 16742)
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
-- TOC entry 227 (class 1259 OID 16741)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 227
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 220 (class 1259 OID 16674)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 16673)
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
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 223 (class 1259 OID 16698)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- TOC entry 247 (class 1259 OID 16902)
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
-- TOC entry 246 (class 1259 OID 16901)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 246
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 243 (class 1259 OID 16857)
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
-- TOC entry 242 (class 1259 OID 16856)
-- Name: room_type_accommodations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_type_accommodations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 242
-- Name: room_type_accommodations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_type_accommodations_id_seq OWNED BY public.room_type_accommodations.id;


--
-- TOC entry 239 (class 1259 OID 16835)
-- Name: room_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room_types (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 238 (class 1259 OID 16834)
-- Name: room_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 238
-- Name: room_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_types_id_seq OWNED BY public.room_types.id;


--
-- TOC entry 224 (class 1259 OID 16707)
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
-- TOC entry 233 (class 1259 OID 16791)
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 232 (class 1259 OID 16790)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 232
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 222 (class 1259 OID 16684)
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
-- TOC entry 221 (class 1259 OID 16683)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4839 (class 2604 OID 16849)
-- Name: accommodations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accommodations ALTER COLUMN id SET DEFAULT nextval('public.accommodations_id_seq'::regclass);


--
-- TOC entry 4836 (class 2604 OID 16803)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 4833 (class 2604 OID 16775)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4841 (class 2604 OID 16882)
-- Name: hotel_rooms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_rooms ALTER COLUMN id SET DEFAULT nextval('public.hotel_rooms_id_seq'::regclass);


--
-- TOC entry 4837 (class 2604 OID 16818)
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- TOC entry 4832 (class 2604 OID 16745)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4830 (class 2604 OID 16677)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4842 (class 2604 OID 16905)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 4840 (class 2604 OID 16860)
-- Name: room_type_accommodations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type_accommodations ALTER COLUMN id SET DEFAULT nextval('public.room_type_accommodations_id_seq'::regclass);


--
-- TOC entry 4838 (class 2604 OID 16838)
-- Name: room_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_types ALTER COLUMN id SET DEFAULT nextval('public.room_types_id_seq'::regclass);


--
-- TOC entry 4835 (class 2604 OID 16794)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 4831 (class 2604 OID 16687)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5075 (class 0 OID 16846)
-- Dependencies: 241
-- Data for Name: accommodations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accommodations VALUES (1, 'Single', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.accommodations VALUES (2, 'Double', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.accommodations VALUES (3, 'Triple', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.accommodations VALUES (4, 'Quadruple', '2026-05-07 05:09:24', '2026-05-07 05:09:24');


--
-- TOC entry 5059 (class 0 OID 16719)
-- Dependencies: 225
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5060 (class 0 OID 16730)
-- Dependencies: 226
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5069 (class 0 OID 16800)
-- Dependencies: 235
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cities VALUES (1, 'Cartagena', 1, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (2, 'Magangué', 1, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (3, 'Turbaco', 1, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (4, 'Santa Marta', 2, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (5, 'Ciénaga', 2, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (6, 'Fundación', 2, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (7, 'San Andrés', 3, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (8, 'Providencia', 3, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (9, 'Leticia', 4, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (10, 'Medellín', 5, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (11, 'Rionegro', 5, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (12, 'Envigado', 5, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (13, 'Bogotá', 6, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (14, 'Girardot', 6, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (15, 'Villeta', 6, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (16, 'Armenia', 7, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (17, 'Montenegro', 7, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (18, 'Salento', 7, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (19, 'Cali', 8, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (20, 'Buenaventura', 8, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (21, 'Barranquilla', 9, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.cities VALUES (22, 'Puerto Colombia', 9, '2026-05-07 05:09:24', '2026-05-07 05:09:24');


--
-- TOC entry 5065 (class 0 OID 16772)
-- Dependencies: 231
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5079 (class 0 OID 16879)
-- Dependencies: 245
-- Data for Name: hotel_rooms; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hotel_rooms VALUES (1, 1, 1, 7, '2026-05-07 17:11:21', '2026-05-07 17:11:21');


--
-- TOC entry 5071 (class 0 OID 16815)
-- Dependencies: 237
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hotels VALUES (1, 'Decameron Isla Palma', 'Isla Palma, Sucre', 1, '900.123.456-1', 10, '2026-05-07 16:58:47', '2026-05-07 16:58:47', NULL);
INSERT INTO public.hotels VALUES (2, 'asdfh', 'h hvc hvch', 18, '11111111', 35, '2026-05-09 13:40:58', '2026-05-09 14:52:17', '2026-05-09 14:52:17');


--
-- TOC entry 5063 (class 0 OID 16757)
-- Dependencies: 229
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5062 (class 0 OID 16742)
-- Dependencies: 228
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5054 (class 0 OID 16674)
-- Dependencies: 220
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO public.migrations VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO public.migrations VALUES (4, '2026_05_07_015147_create_states_table', 1);
INSERT INTO public.migrations VALUES (5, '2026_05_07_015212_create_cities_table', 1);
INSERT INTO public.migrations VALUES (6, '2026_05_07_015229_create_hotels_table', 1);
INSERT INTO public.migrations VALUES (7, '2026_05_07_015249_create_room_types_table', 1);
INSERT INTO public.migrations VALUES (8, '2026_05_07_015305_create_accommodations_table', 1);
INSERT INTO public.migrations VALUES (9, '2026_05_07_015323_create_room_type_accommodations_table', 1);
INSERT INTO public.migrations VALUES (10, '2026_05_07_015336_create_hotel_rooms_table', 1);
INSERT INTO public.migrations VALUES (11, '2026_05_07_032424_create_personal_access_tokens_table', 1);


--
-- TOC entry 5057 (class 0 OID 16698)
-- Dependencies: 223
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5081 (class 0 OID 16902)
-- Dependencies: 247
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.personal_access_tokens VALUES (1, 'App\Models\User', 1, 'auth_token', '250ccea55213863839d6c182bf81a81f6e518d1bc4faccab503ffeacdfebee57', '["*"]', '2026-05-07 17:15:53', NULL, '2026-05-07 16:36:38', '2026-05-07 17:15:53');
INSERT INTO public.personal_access_tokens VALUES (2, 'App\Models\User', 1, 'auth_token', 'e49592af587cdfd9b170fb6e48014032a66c83de93d9151dbacfcc6f64992203', '["*"]', NULL, NULL, '2026-05-08 18:43:14', '2026-05-08 18:43:14');
INSERT INTO public.personal_access_tokens VALUES (3, 'App\Models\User', 1, 'auth_token', 'c80c61e55c11e5460616cba01ea56c85949ebeb9b7f51c9075904d68016cebd5', '["*"]', NULL, NULL, '2026-05-08 18:43:40', '2026-05-08 18:43:40');
INSERT INTO public.personal_access_tokens VALUES (4, 'App\Models\User', 1, 'auth_token', '1a535cd4e441bea69fdaf57b80691eae71a2cf9ca808f63a5601c7dd58b6e93d', '["*"]', NULL, NULL, '2026-05-08 18:55:13', '2026-05-08 18:55:13');
INSERT INTO public.personal_access_tokens VALUES (5, 'App\Models\User', 1, 'auth_token', 'f9bfc324d5a863d36b2402a78b23a320113b04740d553c2abb6a03c4c6842758', '["*"]', NULL, NULL, '2026-05-09 04:28:23', '2026-05-09 04:28:23');
INSERT INTO public.personal_access_tokens VALUES (6, 'App\Models\User', 1, 'auth_token', '9b5b21d1a266011c71de828b466655f9fb0e5ebfa7826dc5744dc0e27f048fab', '["*"]', NULL, NULL, '2026-05-09 04:29:03', '2026-05-09 04:29:03');
INSERT INTO public.personal_access_tokens VALUES (7, 'App\Models\User', 1, 'auth_token', '0d681a5c1883d21539fc0f424320fa792bfef2ca9dffa50a83c7bf17a6a7165b', '["*"]', NULL, NULL, '2026-05-09 13:26:30', '2026-05-09 13:26:30');
INSERT INTO public.personal_access_tokens VALUES (10, 'App\Models\User', 1, 'auth_token', '7337e6ccfca36aa001be359dadf3d1c14157788ed7c83b409061732eb6176d3e', '["*"]', '2026-05-09 18:56:30', NULL, '2026-05-09 15:48:01', '2026-05-09 18:56:30');
INSERT INTO public.personal_access_tokens VALUES (8, 'App\Models\User', 1, 'auth_token', '3763afe9d3ff5ac46221699594340a888e8244f94d9eccc3d267caa5f7464825', '["*"]', '2026-05-09 15:43:11', NULL, '2026-05-09 13:39:43', '2026-05-09 15:43:11');
INSERT INTO public.personal_access_tokens VALUES (9, 'App\Models\User', 1, 'auth_token', 'c1d10327de62de751b7601471642599b3426c11829c978389567c961aaf9cd47', '["*"]', '2026-05-09 15:43:28', NULL, '2026-05-09 15:43:17', '2026-05-09 15:43:28');


--
-- TOC entry 5077 (class 0 OID 16857)
-- Dependencies: 243
-- Data for Name: room_type_accommodations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room_type_accommodations VALUES (1, 1, 1, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.room_type_accommodations VALUES (2, 1, 2, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.room_type_accommodations VALUES (3, 2, 3, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.room_type_accommodations VALUES (4, 2, 4, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.room_type_accommodations VALUES (5, 3, 1, '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.room_type_accommodations VALUES (6, 3, 2, '2026-05-07 05:09:25', '2026-05-07 05:09:25');
INSERT INTO public.room_type_accommodations VALUES (7, 3, 3, '2026-05-07 05:09:25', '2026-05-07 05:09:25');


--
-- TOC entry 5073 (class 0 OID 16835)
-- Dependencies: 239
-- Data for Name: room_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room_types VALUES (1, 'Standard', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.room_types VALUES (2, 'Junior', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.room_types VALUES (3, 'Suite', '2026-05-07 05:09:24', '2026-05-07 05:09:24');


--
-- TOC entry 5058 (class 0 OID 16707)
-- Dependencies: 224
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5067 (class 0 OID 16791)
-- Dependencies: 233
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.states VALUES (1, 'Bolívar', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.states VALUES (2, 'Magdalena', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.states VALUES (3, 'Archipiélago de San Andrés', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.states VALUES (4, 'Amazonas', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.states VALUES (5, 'Antioquia', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.states VALUES (6, 'Cundinamarca', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.states VALUES (7, 'Quindío', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.states VALUES (8, 'Valle del Cauca', '2026-05-07 05:09:24', '2026-05-07 05:09:24');
INSERT INTO public.states VALUES (9, 'Atlántico', '2026-05-07 05:09:24', '2026-05-07 05:09:24');


--
-- TOC entry 5056 (class 0 OID 16684)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Admin Decameron', 'admin@gmail.com', NULL, '$2y$12$eDpYSF9o2bUpAELIsyTkCeP.egvkTjorR.53JTCnHC31d/vEe60d2', NULL, '2026-05-07 05:09:22', '2026-05-07 05:09:22');
INSERT INTO public.users VALUES (2, 'Test User', 'test@example.com', '2026-05-07 05:09:22', '$2y$12$D2Jr.mnXrKLfLZgTR.HP7OKfG5b9Gyf1wfd/jUdqHwg/IQlC9c5K6', 'XqpzEwRwgJ', '2026-05-07 05:09:23', '2026-05-07 05:09:23');


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 240
-- Name: accommodations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accommodations_id_seq', 4, true);


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 234
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 22, true);


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 230
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 244
-- Name: hotel_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hotel_rooms_id_seq', 2, true);


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 236
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hotels_id_seq', 2, true);


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 227
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 11, true);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 246
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 10, true);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 242
-- Name: room_type_accommodations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_type_accommodations_id_seq', 7, true);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 238
-- Name: room_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_types_id_seq', 3, true);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 232
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 9, true);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 4883 (class 2606 OID 16855)
-- Name: accommodations accommodations_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT accommodations_name_unique UNIQUE (name);


--
-- TOC entry 4885 (class 2606 OID 16853)
-- Name: accommodations accommodations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT accommodations_pkey PRIMARY KEY (id);


--
-- TOC entry 4860 (class 2606 OID 16739)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4857 (class 2606 OID 16728)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4873 (class 2606 OID 16808)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 4867 (class 2606 OID 16787)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4869 (class 2606 OID 16789)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4891 (class 2606 OID 16900)
-- Name: hotel_rooms hotel_room_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_room_unique UNIQUE (hotel_id, room_type_accommodation_id);


--
-- TOC entry 4893 (class 2606 OID 16888)
-- Name: hotel_rooms hotel_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 4875 (class 2606 OID 16833)
-- Name: hotels hotels_nit_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_nit_unique UNIQUE (nit);


--
-- TOC entry 4877 (class 2606 OID 16826)
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4865 (class 2606 OID 16770)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4862 (class 2606 OID 16755)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4844 (class 2606 OID 16682)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4850 (class 2606 OID 16706)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 4896 (class 2606 OID 16914)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4898 (class 2606 OID 16917)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 4887 (class 2606 OID 16865)
-- Name: room_type_accommodations room_type_accommodations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type_accommodations
    ADD CONSTRAINT room_type_accommodations_pkey PRIMARY KEY (id);


--
-- TOC entry 4879 (class 2606 OID 16844)
-- Name: room_types room_types_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_name_unique UNIQUE (name);


--
-- TOC entry 4881 (class 2606 OID 16842)
-- Name: room_types room_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4889 (class 2606 OID 16877)
-- Name: room_type_accommodations rta_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type_accommodations
    ADD CONSTRAINT rta_unique UNIQUE (room_type_id, accommodation_id);


--
-- TOC entry 4853 (class 2606 OID 16716)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4871 (class 2606 OID 16798)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 4846 (class 2606 OID 16697)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4848 (class 2606 OID 16695)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4855 (class 1259 OID 16729)
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- TOC entry 4858 (class 1259 OID 16740)
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- TOC entry 4863 (class 1259 OID 16756)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4894 (class 1259 OID 16918)
-- Name: personal_access_tokens_expires_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX personal_access_tokens_expires_at_index ON public.personal_access_tokens USING btree (expires_at);


--
-- TOC entry 4899 (class 1259 OID 16915)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 4851 (class 1259 OID 16718)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4854 (class 1259 OID 16717)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 4900 (class 2606 OID 16809)
-- Name: cities cities_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_id_foreign FOREIGN KEY (state_id) REFERENCES public.states(id) ON DELETE CASCADE;


--
-- TOC entry 4904 (class 2606 OID 16889)
-- Name: hotel_rooms hotel_rooms_hotel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_hotel_id_foreign FOREIGN KEY (hotel_id) REFERENCES public.hotels(id) ON DELETE CASCADE;


--
-- TOC entry 4905 (class 2606 OID 16894)
-- Name: hotel_rooms hotel_rooms_room_type_accommodation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_room_type_accommodation_id_foreign FOREIGN KEY (room_type_accommodation_id) REFERENCES public.room_type_accommodations(id) ON DELETE RESTRICT;


--
-- TOC entry 4901 (class 2606 OID 16827)
-- Name: hotels hotels_city_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_city_id_foreign FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- TOC entry 4902 (class 2606 OID 16871)
-- Name: room_type_accommodations room_type_accommodations_accommodation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type_accommodations
    ADD CONSTRAINT room_type_accommodations_accommodation_id_foreign FOREIGN KEY (accommodation_id) REFERENCES public.accommodations(id) ON DELETE CASCADE;


--
-- TOC entry 4903 (class 2606 OID 16866)
-- Name: room_type_accommodations room_type_accommodations_room_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type_accommodations
    ADD CONSTRAINT room_type_accommodations_room_type_id_foreign FOREIGN KEY (room_type_id) REFERENCES public.room_types(id) ON DELETE CASCADE;


-- Completed on 2026-05-09 16:19:54

--
-- PostgreSQL database dump complete
--

\unrestrict af27Gz4e4rFBiIWktD5FjY09RC1mGMt95cjNeh4Akoa77GGy7TDsSAcBSzD0230


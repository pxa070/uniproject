--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Homebrew)
-- Dumped by pg_dump version 14.10 (Homebrew)

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
-- Name: question_feedback; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.question_feedback (
    feedback_id integer NOT NULL,
    question_id integer NOT NULL,
    feedback text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.question_feedback OWNER TO paransaccount;

--
-- Name: question_feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: paransaccount
--

CREATE SEQUENCE public.question_feedback_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_feedback_feedback_id_seq OWNER TO paransaccount;

--
-- Name: question_feedback_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.question_feedback_feedback_id_seq OWNED BY public.question_feedback.feedback_id;


--
-- Name: question_topic_links; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.question_topic_links (
    question_id integer NOT NULL,
    topic_id integer NOT NULL
);


ALTER TABLE public.question_topic_links OWNER TO paransaccount;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.questions (
    question_id integer NOT NULL,
    user_id integer,
    question_text text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    tags text[],
    model_answer_explanation text,
    keywords text[]
);


ALTER TABLE public.questions OWNER TO paransaccount;

--
-- Name: questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: paransaccount
--

CREATE SEQUENCE public.questions_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_id_seq OWNER TO paransaccount;

--
-- Name: questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.questions.question_id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.resources (
    resource_id integer NOT NULL,
    question_id integer,
    resource_type character varying(50),
    resource_link text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    source_type character varying(50)
);


ALTER TABLE public.resources OWNER TO paransaccount;

--
-- Name: resources_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: paransaccount
--

CREATE SEQUENCE public.resources_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_resource_id_seq OWNER TO paransaccount;

--
-- Name: resources_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.resources_resource_id_seq OWNED BY public.resources.resource_id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    subject_name text NOT NULL
);


ALTER TABLE public.subjects OWNER TO paransaccount;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: paransaccount
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO paransaccount;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    topic_name text NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE public.topics OWNER TO paransaccount;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: paransaccount
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO paransaccount;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    image_url character varying(255)
);


ALTER TABLE public.users OWNER TO paransaccount;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: paransaccount
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO paransaccount;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: question_feedback feedback_id; Type: DEFAULT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.question_feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.question_feedback_feedback_id_seq'::regclass);


--
-- Name: questions question_id; Type: DEFAULT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.questions ALTER COLUMN question_id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);


--
-- Name: resources resource_id; Type: DEFAULT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.resources ALTER COLUMN resource_id SET DEFAULT nextval('public.resources_resource_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: question_feedback; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.question_feedback (feedback_id, question_id, feedback, created_at) FROM stdin;
\.


--
-- Data for Name: question_topic_links; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.question_topic_links (question_id, topic_id) FROM stdin;
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.questions (question_id, user_id, question_text, created_at, tags, model_answer_explanation, keywords) FROM stdin;
1	1	Sample question text	2024-01-08 19:48:48.251013+00	\N	\N	\N
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.resources (resource_id, question_id, resource_type, resource_link, created_at, source_type) FROM stdin;
1	1	book	http://example.com/resource	2024-01-08 19:48:48.252529+00	\N
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.subjects (id, subject_name) FROM stdin;
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.topics (id, topic_name, subject_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.users (user_id, username, password, email, created_at, image_url) FROM stdin;
1	testuser	password	test@example.com	2024-01-08 19:48:48.249098+00	\N
2	psaoulik	$2b$10$LujyhiSCSgLf1KqsXP7JqeIRl1MUW9jIvkirotL/eW2cqDQMP2iLm	paranviraoulik@gmail.com	2024-02-07 18:12:21.814043+00	\N
3	satvir	$2b$10$H9y1yH7kFmoTOslQPvoUV.mRTzdf93Tq5Wbs3M/mPFqmNrRgBRUey	satvir@gmail.com	2024-02-07 18:16:17.669904+00	\N
\.


--
-- Name: question_feedback_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.question_feedback_feedback_id_seq', 1, false);


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 1, true);


--
-- Name: resources_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.resources_resource_id_seq', 1, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.subjects_id_seq', 1, false);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.topics_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- Name: question_feedback question_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.question_feedback
    ADD CONSTRAINT question_feedback_pkey PRIMARY KEY (feedback_id);


--
-- Name: question_topic_links question_topic_links_pkey; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.question_topic_links
    ADD CONSTRAINT question_topic_links_pkey PRIMARY KEY (question_id, topic_id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (question_id);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (resource_id);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: subjects subjects_subject_name_key; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key UNIQUE (subject_name);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: question_feedback question_feedback_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.question_feedback
    ADD CONSTRAINT question_feedback_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id);


--
-- Name: question_topic_links question_topic_links_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.question_topic_links
    ADD CONSTRAINT question_topic_links_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id);


--
-- Name: question_topic_links question_topic_links_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.question_topic_links
    ADD CONSTRAINT question_topic_links_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id);


--
-- Name: questions questions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: resources resources_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id);


--
-- Name: topics topics_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- PostgreSQL database dump complete
--


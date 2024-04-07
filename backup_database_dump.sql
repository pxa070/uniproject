PGDMP                      |        
   uniproject    16.2 (Postgres.app)    16.2 (Postgres.app)              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16390 
   uniproject    DATABASE     v   CREATE DATABASE uniproject WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE uniproject;
             
   paransaccount    false            �            1259    17558    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token character varying(255) NOT NULL,
    expiry timestamp with time zone NOT NULL
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap 
   paransaccount    false            �            1259    17557    password_reset_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.password_reset_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.password_reset_tokens_id_seq;
       public       
   paransaccount    false    231                       0    0    password_reset_tokens_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.password_reset_tokens_id_seq OWNED BY public.password_reset_tokens.id;
          public       
   paransaccount    false    230            �            1259    17513    question_feedback    TABLE     �   CREATE TABLE public.question_feedback (
    feedback_id integer NOT NULL,
    question_id integer NOT NULL,
    feedback text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE public.question_feedback;
       public         heap 
   paransaccount    false            �            1259    17512 !   question_feedback_feedback_id_seq    SEQUENCE     �   CREATE SEQUENCE public.question_feedback_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.question_feedback_feedback_id_seq;
       public       
   paransaccount    false    226                       0    0 !   question_feedback_feedback_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.question_feedback_feedback_id_seq OWNED BY public.question_feedback.feedback_id;
          public       
   paransaccount    false    225            �            1259    17542    question_topic_links    TABLE     n   CREATE TABLE public.question_topic_links (
    question_id integer NOT NULL,
    topic_id integer NOT NULL
);
 (   DROP TABLE public.question_topic_links;
       public         heap 
   paransaccount    false            �            1259    17478 	   questions    TABLE     �  CREATE TABLE public.questions (
    question_id integer NOT NULL,
    user_id integer NOT NULL,
    question_text text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    tags character varying(255)[],
    model_answer_explanation text,
    resources json,
    keywords character varying(255)[] DEFAULT ARRAY['test'::character varying(255), 'test'::character varying(255)],
    potential_topic text,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.questions;
       public         heap 
   paransaccount    false            �            1259    17477    questions_question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.questions_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.questions_question_id_seq;
       public       
   paransaccount    false    222                       0    0    questions_question_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.questions.question_id;
          public       
   paransaccount    false    221            �            1259    17528 	   resources    TABLE       CREATE TABLE public.resources (
    resource_id integer NOT NULL,
    question_id integer NOT NULL,
    resource_type character varying(50),
    resource_link text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    source_type character varying(50)
);
    DROP TABLE public.resources;
       public         heap 
   paransaccount    false            �            1259    17527    resources_resource_id_seq    SEQUENCE     �   CREATE SEQUENCE public.resources_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.resources_resource_id_seq;
       public       
   paransaccount    false    228                       0    0    resources_resource_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.resources_resource_id_seq OWNED BY public.resources.resource_id;
          public       
   paransaccount    false    227            �            1259    17438    subjects    TABLE     Z   CREATE TABLE public.subjects (
    id integer NOT NULL,
    subject_name text NOT NULL
);
    DROP TABLE public.subjects;
       public         heap 
   paransaccount    false            �            1259    17437    subjects_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.subjects_id_seq;
       public       
   paransaccount    false    216                       0    0    subjects_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;
          public       
   paransaccount    false    215            �            1259    17493    submissions    TABLE     D  CREATE TABLE public.submissions (
    id integer NOT NULL,
    "questionId" integer NOT NULL,
    "studentId" integer NOT NULL,
    "studentAnswer" text NOT NULL,
    "similarityIndex" double precision,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.submissions;
       public         heap 
   paransaccount    false            �            1259    17492    submissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.submissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.submissions_id_seq;
       public       
   paransaccount    false    224                       0    0    submissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.submissions_id_seq OWNED BY public.submissions.id;
          public       
   paransaccount    false    223            �            1259    17464    topics    TABLE     �   CREATE TABLE public.topics (
    id integer NOT NULL,
    topic_name text NOT NULL,
    subject_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.topics;
       public         heap 
   paransaccount    false            �            1259    17463 
   topics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.topics_id_seq;
       public       
   paransaccount    false    220                       0    0 
   topics_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;
          public       
   paransaccount    false    219            �            1259    17449    users    TABLE     s  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'user'::character varying NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    image_url character varying(255)
);
    DROP TABLE public.users;
       public         heap 
   paransaccount    false            �            1259    17448    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       
   paransaccount    false    218                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public       
   paransaccount    false    217            �
           2604    17561    password_reset_tokens id    DEFAULT     �   ALTER TABLE ONLY public.password_reset_tokens ALTER COLUMN id SET DEFAULT nextval('public.password_reset_tokens_id_seq'::regclass);
 G   ALTER TABLE public.password_reset_tokens ALTER COLUMN id DROP DEFAULT;
       public       
   paransaccount    false    230    231    231            �
           2604    17516    question_feedback feedback_id    DEFAULT     �   ALTER TABLE ONLY public.question_feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.question_feedback_feedback_id_seq'::regclass);
 L   ALTER TABLE public.question_feedback ALTER COLUMN feedback_id DROP DEFAULT;
       public       
   paransaccount    false    226    225    226            �
           2604    17481    questions question_id    DEFAULT     ~   ALTER TABLE ONLY public.questions ALTER COLUMN question_id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);
 D   ALTER TABLE public.questions ALTER COLUMN question_id DROP DEFAULT;
       public       
   paransaccount    false    222    221    222            �
           2604    17531    resources resource_id    DEFAULT     ~   ALTER TABLE ONLY public.resources ALTER COLUMN resource_id SET DEFAULT nextval('public.resources_resource_id_seq'::regclass);
 D   ALTER TABLE public.resources ALTER COLUMN resource_id DROP DEFAULT;
       public       
   paransaccount    false    228    227    228            �
           2604    17441    subjects id    DEFAULT     j   ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);
 :   ALTER TABLE public.subjects ALTER COLUMN id DROP DEFAULT;
       public       
   paransaccount    false    216    215    216            �
           2604    17496    submissions id    DEFAULT     p   ALTER TABLE ONLY public.submissions ALTER COLUMN id SET DEFAULT nextval('public.submissions_id_seq'::regclass);
 =   ALTER TABLE public.submissions ALTER COLUMN id DROP DEFAULT;
       public       
   paransaccount    false    224    223    224            �
           2604    17467 	   topics id    DEFAULT     f   ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);
 8   ALTER TABLE public.topics ALTER COLUMN id DROP DEFAULT;
       public       
   paransaccount    false    220    219    220            �
           2604    17452    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       
   paransaccount    false    218    217    218                      0    17558    password_reset_tokens 
   TABLE DATA           L   COPY public.password_reset_tokens (id, "userId", token, expiry) FROM stdin;
    public       
   paransaccount    false    231   (�                 0    17513    question_feedback 
   TABLE DATA           [   COPY public.question_feedback (feedback_id, question_id, feedback, created_at) FROM stdin;
    public       
   paransaccount    false    226   Ƿ                 0    17542    question_topic_links 
   TABLE DATA           E   COPY public.question_topic_links (question_id, topic_id) FROM stdin;
    public       
   paransaccount    false    229   �       �          0    17478 	   questions 
   TABLE DATA           �   COPY public.questions (question_id, user_id, question_text, created_at, tags, model_answer_explanation, resources, keywords, potential_topic, updated_at) FROM stdin;
    public       
   paransaccount    false    222   �                 0    17528 	   resources 
   TABLE DATA           t   COPY public.resources (resource_id, question_id, resource_type, resource_link, created_at, source_type) FROM stdin;
    public       
   paransaccount    false    228   <�       �          0    17438    subjects 
   TABLE DATA           4   COPY public.subjects (id, subject_name) FROM stdin;
    public       
   paransaccount    false    216   Y�                 0    17493    submissions 
   TABLE DATA           �   COPY public.submissions (id, "questionId", "studentId", "studentAnswer", "similarityIndex", "createdAt", "updatedAt") FROM stdin;
    public       
   paransaccount    false    224   v�       �          0    17464    topics 
   TABLE DATA           V   COPY public.topics (id, topic_name, subject_id, "createdAt", "updatedAt") FROM stdin;
    public       
   paransaccount    false    220   ��       �          0    17449    users 
   TABLE DATA           [   COPY public.users (id, username, role, password, email, created_at, image_url) FROM stdin;
    public       
   paransaccount    false    218   ��                  0    0    password_reset_tokens_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.password_reset_tokens_id_seq', 6, true);
          public       
   paransaccount    false    230                       0    0 !   question_feedback_feedback_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.question_feedback_feedback_id_seq', 1, false);
          public       
   paransaccount    false    225                       0    0    questions_question_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.questions_question_id_seq', 7, true);
          public       
   paransaccount    false    221                       0    0    resources_resource_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.resources_resource_id_seq', 1, false);
          public       
   paransaccount    false    227                       0    0    subjects_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.subjects_id_seq', 1, false);
          public       
   paransaccount    false    215                       0    0    submissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.submissions_id_seq', 1, false);
          public       
   paransaccount    false    223                       0    0 
   topics_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.topics_id_seq', 1, false);
          public       
   paransaccount    false    219                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public       
   paransaccount    false    217            _           2606    17563 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public         
   paransaccount    false    231            Y           2606    17521 (   question_feedback question_feedback_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.question_feedback
    ADD CONSTRAINT question_feedback_pkey PRIMARY KEY (feedback_id);
 R   ALTER TABLE ONLY public.question_feedback DROP CONSTRAINT question_feedback_pkey;
       public         
   paransaccount    false    226            ]           2606    17546 .   question_topic_links question_topic_links_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.question_topic_links
    ADD CONSTRAINT question_topic_links_pkey PRIMARY KEY (question_id, topic_id);
 X   ALTER TABLE ONLY public.question_topic_links DROP CONSTRAINT question_topic_links_pkey;
       public         
   paransaccount    false    229    229            U           2606    17486    questions questions_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (question_id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public         
   paransaccount    false    222            [           2606    17536    resources resources_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (resource_id);
 B   ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_pkey;
       public         
   paransaccount    false    228            �
           2606    17445    subjects subjects_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_pkey;
       public         
   paransaccount    false    216            �
           2606    20426 "   subjects subjects_subject_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key UNIQUE (subject_name);
 L   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key;
       public         
   paransaccount    false    216            �
           2606    20424 #   subjects subjects_subject_name_key1 
   CONSTRAINT     f   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key1 UNIQUE (subject_name);
 M   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key1;
       public         
   paransaccount    false    216            �
           2606    20416 $   subjects subjects_subject_name_key10 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key10 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key10;
       public         
   paransaccount    false    216            �
           2606    20414 $   subjects subjects_subject_name_key11 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key11 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key11;
       public         
   paransaccount    false    216            �
           2606    20438 $   subjects subjects_subject_name_key12 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key12 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key12;
       public         
   paransaccount    false    216            �
           2606    20440 $   subjects subjects_subject_name_key13 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key13 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key13;
       public         
   paransaccount    false    216            �
           2606    20412 $   subjects subjects_subject_name_key14 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key14 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key14;
       public         
   paransaccount    false    216            �
           2606    20410 $   subjects subjects_subject_name_key15 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key15 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key15;
       public         
   paransaccount    false    216            �
           2606    20442 $   subjects subjects_subject_name_key16 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key16 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key16;
       public         
   paransaccount    false    216            �
           2606    20444 $   subjects subjects_subject_name_key17 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key17 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key17;
       public         
   paransaccount    false    216            �
           2606    20408 $   subjects subjects_subject_name_key18 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key18 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key18;
       public         
   paransaccount    false    216            �
           2606    20446 $   subjects subjects_subject_name_key19 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key19 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key19;
       public         
   paransaccount    false    216            �
           2606    20428 #   subjects subjects_subject_name_key2 
   CONSTRAINT     f   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key2 UNIQUE (subject_name);
 M   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key2;
       public         
   paransaccount    false    216            �
           2606    20406 $   subjects subjects_subject_name_key20 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key20 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key20;
       public         
   paransaccount    false    216            �
           2606    20404 $   subjects subjects_subject_name_key21 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key21 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key21;
       public         
   paransaccount    false    216            �
           2606    20448 $   subjects subjects_subject_name_key22 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key22 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key22;
       public         
   paransaccount    false    216            �
           2606    20402 $   subjects subjects_subject_name_key23 
   CONSTRAINT     g   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key23 UNIQUE (subject_name);
 N   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key23;
       public         
   paransaccount    false    216            �
           2606    20430 #   subjects subjects_subject_name_key3 
   CONSTRAINT     f   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key3 UNIQUE (subject_name);
 M   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key3;
       public         
   paransaccount    false    216            �
           2606    20422 #   subjects subjects_subject_name_key4 
   CONSTRAINT     f   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key4 UNIQUE (subject_name);
 M   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key4;
       public         
   paransaccount    false    216            �
           2606    20432 #   subjects subjects_subject_name_key5 
   CONSTRAINT     f   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key5 UNIQUE (subject_name);
 M   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key5;
       public         
   paransaccount    false    216            �
           2606    20420 #   subjects subjects_subject_name_key6 
   CONSTRAINT     f   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key6 UNIQUE (subject_name);
 M   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key6;
       public         
   paransaccount    false    216            �
           2606    20418 #   subjects subjects_subject_name_key7 
   CONSTRAINT     f   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key7 UNIQUE (subject_name);
 M   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key7;
       public         
   paransaccount    false    216            �
           2606    20434 #   subjects subjects_subject_name_key8 
   CONSTRAINT     f   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key8 UNIQUE (subject_name);
 M   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key8;
       public         
   paransaccount    false    216            �
           2606    20436 #   subjects subjects_subject_name_key9 
   CONSTRAINT     f   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key9 UNIQUE (subject_name);
 M   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_subject_name_key9;
       public         
   paransaccount    false    216            W           2606    17501    submissions submissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.submissions DROP CONSTRAINT submissions_pkey;
       public         
   paransaccount    false    224            S           2606    17471    topics topics_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.topics DROP CONSTRAINT topics_pkey;
       public         
   paransaccount    false    220            �
           2606    20528    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public         
   paransaccount    false    218            �
           2606    20526    users users_email_key1 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key1;
       public         
   paransaccount    false    218            �
           2606    20518    users users_email_key10 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key10 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key10;
       public         
   paransaccount    false    218            �
           2606    20516    users users_email_key11 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key11 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key11;
       public         
   paransaccount    false    218            �
           2606    20540    users users_email_key12 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key12 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key12;
       public         
   paransaccount    false    218            �
           2606    20542    users users_email_key13 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key13 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key13;
       public         
   paransaccount    false    218            �
           2606    20514    users users_email_key14 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key14 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key14;
       public         
   paransaccount    false    218            �
           2606    20512    users users_email_key15 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key15 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key15;
       public         
   paransaccount    false    218                       2606    20544    users users_email_key16 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key16 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key16;
       public         
   paransaccount    false    218                       2606    20546    users users_email_key17 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key17 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key17;
       public         
   paransaccount    false    218                       2606    20510    users users_email_key18 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key18 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key18;
       public         
   paransaccount    false    218                       2606    20508    users users_email_key19 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key19 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key19;
       public         
   paransaccount    false    218            	           2606    20530    users users_email_key2 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key2;
       public         
   paransaccount    false    218                       2606    20548    users users_email_key20 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key20 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key20;
       public         
   paransaccount    false    218            
           2606    20506    users users_email_key21 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key21 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key21;
       public         
   paransaccount    false    218                       2606    20550    users users_email_key22 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key22 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key22;
       public         
   paransaccount    false    218                       2606    20504    users users_email_key23 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key23 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key23;
       public         
   paransaccount    false    218                       2606    20524    users users_email_key3 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key3;
       public         
   paransaccount    false    218                       2606    20532    users users_email_key4 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key4 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key4;
       public         
   paransaccount    false    218                       2606    20534    users users_email_key5 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key5 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key5;
       public         
   paransaccount    false    218                       2606    20522    users users_email_key6 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key6 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key6;
       public         
   paransaccount    false    218                       2606    20520    users users_email_key7 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key7 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key7;
       public         
   paransaccount    false    218                       2606    20536    users users_email_key8 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key8 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key8;
       public         
   paransaccount    false    218                       2606    20538    users users_email_key9 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key9 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key9;
       public         
   paransaccount    false    218            !           2606    17458    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         
   paransaccount    false    218            #           2606    20492    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public         
   paransaccount    false    218            %           2606    20490    users users_username_key1 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key1 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key1;
       public         
   paransaccount    false    218            '           2606    20482    users users_username_key10 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key10 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key10;
       public         
   paransaccount    false    218            )           2606    20480    users users_username_key11 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key11 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key11;
       public         
   paransaccount    false    218            +           2606    20462    users users_username_key12 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key12 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key12;
       public         
   paransaccount    false    218            -           2606    20464    users users_username_key13 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key13 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key13;
       public         
   paransaccount    false    218            /           2606    20478    users users_username_key14 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key14 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key14;
       public         
   paransaccount    false    218            1           2606    20476    users users_username_key15 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key15 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key15;
       public         
   paransaccount    false    218            3           2606    20466    users users_username_key16 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key16 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key16;
       public         
   paransaccount    false    218            5           2606    20468    users users_username_key17 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key17 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key17;
       public         
   paransaccount    false    218            7           2606    20474    users users_username_key18 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key18 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key18;
       public         
   paransaccount    false    218            9           2606    20470    users users_username_key19 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key19 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key19;
       public         
   paransaccount    false    218            ;           2606    20494    users users_username_key2 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key2 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key2;
       public         
   paransaccount    false    218            =           2606    20472    users users_username_key20 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key20 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key20;
       public         
   paransaccount    false    218            ?           2606    20454    users users_username_key21 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key21 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key21;
       public         
   paransaccount    false    218            A           2606    20498    users users_username_key22 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key22 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key22;
       public         
   paransaccount    false    218            C           2606    20452    users users_username_key23 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key23 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key23;
       public         
   paransaccount    false    218            E           2606    20488    users users_username_key3 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key3 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key3;
       public         
   paransaccount    false    218            G           2606    20496    users users_username_key4 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key4 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key4;
       public         
   paransaccount    false    218            I           2606    20456    users users_username_key5 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key5 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key5;
       public         
   paransaccount    false    218            K           2606    20486    users users_username_key6 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key6 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key6;
       public         
   paransaccount    false    218            M           2606    20484    users users_username_key7 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key7 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key7;
       public         
   paransaccount    false    218            O           2606    20458    users users_username_key8 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key8 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key8;
       public         
   paransaccount    false    218            Q           2606    20460    users users_username_key9 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key9 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key9;
       public         
   paransaccount    false    218            h           2606    20591 7   password_reset_tokens password_reset_tokens_userId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT "password_reset_tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT "password_reset_tokens_userId_fkey";
       public       
   paransaccount    false    231    218    3617            d           2606    20577 4   question_feedback question_feedback_question_id_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.question_feedback
    ADD CONSTRAINT question_feedback_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id);
 ^   ALTER TABLE ONLY public.question_feedback DROP CONSTRAINT question_feedback_question_id_fkey;
       public       
   paransaccount    false    222    226    3669            f           2606    17547 :   question_topic_links question_topic_links_question_id_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.question_topic_links
    ADD CONSTRAINT question_topic_links_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id);
 d   ALTER TABLE ONLY public.question_topic_links DROP CONSTRAINT question_topic_links_question_id_fkey;
       public       
   paransaccount    false    3669    229    222            g           2606    17552 7   question_topic_links question_topic_links_topic_id_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.question_topic_links
    ADD CONSTRAINT question_topic_links_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id);
 a   ALTER TABLE ONLY public.question_topic_links DROP CONSTRAINT question_topic_links_topic_id_fkey;
       public       
   paransaccount    false    3667    220    229            a           2606    20558     questions questions_user_id_fkey 
   FK CONSTRAINT        ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_user_id_fkey;
       public       
   paransaccount    false    3617    218    222            e           2606    20584 $   resources resources_question_id_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id);
 N   ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_question_id_fkey;
       public       
   paransaccount    false    222    228    3669            b           2606    20565 '   submissions submissions_questionId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT "submissions_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public.questions(question_id);
 S   ALTER TABLE ONLY public.submissions DROP CONSTRAINT "submissions_questionId_fkey";
       public       
   paransaccount    false    224    222    3669            c           2606    20570 &   submissions submissions_studentId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT "submissions_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.submissions DROP CONSTRAINT "submissions_studentId_fkey";
       public       
   paransaccount    false    218    3617    224            `           2606    20553    topics topics_subject_id_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);
 G   ALTER TABLE ONLY public.topics DROP CONSTRAINT topics_subject_id_fkey;
       public       
   paransaccount    false    216    220    3519               �   x�eͻ��0Eј�bs�9�T-NB�K�w��<i��4��.%�*���,��aU�$���
���9�#� �>���2�T��$�m��Kw8������c��}+�6`�����ĢA�B?��:X�q>����h0q         
   x������ � �         
   x������ � �      �      x��\��F��<~����FHj�ь=�r�g����8����z�Ȗ��M�ɑ�`�<�~��-��>J��~U�I������;Nf$5����~U��Ҍ��G��Ƶ���+!��Wr���y"m;���g�y��S��JN����
Y�DTF�*��6�L����x4���TO/����h�����ћ�G{k|��o�a$^�2���jy�1��z��i&J(iu��K���R�` E�.��kR&Ʉ�u�C��s�%��RY�`���y�b�jћ|��R�A�%M͂�����XLN#�V�h�@�j�%��b7�Ԧ�nP�,��ت��.a�7�I$^�g2���±�EQ��@Y=��R�x�(Ve%u�W�N�(R��m C�s!�Q�U؊��.I:�
o���͋���t�N�<^B�7��#��M�$�c�-Ͻ�e&��2.�TC)�@��bV�r(�%�uF6�����@,����R%Y&���s�#���f�c���U���b���Psy�D�3]a���G�G`�4N�sЃ�F�~��8Wx&�,�w[&s�L��������U��t�*K�������%��0D��	G�1)�FQ��
x��Ui���VkV�����m8�����*��`�X,��I+G�&��
Z[��G��ƾOo���킆`���R�OTU�~j���Xmؒ�gt��Ϸሟ�Pz���pxa �2��(`t%:M����3���
�jN���"�唇�+]C8�
ɕ7�~�
1:Pv(��xQ�E�N�%۔�͵�Hi��#����S� xj�y#u<�U"�#2ո�-�J��dmŽJgp<�LXg�-�=g��p�l�����ͭ-�o���4l�ĥ<��Y0�D���v<_W؀ �	B��؛9w*��Htź��K��!�V�AY����`1��[H���mg}k�o9�e�x�q�a���dC����U����] �� �b/nP���G�c4�G3:��2&e�)�P��SW�xM��[��/p�}��^�{�C&V�7�D�rP[�5BX#�,.&`o���Lw�·M|c�T��i�n���!�� �jd��$QJ�
1�s'b�4��H��5[�5K1���Q�S���1\V�� ��68\!��?�V�u�}]Q����"hY �*�g���"ў�!w=� �^ ���k��8��E0����rU
�)����^�m⹹��{,!SkV��0�OԍJMA������&�O�	��'�����}Kp����4`�:" �	�/��x��25���p7,�I[7�[�r)Y����ڇ|�*�<iCA�]�$aq��&ߎ�$�^Wx_�����n��� ���pb�y�N4tWF	�+�����<��5ڮZ��Y�(4	�[����_��:��|��%[���xj���RN+���؞)N;��$7vC�PH��裪��D�_rx69u&�A�DO�Ȯ�	Keӂ�M��Z�nB�E�I�{E�r��O�
����3
j���_.p2�	x+���z�Hg����:9:9"��@B��$�uN��:P=�z:�K�-0	$��L�R9Ν}�[�����b4�·�=;~�+�H��
��N���s��db^#:�++}�G��Q��eN.75�"/)*��ڟ�"����
υ�bG9�_�����P�4��& ��e9��L����t�zd�e���\-�.�/��%��MPZR�A��Gj
��	���,3L�-d��<)}DF)J�>&�R��qHl���̛�����+7�IiF|&p�
M�#�� ~�g��������yd��@�?�
X��!o�U\�ݠЍڈe�;%��*׊��YV���+؏��:��T�$r߫��̄���L��B�WC_}���)��
f�Ϭ�|���"G�.M!�c�W�1D�ݷ*��	|
<�����/u	���H^E���~0�b�&&�F�%�;2����p;��i��
A.�m!cǺH|�7�)�?37}����(�ȁ�	�iJ�=O(7UD�S��k�_�7�|fB�8�v<,�v"��(}����_Q��6>�X�1K�Q���N�nH���Qi��2�9*��Fq�" �<g�NF{H���D�9��V�/
�i:�+�)���#�=�`��<�d���e8ׄ@̲�P<��ɀ�̭>:��:1�7�?8t�K:J�Z�JD6������l0<�̄$�\�x�l���ĕ�Bfx�*d2=�W�r����5�&g����"KS�P�w�z����ٌ��,���HA�m$����G������¦ޯ��)�#�1�O�H�>���
R����u��ǈ�2c���!g� "�|4
�K��V��b�G'����sx�2$�e>o�abP�U�U*�Q"�(3�̲	�L�w���i���=t^�j�A��w1�2�Si���M�� �t��Ǌ�-U�(�M�a�
pFN�7Z-���,�'JT�
��V ҈`*q@7U���\Y{{�	_���VI�W�O�w�˓�A٭�*4:Z�T�<���T�Ref��"q�b�M`�cޛ�nt`䪘t�BU��0�2���55 y���&���v�v�S|�9"�o8�O���Ѽ�6t�JM��s��u���o���i �
E�ª�ϥy�K͝���.DD�)Q'5���NTB Z-�=]z�Q�5��]�~E��j��I��WJRY�7䗸�����S�� l�6�4�D�}��x��y�N<�}�KdK.�m>!�%�!�Š�$��cDϖjLZkP�Rl��-g�F}r�B4?Q&�H�O0����D$5�&��S���
��Ӄ�����,:��)���a|2kj.�~?�����f2ܸ42j�]��-I\
�����	UW��4�����YIRʽ�Q˫NG�R��&�rLwm(�ҁ(�ҁ(�ҁ(�ҁ(���	��'-�N����>�3�������8:�>��c�,W��m7%7�qK��_C|����.�_�J��PQ�F���ޡAm���z>�{HOa�
�.y�N��/�SRL�i�J���T�5ݡ%]�2q/��B�"X�o�tAJ���z�~��#�!��
*/�}���������:�os��Ӣ���)�_]:*)��e�x�V�)6��K��݇������q�h�+���Η�f����vrK!�]�����<O�ݖ|	�i��ޥI"�^���@�2�ӠIU_ێ�:Q�tZ!عȒdf�!d��ZwS.n!��q�RPSv��U.���0�Xx%-�YP����7�W�&s�����D5��v۸�_�6�%����<q��}������M7��CӞ�N%M����C��i��4zh=4��F�_�=�cCw�?�it�V�:�¡+��1QH�w����5*��l�������bx������|�.[S O
�uw��W�����1��I�*���k�}�s���S]�~]䃚��P�#Qd�"��9b�X�q�J_/T��	�'
��ۄ��
q�2¬Of&[�\o�g�
�NP|�u��Ɛ�K�l'K͍�A���0Ϗ�����Cw�;�=�gN#���(Pn'��˄��"ݵ���C5xQ�>� �V��{<(,g�r�6lC�֓)q�Q��\�� �ҝ*��E{�q)*�Kp:>+�7�B� �j��L������6*��
�L�6��w�^�ۥ���v��u#��~=g&�����r]�U0�I��EK'�TcL�����i��t|2~0<��*l'u�������T�]�`F��k�����a"vg�4��iX�R�GO��vU,L���+_�4��#�U��iS�f��h>c#\O�����+l����8�-*����n{��W��]9��X����7���2p�4j(ˌ��*漏�����=���ܟ���y�n��D�k>S�.&Q�
&�NI�Pn7@(m�}��v1����Q2��e<�ZM�����"}��T�%/B� /�"t�N�V!�l�����翰�wSXQq����4����=�c��Ðo�W�_�SDtHU�w�P��p�
�Q�J�cB���g�^a��p<|p~�) &  _׹?�������?%j��c���(�40�<�
�$1qͥ�LUp��hy��}���jhH��{�c���c���Y�a�Y^�u
�̓H^��Ӊ�5�p8�F�
>}�
3��/�`���0?8>;9��D�{ȗ�2=���<�L��1"0�'��y���7���"���[Qs,OUE��L����G2���m�b�r��Z����ht>x��"����+p���nء;�an����%�̫�(�p��˗,mǕ�ӄ�)��b2�P2��C1�F1ծ��ɫgO;L�Lm��^7�;��X|/肛*f�l��LC�da�h#j���h���X�NP}�=6�.j�kV��#g#Fk�n�ܱC�+���kS^��4g,�v���{o�	�6�.{Gra5~�����d0+e1��B� ��Ȧ1�vT��Q�9@����b��d
_I����h���ky�� ����2����V$����V,�O�$l�������"�vB!���Y�f�}iMY}aR�	�-:�,WB"܍H��@�	5u>���l����P�ݩ�;_<����A9�b��ݬ��E;����<X�F}��J��-S
�[ae��z*��]�1؍r�<;>�m��^��K�/]��.WYk!�i�7{ѩ�v�����m���XC��J�P��W�,H��B��]�U.
Z�
Ճ�+9����	zog�}�x����JG'�㋓�h|�IiC>uZ"e�b�z�-=r+_��9�:7��V��87�4�֨�����{��3%��s�Ӎ������L���w�+����Jd�����L���u�i] g����J��1�s��\��X_d�)�^��ρ���2�{"�i��:�NvF@�&��u�3ߖ�E	i�������Y�N�XWֹ_x'i�Ɲ�to��é}���s`>����̌�!ק�NH�:�;)�x�����=
_OJ΅dB鞨�����o��_V�vH��r�������K7
�e:�*M���0����I0�sǛ+X&1z7�t�T`6�?�}�c-ٷ�q���x�����y���|�֛�֭[�
T$�         
   x������ � �      �   
   x������ � �         
   x������ � �      �   
   x������ � �      �   P  x�}��N�@�u�,��s;�)�E*m�)�e���^Ԉ1���'�=D+kQ�T�4UǕ�4�&�&���
�X�g\`��A�";t�9�\v�c]/��"�=uS��J+E%�>;I&d�6E��ؤ-|�� �!ءos��a��cn���2�9L!�mm|�.Or�����7��8=����-��Ŧ��KF��K�I�"X` �۴�NPeZ��6ʪx�i�f"�[`�I�)�	C�e�S-QU-�+��\U��ϻ|��U�o�������}/��� �I���4�T`w��Z����@l9&C�u������@�v�t]6.��     
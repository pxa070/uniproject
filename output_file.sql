--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Postgres.app)
-- Dumped by pg_dump version 16.2 (Postgres.app)

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
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.password_reset_tokens (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token character varying(255) NOT NULL,
    expiry timestamp with time zone NOT NULL
);


ALTER TABLE public.password_reset_tokens OWNER TO paransaccount;

--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: paransaccount
--

CREATE SEQUENCE public.password_reset_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.password_reset_tokens_id_seq OWNER TO paransaccount;

--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.password_reset_tokens_id_seq OWNED BY public.password_reset_tokens.id;


--
-- Name: question_feedback; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.question_feedback (
    feedback_id integer NOT NULL,
    question_id integer NOT NULL,
    feedback text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
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


ALTER SEQUENCE public.question_feedback_feedback_id_seq OWNER TO paransaccount;

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


ALTER SEQUENCE public.questions_question_id_seq OWNER TO paransaccount;

--
-- Name: questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.questions.question_id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.resources (
    resource_id integer NOT NULL,
    question_id integer NOT NULL,
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


ALTER SEQUENCE public.resources_resource_id_seq OWNER TO paransaccount;

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


ALTER SEQUENCE public.subjects_id_seq OWNER TO paransaccount;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- Name: submissions; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.submissions (
    id integer NOT NULL,
    "questionId" integer NOT NULL,
    "studentId" integer NOT NULL,
    "studentAnswer" text NOT NULL,
    "similarityIndex" double precision,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.submissions OWNER TO paransaccount;

--
-- Name: submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: paransaccount
--

CREATE SEQUENCE public.submissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submissions_id_seq OWNER TO paransaccount;

--
-- Name: submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.submissions_id_seq OWNED BY public.submissions.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    topic_name text NOT NULL,
    subject_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
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


ALTER SEQUENCE public.topics_id_seq OWNER TO paransaccount;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: paransaccount
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'user'::character varying NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    image_url character varying(255)
);


ALTER TABLE public.users OWNER TO paransaccount;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: paransaccount
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO paransaccount;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paransaccount
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: password_reset_tokens id; Type: DEFAULT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.password_reset_tokens ALTER COLUMN id SET DEFAULT nextval('public.password_reset_tokens_id_seq'::regclass);


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
-- Name: submissions id; Type: DEFAULT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.submissions ALTER COLUMN id SET DEFAULT nextval('public.submissions_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.password_reset_tokens (id, "userId", token, expiry) FROM stdin;
6	3	d10f2350d17c60337ed4e38713b6b1d2c8821142	2024-04-05 17:52:05.356+01
7	3	8be1104aa895a6c300ef60a4e8de064871e95202	2024-04-08 01:41:28.494+01
8	3	4c5548d2e526dd03538477f09d8ca1f31c5d4f5c	2024-04-14 20:54:44.168+01
\.


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

COPY public.questions (question_id, user_id, question_text, created_at, tags, model_answer_explanation, resources, keywords, potential_topic, updated_at) FROM stdin;
3	3	What are the primary causes of climate change, and what can be done to address them?	2024-04-05 17:31:22.917+01	\N	The primary causes of climate change are greenhouse gas emissions from human activities like burning fossil fuels, deforestation, and industrial processes. To address climate change, we can reduce our carbon footprint by transitioning to renewable energy sources, increasing energy efficiency, and promoting sustainable land use practices. Additionally, international cooperation and policies to limit greenhouse gas emissions are crucial in mitigating climate change.	[{"link":"https://www.un.org/en/climatechange/science/causes-effects-climate-change","description":"As greenhouse gas emissions blanket the Earth, they trap the sun's heat. This leads to global warming and climate change. The world is now warming faster than ..."},{"link":"https://climate.ec.europa.eu/climate-change/causes-climate-change_en","description":"What we do · Our Director General · Climate change ... The main driver of climate change is the greenhouse effect. ... it from leaking back into space and causing ..."},{"link":"https://www.epa.gov/climatechange-science/causes-climate-change","description":"Apr 25, 2023 ... However, they do not explain the warming that we have observed over the last century. Human Versus Natural Causes. It is unequivocal that human ..."},{"link":"https://www.nrdc.org/stories/what-are-causes-climate-change","description":"Sep 13, 2022 ... And we must honestly address its origins—even though it can sometimes be difficult, or even uncomfortable, to do so. Human civilization has made ..."},{"link":"https://www.pewresearch.org/science/2016/10/04/the-politics-of-climate/","description":"Oct 4, 2016 ... ... might be done to address any climate impacts. ... it comes to scientists' understanding about ways to address climate change. ... causes of climate ..."},{"link":"https://science.nasa.gov/climate-change/causes/","description":"The greenhouse effect is essential to life on Earth, but human-made emissions in the atmosphere are trapping and slowing heat loss to space."},{"link":"https://www.pewresearch.org/science/2023/08/09/why-some-americans-do-not-see-urgency-on-climate-change/","description":"Aug 9, 2023 ... To better understand the perspectives of those who see less urgency to address climate change, Pew Research Center conducted in-depth interviews ..."},{"link":"https://www.nature.org/en-us/what-we-do/our-priorities/tackle-climate-change/climate-change-stories/climate-change-frequently-asked-questions/","description":"Nov 13, 2023 ... ... climate change and how we can solve it together. December 09, 2018 ... causes it and what to do to stop it. It will take courage, ambition, and a ..."},{"link":"https://press.un.org/en/2021/sc14445.doc.htm","description":"Feb 23, 2021 ... The poorest — those with the least security — are certain to suffer. “Our duty right now is surely to do all we can to help those in the most ..."},{"link":"https://www.canada.ca/en/environment-climate-change/services/climate-change/causes.html","description":"Mar 28, 2019 ... What can be done about climate change? Carbon dioxide is the main cause of human-induced global warming and associated climate change. It is ..."}]	{the,primari,caus,of,climat,chang,and,can,be,done,to,address}	Geography\n	2024-04-05 17:31:22.917+01
5	4	Discuss the advantages and disadvantages of using NoSQL databases compared to relational databases.	2024-04-06 13:06:40.942+01	\N	Advantages of NoSQL databases:\n1. Scalability: NoSQL databases allow for horizontal scaling, making it easy to handle large amounts of data.\n2. Flexibility: NoSQL databases can store various types of data, such as structured, semi-structured, and unstructured data.\n3. Performance: NoSQL databases are often faster at handling read and write operations due to their distributed nature.\n4. Cost-effectiveness: NoSQL databases are generally more cost-effective to scale compared to relational databases.\n\nDisadvantages of NoSQL databases:\n1. Lacks ACID transactions: NoSQL databases do not always guarantee ACID (Atomicity, Consistency, Isolation, Durability) properties, which can lead to data inconsistency.\n2. Limited querying capabilities: NoSQL databases may not support complex queries as well as relational databases, making it challenging for some use cases.\n3. Lack of standardization: NoSQL databases lack a standardized query language like SQL, making it harder for developers to work with them.\n4. Learning curve: NoSQL databases may require developers to learn new concepts and tools compared to relational databases, which can impact development time and resources.	[{"link":"https://www.boltic.io/blog/relational-databases-vs-nosql","description":"Relational databases are better able to handle complex queries and join, while NoSQL databases are better suited for storing data in the same form as it will be ..."},{"link":"https://www.datastax.com/blog/sql-vs-nosql-pros-cons","description":"Sep 29, 2021 ... As a result, NoSQL databases are more stable and resilient, with continuous availability and zero downtime. Query speed. Since NoSQL databases ..."},{"link":"https://www.mongodb.com/compare/relational-vs-non-relational-databases","description":"When to use a non-relational database. As discussed, there are many types of non-relational databases, each having their own advantages and disadvantages."},{"link":"https://www.reddit.com/r/Database/comments/rtnnyq/what_are_the_advantages_of_using_nosql_databases/","description":"Jan 1, 2022 ... In a relational database, you write the data into the DB the way it can logically be reasoned about. With a relational DB, you're storing your ..."},{"link":"https://www.adservio.fr/post/what-are-the-pros-and-cons-of-nosql","description":"Queries are less flexible. ... NoSQL databases are more flexible when storing a wide variety of data structures, but they lack the complex query functionality ..."},{"link":"https://hevodata.com/learn/relational-database-vs-nosql/","description":"May 6, 2022 ... NoSQL databases have no single point of failure. Relational databases have a single point of failure with failover. NoSQL databases can handle ..."},{"link":"https://www.dataversity.net/nosql-databases-advantages-and-disadvantages/","description":"Nov 17, 2022 ... NoSQL databases also provide faster development. Frequent updates to the data structure in a “relational database” will slow down the research."},{"link":"https://aloa.co/blog/relational-vs-non-relational-database-pros-cons","description":"Relational databases can provide strong data consistency and integrity but may be slower in performance for certain use cases. Non-relational databases can ..."},{"link":"https://webandcrafts.com/blog/sql-vs-nosql","description":"Jan 15, 2022 ... SQL vs NoSQL databases - a comparison guide. Know the major differences between the two databases, the advantages and disadvantages and when ..."},{"link":"https://www.quora.com/What-are-the-advantages-and-disadvantages-of-using-both-relational-and-non-relational-databases-NoSQL","description":"Sep 14, 2022 ... ... disadvantages of relational databases compared to non-relational ... pros and cons of using NoSQL databases instead of RDBMS for large data ..."}]	{discuss,the,advantag,and,disadvantag,of,us,nosql,databas,compar,to,relat,databas}	Computer Science	2024-04-06 13:06:40.942+01
8	4	How do I implement pagination in a JavaScript application?	2024-04-10 16:45:07.453+01	\N	You can implement pagination in a JavaScript application by dividing your content into pages and displaying only a certain number of items per page. Use a library like "pagination.js" or implement your own logic to handle page navigation, such as updating the displayed content based on the selected page number.	[{"link":"https://stackoverflow.com/questions/25434813/simple-pagination-in-javascript","description":"Aug 21, 2014 ... Since if you have a huge dataset, it would mean you need to download all the data before your page loads. Better to implement server-side ..."},{"link":"https://www.turing.com/kb/implementing-javascript-pagination","description":"Pagination in JavaScript refers to the process of dividing a large set of data into smaller, more manageable pieces called pages. This makes it easier for users ..."},{"link":"https://medium.com/geekculture/building-a-javascript-pagination-as-simple-as-possible-a9c32dbf4ac1","description":"May 13, 2021 ... Building a JavaScript Pagination As Simple as Possible · const listArray = [] for (let i=0; i<40; i++) { · const numberOfItems = listArray.length"},{"link":"https://webdesign.tutsplus.com/pagination-with-vanilla-javascript--cms-41896t","description":"Jun 28, 2022 ... 3. Pagination Logic with JavaScript ; 2, const paginatedList = document.getElementById(\\"paginated-list\\"); ; 3, const listItems = paginatedList."},{"link":"https://medium.com/@akhilanand.ak01/implementing-server-side-pagination-in-react-with-node-js-and-express-417d1c480630","description":"May 19, 2023 ... Server-side pagination is a common requirement when dealing with large datasets in web applications. It allows us to fetch and display data ..."},{"link":"https://answers.laserfiche.com/questions/52229/Help-Implementing-Form-Pagination","description":"Mar 11, 2014 ... You'll want to use the CSS and JavaScript from that example and modify it a bit to fit the HTML structure of your form. For example, you'll use ..."},{"link":"https://www.sitepoint.com/simple-pagination-html-css-javascript/","description":"Aug 24, 2023 ... Implementing the Pagination Functionality with JavaScript · Creating a function that divides the table into pages · Working out the showPage() ..."},{"link":"https://docs.amplify.aws/javascript/build-a-backend/graphqlapi/query-data/","description":"Implement pagination in your GraphQL API. This brief walkthrough provides additional step-by-step guidance for implementing pagination. When working with a ..."},{"link":"https://forums.meteor.com/t/how-to-implement-pagination-with-two-different-colletions/60026","description":"May 25, 2023 ... So, we currently need to implement a list that will have entries that will come from two different collections. This list needs to be paginated, ..."},{"link":"https://somoye-ayotunde.medium.com/frontend-pagination-using-javascript-1467445c6833","description":"Jan 18, 2021 ... Hopefully, you can now implement frontend pagination of any sort irrespective of the framework. Here is the application in production, and this ..."}]	{how,do,implement,pagin,in,a,javascript,applic}	Biology	2024-04-10 16:45:07.453+01
9	4	Discuss the advantages and disadvantages of using NoSQL databases compared to relational databases.	2024-04-10 22:14:30.231+01	\N	Advantages of NoSQL databases:\n1. Scalability: NoSQL databases can easily scale out to handle large amounts of data and traffic.\n2. Flexibility: NoSQL databases can handle different types of data formats, making them more versatile.\n3. Performance: NoSQL databases can offer better performance for certain use cases, especially when dealing with unstructured data.\n4. Schema-less design: NoSQL databases do not require a fixed schema, allowing for more flexibility in data storage.\n\nDisadvantages of NoSQL databases:\n1. Lack of consistency: NoSQL databases often sacrifice consistency for availability and partition tolerance, which can lead to data inconsistency.\n2. Limited query functionality: NoSQL databases may have limited query capabilities compared to relational databases, making it harder to perform complex operations.\n3. Less mature ecosystem: NoSQL databases may have less robust tools and community support compared to relational databases, which can make development and maintenance more challenging.\n4. Data normalization challenges: Modeling data in a NoSQL database can be more complex compared to a relational database, especially when dealing with complex relationships between data entities.	[{"link":"https://www.boltic.io/blog/relational-databases-vs-nosql","description":"Relational databases are better able to handle complex queries and join, while NoSQL databases are better suited for storing data in the same form as it will be ..."},{"link":"https://www.reddit.com/r/Database/comments/rtnnyq/what_are_the_advantages_of_using_nosql_databases/","description":"Jan 1, 2022 ... In a relational database, you write the data into the DB the way it can logically be reasoned about. With a relational DB, you're storing your ..."},{"link":"https://www.mongodb.com/compare/relational-vs-non-relational-databases","description":"When to use a non-relational database. As discussed, there are many types of non-relational databases, each having their own advantages and disadvantages."},{"link":"https://www.datastax.com/blog/sql-vs-nosql-pros-cons","description":"Sep 29, 2021 ... Which database suits you best? SQL and NoSQL each have specific strengths. This blog analyzes SQL vs. NoSQL, looking at the pros and cons of ..."},{"link":"https://www.adservio.fr/post/what-are-the-pros-and-cons-of-nosql","description":"Queries are less flexible. ... NoSQL databases are more flexible when storing a wide variety of data structures, but they lack the complex query functionality ..."},{"link":"https://hevodata.com/learn/relational-database-vs-nosql/","description":"May 6, 2022 ... NoSQL databases have no single point of failure. Relational databases have a single point of failure with failover. NoSQL databases can handle ..."},{"link":"https://www.dataversity.net/nosql-databases-advantages-and-disadvantages/","description":"Nov 17, 2022 ... NoSQL databases also provide faster development. Frequent updates to the data structure in a “relational database” will slow down the research."},{"link":"https://aloa.co/blog/relational-vs-non-relational-database-pros-cons","description":"Relational databases can provide strong data consistency and integrity but may be slower in performance for certain use cases. Non-relational databases can ..."},{"link":"https://webandcrafts.com/blog/sql-vs-nosql","description":"Jan 15, 2022 ... SQL vs NoSQL databases - a comparison guide. Know the major differences between the two databases, the advantages and disadvantages and when ..."},{"link":"https://stackoverflow.com/questions/4160732/nosql-vs-relational-database","description":"Nov 12, 2010 ... The biggest advantage of NoSQL over RDBMS is Scalability. NoSQL databases can easily scale-out to many nodes, but for RDBMS it is very hard."}]	{discuss,the,advantag,and,disadvantag,of,us,nosql,databas,compar,to,relat,databas}	Biology	2024-04-10 22:14:30.231+01
10	4	What is Photosynthesis?	2024-04-13 22:01:04.243+01	\N	Photosynthesis is the process by which green plants, algae, and some bacteria convert light energy, usually from the sun, into chemical energy stored in glucose or other organic compounds. This process involves the absorption of carbon dioxide and the release of oxygen as a byproduct.	[{"link":"https://education.nationalgeographic.org/resource/photosynthesis/","description":"Photosynthesis is the process by which plants use sunlight, water, and carbon dioxide to create oxygen and energy in the form of sugar."},{"link":"https://ssec.si.edu/stemvisions-blog/what-photosynthesis","description":"Apr 12, 2017 ... Rather, plants use sunlight, water, and the gases in the air to make glucose, which is a form of sugar that plants need to survive. This process ..."},{"link":"https://www.britannica.com/science/photosynthesis","description":"Mar 1, 2024 ... Photosynthesis, the process by which green plants and certain other organisms transform light energy into chemical energy."},{"link":"https://en.wikipedia.org/wiki/Photosynthesis","description":"Photosynthesis ... Photosynthesis (/ˌfoʊtəˈsɪnθəsɪs/ FOH-tə-SINTH-ə-sis) is a system of biological processes by which photosynthetic organisms, such as most ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3729760/","description":"CO2 diffusion into leaves is restricted such that during photosynthesis, the CO2 partial pressure inside chloroplasts is less than in the surrounding atmosphere ..."},{"link":"https://www.usda.gov/media/blog/2015/03/17/power-one-tree-very-air-we-breathe","description":"Mar 17, 2015 ... Through a process called photosynthesis, leaves pull in carbon dioxide and water and use the energy of the sun to convert this into chemical ..."},{"link":"https://www.khanacademy.org/science/ap-biology/cellular-energetics/photosynthesis/a/intro-to-photosynthesis","description":"Jul 17, 2016 ... Photosynthesis is the process in which light energy is converted to chemical energy in the form of sugars. In a process driven by light energy, ..."},{"link":"https://www.livescience.com/51720-photosynthesis.html","description":"Nov 3, 2022 ... Photosynthesis is the process plants, algae and some bacteria use to turn sunlight, carbon dioxide and water into sugar and oxygen."},{"link":"https://aglab.ars.usda.gov/explore-learn/what-is-photosynthesis","description":"Learn about photosynthesis and how plants use it to feed the planet."},{"link":"https://www.nature.com/scitable/topicpage/photosynthetic-cells-14025371/","description":"The chloroplast is involved in both stages of photosynthesis. The light reactions take place in the thylakoid. There, water (H2O) is oxidized, and oxygen (O2) ..."}]	{photosynthesi}	Biology	2024-04-13 22:01:04.243+01
11	4	Explain the concept of promises in JavaScript.	2024-04-14 09:39:23.46+01	\N	Promises in JavaScript are objects that represent the eventual completion or failure of an asynchronous operation. They allow you to write cleaner asynchronous code by providing a more structured way to handle asynchronous tasks. Promises have three states: pending (initial state), fulfilled (success), and rejected (failure). You can chain promises together to execute asynchronous operations in a sequential manner.	[{"link":"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise","description":"Nov 29, 2023 ... A Promise is a proxy for a value not necessarily known when the promise is created. It allows you to associate handlers with an asynchronous ..."},{"link":"https://www.reddit.com/r/learnprogramming/comments/u3aovt/explain_promises_in_javascript_to_me_like_im_a_5/","description":"Apr 14, 2022 ... A promise is a container that promises to eventually have a value. You can use .then to tell it what to do once it gets a value."},{"link":"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises","description":"Mar 21, 2024 ... Essentially, a promise is a returned object to which you attach callbacks, instead of passing callbacks into a function. Imagine a function, ..."},{"link":"https://www.w3schools.com/js/js_promise.asp","description":"A JavaScript Promise object can be: ... The Promise object supports two properties: state and result. While a Promise object is \\"pending\\" (working), the result is ..."},{"link":"https://www.freecodecamp.org/news/guide-to-javascript-promises/","description":"Jun 13, 2023 ... A promise is an assurance or guarantee that something will happen in the future. A person can promise another person a specific outcome or ..."},{"link":"https://stackoverflow.com/questions/39458201/understanding-javascript-promise-object","description":"Sep 12, 2016 ... Summary: A promise in Javascript is an object which represent the eventual completion or failure of an asynchronous operation."},{"link":"https://www.freecodecamp.org/news/what-is-promise-in-javascript-for-beginners/","description":"Aug 16, 2021 ... A promise is simply a placeholder for an asynchronous task which is yet to be completed. When you define a promise object in your script, ..."},{"link":"https://www.geeksforgeeks.org/javascript-promise/","description":"Jan 4, 2024 ... JavaScript Promise are easy to manage when dealing with multiple asynchronous operations where callbacks can create callback hell leading to ..."},{"link":"https://blog.greenroots.info/javascript-promises-explain-like-i-am-five","description":"Jul 30, 2021 ... A promise is a JavaScript object that allows you to make asynchronous(aka async) calls. It produces a value when the async operation completes ..."},{"link":"https://www.freecodecamp.org/news/javascript-promises-explained/","description":"Jan 15, 2020 ... What is a promise in JavaScript? JavaScript is single threaded, meaning that two bits of script cannot run at the same time; ..."}]	{explain,the,concept,of,promis,in,javascript}	Computer Science	2024-04-14 09:39:23.46+01
12	6	Intensive Care Units in hospitals are for patients in need of round the clock monitoring and support.\nComputerised systems can be used to monitor patients’ vital signs (temperature, heart rate, blood pressure and\nbreathing). They can then alert medical professionals to any significant changes.\nThese systems usually run on an embedded, real-time, operating system.\n(i) State what is meant by the term real-time.	2024-04-15 01:46:51.435+01	\N	Real-time means that a system processes data promptly and provides outputs immediately without any noticeable delay.	[{"link":"https://www.ocr.org.uk/images/170855-unit-h046-1-computing-principles-sample-assessment-materials.pdf","description":"support. Computerised systems can be used to monitor patients' vital signs (temperature, heart rate, blood pressure and breathing). They can then alert ..."},{"link":"https://quizlet.com/gb/683343832/computing-flash-cards/","description":"Computerised systems can be used to monitor patients' vital signs (temperature, heart rate, blood pressure and breathing). They can then alert medical ..."},{"link":"https://pmt.physicsandmathstutor.com/download/Computer-Science/A-level/Topic-Qs/OCR/1.2-Software-and-Software-Development/1.2.1%20Systems%20Software.pdf","description":"Computerised systems can be used to monitor patients' vital signs (temperature, heart rate, blood pressure and breathing). They can then alert medical ..."},{"link":"https://quizlet.com/495858285/operating-system-questions-flash-cards/","description":"Computerised systems can be used to monitor patients' vital signs (temperature, heart rate, blood pressure and breathing). They can then alert medical ..."},{"link":"https://mrjhubbardcs.files.wordpress.com/2018/05/ocr-h446-1-5-mark-scheme1.pdf","description":"Computerised systems can be used to monitor patients' vital signs (temperature, heart rate, blood pressure and breathing). They can then alert medical ..."},{"link":"https://a-level-study.co.uk/wp-content/uploads/2020/09/170855-unit-h046-1-computing-principles-sample-assessment-materials-qp.pdf","description":"support. Computerised systems can be used to monitor patients' vital signs (temperature, heart rate, blood pressure and breathing). They can then alert ..."},{"link":"https://www.researchgate.net/publication/230638387_Critical_care_The_eight_vital_signs_of_patient_monitoring","description":"PDF | Nurses have traditionally relied on five vital signs to assess their patients: temperature, pulse, blood pressure, respiratory rate and oxygen."},{"link":"https://slideplayer.com/slide/12926933/","description":"Computerised systems can be used to monitor patients' vital signs (temperature, heart rate, blood pressure and breathing). They can then alert medical ..."},{"link":"https://ec.europa.eu/health/scientific_committees/emerging/docs/scenihr_o_041.pdf","description":"It appears that long-term exposure to ELF magnetic field of these people can extent to several tenths of μT. Today, for power regulation most modern electrical ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10515965/","description":"Secondary Objective – Empower nurses to create and deliver a QI programme that can be validated and used as a template for future Quality and Safety projects."}]	{intens,care,unit,in,hospit,for,patient,in,need,of,round,the,clock,monitor,and,support,computeris,system,can,be,us,to,monitor,patient,vital,sign,temperatur,heart,rate,blood,pressur,and,breath,can,then,alert,medic,profession,to,ani,signific,chang,system,usual,run,on,an,embed,real,time,oper,system,state,meant,by,the,term,real,time}	Environmental Science	2024-04-15 01:46:51.435+01
13	6	What is a black hole?	2024-04-15 01:48:43.754+01	\N	A black hole is a region in space where the gravitational pull is so strong that nothing, not even light, can escape from it.	[{"link":"https://spaceplace.nasa.gov/black-holes/","description":"A black hole is an area of such immense gravity that nothing—not even light—can escape from it. Black holes form at the end of some stars' lives. The energy ..."},{"link":"https://www.nasa.gov/universe/what-are-black-holes/","description":"Sep 8, 2020 ... A black hole is an astronomical object with a gravitational pull so strong that nothing, not even light, can escape it. A black hole's ..."},{"link":"https://en.wikipedia.org/wiki/Black_hole","description":"A black hole is a region of spacetime where gravity is so strong that nothing, including light and other electromagnetic waves, is capable of possessing enough ..."},{"link":"https://www.nasa.gov/learning-resources/for-kids-and-students/what-is-a-black-hole-grades-k-4/","description":"A black hole is a place in space where gravity pulls so much that even light can not get out. The gravity is so strong because matter has been squeezed into ..."},{"link":"https://science.nasa.gov/universe/black-holes/","description":"Black Holes Black holes are among the most mysterious cosmic objects, much studied but not fully understood. These objects aren't really holes."},{"link":"https://www.space.com/15421-black-holes-facts-formation-discovery-sdcmp.html","description":"May 19, 2023 ... Black holes grow by the accretion of matter nearby that is pulled in by their immense gravity. Hawking predicted that black holes could also ..."},{"link":"https://news.uchicago.edu/explainer/black-holes-explained","description":"Black holes, explained ... Black holes are regions in space where an enormous amount of mass is packed into a tiny volume. This creates a gravitational pull so ..."},{"link":"https://new.nsf.gov/blackholes","description":"Most black holes are the condensed remnants of a massive star, the collapsed core that remains following an explosive supernova. However, the black hole family ..."},{"link":"https://www.britannica.com/science/black-hole","description":"Black hole, cosmic body of extremely intense gravity from which nothing, not even light, can escape. It can be formed by the death of a massive star wherein ..."},{"link":"https://www.cfa.harvard.edu/research/topic/black-holes","description":"Black holes are some of the most fascinating and mind-bending objects in the cosmos. The very thing that characterizes a black hole also makes it hard to ..."}]	{a,black,hole}	Computer Science	2024-04-15 01:48:43.754+01
21	7	Large software projects involve teams of developers. How can we ensure software quality and maintainability in such an environment? Discuss different software development methodologies like Agile or Waterfall.	2024-04-15 01:52:22.801+01	\N	One way to ensure software quality and maintainability in large software projects is by implementing best practices such as code reviews, automated testing, continuous integration, and documentation. \n\nAgile methodology is a flexible and iterative approach that focuses on collaboration, adaptability, and delivering working software in short iterations. It promotes frequent communication with stakeholders and allows for changes throughout the development process.\n\nWaterfall methodology follows a sequential approach with distinct phases such as requirements gathering, design, implementation, testing, and maintenance. It is more structured but less flexible compared to Agile.\n\nBoth methodologies have their pros and cons, and the choice between Agile and Waterfall depends on the project requirements, team dynamics, and organizational culture. Ultimately, the key to ensuring software quality and maintainability lies in selecting the right methodology and adhering to best practices throughout the development process.	[{"link":"https://www.techtarget.com/searchsoftwarequality/definition/agile-software-development","description":"Agile is a software development methodology that focuses on flexibility, collaboration and efficiency that allow teams to deliver quality products."},{"link":"https://stackify.com/what-is-sdlc/","description":"As the SDLC is a repetitive methodology, you have to ensure code quality at every cycle. ... different deployment environments such as a testing or staging ..."},{"link":"https://www.synopsys.com/blogs/software-security/top-4-software-development-methodologies.html","description":"Teams use the agile development methodology to minimize risk (such as bugs, cost overruns, and changing requirements) when adding new functionality. In all ..."},{"link":"https://www.altexsoft.com/whitepapers/agile-project-management-best-practices-and-methodologies/","description":"Oct 3, 2023 ... This stage is unique to Agile software development. It enables the team to review the results of previous iterations, assess the existing ..."},{"link":"https://www.ibm.com/topics/software-development","description":"Programming software to give programmers tools such as text editors, compilers, linkers, debuggers, and other tools to create code. Application software ( ..."},{"link":"https://theproductmanager.com/topics/software-development-life-cycle/","description":"... to ensure that the software is bug-free and reliable. SDLC consists of various phases, such as planning, design, coding, testing, and deployment, while STLC ..."},{"link":"https://aws.amazon.com/what-is/sdlc/","description":"... to the production environment, such as packaging, environment configuration, and installation. Maintain. In the maintenance phase, among other tasks, the ..."},{"link":"https://hbr.org/2016/05/embracing-agile","description":"Over the past 25 to 30 years, agile innovation methods have greatly increased success rates in software development, improved quality and speed to market, ..."},{"link":"https://www.quora.com/What-development-methodology-waterfall-iterative-agile-other-do-major-defense-software-projects-use","description":"Jul 4, 2017 ... I have not worked with the Department of Defense directly but I did manage a significant software development program for a large civilian ..."},{"link":"https://www.teamwork.com/project-management-guide/project-management-methodologies/","description":"Waterfall, Agile, Scrum, Kanban and more. If you're wondering which methodology you should choose, then you need to read this guide to project management ..."}]	{larg,softwar,project,involv,team,of,develop,how,can,ensur,softwar,qualiti,and,maintain,in,such,an,environ,discuss,differ,softwar,develop,methodolog,like,agil,or,waterfal}	Political Science	2024-04-15 01:52:22.801+01
14	6	As light from a star spreads out and weakens, do gaps form between the photons?	2024-04-15 01:49:06.509+01	\N	No, gaps do not form between photons as light spreads out and weakens. Photons travel in a continuous stream and do not leave gaps between them. The weakening of light is due to factors like distance, absorption, and scattering.	[{"link":"https://wtamu.edu/~cbaird/sq/2015/02/12/as-light-from-a-star-spreads-out-and-weakens-do-gaps-form-between-the-photons/","description":"Feb 12, 2015 ... The answer depends on how you look at light. However, in the most accurate approach, gaps do not form between photons as light spreads out."},{"link":"https://physics.stackexchange.com/questions/406506/as-light-from-a-star-spreads-out-and-weakens-do-gaps-form-between-the-photons","description":"May 17, 2018 ... If we look at light as a collection of little particles, we can say that dimmer light has its photons more spread out. But if we look at light ..."},{"link":"https://www.quora.com/As-light-from-a-star-spreads-out-and-weakens-do-gaps-form-between-the-photons","description":"Jan 25, 2019 ... There are no gaps in space between the photons as they travel. ... The light from a distance star indeed spreads out and weakens as it travels, ..."},{"link":"https://physicsandmathforum.quora.com/As-light-from-a-star-spreads-out-and-weakens-do-gaps-form-between-the-photons","description":"Jun 23, 2020 ... Considering the star to be Stationary the wave crests that spreads out will be equally spaced.. Wavelength at both side will be the same.."},{"link":"https://www.toppr.com/ask/question/as-light-from-a-star-spreads-out-andweakens-do-gaps-form-between-thephotons-can-a/","description":"Jan 9, 2020 ... As light from a star spreads out and weakens, do gaps form between the photons? . Can a fire have a shadow? . Can air make shadows? Can gold ..."},{"link":"https://www.krayonnz.com/user/doubts/detail/63485c669083f200545d464a/as-light-from-a-star-spreads-out-and-weakens-do-gaps-form-between-the-photons","description":"Light is made up of tiny fundamental bits called photons. A photon is a quantum object. As such, photons acts little like particle and little like wave, but is ..."},{"link":"https://jorahkai.com/askamos/","description":"... out this page about a Virtual Book Tour. Hey Amos! As light from a star spreads out and weakens, do gaps form between the photons? -Corey, 16 Hey Corey, I ..."},{"link":"https://brainly.in/question/60074627","description":"Apr 5, 2024 ... no gaps do not formed between the photons as light spread out. because light is made up of tiny fundamental bits called photons. photon is a ..."},{"link":"https://www.coursehero.com/file/213860360/Case-Analysis-Template-Yamoto-Transport-Fall2023docx/","description":"Oct 5, 2023 ... How do we know this? What led tothe current situation? More ... As light from a star spreads out and weakens, do gaps form between the photons?"},{"link":"https://brainly.com/question/16432523","description":"May 14, 2020 ... ... weaken, but does not cause gaps to form. Therefore, if you look at photons as waves, spatial gaps never form in light as it travels through ..."}]	{as,light,from,a,star,spread,out,and,weaken,do,gap,form,between,the,photon}	Computer Science	2024-04-15 01:49:06.509+01
15	6	Can momentum be hidden to human eyes like how kinetic energy can be hidden as heat?	2024-04-15 01:49:17.699+01	\N	Momentum is a physical quantity that is always conserved in a closed system. However, it is not "hidden" like kinetic energy can be converted into other forms like heat. Momentum is a vector quantity that is always present and can be observed through the motion of objects.	[{"link":"https://wtamu.edu/~cbaird/sq/2014/03/19/can-momentum-be-hidden-to-human-eyes-like-how-kinetic-energy-can-be-hidden-as-heat/","description":"Mar 19, 2014 ... No. If you did a careful analysis of this event, and measured everything you could think of, you would find that the heat (thermal energy) in ..."},{"link":"https://homework.study.com/explanation/can-momentum-be-hidden-to-human-eyes-like-how-kinetic-energy-can-be-hidden-as-heat.html","description":"Yes, there are many scenarios where we cannot \\"see\\" momentum. Usually, momentum carried by waves are hidden to human eyes. Here are a few examples:."},{"link":"https://www.quora.com/If-momentum-can-be-hidden-to-human-eyes-like-kinetic-energy-can-be-hidden-as-heat-what-process-would-cause-it-to-happen","description":"Jul 14, 2021 ... Thus, the individual momentum of each gas molecule is invisible (hidden to the eye)."},{"link":"https://www.krayonnz.com/user/doubts/detail/61d04ad1778ae600457813ae/can-momentum-be-hidden-to-human-eyes-like-how-kinetic-energy-can-be-hidden-as-heat-Explain","description":"So there it is, there is no way to convert momentum into something else because there are no different forms of momentum, in the same way that heat and kinetic ..."},{"link":"https://twitter.com/WathuBlackgirl/status/1690257587206230016","description":"Aug 12, 2023 ... Can momentum be hidden to human eyes like how kinetic energy can be hidden as heat?"},{"link":"https://www.toppr.com/ask/question/as-light-from-a-star-spreads-out-andweakens-do-gaps-form-between-thephotons-can-a/","description":"Jan 9, 2020 ... - Can light bend around corners? . Can momentum be hidden to human eyes like how kinetic energy can be hidden as heat? Open in App ..."},{"link":"https://brainly.in/question/49182305","description":"Dec 21, 2021 ... Find an answer to your question Can momentum be hidden to human eyes like how kinetic energy can be hidden as heat?​"},{"link":"https://www.numerade.com/ask/question/can-momentum-be-hidden-to-human-eyes-like-how-kinetic-energy-can-be-hidden-as-heat-73538/","description":"Feb 22, 2022 ... When we say that kinetic energy can be \\"hidden\\" as heat, we mean that the energy can be transferred from one form to another, such as from ..."},{"link":"https://www.quotev.com/story/12650415/Reddie/2","description":"Apr 25, 2020 ... ... hidden to human eyes, like how kinetic energy can be hidden as heat? ... Which is invisible to human eyes at most frequencies. Therefore, momentum ..."},{"link":"https://orionmagazine.org/article/calling-all-fanatics/","description":"It feels more like hidden hostility toward humans that will only further divide and alienate. I know I felt like fighting them on it after I read it. But how ..."}]	{can,momentum,be,hidden,to,human,ey,like,how,kinet,energi,can,be,hidden,as,heat}	Physics	2024-04-15 01:49:17.699+01
16	6	Can you make a shock wave of light by breaking the light barrier just like supersonic airplanes break the sound barrier?	2024-04-15 01:49:30.751+01	\N	No, it is not possible to create a shock wave of light by breaking the light barrier similar to how supersonic airplanes break the sound barrier. The speed of light in a vacuum is constant and cannot be exceeded, unlike the speed of sound, which can be surpassed by faster-moving objects.	[{"link":"https://wtamu.edu/~cbaird/sq/2013/04/09/can-you-make-a-shock-wave-of-light-by-breaking-the-light-barrier-just-like-supersonic-airplanes-break-the-sound-barrier/","description":"Apr 9, 2013 ... And as you would expect, an object traveling through a material at a speed that is faster than the light in that material does indeed create an ..."},{"link":"https://www.quora.com/What-will-happen-if-we-break-the-barrier-of-the-speed-of-light","description":"Mar 1, 2015 ... Can you make a shockwave of light by breaking the light barrier just like supersonic airplanes break the sound barrier? Yes. It looks like this."},{"link":"https://wtamu.edu/~cbaird/sq/category/physics/","description":"Can you make a shock wave of light by breaking the light barrier just like supersonic airplanes break the sound barrier? Can you make a sunset in a cup of milk?"},{"link":"https://askanastronomer.org/can-you-make-a-shock-wave-of-light-by-breaking-the-light-barrier/","description":"Oct 18, 2020 ... Can you make a shock wave of light by breaking the light barrier just like supersonic airplanes break the sound barrier? The answer to this ..."},{"link":"https://www.quora.com/Can-you-make-a-shockwave-of-light-by-breaking-the-light-barrier-just-like-supersonic-airplanes-break-the-sound-barrier","description":"Mar 7, 2019 ... ... medium, it used to be called Aeither. That medium was basically thrown out as it couldn't be found…. Howev..."},{"link":"https://www.reddit.com/r/interestingasfuck/comments/p0b77c/navy_fighter_jet_photographed_while_breaking_the/","description":"Aug 8, 2021 ... What you see on the picture is a cone of shockwave dragged behind supersonic airplanes. same optical effect as the shockwaves when somethign ..."},{"link":"https://boomsupersonic.com/flyby/how-exactly-do-you-break-the-sound-barrier","description":"Sep 17, 2019 ... ... breaking the sound barrier — would ... The presence of shock waves can change how the plane ... supersonic shock waves for the first time this year."},{"link":"https://www.reddit.com/r/mildyinteresting/comments/13p1txv/f18_breaking_the_sound_barrier/","description":"May 22, 2023 ... What you're seeing is the the diffraction of light through the shockwave created by an object moving as fast or faster than the speed of sound ..."},{"link":"https://www.scientificamerican.com/article/what-happens-when-an-airc/","description":"Mar 11, 2002 ... The change in pressure as the object outruns all the pressure and sound waves in front of it is heard on the ground as an explosion, or sonic ..."},{"link":"https://www.physicsforums.com/threads/rocket-trust-and-sound-barrier-breaktrough.14871/","description":"... you can get out of the flow ... shock wave they produced to strike just inside the intake. ... Can any type of aircraft break the sound barrier?"}]	{can,make,a,shock,wave,of,light,by,break,the,light,barrier,just,like,superson,airplan,break,the,sound,barrier}	Computer Science	2024-04-15 01:49:30.751+01
17	6	How can a material at a certain temperature have all of its molecules at the same energy?	2024-04-15 01:49:47.357+01	\N	When a material is at a certain temperature, its molecules will have a range of energies due to thermal motion. It is statistically improbable for all molecules to have exactly the same energy at a given temperature. The distribution of energies follows a probability distribution based on the Boltzmann distribution, where most molecules will be near the average energy and only a few will have significantly higher or lower energies.	[{"link":"https://wtamu.edu/~cbaird/sq/2014/09/09/how-can-a-material-at-a-certain-temperature-have-all-of-its-molecules-at-the-same-energy/","description":"Sep 9, 2014 ... It is because thermal motion is random motion. When randomness is involved, many outcomes will result despite underlying laws making certain ..."},{"link":"https://homework.study.com/explanation/how-can-a-material-at-a-certain-temperature-have-all-of-its-molecules-at-the-same-energy.html","description":"A material at a certain temperature does not ever have all its molecules at the same energy: The kinetic energy of the molecules can be and is often different."},{"link":"https://www.quora.com/How-can-a-material-at-a-certain-temperature-have-all-of-its-molecules-at-the-same-energy","description":"May 15, 2019 ... The water molecules will now have more kinetic energy allowing them to have move apart more but still capable of occupying the shape of any ..."},{"link":"https://quizlet.com/574223336/physics-chapter-15-temperature-heat-and-expansion-flash-cards/","description":"Feb 28, 2021 ... All matter is composed of continuously moving molecules. Because of this random motion, the atoms and molecules in matter have kinetic energy."},{"link":"https://opentextbc.ca/introductorychemistry/chapter/kinetic-molecular-theory-of-gases/","description":"... all gases at the same temperature have the same average kinetic energy. Figure 6.6 “The Kinetic Molecular Theory of Gases” shows a representation of how we ..."},{"link":"https://www.acs.org/middleschoolchemistry/lessonplans/chapter2/lesson1.html","description":"Jan 9, 2024 ... If you cannot get the materials for all groups to do ... Something can only get colder by having its atoms and molecules transfer their energy to ..."},{"link":"https://courses.lumenlearning.com/suny-physics/chapter/14-3-phase-change-and-latent-heat/","description":"... its molecular forces as noted ... Phase changes can have a tremendous stabilizing effect even on temperatures ... Find the final temperature when all ice has melted ..."},{"link":"https://education.nationalgeographic.org/resource/energy-transfers-and-transformations/","description":"Oct 19, 2023 ... Thermal energy has to do with the internal energy of a system due to its temperature. When a substance is heated, its temperature rises ..."},{"link":"https://openstax.org/books/physics/pages/11-3-phase-change-and-latent-heat","description":"Mar 26, 2020 ... So far, we have learned that adding thermal energy by heat increases the temperature of a substance. But surprisingly, there are situations ..."},{"link":"https://earthobservatory.nasa.gov/features/EnergyBalance","description":"Jan 14, 2009 ... Earth's temperature depends on how much sunlight the land, oceans, and atmosphere absorb, and how much heat the planet radiates back to ..."}]	{how,can,a,materi,at,a,certain,temperatur,have,all,of,molecul,at,the,same,energi}	Physics	2024-04-15 01:49:47.357+01
18	7	With the rise of online security threats, how can we ensure secure communication over the internet? Explain the concept of public-key cryptography and how it works.\n\n	2024-04-15 01:51:46.793+01	\N	To ensure secure communication over the internet, public-key cryptography is utilized. In this system, each user has a pair of cryptographic keys - a public key and a private key. The public key is shared with others to encrypt messages, while the private key is kept secret and used to decrypt messages. \n\nWhen User A wants to send a secure message to User B, User B shares their public key with User A. User A then encrypts the message using User B's public key and sends it. Only User B, with their private key, can decrypt and read the message. This ensures confidentiality and authenticity of the communication.\n\nPublic-key cryptography also enables digital signatures, where a user can sign a message with their private key, and others can verify the signature using the public key. This helps ensure the integrity and authenticity of messages exchanged over the internet.	[{"link":"https://www.cloudflare.com/learning/ssl/transport-layer-security-tls/","description":"Transport Layer Security (TLS) is a cryptographic protocol that protects Internet communications. TLS replaced SSL in 1999. Learn how TLS works."},{"link":"https://www.techtarget.com/searchsecurity/definition/encryption","description":"When encrypted data is intercepted by an unauthorized entity, the intruder has to guess which cipher was used to encrypt the data and what key is required to ..."},{"link":"https://www.kiteworks.com/secure-file-sharing/public-vs-private-key-encryption/","description":"Aug 12, 2023 ... The key must be kept secret to ensure the security of the encrypted data. Symmetric encryption is used extensively in protecting content at rest ..."},{"link":"https://www.internetsociety.org/deploy360/tls/basics/","description":"Transport Layer Security (TLS) encrypts data sent over the Internet to ensure ... Communications Corporation in 1994 to secure web sessions. ... to use the private ..."},{"link":"https://www.digicert.com/what-is-ssl-tls-and-https","description":"TLS: Transport Layer Security. TLS is an updated, more secure version of SSL. We still refer to our security certificates as SSL because it's a more common term ..."},{"link":"https://www.simplilearn.com/data-encryption-methods-article","description":"In a world where cybercrimes are on the rise, it's comforting to know that there are as many methods available to protect network security as there are ways of ..."},{"link":"https://www.keyfactor.com/education-center/what-is-pki/","description":"PKI security first emerged in the 1990s to help govern encryption keys through the issuance and management of digital certificates. These PKI certificates ..."},{"link":"https://www.okta.com/identity-101/public-key-infrastructure/","description":"Jun 26, 2023 ... PKI is one of the most common forms of internet encryption ... It can also be used for secure communications within an organization to ensure ..."},{"link":"https://www.portnox.com/cybersecurity-101/public-key-infrastructure-pki/","description":"In summary, PKI enables secure communication over an insecure network by using public key cryptography and digital certificates to establish trust between ..."},{"link":"https://venafi.com/machine-identity-basics/what-is-pki-and-how-does-it-work/","description":"... security system that issues, distributes, and validates digital certificates. It encrypts communications, ensuring data protection and secure transactions ..."}]	{with,the,rise,of,onlin,secur,threat,how,can,ensur,secur,commun,over,the,internet,explain,the,concept,of,public,kei,cryptographi,and,how,work}	Political Science	2024-04-15 01:51:46.793+01
19	7	 Self-driving cars are becoming a reality.  Describe the challenges of training an AI to navigate complex and unpredictable road environments.  What ethical considerations need to be addressed?	2024-04-15 01:51:58.944+01	\N	Training an AI to navigate complex and unpredictable road environments for self-driving cars poses challenges such as handling diverse driving conditions, unpredictable human behaviors, adapting to changing environments, ensuring real-time decision-making, and addressing edge cases or rare scenarios.\n\nEthical considerations that need to be addressed include ensuring safety and security of passengers and other road users, making decisions in potential life-threatening scenarios, addressing liability and legal issues in case of accidents, dealing with job displacement of human drivers, data privacy and security concerns, and ensuring transparency and accountability of AI systems.	[{"link":"https://www.pewresearch.org/internet/2018/12/10/improvements-ahead-how-humans-and-ai-might-evolve-together-in-the-next-decade/","description":"Dec 10, 2018 ... Martijn van Otterlo, author of “Gatekeeping Algorithms with Human Ethical Bias” and assistant professor of artificial intelligence at Tilburg ..."},{"link":"https://www.europarl.europa.eu/RegData/etudes/STUD/2020/634452/EPRS_STU(2020)634452_EN.pdf","description":"Self-driving autonomous cars are likely to raise issues in relation to product liability that could lead to more complex cases (currently insurers typically ..."},{"link":"https://www.iiot-world.com/artificial-intelligence-ml/artificial-intelligence/five-challenges-in-designing-a-fully-autonomous-system-for-driverless-cars/","description":"Today we see a lot of experiments being done on driverless cars in a controlled environment under the supervision of human, and excellent road conditions."},{"link":"https://www.mdpi.com/2624-800X/3/3/25","description":"We further explore the various security solutions that have been proposed and implemented to address these threats. The discussion not only provides an overview ..."},{"link":"https://www.sciencedirect.com/science/article/pii/S2590005621000059","description":"... self-driving cars: Survey, challenges, and open issues ... Ethics, AI and self-driving cars ... To gain a complete 3D view of the environment, self-driving cars ..."},{"link":"https://www.linkedin.com/pulse/self-driveautonomous-trucks-impact-logistics-patrick-mutabazi","description":"Aug 3, 2023 ... ... complex urban environments, adverse weather conditions, and unpredictable road situations. ... required to address these challenges. Public ..."},{"link":"https://www.mckinsey.com/featured-insights/future-of-work/ai-automation-and-the-future-of-work-ten-things-to-solve-for","description":"Jun 1, 2018 ... ... environments ranging from autonomous vehicles on roads to automated check-outs in grocery stores. Much of this progress has been driven by ..."},{"link":"https://www.sciencedirect.com/science/article/pii/S0268401222000767","description":"Virtual environments and immersive games (such as, Second Life, Fortnite, Roblox and VRChat) have been described as antecedents of the metaverse and offer some ..."},{"link":"https://www.brookings.edu/articles/how-artificial-intelligence-is-transforming-the-world/","description":"Apr 24, 2018 ... In this report, Darrell West and John Allen discuss AI's application across a variety of sectors, address issues in its development, and offer ..."},{"link":"https://www.vox.com/2016/4/21/11447838/self-driving-cars-challenges-obstacles","description":"Apr 21, 2016 ... As more and more self-driving cars hit the road, they will constantly be encountering new objects and obstacles that they can relay to the ..."}]	{self,drive,car,becom,a,realiti,describ,the,challeng,of,train,an,ai,to,navig,complex,and,unpredict,road,environ,ethic,consider,need,to,be,address}	Earth Science	2024-04-15 01:51:58.944+01
20	7	Modern computers rely on parallel processing with multiple cores. How does the architecture of a CPU allow for instructions to be executed simultaneously?  What are the limitations of this approach?	2024-04-15 01:52:09.869+01	\N	Modern CPUs have multiple cores that can execute instructions simultaneously by dividing tasks among the cores. Each core has its own set of resources, such as registers and execution units, allowing them to work independently and in parallel. \n\nLimitations of this approach include:\n1. Synchronization overhead: Coordinating the execution of tasks across multiple cores can introduce overhead and reduce performance.\n2. Limited scalability: Adding more cores does not always result in linear improvement in performance, as there may be diminishing returns due to dependencies and bottlenecks.\n3. Power consumption: Running multiple cores simultaneously can consume more power, limiting battery life in mobile devices.\n4. Software limitations: Not all software is designed to take advantage of multiple cores, leading to potential underutilization of resources.\n5. Cost: Increasing the number of cores on a chip can also increase the cost of manufacturing, making it a balancing act between performance and affordability.	[{"link":"https://www.techtarget.com/searchdatacenter/definition/multi-core-processor","description":"These processors also enable more efficient simultaneous processing of multiple tasks, such as with parallel processing and multithreading. A dual core ..."},{"link":"https://en.wikipedia.org/wiki/Superscalar_processor","description":"But merely processing multiple instructions concurrently does not make an architecture superscalar, since pipelined, multiprocessor or multi-core ..."},{"link":"https://computer.howstuffworks.com/parallel-processing.htm","description":"Parallel processing allows computer programs to run faster because of the use of more CPUs ... modern computing, allowing for the concurrent execution of multiple ..."},{"link":"https://arxiv.org/html/2401.02469v1","description":"1) Parallel Computing: Through the utilization of several processor cores, parallel computing can perform multiple tasks simultaneously. The ability to ..."},{"link":"https://en.wikipedia.org/wiki/Parallel_computing","description":"Parallel computing is a type of computation in which many calculations or processes are carried out simultaneously. Large problems can often be divided into ..."},{"link":"https://ece.ncsu.edu/research/cas/","description":"Flynn's taxonomy classifies parallel (and serial) computers according to whether all processors execute the same instructions at the same time (single ..."},{"link":"https://www.run.ai/guides/multi-gpu/cpu-vs-gpu","description":"CPU Advantages and Limitations. CPUs have several distinct advantages for modern computing tasks: Flexibility—a CPU is a general-purpose processor that can ..."},{"link":"https://nap.nationalacademies.org/read/12980/chapter/5","description":"... instructions that a particular CPU core can execute ... instructions with the intent of executing them concurrently and cooperatively on multiple processors."},{"link":"https://learn.saylor.org/mod/page/view.php?id=27133","description":"Jul 14, 2020 ... Parallel software is specifically intended for parallel hardware with multiple cores, threads, etc. In most cases, serial programs run on modern ..."},{"link":"https://realpython.com/python-parallel-processing/","description":"Sep 13, 2023 ... Why Do Modern Computers Favor Parallelism? How Can You Harness the Power of Multiple CPU Cores? Compare Multithreading in Python and Other ..."}]	{modern,comput,reli,on,parallel,process,with,multipl,core,how,doe,the,architectur,of,a,cpu,allow,for,instruct,to,be,execut,simultan,the,limit,of,approach}	Physics	2024-04-15 01:52:09.869+01
22	7	 Imagine you're building a chat robot. How can computers understand and respond to human language in a meaningful way? Explain the challenges and potential applications of NLP.	2024-04-15 01:52:40.309+01	\N	Natural Language Processing (NLP) is a branch of artificial intelligence that focuses on the interaction between computers and human languages. NLP allows computers to understand, interpret, and generate human language in a way that is meaningful.\n\nChallenges in NLP include:\n\n1. Ambiguity: Human language is often ambiguous and context-dependent, making it challenging for computers to accurately interpret and respond to.\n2. Syntax and Grammar: Computers need to understand the rules and structure of different languages to process text correctly.\n3. Sentiment Analysis: Understanding the emotions, attitudes, and opinions expressed in text can be complex for machines.\n4. Semantic Understanding: Interpreting the meaning of words, phrases, or sentences in specific contexts can be tricky for computers.\n\nPotential applications of NLP include:\n\n1. Sentiment Analysis: Analyzing customer feedback, reviews, and social media posts to gauge public opinion.\n2. Machine Translation: Translating text from one language to another in real-time.\n3. Chatbots: Building conversational interfaces that can interact with users in a natural language.\n4. Text Summarization: Generating concise summaries of long texts, articles, or documents.\n5. Named Entity Recognition: Identifying and categorizing entities like names, organizations, and locations in text.\n\nBy addressing these challenges and leveraging the potential applications, NLP can enable computers to better understand and respond to human language, making chatbots and other language-based technologies more powerful and user-friendly.	[{"link":"https://www.analyticsvidhya.com/blog/2021/10/complete-guide-to-build-your-ai-chatbot-with-nlp-in-python/","description":"Our goal is to help you build a smart chatbot. First, we'll explain NLP, which helps computers understand human language. Then, we'll show you how to use AI ..."},{"link":"https://blog.synapticlabs.ai/natural-language-processing-decoding-the-language-of-machines","description":"Jul 3, 2023 ... Part-of-Speech Tagging and Syntactic Parsing. Alright fellow linguistic explorers, it's time to put on our grammar hats! Today we're exploring ..."},{"link":"https://medium.com/@asarav/the-limitations-of-chat-gpt-8b73f5859bb4","description":"Dec 19, 2022 ... As someone who has published research relating to social robotics and conversational AI, I have seen overexaggerated articles about the field ..."},{"link":"https://fstoppers.com/artificial-intelligence/i-interviewed-ai-about-ai-and-it-wants-know-it-comes-peace-636377","description":"Jul 14, 2023 ... Generative artificial intelligence like Chat GPT, Dall-e, Midjourney, etc., what we are all now collectively referring to as \\"AI,\\" has all ..."},{"link":"https://www.quora.com/Whats-a-good-question-to-trip-up-an-AI-bot-trying-to-have-a-conversation-with-you-Some-of-them-are-very-good-with-programmed-answers-to-what-I-would-consider-tough-challenge-questions-I-feel-embarrassed-when-I","description":"Jan 24, 2021 ... If it's a talk bot, try challenging them back on the facts they are telling you. It seems that when the bots are being programmed by an ..."},{"link":"https://www.reddit.com/r/ChatGPT/comments/13cklzh/what_are_some_of_your_favorite_chatgpt_prompts/","description":"May 9, 2023 ... If it's a tutorial that's pretty lengthy/wordy, you can use the above prompt to shorten it, so you don't waste your time trying to figure out ..."},{"link":"https://huyenchip.com/2023/04/11/llm-engineering.html","description":"Apr 11, 2023 ... Challenges of productionizing prompt engineering. The ambiguity of natural languages. For most of the history of computers, engineers have ..."},{"link":"https://www.techtarget.com/searchcustomerexperience/definition/chatbot","description":"In this definition, learn what a chatbot is, how it can change CX and what the future could hold for this technology."},{"link":"https://texadmissions.com/blog/2022/12/10/what-does-chatgpt-mean-for-college-application-essays-and-college-admission","description":"Dec 11, 2022 ... What is ChatGPT? Will it disrupt college admissions and education in general? How will it influence college essay submissions?"},{"link":"https://forums.fast.ai/t/meet-greet-thread-introduce-yourself/13345","description":"Mar 16, 2018 ... I work with text and use NLP and ML to automate human tasks. I hope to build a bot that can reply data queries in natural language. I'd love ..."}]	{imagin,re,build,a,chat,robot,how,can,comput,understand,and,respond,to,human,languag,in,a,meaning,wai,explain,the,challeng,and,potenti,applic,of,nlp}	Computer Science	2024-04-15 01:52:40.309+01
23	8	What are the building blocks and conditions necessary for life to emerge, and could it exist elsewhere in the universe?	2024-04-15 01:56:23.133+01	\N	The building blocks necessary for life to emerge include carbon-based molecules, liquid water, and a source of energy. Conditions necessary for life to flourish include a stable environment, a suitable temperature range, and protection from harmful radiation. Scientists believe that life could potentially exist elsewhere in the universe, especially on planets or moons with similar conditions to Earth.	[{"link":"https://news.uchicago.edu/explainer/origin-life-earth-explained","description":"Sep 19, 2022 ... ... building blocks of life could form in a primordial soup ... could have seeded life on planets elsewhere in the universe. ... Amino acids, an ..."},{"link":"https://europa.nasa.gov/why-europa/ingredients-for-life/","description":"Life is abundant on Earth, but we haven't yet found it anywhere else in the universe. How do we search for life beyond our home planet?"},{"link":"https://www.nhm.ac.uk/discover/eight-ingredients-life-in-space.html","description":"Many complex molecules are needed to perform the thousands of functions sustaining complex life. Carbon is the simple building block that organisms need to ..."},{"link":"https://www.khanacademy.org/science/ap-biology/natural-selection/origins-of-life-on-earth/a/hypotheses-about-the-origins-of-life","description":"... could exist in space (high UV irradiation and low ... Could life itself have come from elsewhere in the universe? ... building blocks required for life as we know ..."},{"link":"https://www.sciencedirect.com/topics/earth-and-planetary-sciences/panspermia","description":"... building blocks of the RNA can be ... Under what kind of life system could space life emerge? ... Another possibility is that life evolved elsewhere in the universe ..."},{"link":"https://www.space.com/33374-odds-of-life-emerging-new-equation.html","description":"Jul 8, 2016 ... ... might show that life could emerge in more ... building blocks over a given time, is murkier — and much more interesting. ... That kind of data could ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10054531/","description":"Mar 1, 2023 ... For life to exist, three basic requirements must be met: the presence of liquid water, an energy source, and organic building blocks [8]."},{"link":"https://en.wikipedia.org/wiki/Abiogenesis","description":"Researchers generally think that current life descends from an RNA world, although other self-replicating molecules may have preceded RNA. The classic 1952 ..."},{"link":"https://evolutionnews.org/2023/09/chatting-with-chatgpt-about-intelligent-design-and-the-origin-of-life/","description":"Sep 20, 2023 ... ... other building blocks of life emerged. Here ... emergence of life is an essential ... We can only exist in a universe where conditions allow our ..."},{"link":"https://www.harvardmagazine.com/node/42166","description":"... life forms in the universe, or could life exist elsewhere? ... is necessary because so many conditions influence life's emergence. ... (building blocks of RNA) could ..."}]	{the,build,block,and,condit,necessari,for,life,to,emerg,and,could,exist,elsewher,in,the,univers}	Physics	2024-04-15 01:56:23.133+01
24	8	Is there a fundamental asymmetry in the laws of physics that explains this, or is our perception of time misleading?	2024-04-15 01:56:42.38+01	\N	The fundamental asymmetry in the laws of physics related to the direction of time is known as the arrow of time. This asymmetry is not fully explained by current understanding of physics and remains a topic of ongoing research and investigation.	[{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8064314/","description":"Mar 25, 2021 ... Although the laws of physics do not provide us with enough temporal asymmetry, one could insist that we have enough asymmetry in the world as it ..."},{"link":"https://medium.com/physics-as-a-foreign-language/why-ethan-siegel-is-wrong-about-the-arrow-of-time-a280a2f721cb","description":"Oct 20, 2016 ... There is also a built in time asymmetry in the microscopic laws of physics called CP-violation. ... any law of physics. An open system is one ..."},{"link":"https://plato.stanford.edu/entries/time-thermo/","description":"Nov 15, 2001 ... The typical textbook treatment of thermodynamics describes some basic concepts, states the laws in a more or less rough way and then proceeds to ..."},{"link":"https://brill.com/view/journals/time/12/2/article-p138_006.xml?language=en","description":"Nov 21, 2023 ... ... my view, to be found in neuroscience, not in physics. ... It may be that 'time' is in some sense more fundamental ... fundamental spacetime physics ..."},{"link":"https://www.scientificamerican.com/article/time-s-passage-is-probably-an-illusion/","description":"Oct 24, 2014 ... And who could doubt that it does? The passage of time is probably the most basic facet of human perception, for we feel time slipping by in our ..."},{"link":"https://iep.utm.edu/time/","description":"Our society's standard clock tells everyone what time it really is. ... fundamental laws of physics ... There is no hope the time-asymmetry will show up in a ..."},{"link":"https://link.springer.com/article/10.1007/s10838-016-9342-z","description":"Jun 1, 2016 ... ... time, that is, the asymmetry of time itself, and was convinced that it should manifest itself in some time asymmetry within our laws of nature:."},{"link":"https://nautil.us/where-did-time-come-from-and-why-does-it-seem-to-flow-234760/","description":"Jan 28, 2014 ... ... time asymmetry of ... It could be that fundamentally the laws of ... In terms of fundamental physics, is there anything especially new about time?"},{"link":"https://www.jstor.org/stable/44697644","description":"Jun 1, 2016 ... theory of asymmetry of time to be acceptable it ... manifest itself in some time asymmetry within our laws of nature: ... Reversal Violation in the ..."},{"link":"https://writings.stephenwolfram.com/2023/02/a-50-year-quest-my-personal-journey-with-the-second-law-of-thermodynamics/","description":"Feb 2, 2023 ... (Thinking about it today, maybe that name reflected some aspiration of relating this to particle physics.) It was the most complicated program I ..."}]	{there,a,fundament,asymmetri,in,the,law,of,physic,explain,or,percept,of,time,mislead}	Physics	2024-04-15 01:56:42.38+01
25	8	How will life on Earth evolve in the face of climate change and other environmental pressures?	2024-04-15 01:57:17.983+01	\N	The future of life on Earth in response to climate change and environmental pressures remains uncertain. However, species that can adapt to changing conditions or migrate to more suitable habitats are likely to survive. Conservation efforts and sustainable practices are crucial in mitigating the impacts on biodiversity.	[{"link":"http://humanorigins.si.edu/research/climate-and-human-evolution/climate-effects-human-evolution","description":"Mar 6, 2024 ... How did environmental change shape the evolution ... How do we know Earth's climate has changed? ... Another response to environmental change is ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7157458/","description":"... other life on Earth – is humanity's greatest challenge. Go to: Human Environmental Impact Through Time. The human evolutionary line began in Africa about 7 ..."},{"link":"https://19january2017snapshot.epa.gov/climate-impacts/climate-impacts-ecosystems","description":"Dec 22, 2016 ... Timing of Seasonal Life-Cycle Events; Range Shifts; Food Web Disruptions; Threshold Effects; Pathogens, Parasites, and Disease; Extinction Risks ..."},{"link":"https://www.dni.gov/files/ODNI/documents/assessments/GlobalTrends_2040.pdf","description":"Climate change will increasingly ex- acerbate ... Even though the Earth's climate is an ... Governments in all regions will face mounting pressures from economic."},{"link":"https://press.un.org/en/2023/sc15318.doc.htm","description":"Jun 13, 2023 ... ... global climate change, their way of life faces extinction. ... And in many other ... Without ambitious action, peace will wilt in the face of ..."},{"link":"https://climate.nasa.gov/news/2879/climate-change-puts-pressure-on-sea-turtles/","description":"Jun 19, 2019 ... From the day they're hatched, a sea turtle's life is a struggle for survival. For every 1,000 sea turtle eggs laid, only about one turtle ..."},{"link":"https://www.un.org/sustainabledevelopment/blog/2019/05/nature-decline-unprecedented-report/","description":"May 6, 2019 ... ... is also key to meeting most other global goals. ... The essential, interconnected web of life on Earth is getting smaller and increasingly frayed, ..."},{"link":"https://www.sciencedirect.com/science/article/pii/S2590332220302505","description":"Jun 19, 2020 ... ... face of climate change. Similarly, working ... environmental change and other outside pressures. ... life on Earth points to the need for ..."},{"link":"https://www.iea.org/reports/the-oil-and-gas-industry-in-energy-transitions","description":"Jan 20, 2020 ... ... environmental pressures on ... face is whether they can help deliver climate solutions. ... do much more to respond to the threat of climate change."},{"link":"https://www.science.org.au/curious/earth-environment/population-environment","description":"Jul 24, 2015 ... ... would their quality of life be like? Would they be ... will go some way to reducing climate change. ... other footprints will continue to add up."}]	{how,will,life,on,earth,evolv,in,the,face,of,climat,chang,and,other,environment,pressur}	Physics	2024-04-15 01:57:17.983+01
26	8	Advances in genetic engineering and gene editing raise important ethical questions.  How can we ensure the responsible use of these technologies, and what are the potential risks and benefits?	2024-04-15 01:57:34.3+01	\N	To ensure responsible use of genetic engineering and gene editing technologies, guidelines and regulations must be established and followed by researchers and practitioners. Ethical considerations must prioritize the well-being of individuals, communities, and ecosystems.\n\nPotential benefits of these technologies include treating genetic disorders, developing more resilient crops, and advancing medical research. Risk factors to consider include unintended consequences, unequal access to benefits, and ethical implications related to altering the genetic makeup of organisms. Regular evaluation and oversight are crucial to mitigate risks and maximize benefits of genetic engineering and gene editing technologies.	[{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7129066/","description":"Apr 2, 2020 ... ... potential risks and benefits of the applications (Greene and Master, 2018). One important ethical issue is that the use of such technologies ..."},{"link":"https://carnegieendowment.org/2019/08/28/new-tech-new-threats-and-new-governance-challenges-opportunity-to-craft-smarter-responses-pub-79736","description":"Aug 28, 2019 ... ... provide reasonable compensation or benefit sharing to those exposed to risk. ... this powerful technology and raise important issues related to ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3078015/","description":"To reflect this progress and to include those animals that are not strictly transgenic, the umbrella term “genetically engineered” has been adopted into the ..."},{"link":"https://www.whitehouse.gov/briefing-room/presidential-actions/2022/09/12/executive-order-on-advancing-biotechnology-and-biomanufacturing-innovation-for-a-sustainable-safe-and-secure-american-bioeconomy/","description":"Sep 12, 2022 ... We need to develop genetic engineering technologies and techniques to be able to ... risks associated with advances ... ethical and responsible; are ..."},{"link":"https://www.nationalacademies.org/news/2015/12/on-human-gene-editing-international-summit-statement","description":"Dec 3, 2015 ... Some of these advances have also raised important ethical and societal issues – for example, about the use of recombinant DNA technologies or ..."},{"link":"https://www.pewresearch.org/science/2016/07/26/human-enhancement-the-scientific-and-ethical-dimensions-of-striving-for-perfection/","description":"Jul 26, 2016 ... Others speak of “post-humanity,” and predict that dramatic advances in genetic engineering and machine technology may ultimately allow people to ..."},{"link":"https://www.usda.gov/topics/biotechnology/biotechnology-frequently-asked-questions-faqs","description":"The use of some of these crops can simplify work and improve safety for farmers. ... Other potential risks considered in the assessment of genetically engineered ..."},{"link":"https://www.nature.com/articles/s41599-022-01147-y","description":"Apr 20, 2022 ... Beyond these applications, modern genetic engineering techniques such as genome editing technologies have the potential to be an innovative ..."},{"link":"https://nap.nationalacademies.org/read/24623/chapter/2","description":"Important questions raised with respect to genome editing include how to balance potential benefits against the risk of unintended ..."},{"link":"https://www.europarl.europa.eu/RegData/etudes/STUD/2020/634452/EPRS_STU(2020)634452_EN.pdf","description":"Rapid developments in artificial intelligence (AI) and machine learning carry huge potential benefits. However it is necessary to explore the full ethical, ..."}]	{advanc,in,genet,engin,and,gene,edit,rais,import,ethic,question,how,can,ensur,the,respons,us,of,technolog,and,the,potenti,risk,and,benefit}	Computer Science	2024-04-15 01:57:34.3+01
27	8	What are the potential applications of nanotechnology and artificial intelligence in healthcare, and what are the ethical considerations?	2024-04-15 01:59:28.832+01	\N	Potential applications of nanotechnology in healthcare include targeted drug delivery, tissue engineering, disease detection, and imaging technologies. Artificial intelligence can be used for personalized medicine, medical imaging analysis, drug discovery, and remote patient monitoring.\n\nEthical considerations in using nanotechnology and AI in healthcare include data privacy and security, bias in algorithms leading to unequal treatment, potential job displacement, informed consent for using advanced technologies, and the need for regulatory oversight to ensure safety and efficacy of these technologies.	[{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10385763/","description":"Legal and Ethical Consideration in Artificial Intelligence in Healthcare: Who Takes Responsibility? Front. Surg. 2022;9:266. doi: 10.3389/fsurg.2022.862322 ..."},{"link":"https://www.neilsahota.com/ai-and-nanotechnology-pioneering-tomorrows-tech-evolution/","description":"Nov 29, 2023 ... ... applications of nanotechnology ... AI's societal impact, ethical considerations, and potential job displacement. ... machine learning applications."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10213273/","description":"May 12, 2023 ... Artificial intelligence in health care: Applications and legal issues. ... Healthcare uses of artificial intelligence ... Ethical considerations in ..."},{"link":"https://www.sciencedirect.com/science/article/pii/S266734522300024X","description":"Artificial Intelligence and Machine Ethics: As AI systems become more sophisticated, ethical considerations specific to AI and machine learning emerge."},{"link":"https://www.linkedin.com/pulse/ai-revolution-healthcare-transforming-patient-brandon-donnelly-mdrke","description":"Jan 9, 2024 ... This article delves into the multifaceted impact of AI in healthcare, exploring its applications in enhancing diagnostic accuracy, personalizing ..."},{"link":"https://www.europarl.europa.eu/RegData/etudes/BRIE/2016/571380/IPOL_BRI(2016)571380_EN.pdf","description":"We therefore focus on practical applications of discrete AI capabilities that assist people in performing well-defined tasks, by exploiting a wide range of AI- ..."},{"link":"https://www.pewresearch.org/internet/2018/12/10/solutions-to-address-ais-anticipated-negative-impacts/","description":"Dec 10, 2018 ... While often well-intentioned, these uses of AI are rife with ethical and human rights issues, from perpetuating racial bias to violating our ..."},{"link":"https://carnegieendowment.org/2019/08/28/new-tech-new-threats-and-new-governance-challenges-opportunity-to-craft-smarter-responses-pub-79736","description":"Aug 28, 2019 ... Cussins Newman, “Toward AI Security.” 86 European Group on Ethics in Science and New Technologies, “Statement on Artificial Intelligence ..."},{"link":"https://www.pewresearch.org/internet/2018/12/10/improvements-ahead-how-humans-and-ai-might-evolve-together-in-the-next-decade/","description":"Dec 10, 2018 ... Martijn van Otterlo, author of “Gatekeeping Algorithms with Human Ethical Bias” and assistant professor of artificial intelligence at Tilburg ..."},{"link":"https://journals.lww.com/prsgo/fulltext/2020/10000/artificial_intelligence_in_plastic_surgery_.50.aspx","description":"Oct 29, 2020 ... Like any evolving technology, however, the use of AI in healthcare raises important ethical issues, including patient autonomy and informed ..."}]	{the,potenti,applic,of,nanotechnolog,and,artifici,intellig,in,healthcar,and,the,ethic,consider}	Computer Science	2024-04-15 01:59:28.832+01
28	9	Climate change will have a profound impact on societies around the world. How will it affect migration patterns, social inequalities, and political systems?	2024-04-15 02:02:30.649+01	\N	Climate change is expected to affect migration patterns by displacing communities due to environmental disasters such as floods, droughts, and rising sea levels. This can lead to increased competition over limited resources and strain on infrastructure in receiving areas. Social inequalities may widen as marginalized populations are disproportionately affected by climate change impacts, such as lack of access to resources and opportunities for adaptation. In terms of political systems, climate change can create new challenges for governance as governments grapple with the need to address climate-related issues while balancing economic interests and societal needs.	[{"link":"https://press.un.org/en/2021/sc14445.doc.htm","description":"Feb 23, 2021 ... ... system to blunt its acute effects on food security, natural resources and migration patterns fuelling tensions across countries and regions."},{"link":"https://www.dni.gov/files/ODNI/documents/assessments/GlobalTrends_2040.pdf","description":"climate disruptions will compound these broader migration trends. ... ing world, climate effects will strain readiness ... ganizations all over the world have ..."},{"link":"https://www.whitehouse.gov/wp-content/uploads/2021/10/Report-on-the-Impact-of-Climate-Change-on-Migration.pdf","description":"of immigration, and climate change has the potential to compound related political and social ... world will have a direct impact on political stability elsewhere ..."},{"link":"https://www.pewresearch.org/internet/2021/02/18/experts-say-the-new-normal-in-2025-will-be-far-more-tech-driven-presenting-more-big-challenges/","description":"Feb 18, 2021 ... Worries: As the global pandemic unfolds, experts fear growing social and racial inequality, worsening security and privacy and the further ..."},{"link":"https://www.un.org/esa/desa/papers/2017/wp152_2017.pdf","description":"This paper is based on a background paper that the authors prepared for the World Economic and Social Survey. (WESS) 2016, devoted to the topic, ..."},{"link":"https://www.nrdc.org/stories/what-are-effects-climate-change","description":"Oct 24, 2022 ... A rapidly warming planet poses an existential threat to all life on earth. Just how bad it gets depends on how quickly we act."},{"link":"https://www.un.org/development/desa/dspd/wp-content/uploads/sites/22/2020/02/World-Social-Report2020-FullReport.pdf","description":"disadvantaged groups in economic, social and political life. Social and economic policies will have limited impact on inequality if societies continue to ..."},{"link":"https://carnegieendowment.org/2023/07/06/climate-change-and-vulnerability-in-middle-east-pub-90089","description":"Jul 6, 2023 ... However, what is needed to mitigate these impacts—a resolute political will and collaborative efforts across all sectors of society—is still ..."},{"link":"https://19january2017snapshot.epa.gov/climate-impacts/international-climate-impacts","description":"Jan 13, 2017 ... Changes in climate could have significant impacts on food production around the world. Heat stress, droughts, and flooding events may lead to ..."},{"link":"https://www.imf.org/en/News/Articles/2015/09/28/04/53/sp082500","description":"Aug 25, 2000 ... ... have profound effects on innovation across a very broad spectrum and on a global scale. We are seeing the beginnings of this now, in the ..."}]	{climat,chang,will,have,a,profound,impact,on,societi,around,the,world,how,will,affect,migrat,pattern,social,inequ,and,polit,system}	Economics	2024-04-15 02:02:30.649+01
29	9	With increased globalization, will the world become more linguistically homogenous, or will language diversity continue to thrive?	2024-04-15 02:02:44.405+01	\N	While globalization can lead to the spread of dominant languages, it also facilitates the preservation and revitalization of minority and indigenous languages. Therefore, language diversity is likely to continue thriving alongside homogenization.	[{"link":"https://www.oecd.org/education/Global-competency-for-an-inclusive-world.pdf","description":"In the background questionnaire, students will be asked to report how familiar they are with global issues; how developed their linguistic and communication ..."},{"link":"https://www.cambridgeenglish.org/Images/539682-perspectives-impact-on-multilingualism.pdf","description":"In one sense, it might be thought that linguistic diversity is in decline. Some languages are dying out, some are spoken by smaller numbers of people, and there ..."},{"link":"https://www.weforum.org/agenda/2019/04/business-case-for-diversity-in-the-workplace/","description":"Apr 29, 2019 ... In this era of globalization, diversity in the business environment is about more than gender, race and ethnicity. It now includes employees ..."},{"link":"https://www.hult.edu/blog/benefits-challenges-cultural-diversity-workplace/","description":"At Hult, diversity and global mindedness are integral to our DNA. Our mission is to prepare our students to thrive in a fast-paced, unpredictable, and ..."},{"link":"https://www.reddit.com/r/Futurology/comments/17a1mue/will_human_languages_be_more_unified_or_diverse/","description":"Oct 17, 2023 ... Direction A: For example, designing a universal artificial language, or using the existing English as a fully universal language, ..."},{"link":"https://scholarworks.uark.edu/cgi/viewcontent.cgi?article=1051&context=econuht","description":"May 14, 2023 ... growth and increase GDP. As the world becomes more interconnected, investing in linguistic diversity will yield significant economic benefits."},{"link":"https://www.reddit.com/r/changemyview/comments/nvdxw8/cmv_within_the_next_few_centuries_homogenous/","description":"Jun 8, 2021 ... I feel we will have much more countries that are like 70% main ethnicity and 30% other (with a variety of people from all around the world). For ..."},{"link":"https://desapublications.un.org/file/745/download","description":"They are also responsible for a great deal of the world's linguistic and cultural diversity, and their traditional knowledge has been and continues to be an ..."},{"link":"https://www.intechopen.com/chapters/38348","description":"Aug 22, 2012 ... In the homogenization view, barriers that prevent flows that would contribute to making cultures look alike are weak and global flows are strong ..."},{"link":"https://hbr.org/1983/05/the-globalization-of-markets","description":"(Indeed their global reach would be even greater were it not for artificial trade barriers.) They exemplify a general drift toward the homogenization of the ..."}]	{with,increas,global,will,the,world,becom,more,linguist,homogen,or,will,languag,divers,continu,to,thrive}	Computer Science	2024-04-15 02:02:44.405+01
30	9	 How is technology changing the way we create and experience art?  Can AI generate art that is truly meaningful and creative?	2024-04-15 02:03:14.985+01	\N	Technology is revolutionizing the way we create and experience art by offering new tools and platforms for artists to explore. AI is also being used to generate art, and while it can produce aesthetically pleasing works, the debate continues on whether AI can truly create art that is meaningful and creative in the human sense. Many believe that the emotional depth and personal expression in art are unique to human experience and may be challenging for AI to replicate authentically.	[{"link":"https://aelaschool.com/en/art/artificial-intelligence-art-changes/","description":"Apr 1, 2023 ... But how is AI changing the way we see and make art? ... can be very useful for creating experimental and innovative art. ... generate creative ideas ..."},{"link":"https://www.reddit.com/r/blender/comments/121lhfq/i_lost_everything_that_made_me_love_my_job/","description":"Mar 25, 2023 ... I am employed as a 3D artist in a small games company of 10 people. Our Art team is 2 people, we make 3D models, just to render them and get ..."},{"link":"https://www.pewresearch.org/internet/2018/12/10/improvements-ahead-how-humans-and-ai-might-evolve-together-in-the-next-decade/","description":"Dec 10, 2018 ... “AI will be a useful tool; I am quite a ways ... we truly love, including more creative pursuits. ... people with disabilities AI technology could ..."},{"link":"https://www.quora.com/Will-AI-art-cause-artists-to-lose-their-jobs","description":"Aug 16, 2022 ... People still teach art because they are the only ones who can. AI can't make meaningful art and is entirely unable to teach art. I assume that ..."},{"link":"https://news.harvard.edu/gazette/story/2023/08/is-art-generated-by-artificial-intelligence-real-art/","description":"Aug 15, 2023 ... It's important to welcome AI with open arms to try to understand what AI can do for us and work with it in creative ways. Any new technology is ..."},{"link":"https://folio.procreate.com/discussions/3/6/53930","description":"And this is where I think AI art will shine. (Hopefully, I can also see it creating new expectations for such professional artists, meaning they'll need to work ..."},{"link":"https://foxprinteditorial.com/2023/01/12/what-does-ai-mean-for-writers-i-asked-it/","description":"Jan 12, 2023 ... Overall, the main difference between human-generated and AI-generated stories and art is the source of the creativity and originality. While ..."},{"link":"https://yaledailynews.com/blog/2023/01/23/what-ai-art-means-for-society-according-to-yale-experts/","description":"Jan 23, 2023 ... ... really be a need to make AI ... AI art generators are changing the way people ... I think will be what AI ends up replacing,” Ebrahimi Afrouzi said."},{"link":"https://foxprinteditorial.com/2023/05/11/will-ai-replace-writers-it-already-is/","description":"May 11, 2023 ... Part of human creativity and ingenuity is in creating ever more efficient ways to accomplish things—including art. Craftspeople have been losing ..."},{"link":"https://www.interaction-design.org/literature/topics/ai-generated-art","description":"How Does Artificial Intelligence Create Art? The Artistic Collaboration: Human-AI Synergy; Can AI Replace Human Creativity in Art? Originality in AI-Generated ..."}]	{how,technolog,chang,the,wai,creat,and,experi,art,can,ai,gener,art,truli,meaning,and,creativ}	Computer Science	2024-04-15 02:03:14.985+01
31	9	Explain the theory of relativity and its implications for our understanding of space and time.\nDiscuss the evidence for evolution and the different mechanisms that drive it.\nAnalyze the ethical considerations surrounding a recent scientific advancement (e.g., gene editing).	2024-04-15 02:04:15.181+01	\N	The theory of relativity, proposed by Albert Einstein, describes how gravity affects matter, space, and time. It consists of two main parts: the special theory of relativity and the general theory of relativity. Special relativity explains the relationship between space and time, while general relativity describes the force of gravity as a curvature in space-time. This theory has implications for our understanding of space and time by showing that they are not separate entities but are interwoven into a single fabric known as space-time.\n\nEvolution is the process by which species change over time, driven by natural selection, genetic drift, gene flow, and mutation. Evidence for evolution includes the fossil record, comparative anatomy, embryology, molecular biology, and biogeography. These mechanisms work together to create genetic variation in populations, leading to adaptation and the formation of new species over generations.\n\nEthical considerations surrounding gene editing technologies like CRISPR-Cas9 include issues related to informed consent, equitable access to treatment, unintended consequences of genetic alterations, and concerns about "designer babies." There are also debates about how to balance the potential benefits of gene editing, such as treating genetic diseases, with the risks of altering the human germline and introducing heritable changes to future generations.	[{"link":"https://www.pewresearch.org/science/2016/07/26/human-enhancement-the-scientific-and-ethical-dimensions-of-striving-for-perfection/","description":"Jul 26, 2016 ... Human enhancement is at least as old as human civilization. People have been trying to enhance their physical and mental capabilities for ..."},{"link":"https://carnegieendowment.org/2019/08/28/new-tech-new-threats-and-new-governance-challenges-opportunity-to-craft-smarter-responses-pub-79736","description":"Aug 28, 2019 ... Significant technological advances are being made across a range of fields, including information communications technology (ICT); ..."},{"link":"https://www.nasa.gov/wp-content/uploads/2015/01/archaeology_anthropology_and_interstellar_communication_tagged.pdf","description":"the current strictures of space-time and of Relativity Theory, there will be a ... modern evolutionary theory by scientists of various disciplines. ... e.g., our ..."},{"link":"https://opentextbc.ca/introductiontosociology2ndedition/chapter/chapter-3-culture/","description":"While each type of diet claims scientific evidence to support its health and other ... an elaborate cultural map of meaning: the modern biomedical understanding ..."},{"link":"https://www.pnas.org/doi/10.1073/pnas.1501798112","description":"The proposal to enhance the human genetic endowment by genetic cloning of eminent individuals is not warranted. Genomes can be cloned; individuals cannot. In ..."},{"link":"https://nap.nationalacademies.org/read/4962/chapter/8","description":"This section describes linkages among student learning, teaching, and classroom situations. This discussion on developing student understanding, including the ..."},{"link":"https://www.sciencedirect.com/science/article/pii/S0040162523002731","description":"The recent devastating pandemic has drastically reminded humanity of the importance of constant scientific and technological progress. A strong ..."},{"link":"https://medlineplus.gov/genetics/understanding/therapy/procedures/","description":"Feb 28, 2022 ... Gene therapy can compensate for genetic alterations in a couple different ways. Gene transfer therapy introduces new genetic material into cells ..."},{"link":"https://iep.utm.edu/philosophy-of-biology/","description":"Others think that nothing in the current understanding of evolution predicts a drive towards increased complexity. ... describe science (e.g., theory vs."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2685272/","description":"The immediate consequence of the extended life expectancy is represented by the increasing number of older people in developed countries, an artefact of human ..."}]	{explain,the,theori,of,rel,and,implic,for,understand,of,space,and,time,discuss,the,evid,for,evolut,and,the,differ,mechan,drive,analyz,the,ethic,consider,surround,a,recent,scientif,advanc,e,g,gene,edit}	Political Science	2024-04-15 02:04:15.181+01
32	9	Explain the theory of relativity and its implications for our understanding of space and time.\nDiscuss the evidence for evolution and the different mechanisms that drive it.\nAnalyze the ethical considerations surrounding a recent scientific advancement (e.g., gene editing).	2024-04-15 02:04:16.077+01	\N	1. The theory of relativity, proposed by Albert Einstein, consists of two parts: special relativity and general relativity. Special relativity deals with the relationship between space and time in the absence of gravity, explaining how the laws of physics are the same for all observers in uniform motion. General relativity extends this to include gravity, suggesting that massive objects warp spacetime. This theory revolutionized our understanding of space and time by showing that they are intertwined and relative to the observer's frame of reference.\n\n2. Evolution is the process by which living organisms change and diversify over time. The evidence for evolution comes from various sources, including the fossil record, comparative anatomy, molecular biology, and biogeography. The mechanisms that drive evolution include natural selection, genetic drift, gene flow, and mutations. These mechanisms act on heritable traits, leading to changes in populations over successive generations.\n\n3. Gene editing, such as the CRISPR-Cas9 technology, raises ethical considerations due to its potential to alter the human germline, leading to heritable genetic changes. Issues surrounding gene editing include concerns about unintended consequences, equity in access to this technology, the potential for designer babies, and the moral implications of manipulating the human genome. Ethical guidelines and regulations are essential to ensure that gene editing is used responsibly and ethically.	[{"link":"https://www.pewresearch.org/science/2016/07/26/human-enhancement-the-scientific-and-ethical-dimensions-of-striving-for-perfection/","description":"Jul 26, 2016 ... Human enhancement is at least as old as human civilization. People have been trying to enhance their physical and mental capabilities for ..."},{"link":"https://carnegieendowment.org/2019/08/28/new-tech-new-threats-and-new-governance-challenges-opportunity-to-craft-smarter-responses-pub-79736","description":"Aug 28, 2019 ... Significant technological advances are being made across a range of fields, including information communications technology (ICT); ..."},{"link":"https://www.nasa.gov/wp-content/uploads/2015/01/archaeology_anthropology_and_interstellar_communication_tagged.pdf","description":"the current strictures of space-time and of Relativity Theory, there will be a ... modern evolutionary theory by scientists of various disciplines. ... e.g., our ..."},{"link":"https://opentextbc.ca/introductiontosociology2ndedition/chapter/chapter-3-culture/","description":"While each type of diet claims scientific evidence to support its health and other ... an elaborate cultural map of meaning: the modern biomedical understanding ..."},{"link":"https://www.pnas.org/doi/10.1073/pnas.1501798112","description":"The proposal to enhance the human genetic endowment by genetic cloning of eminent individuals is not warranted. Genomes can be cloned; individuals cannot. In ..."},{"link":"https://nap.nationalacademies.org/read/4962/chapter/8","description":"This section describes linkages among student learning, teaching, and classroom situations. This discussion on developing student understanding, including the ..."},{"link":"https://www.sciencedirect.com/science/article/pii/S0040162523002731","description":"The recent devastating pandemic has drastically reminded humanity of the importance of constant scientific and technological progress. A strong ..."},{"link":"https://medlineplus.gov/genetics/understanding/therapy/procedures/","description":"Feb 28, 2022 ... Gene therapy can compensate for genetic alterations in a couple different ways. Gene transfer therapy introduces new genetic material into cells ..."},{"link":"https://iep.utm.edu/philosophy-of-biology/","description":"Others think that nothing in the current understanding of evolution predicts a drive towards increased complexity. ... describe science (e.g., theory vs."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2685272/","description":"The immediate consequence of the extended life expectancy is represented by the increasing number of older people in developed countries, an artefact of human ..."}]	{explain,the,theori,of,rel,and,implic,for,understand,of,space,and,time,discuss,the,evid,for,evolut,and,the,differ,mechan,drive,analyz,the,ethic,consider,surround,a,recent,scientif,advanc,e,g,gene,edit}	Political Science	2024-04-15 02:04:16.077+01
33	9	Explain the theory of relativity and its implications for our understanding of space and time.\nDiscuss the evidence for evolution and the different mechanisms that drive it.\nAnalyze the ethical considerations surrounding a recent scientific advancement (e.g., gene editing).	2024-04-15 02:04:17.883+01	\N	1. The theory of relativity, developed by Albert Einstein, consists of two parts: special relativity and general relativity. Special relativity describes the relationship between space and time and how they are perceived differently depending on the observer's motion. General relativity extends this to include the influence of gravity on the fabric of spacetime. This theory has major implications for our understanding of the universe, as it revolutionized concepts of space, time, and gravity.\n\n2. Evidence for evolution includes fossil records, comparative anatomy, embryology, molecular biology, and biogeography. The mechanisms that drive evolution are primarily natural selection, genetic drift, gene flow, mutation, and sexual selection, all of which contribute to the diversity of life on Earth.\n\n3. The ethical considerations surrounding gene editing technologies, such as CRISPR-Cas9, involve concerns about unintended consequences, potential for germline editing leading to heritable changes, issues of equity in access to such technologies, and the ethical implications of altering the genetic makeup of future generations. Regulation, transparency, and public engagement are crucial in addressing these ethical considerations.	[{"link":"https://www.pewresearch.org/science/2016/07/26/human-enhancement-the-scientific-and-ethical-dimensions-of-striving-for-perfection/","description":"Jul 26, 2016 ... Human enhancement is at least as old as human civilization. People have been trying to enhance their physical and mental capabilities for ..."},{"link":"https://carnegieendowment.org/2019/08/28/new-tech-new-threats-and-new-governance-challenges-opportunity-to-craft-smarter-responses-pub-79736","description":"Aug 28, 2019 ... Significant technological advances are being made across a range of fields, including information communications technology (ICT); ..."},{"link":"https://www.nasa.gov/wp-content/uploads/2015/01/archaeology_anthropology_and_interstellar_communication_tagged.pdf","description":"the current strictures of space-time and of Relativity Theory, there will be a ... modern evolutionary theory by scientists of various disciplines. ... e.g., our ..."},{"link":"https://opentextbc.ca/introductiontosociology2ndedition/chapter/chapter-3-culture/","description":"While each type of diet claims scientific evidence to support its health and other ... an elaborate cultural map of meaning: the modern biomedical understanding ..."},{"link":"https://www.pnas.org/doi/10.1073/pnas.1501798112","description":"The proposal to enhance the human genetic endowment by genetic cloning of eminent individuals is not warranted. Genomes can be cloned; individuals cannot. In ..."},{"link":"https://nap.nationalacademies.org/read/4962/chapter/8","description":"This section describes linkages among student learning, teaching, and classroom situations. This discussion on developing student understanding, including the ..."},{"link":"https://www.sciencedirect.com/science/article/pii/S0040162523002731","description":"The recent devastating pandemic has drastically reminded humanity of the importance of constant scientific and technological progress. A strong ..."},{"link":"https://medlineplus.gov/genetics/understanding/therapy/procedures/","description":"Feb 28, 2022 ... Gene therapy can compensate for genetic alterations in a couple different ways. Gene transfer therapy introduces new genetic material into cells ..."},{"link":"https://iep.utm.edu/philosophy-of-biology/","description":"Others think that nothing in the current understanding of evolution predicts a drive towards increased complexity. ... describe science (e.g., theory vs."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2685272/","description":"The immediate consequence of the extended life expectancy is represented by the increasing number of older people in developed countries, an artefact of human ..."}]	{explain,the,theori,of,rel,and,implic,for,understand,of,space,and,time,discuss,the,evid,for,evolut,and,the,differ,mechan,drive,analyz,the,ethic,consider,surround,a,recent,scientif,advanc,e,g,gene,edit}	Political Science	2024-04-15 02:04:17.883+01
34	10	Evaluate the potential benefits and drawbacks of a specific economic policy (e.g., free trade agreements).	2024-04-15 02:05:31.985+01	\N	Potential benefits of free trade agreements include increased market access for goods and services, lower prices for consumers due to increased competition, and economic growth resulting from increased trade and investment.\n\nDrawbacks may include job losses in certain industries that are unable to compete with foreign companies, potential exploitation of labor in countries with weaker regulations, and loss of sovereignty as countries may have to conform to international trade rules that may not necessarily align with their domestic priorities.	[{"link":"https://www.wilsoncenter.org/chapter-3-trade-agreements-and-economic-theory","description":"... benefits of free trade may be greater than the static benefits. ... trade policy action on a specific sector, not the general economy. ... potential benefits of a ..."},{"link":"https://www.imf.org/external/np/exr/ib/2001/110801.htm","description":"Integration into the world economy has proven a powerful means for countries to promote economic growth, development, and poverty reduction."},{"link":"https://www.investopedia.com/terms/f/free-trade.asp","description":"Governments with free-trade policies or agreements ... Or, it might have policies in place that exempt specific ... Free Trade Pros and Cons. Pros. Allows consumers ..."},{"link":"https://www.worldbank.org/en/topic/trade/publication/the-african-continental-free-trade-area","description":"Jul 27, 2020 ... ... benefits from economic ... agreement's potential gains while minimizing ... economics and public policy including trade policy, export ..."},{"link":"https://www.investopedia.com/terms/f/free_trade_area.asp","description":"Jan 11, 2024 ... Free trade areas are formed by groups of countries that sign agreements to facilitate trade and reduce trade barriers."},{"link":"https://op.europa.eu/webpub/com/eu-what-it-is/en/","description":"The European Union (EU) is a unique economic and political union between 27 European countries. The EU that we know today has its roots in several treaties ..."},{"link":"https://www.oecd.org/trade/topics/trade-and-the-environment/","description":"... trade and environment policies harness the benefits of trade while minimizing environmental costs? ... Economic growth resulting from trade ... trade agreements has ..."},{"link":"https://www.cfr.org/backgrounder/naftas-economic-impact","description":"The United States had already completed a free trade agreement (FTA) ... The Center for Economic and Policy ... evaluates the costs and benefits of NAFTA for the ..."},{"link":"https://www.whitehouse.gov/briefing-room/presidential-actions/2023/10/30/executive-order-on-the-safe-secure-and-trustworthy-development-and-use-of-artificial-intelligence/","description":"Oct 30, 2023 ... ... potential benefits posed by AI. In ... This work shall include the development of AI assurance policy — to evaluate ... (xxii) the Assistant to the ..."},{"link":"https://www.international.gc.ca/transparency-transparence/state-trade-commerce-international/2022.aspx?lang=eng","description":"Sep 6, 2023 ... ... evaluate these benefits given limitations with existing analytical models (GAC, 2020). Advancing broader policy priorities in FTAs. Countries ..."}]	{evalu,the,potenti,benefit,and,drawback,of,a,specif,econom,polici,e,g,free,trade,agreement}	Economics	2024-04-15 02:05:31.985+01
35	10	Analyze the factors that contribute to economic growth and development in different countries.\n	2024-04-15 02:05:50.445+01	\N	Several factors contribute to economic growth and development in different countries, including:\n\n1. Investment in physical and human capital: Countries that invest in infrastructure, technology, and education tend to experience higher economic growth as it increases productivity and competitiveness.\n\n2. Strong institutions and governance: Countries with effective legal systems, property rights protection, and low levels of corruption attract more investment and foster economic development.\n\n3. Access to finance: A well-functioning financial system that provides access to credit and capital for businesses and individuals can spur economic growth.\n\n4. Export-oriented policies: Countries that promote trade, exports, and foreign investment tend to experience higher economic growth by expanding markets and creating new opportunities.\n\n5. Innovation and technology advancement: Countries that focus on research and development, technology transfer, and innovation are likely to see sustainable economic growth and development.\n\n6. Sound macroeconomic policies: Stable inflation rates, manageable public debt, and prudent fiscal and monetary policies create a favorable environment for economic growth.\n\n7. Infrastructure development: Good transportation, communication, and energy infrastructure are essential for economic activities and can drive growth in various sectors.\n\n8. Skilled workforce: A well-educated and skilled labor force can drive innovation, productivity, and economic growth in various industries.\n\nBy focusing on these factors, countries can create conducive environments for economic growth and development.	[{"link":"https://www.imf.org/external/pubs/ft/sdn/2015/sdn1513.pdf","description":"Jun 1, 2015 ... discuss potential global and country-specific drivers of income inequality across ... factors drive growth, the income level, and income ..."},{"link":"https://www.investopedia.com/ask/answers/040715/why-are-factors-production-important-economic-growth.asp","description":"Land is defined as agricultural land, commercial real estate, and natural resources, such as oil, gas, and other commodities. Labor is made up of the ..."},{"link":"https://www.imf.org/en/Topics/Inequality/introduction-to-inequality","description":"There is no easy answer, but it will depend on several country-specific factors, including the growth context in which inequality arises, along with societal ..."},{"link":"https://www.unodc.org/documents/data-and-analysis/gsh/Booklet1.pdf","description":"By bringing together the available data, the United. Nations Office on Drugs and Crime seeks to shed light on different phenomena, from lethal gang violence and ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9467361/","description":"Sep 12, 2022 ... However, the study employed the level of economic development and tourism growth as a factor to cluster the countries for analysis; the results ..."},{"link":"https://www.dni.gov/files/ODNI/documents/assessments/GlobalTrends_2040.pdf","description":"(OECD) countries would help governments deal with economic ... Slowing economic growth and gains in human development, coupled with rapid ... development in many ..."},{"link":"https://www.unwomen.org/en/what-we-do/economic-empowerment/facts-and-figures","description":"... affect both developing and developed economies, and women in all regions. ... development in developing countries. The survey ... Five things to accelerate women's ..."},{"link":"https://jamanetwork.com/journals/jamanetworkopen/fullarticle/2811562","description":"Nov 9, 2023 ... One recent cross-country study considered 9 direct and 17 indirect factors but analyzed only stunting, underweight, and wasting (omitting ..."},{"link":"https://www.kff.org/global-health-policy/issue-brief/assessing-pepfars-impact-analysis-of-economic-and-educational-spillover-effects-in-pepfar-countries/","description":"Dec 12, 2022 ... ... GDP growth rate ... Future analysis could seek to explore other factors that may contribute ... Child Health Spillover Effects in PEPFAR Countries ..."},{"link":"https://www.worldbank.org/en/country/china/overview","description":"... economic growth. Data and research help us ... development experiences enhance the Bank's global knowledge and capacity to help other developing countries."}]	{analyz,the,factor,contribut,to,econom,growth,and,develop,in,differ,countri}	Political Science	2024-04-15 02:05:50.445+01
36	10	\nCompare and contrast different economic systems (e.g., capitalism vs. socialism).	2024-04-15 02:06:04.044+01	\N	Capitalism is an economic system based on private ownership of the means of production and the pursuit of profit. In contrast, socialism is an economic system where the means of production are owned and controlled by the state or the community as a whole. Capitalism promotes individual initiative and competition, while socialism focuses on collective welfare and shared ownership. Capitalism allows for a free market economy with minimal government intervention, while socialism emphasizes government planning and distribution of resources.	[{"link":"https://www.investopedia.com/articles/personal-finance/082415/pros-and-cons-capitalist-vs-socialist-economies.asp","description":"Dec 27, 2023 ... Capitalist and socialist economies are very different; capitalism relies on the markets, while socialism relies on government planning."},{"link":"https://www.thegreatcourses.com/courses/capitalism-vs-socialism-comparing-economic-systems","description":"6 days ago ... Stuart, Ph.D. Virtually all countries around the world debate the role of government and market institutions. InstitutionNortheastern Illinois ..."},{"link":"https://www.investopedia.com/ask/answers/020915/what-are-differences-between-capitalism-and-socialism.asp","description":"While capitalism and socialism are often presented as opposing economic systems, in reality, the economies of most countries exist on a spectrum ..."},{"link":"https://www.amazon.com/Capitalism-vs-Socialism-Comparing-Economic/dp/1629975265","description":"... other, from the rise of Soviet communism to the future of the European Union and beyond. As you compare and contrast the many ways societies tackle economic ..."},{"link":"https://byjus.com/commerce/differences-between-capitalist-and-socialist-economy/","description":"... Socialist economic system and both of them function at variance with each other. However, both these systems have their own merits and demerits and it is up ..."},{"link":"https://www.thoughtco.com/socialism-vs-capitalism-4768969","description":"Apr 11, 2022 ... Socialism and capitalism are the two main economic systems used in developed countries today. The main difference between capitalism and ..."},{"link":"https://www.bu.edu/eci/files/2021/08/Comparative-Economic-Systems.pdf","description":"Most countries can be characterized as having a mixed economic system that combines elements of market and planned economies. For example, in some countries ..."},{"link":"https://www.pewresearch.org/politics/2019/10/07/in-their-own-words-behind-americans-views-of-socialism-and-capitalism/","description":"Oct 7, 2019 ... ... or in other countries, such as Venezuela or ... contrast with criticisms of ... SocialismCapitalismEconomic SystemsFederal Government. MOST POPULAR."},{"link":"https://webnew.ped.state.nm.us/wp-content/uploads/2018/01/SocialStudiesStandards_9-12.pdf","description":"Compare and contrast the relationships over time of Native American tribes in New Mexico with other cultures;. 2. Analyze the geographic, economic, social and ..."},{"link":"https://courses.lumenlearning.com/wm-introductiontosociology/chapter/capitalism-and-socialism/","description":"Learning Outcomes. Compare and contrast capitalism and socialism ... economic systems: capitalism and socialism. Under ... or all of the economy is centrally ..."}]	{compar,and,contrast,differ,econom,system,e,g,capit,vs,social}	Economics	2024-04-15 02:06:04.044+01
37	10	Compare and contrast the leadership styles and political philosophies of two historical figures.	2024-04-15 02:06:22.583+01	\N	Sure! Could you please specify the two historical figures you would like me to compare and contrast in terms of their leadership styles and political philosophies?	[{"link":"https://www.cde.ca.gov/be/st/ss/documents/histsocscistnd.pdf","description":"Oct 9, 1998 ... 4 Students compare and contrast the locations of people, places, and environments and describe their characteristics. 1. Determine the relative ..."},{"link":"https://www.utc.edu/health-education-and-professional-studies/center-for-reflective-citizenship/2017-faculty-fellow-american-history-and-government-teaching-modules/thomas-hobbes-john-locke","description":"Compare and contrast their beliefs about the ... What do you identify as the key difference between the two? ... The Center for Civic Education's We the People ..."},{"link":"https://www.pewresearch.org/politics/2014/06/12/political-polarization-in-the-american-public/","description":"Jun 12, 2014 ... ... important to them to live in a place where most people share their political views. Nearly two-thirds (63%) of consistent conservatives and ..."},{"link":"https://www.nps.gov/jame/learn/historyculture/jamestown-and-plymouth-compare-and-contrast.htm","description":"Aug 3, 2023 ... Thirteen years later, 102 settlers aboard the Mayflower landed in Massachusetts at a place they named Plymouth. With these two colonies, English ..."},{"link":"https://www.nysed.gov/sites/default/files/programs/curriculum-instruction/ss-framework-k-8a2.pdf","description":"Identify and explain different types of political systems and ideologies used at various times in colonial history and the early history of the United ..."},{"link":"https://www.nationalgeographic.org/article/chinese-religions-and-philosophies/","description":"Oct 19, 2023 ... He was a philosopher and political figure ... two thousand years ago. In contrast to ... important part of the Taoist religion. Despite their ..."},{"link":"https://www.nj.gov/education/cccs/2020/2020%20NJSLS-SS.pdf","description":"b: Compare and contrast the economic ideologies of the two major political parties regarding the role of government during the New Deal and today. Evidence ..."},{"link":"https://dk.usembassy.gov/usa-i-skolen/presidential-elections-and-the-american-political-system/","description":"Now, let us look at the history of the two major political parties in the U.S.. The Founding Fathers disagree. Differing political views among U.S. Founding ..."},{"link":"https://iep.utm.edu/hobmoral/","description":"Table of Contents. Introduction; Life and Times; Two Intellectual Influences; Ethics and Human Nature. Materialism Versus Self-Knowledge; The Poverty of Human ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5746707/","description":"Oct 14, 2017 ... To explore the role of leadership styles used by nurse managers in nursing turnover and patient satisfaction. Two categories of ED nurse ..."}]	{compar,and,contrast,the,leadership,style,and,polit,philosophi,of,two,histor,figur}	Computer Science	2024-04-15 02:06:22.583+01
38	10	Analyze the primary causes and effects of a specific war or conflict.	2024-04-15 02:06:34.972+01	\N	One example of a war and its causes and effects is the Vietnam War. The primary cause of the Vietnam War was the spread of communism in the region, with the United States and its allies supporting the anti-communist South Vietnam government, while North Vietnam and the Viet Cong fought for reunification under a communist regime.\n\nThe effects of the Vietnam War were extensive and long-lasting. It resulted in the loss of millions of lives, including soldiers and civilians. The war caused significant economic damage to Vietnam and neighboring countries. Social and political divisions in the United States deepened due to public opposition to the war. The use of chemical defoliants like Agent Orange also led to environmental and health issues for generations.\n\nOverall, the Vietnam War had far-reaching consequences on the countries involved, as well as on the global political landscape during the Cold War era.	[{"link":"https://www.nysed.gov/sites/default/files/programs/curriculum-instruction/ss-framework-9-12.pdf","description":"Identify causes and effects using examples from different time periods and courses of study across several grade levels. 3. Identify, analyze, and evaluate the ..."},{"link":"https://www.imf.org/en/Blogs/Articles/2022/03/15/blog-how-war-in-ukraine-is-reverberating-across-worlds-regions-031522","description":"Mar 15, 2022 ... The conflict is a major blow to the global economy that will hurt growth and raise prices. Beyond the suffering and humanitarian crisis from ..."},{"link":"https://www.ohchr.org/en/news/2023/03/conflict-and-violence-are-primary-causes-hunger-and-famine-special-rapporteur-right","description":"Mar 9, 2023 ... ... Special Rapporteur between food systems and malnutrition. The Rapporteur's analysis on the impact of global food systems on women, young ..."},{"link":"https://www.cde.ca.gov/be/st/ss/documents/histsocscistnd.pdf","description":"Oct 9, 1998 ... 10.8 Students analyze the causes and consequences of World War II. ... turning points of the war, the principal theaters of conflict, key ..."},{"link":"https://www.washingtoninstitute.org/policy-analysis/religion-and-israel-palestinian-conflict-cause-consequence-and-cure","description":"May 31, 2018 ... As far back as the 1948 war, some Jewish ... This results from two major factors, as follows: ... particular and Jewish people in general."},{"link":"https://www.archives.gov/education/lessons/korean-conflict","description":"May 19, 2021 ... ... major battle waged in the name of containment: the Korean War. ... conflict that would eventually escalate into the Vietnam War. ... analysis. This ..."},{"link":"https://online.norwich.edu/online/about/resource-library/six-causes-world-war-i","description":"... War I are equally as important as understanding the conflict's devastating effects. ... particular, playing ... For Germany, leading into World War I, historians ..."},{"link":"https://www.unodc.org/documents/data-and-analysis/gsh/Booklet1.pdf","description":"... conflict and war, self-inflicted death (suicide) ... Homicide is among the leading causes ... distribution of resources, making it difficult to pinpoint causes and ..."},{"link":"https://www.fldoe.org/core/fileparse.php/20653/urlt/6-4.pdf","description":"1.1. Analyze primary and ... 2.6. Examine the causes, course, and consequences of the French and Indian War. ... Analyze how certain political ideologies conflict ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2080482/","description":"... war itself (primary prevention). While in a ... A certain proportion of war ... In the European Union, social institutions for dealing with conflict have evolved to ..."}]	{analyz,the,primari,caus,and,effect,of,a,specif,war,or,conflict}	Earth Science	2024-04-15 02:06:34.972+01
39	10	Discuss the historical context of a particular literary movement and how it shaped the themes explored.	2024-04-15 02:07:38.974+01	\N	The historical context of a literary movement refers to the events, attitudes, and ideas prevalent during the time the movement emerged, which influenced the themes explored by writers associated with that movement. For example, the Romantic movement in the late 18th and early 19th centuries was shaped by a rejection of Enlightenment rationalism and a focus on nature, emotion, and individualism. This historical context influenced Romantic writers to explore themes such as the beauty of nature, the power of the imagination, and the heroism of the individual.	[{"link":"https://iep.utm.edu/literary/","description":"Literary theorists trace the history and evolution of the different genres—narrative, dramatic, lyric—in addition to the more recent emergence of the novel and ..."},{"link":"https://www.socialstudies.org/national-curriculum-standards-social-studies-chapter-2-themes-social-studies","description":"Personal identity is shaped by an individual's ... In exploring this theme, students confront questions such ... Within this context, students in early grades ..."},{"link":"https://valenciacollege.edu/academics/departments/arts-humanities-west/writing/historical-cultural.php","description":"What is historical and cultural context? ... What are the philosophical ideas of the time? ... Is the artist identified with a particular movement, school, or “-ism ..."},{"link":"https://jcsr.springeropen.com/articles/10.1186/s40991-018-0039-y","description":"Jan 22, 2019 ... ... particular period making it easier to follow the evolutionary process of CSR. Historical roots of social responsibility. For Chaffee (2017) ..."},{"link":"https://bulletin.case.edu/course-descriptions/hsty/hsty.pdf","description":"archetypal American identities, and how issues such as race, class, gender, sexuality, religion, and historical context have shaped the writing, reading and ..."},{"link":"https://www.humanitiestexas.org/news/articles/harlem-renaissance-what-was-it-and-why-does-it-matter","description":"... literary movement. Under the editorship of Alain ... , Wallace Thurman spearheaded another single-issue literary ... connection to a broader African American ..."},{"link":"https://plato.stanford.edu/entries/history/","description":"Feb 18, 2007 ... ... explain” a given historical event in a given context ... historical writing and rhetoric that are characteristic of a given period or school."},{"link":"https://www.history.com/topics/roaring-twenties/harlem-renaissance","description":"Oct 29, 2009 ... Lasting roughly from the 1910s through the mid-1930s, the period is considered a golden age in African American culture, manifesting in ..."},{"link":"https://mlpp.pressbooks.pub/introductiontohumanitiesv2/chapter/literature-including-fiction-drama-poetry-and-prose/","description":"How does literature reveal the values of a given culture or time period? ... How we can use literature to explain or clarify our own ideas about the world?"},{"link":"https://www.kennedy-center.org/education/resources-for-educators/classroom-resources/media-and-interactives/media/dance/do-you-wanna-dance/","description":"Find out how Alvin Ailey explored themes of African American heritage and culture through dance. ... historical context or significance may have changed since ..."}]	{discuss,the,histor,context,of,a,particular,literari,movement,and,how,shape,the,theme,explor}	Computer Science	2024-04-15 02:07:38.974+01
40	11	Analyze the economic arguments for and against government intervention in the form of price controls in markets experiencing shortages due to natural disasters.	2024-04-15 02:28:30.11+01	\N	The economic arguments for government intervention in the form of price controls during shortages caused by natural disasters are to prevent price gouging and ensure that essential goods remain affordable for all consumers. This can help prevent disadvantaged populations from being priced out of necessary goods during emergencies.\n\nHowever, the economic arguments against price controls in such situations include the potential for unintended consequences such as creating black markets, reducing incentives for suppliers to enter the market, and distorting the signals that prices provide for resource allocation. Price controls can also lead to inefficient allocation of resources and hinder supply chain flexibility.\n\nIn summary, while price controls during shortages caused by natural disasters may have short-term benefits in ensuring affordability, they can also have long-term negative economic implications by distorting market mechanisms and hindering efficient resource allocation.	[{"link":"https://www.investopedia.com/terms/p/price-ceiling.asp","description":"Price ceilings are typically imposed on consumer staples, like food, gas, or medicine, often after a crisis or particular event sends costs skyrocketing. The ..."},{"link":"https://www.oecd.org/coronavirus/policy-responses/the-territorial-impact-of-covid-19-managing-the-crisis-across-levels-of-government-d3e314e1/","description":"... on financial markets ... The Australian Government introduced a National Cabinet to address health and economic issues related ... government action” based on seven ..."},{"link":"https://www.imf.org/EXTERNAL/PUBS/FT/ISSUES6/INDEX.HTM","description":"It finds that corruption discourages investment, limits economic growth, and alters the composition of government spending, often to the detriment of future ..."},{"link":"https://www.cato.org/policy-analysis/government-pandemic","description":"Nov 17, 2020 ... Americans and their political leaders are understandably worried about COVID-19 and its effects, both on human health and the economy. That ..."},{"link":"https://www.whitehouse.gov/cea/written-materials/2021/06/17/why-the-pandemic-has-disrupted-supply-chains/","description":"Jun 17, 2021 ... ... due to shortages of inputs from other businesses. ... Supply-chain disruptions are also having a material impact on consumer prices, especially in ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10111309/","description":"Apr 18, 2023 ... Criticisms most often cite the social costs of the shortages, but, we have found another, as yet unknown, cost: price-gouging regulations ..."},{"link":"https://www.econlib.org/library/Topics/College/marketfailures.html","description":"Most economic arguments for government intervention are based on the idea that the marketplace cannot provide public goods or handle externalities. Public ..."},{"link":"https://www.brookings.edu/articles/what-does-economic-evidence-tell-us-about-the-effects-of-rent-control/","description":"Oct 18, 2018 ... ... market rates, going back to Friedman and Stigler (1946). They argued that a cap on rents would lead landlords to sell their rental ..."},{"link":"https://www3.weforum.org/docs/WEF_Global_Risks_Report_2023.pdf","description":"intervention in markets over the next two years. ... Despite some longer-term government action on the ... Natural-disasters/Pakistan-faces-hunger-crisis-as-."},{"link":"https://www.samhsa.gov/sites/default/files/dtac/srb-low-ses_2.pdf","description":"This issue of the Supplemental Research Bulletin focuses on how people in poverty, with low incomes, and of low socioeconomic status (SES) experience disasters."}]	{analyz,the,econom,argument,for,and,against,govern,intervent,in,the,form,of,price,control,in,market,experienc,shortag,due,to,natur,disast}	Economics	2024-04-15 02:28:30.11+01
41	11	Explain the role of epigenetics in the development of complex diseases like cancer, and discuss the ethical implications of potential epigenetic therapies.\n	2024-04-15 02:28:59.836+01	\N	Epigenetics plays a significant role in the development of complex diseases like cancer by influencing gene expression without altering the DNA sequence. Aberrant epigenetic modifications can promote the uncontrolled growth and spread of cancer cells. Epigenetic changes can affect key genes involved in cell cycle regulation, DNA repair, and apoptosis, which are crucial processes in cancer development.\n\nThe potential use of epigenetic therapies in cancer treatment raises ethical implications related to issues such as:\n\n1. Ethical use of genetic information: Epigenetic therapies may involve manipulating an individual's genetic information, raising concerns about privacy, consent, and potential misuse of personal data.\n\n2. Inequality and access to treatment: Ethical considerations arise regarding the equitable distribution of epigenetic therapies, ensuring that all individuals have access to these potentially life-saving treatments.\n\n3. Long-term effects: The long-term consequences of epigenetic therapies are not fully understood, raising concerns about unintended side effects and potential risks to future generations.\n\n4. Personal autonomy: Ethical dilemmas may arise concerning the right of individuals to make informed decisions about their own medical treatments, including the use of epigenetic therapies.\n\nIn conclusion, while epigenetic therapies hold promise in the treatment of complex diseases like cancer, it is essential to address the ethical implications associated with their use to ensure responsible and equitable deployment of these innovative treatments.	[{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10446850/","description":"Aug 23, 2023 ... Such modifications include processes like DNA methylation, histone modification, and non-coding RNA regulation [1]. Far from being limited to ..."},{"link":"https://clinicalepigeneticsjournal.biomedcentral.com/articles/10.1186/s13148-022-01263-1","description":"Mar 25, 2022 ... ... epigenetic causality of complex diseases ... potential of epigenetic interventions and their consequences should be developed. ... cancer and other ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5075137/","description":"Epigenetic mechanisms also regulate development and adaptations during the life of an organism, and their alterations may result in various disorders such as ..."},{"link":"https://www.nature.com/articles/s41392-022-01211-8","description":"Nov 7, 2022 ... Epigenetics represents a reversible mechanism in regulating the function of the genome without altering the underlying DNA sequence of the ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3034450/","description":"... development has grown, so too has the ... The potential for a significant epigenetic role ... Epigenetics in Human Disease and Prospects for Epigenetic Therapy."},{"link":"https://molecular-cancer.biomedcentral.com/articles/10.1186/s12943-020-01197-3","description":"Apr 27, 2020 ... ... significance of epigenetics in the development and treatment of cancer. Mechanisms of epigenetic modifications. The epigenetic modifications ..."},{"link":"https://www.nature.com/articles/s41392-022-00974-4","description":"Apr 23, 2022 ... Then, we highlight the pathogenesis of microbiota dysbiosis in disease development and progression, primarily associated with dysregulation of ..."},{"link":"https://www.sciencedirect.com/science/article/pii/S0272735820300180","description":"Prospectively, epigenetic profiles may represent trait and therapy response markers. Abstract. Mental disorders are highly complex and multifactorial in origin, ..."},{"link":"https://nida.nih.gov/research-topics/prevention","description":"Sep 14, 2023 ... Researchers are developing and testing new ways to prevent substance use, addiction, and other substance-related harms."},{"link":"https://www.pbs.org/wgbh/nova/transcripts/3413_genes.html","description":"Oct 16, 2007 ... ... diseases like cancer. JEAN-PIERRE ISSA: If ... complex diseases, from Alzheimer's to autism, may have epigenetic triggers. ... impact on brain ..."}]	{explain,the,role,of,epigenet,in,the,develop,of,complex,diseas,like,cancer,and,discuss,the,ethic,implic,of,potenti,epigenet,therapi}	Computer Science	2024-04-15 02:28:59.836+01
42	11	What is machine learning? 	2024-04-15 02:29:16.348+01	\N	Machine learning is a branch of artificial intelligence where systems are designed to learn from data and improve their performance on tasks without being explicitly programmed. It involves algorithms that allow computers to learn patterns and make decisions or predictions based on data.	[{"link":"https://www.ibm.com/topics/machine-learning","description":"Machine learning (ML) is a branch of AI and computer science that focuses on the using data and algorithms to enable AI to imitate the way that humans ..."},{"link":"https://mitsloan.mit.edu/ideas-made-to-matter/machine-learning-explained","description":"Apr 21, 2021 ... Machine learning is a subfield of artificial intelligence, which is broadly defined as the capability of a machine to imitate intelligent human ..."},{"link":"https://www.techtarget.com/searchenterpriseai/definition/machine-learning-ML","description":"Machine learning is a type of AI focused on building computer systems that learn from data, enabling software to improve its performance over time."},{"link":"https://en.wikipedia.org/wiki/Machine_learning","description":"Machine learning approaches have been applied to many fields including natural language processing, computer vision, speech recognition, email filtering, ..."},{"link":"https://www.geeksforgeeks.org/ml-machine-learning/","description":"May 8, 2023 ... Machine Learning is a subset of artificial intelligence(AI) that focus on learning from data to develop an algorithm that can be used to make a ..."},{"link":"https://www.spiceworks.com/tech/artificial-intelligence/articles/what-is-ml/","description":"Aug 30, 2022 ... Machine learning derives insightful information from large volumes of data by leveraging algorithms to identify patterns and learn in an ..."},{"link":"https://developers.google.com/machine-learning/crash-course","description":"Machine Learning Crash Course with TensorFlow APIs. Google's fast-paced, practical introduction to machine learning, featuring a series of lessons with video ..."},{"link":"https://www.technologyreview.com/2018/11/17/103781/what-is-machine-learning-we-drew-you-another-flowchart/","description":"Nov 17, 2018 ... What is the definition of machine learning? Advertisement. Machine-learning algorithms use statistics to find patterns in massive* amounts of ..."},{"link":"https://www.datacamp.com/blog/what-is-machine-learning","description":"Machine learning is a subset of AI, which uses algorithms that learn from data to make predictions. These predictions can be generated through supervised ..."},{"link":"https://pubmed.ncbi.nlm.nih.gov/31509183/","description":"Dec 31, 2019 ... Machine learning is a branch of computer science that has the potential to transform epidemiologic sciences. Amid a growing focus on \\"Big ..."}]	{machin,learn}	Political Science	2024-04-15 02:29:16.348+01
43	11	explain how to implement machine learning into my hotel data system to forecast	2024-04-15 02:31:09.985+01	\N	To implement machine learning for forecasting in your hotel data system, you can follow these steps:\n\n1. Data Collection: Gather historical data related to key performance indicators (e.g., occupancy rate, revenue, customer satisfaction scores).\n\n2. Data Preprocessing: Clean the data, address missing values, and perform feature engineering to make the data suitable for machine learning models.\n\n3. Model Selection: Choose a suitable machine learning algorithm for forecasting tasks, such as linear regression, time series models (e.g., ARIMA), or machine learning models like Random Forest or Gradient Boosting.\n\n4. Training the Model: Split the data into training and testing sets, train the selected model on the training data.\n\n5. Model Evaluation: Evaluate the model's performance using metrics like mean squared error, mean absolute error, or R-squared score on the testing data.\n\n6. Hyperparameter Tuning: Optimize the model's hyperparameters to improve its performance further.\n\n7. Deployment: Implement the trained model into your hotel data system to generate forecasts based on new data inputs.\n\n8. Monitoring and Maintenance: Regularly monitor the model's performance, retrain it with new data periodically, and update it as needed to ensure accurate forecasting.\n\nBy following these steps, you can effectively implement machine learning for forecasting in your hotel data system.	[{"link":"https://cloudblogs.microsoft.com/dynamics365/it/2020/02/26/predictive-sales-forecasting-in-dynamics-365-sales/","description":"Feb 26, 2020 ... In the past, forecasting systems used to be complicated, requiring significant investments from an organization in technology, data availability ..."},{"link":"https://github.com/Ebazhanov/linkedin-skill-assessments-quizzes/blob/main/machine-learning/machine-learning-quiz.md","description":"Use unsupervised learning have the machine look for anomalies in ... Your machine learning system is attempting to describe a hidden structure from unlabeled data ..."},{"link":"https://hoteltechreport.com/news/ai-in-hospitality","description":"... through data analysis and forecasting, giving hotels a competitive advantage in the market. AI technology such as machine learning and algorithms can also ..."},{"link":"https://www.akkio.com/post/cost-of-ai","description":"Nov 24, 2023 ... In order to create and implement AI, businesses traditionally needed to hire data scientists, machine learning engineers, and software ..."},{"link":"https://www.altexsoft.com/blog/how-the-hospitality-industry-uses-performance-enhancing-artificial-intelligence-and-data-science/","description":"Aug 10, 2018 ... ... forecast room demand in ... deep learning to help hotels define their ... systems, changing building standards, or the use of information cards in ..."},{"link":"https://www.projectpro.io/article/15-data-science-projects-for-beginners-with-source-code/343","description":"Mar 19, 2024 ... Build a Stock Market Forecasting system by implementing Machine learning algorithms on the EuroStockMarket Dataset. The dataset has closing ..."},{"link":"https://www.altexsoft.com/blog/machine-learning-redefines-revenue-management-and-dynamic-pricing-in-hotel-industry/","description":"Jan 4, 2018 ... The industry shift from simple legacy systems to smarter data-driven solutions is straggling. In this article, we'll discuss novel RM approaches ..."},{"link":"https://medium.com/coders-camp/230-machine-learning-projects-with-python-5d0c7abf8265","description":"Jun 3, 2021 ... This article will introduce you to over 290 machine learning projects solved and explained using the Python programming language."},{"link":"https://www.sciencedirect.com/science/article/pii/S2666603022000136","description":"By implementing AI into marketing strategy, businesses can use the available data ... In contrast, systems that use deep learning at a ... prediction tool, and ..."},{"link":"https://hbr.org/2018/01/artificial-intelligence-for-the-real-world","description":"... data for better ... The system engages with employees using deep-learning technology (part of the ... Deep learning, on the other hand, is great at learning from ..."}]	{explain,how,to,implement,machin,learn,into,hotel,data,system,to,forecast}	Political Science	2024-04-15 02:31:09.985+01
44	11	Imagine you've discovered a new element on the periodic table. Describe its properties, potential applications, and the ethical considerations surrounding its use.	2024-04-15 02:32:13.934+01	\N	The new element, named "Xenonium (Xe)", has unique properties of being highly stable, non-reactive, and having exceptional conductivity. Its potential applications include use in advanced electronics for improved circuitry, in energy storage devices for higher efficiency, and in medical implants for enhanced biocompatibility.\n\nEthical considerations surrounding the use of Xenonium include its potential impact on the environment during mining and extraction, its scarcity leading to resource exploitation, and concerns about its long-term effects on health and safety when used in consumer products. Regulatory measures and ethical guidelines would need to be established to ensure responsible and sustainable utilization of Xenonium.	[{"link":"https://www.imagineforest.com/blog/science-writing-prompts/","description":"Jan 17, 2024 ... ... ethical considerations surrounding their integration. ... its properties, uses ... If you could have a conversation with an element from the ..."},{"link":"https://nces.ed.gov/pubs98/safetech/chapter4.asp","description":"Effective system security depends on creating a workplace environment and organizational structure where management understands and fully supports security ..."},{"link":"https://www.imaginelearning.com/media/pdf/EDG-Course-Catalog.pdf","description":"periodic table, physical and chemical reactions, and the properties ... They will incorporate abstraction into programs and use data to discover new knowledge ."},{"link":"https://www.accc.gov.au/system/files/ACCC+commissioned+report+-+The+impact+of+digital+platforms+on+news+and+journalistic+content,+Centre+for+Media+Transition+(2).pdf","description":"The Centre was asked by the ACCC to research and report on aspects relating to news and journalistic content, one of several matters under the Terms of ..."},{"link":"https://nces.ed.gov/pubs98/safetech/chapter6.asp","description":"Information backups and their storage are surely safer when the building is secure, software is used properly, and unauthorized users are effectively restricted ..."},{"link":"https://www.instagram.com/p/CU8M-_-l5hL/","description":"Oct 12, 2021 ... A student standing in front of the Spartan statue. melanienashaly · Spartan Marching Band members standing in a group and holding their trombones ..."},{"link":"https://www.cmu.edu/teaching/designteach/design/instructionalstrategies/discussions.html","description":"These include not only the questions you use to ... use questions to refine their ... new issues before the discussion of the previous issue has come to its natural ..."},{"link":"https://www.psandman.com/index-OM.htm","description":"... your most vituperative critics and to take at least some of their concerns onboard. ... explain why they have chosen not to take some possible precautions."},{"link":"https://home.snu.edu/~jsmith/library/body/v06.pdf","description":"J. William Pfeiffer. A person's interpersonal life is dependent on that person's facility for making his or her thoughts, feelings, and needs known to ..."},{"link":"https://www.baycollege.edu/_resources/pdf/academics/academic-resources/open-education/principles-public-speaking.pdf","description":"By learning and using the techniques provided in this book, you will discover how to create engaging speeches and present them using your own delivery style."}]	{imagin,ve,discov,a,new,element,on,the,period,tabl,describ,properti,potenti,applic,and,the,ethic,consider,surround,us}	Earth Science	2024-04-15 02:32:13.934+01
45	12	Propose an economic system that would be sustainable for this new society.	2024-04-15 02:35:21.31+01	\N	A sustainable economic system for a new society could be a combination of elements from a circular economy and a cooperative economy. This system would focus on reducing waste and promoting the reuse and recycling of resources, while also encouraging collective ownership and decision-making through cooperatives. By emphasizing sustainability and collaboration, this economic system could help ensure long-term success for the society while also fostering community resilience and well-being.	[{"link":"https://www.whitehouse.gov/briefing-room/statements-releases/2021/03/31/fact-sheet-the-american-jobs-plan/","description":"Mar 31, 2021 ... ... promote affordable access to ... sustainable transportation system. And, the ... to net-zero emissions while providing new economic opportunities ..."},{"link":"https://new.nsf.gov/funding/opportunities/sustainable-regional-systems-research-networks-srs/nsf24-533/solicitation","description":"Jan 29, 2024 ... An SRS RN proposal is expected to present a compelling case on how what is proposed can be anticipated to result in new SRS knowledge."},{"link":"https://www.sciencedirect.com/science/article/pii/S2352550921000567","description":"... society system to ... In a sustainable circular economy, the purpose of the political-economic system would ... It goes beyond our scope to propose new economic ..."},{"link":"https://www8.cao.go.jp/cstp/english/society5_0/index.html","description":"Society 5.0 was proposed in the 5th Science and Technology Basic Plan as a future society that Japan should aspire to. It follows the hunting society ..."},{"link":"https://ec.europa.eu/commission/presscorner/detail/en/ip_21_3541","description":"Jul 14, 2021 ... They combine: application of emissions trading to new sectors and a tightening of the existing EU Emissions Trading System; increased use of ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7734391/","description":"Filling in these gaps will require not only better routine health information systems for monitoring, but also new research, as proposed in the research agenda ..."},{"link":"https://www.amherst.edu/system/files/media/0972/fulltext.pdf","description":"The economic, social, and environmental planning practices of societies embodying 'urban sustainability' have been proposed as antidotes to these negative urban ..."},{"link":"https://commission.europa.eu/business-economy-euro/doing-business-eu/corporate-sustainability-due-diligence_en","description":"Feb 23, 2022 ... Businesses play a key role in creating a sustainable and fair economy and society. A third of companies recognise the need to act and take ..."},{"link":"https://www.laudesfoundation.org/","description":"... society together to promote regenerative agriculture and sustainable sourcing ... Collaborating to deliver a new economic system in Europe ... Request for Proposal: ..."},{"link":"https://www.europarl.europa.eu/topics/en/article/20210128STO96607/how-the-eu-wants-to-achieve-a-circular-economy-by-2050","description":"Feb 3, 2021 ... Finite resources and climate issues require moving from a 'take-make-dispose' society to a carbon-neutral, environmentally sustainable, toxic- ..."}]	{propos,an,econom,system,would,be,sustain,for,new,societi}	Economics	2024-04-15 02:35:21.31+01
46	12	Design a sustainable urban environment that incorporates principles of both economics and ecology, considering factors like resource allocation, energy efficiency, and green spaces. 	2024-04-15 02:36:25.968+01	\N	To design a sustainable urban environment incorporating economics and ecology principles, you can consider the following factors:\n\n1. Resource allocation: Implement systems for smart resource allocation, such as using renewable energy sources, promoting recycling and waste reduction, and efficient water management.\n\n2. Energy efficiency: Design buildings with energy-efficient technologies like solar panels, LED lighting, and green roofs to reduce energy consumption and carbon emissions.\n\n3. Green spaces: Incorporate parks, community gardens, and green corridors to improve air quality, provide recreational spaces, and enhance biodiversity within the urban environment.\n\n4. Mixed land use: Encourage mixed-use development to reduce the need for long commutes, promote walkability, and reduce urban sprawl.\n\n5. Public transportation: Invest in public transportation systems to reduce the dependency on private vehicles, decrease emissions, and improve accessibility for all residents.\n\n6. Green infrastructure: Implement green infrastructure solutions such as green roofs, rain gardens, and permeable pavements to manage stormwater runoff and reduce flooding risks.\n\nBy integrating these factors into the urban design process, you can create a sustainable urban environment that balances economic growth with ecological considerations.	[{"link":"https://www.digi.com/blog/post/sustainable-city","description":"Jun 17, 2021 ... A sustainable city combats climate change and helps the environment. Learn why urban sustainability matters and what it looks like in ..."},{"link":"https://www.enel.com/company/stories/articles/2023/06/three-pillars-sustainability","description":"Jun 15, 2023 ... Find out about the principles and practices for sustainable development based on the three pillars of sustainability."},{"link":"https://www.amherst.edu/system/files/media/0972/fulltext.pdf","description":"... urban green space ... Others have argued that an enabling environment that optimizes resource allocation ... Ahwahnee Principles for. Resource-Efficient Communities ..."},{"link":"https://www.wbdg.org/resources/green-building-standards-and-certification-systems","description":"Mar 23, 2023 ... Buildings have extensive direct and indirect impacts on the environment. During their construction, occupancy, renovation, repurposing, ..."},{"link":"https://www.mdpi.com/2071-1050/15/13/10682","description":"... efficient, green cities [105] ... 1S—Sustainable Energy, Resource Efficiency, and Circular Economy: ... Incorporating sustainable transportation principles into ..."},{"link":"https://www.oecd.org/finance/ESG-Investing-Practices-Progress-Challenges.pdf","description":"Sep 26, 2020 ... seeks to incorporate environmental, social and governance factors into asset allocation and risk decisions, so as to generate sustainable ..."},{"link":"https://www.sciencedirect.com/science/article/pii/S266616592030017X","description":"This study shows that compactness, density, diversity, mixed land use, sustainable transportation, and green space are the core design strategies of compact ..."},{"link":"https://sustainableinfrastructure.org/wp-content/uploads/EnvisionV3.9.7.2018.pdf","description":"sustainable principles of efficiency, resourcefulness, ... RESOURCE ALLOCATION: ENERGY. RA2.1 Reduce ... Additionally, like other Resource Allocation credits,."},{"link":"https://www.tandfonline.com/doi/full/10.1080/23311886.2019.1653531","description":"... economic and environmental factors. According to ... environmental and economic resource ... areas of building, vehicle efficiency, affordable housing, and other ..."},{"link":"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9389488/","description":"Aug 19, 2022 ... According to the World Conservation Union (IUCN), ecotourism involves “Environmentally responsible travel to natural areas, to enjoy and ..."}]	{design,a,sustain,urban,environ,incorpor,principl,of,both,econom,and,ecolog,consid,factor,like,resourc,alloc,energi,effici,and,green,space}	Political Science	2024-04-15 02:36:25.968+01
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.resources (resource_id, question_id, resource_type, resource_link, created_at, source_type) FROM stdin;
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.subjects (id, subject_name) FROM stdin;
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.submissions (id, "questionId", "studentId", "studentAnswer", "similarityIndex", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.topics (id, topic_name, subject_id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: paransaccount
--

COPY public.users (id, username, role, password, email, created_at, image_url) FROM stdin;
3	psaoulik	user	$2b$10$9mqxo1o/7H5yLM/z1RZ4XeI.7bI9yXOzkqvssVFbUgr34xAlI.xPu	paranviraoulik@gmail.com	2024-04-05 17:30:46.198956+01	\N
4	gursimran	user	$2b$10$zupFHM5eSA9ZW9ZnnhdX6utLMnGU7DBdR9QXnBiauSeWJHMuX/vkS	gursimransapra@icloud.com	2024-04-06 13:05:26.252338+01	uploads/profileImage-1712581360006.jpg
5	admin	admin	$2b$10$YkrCZuz3cAzVAd0k4oYNgO5eNn9b3Ta1ngiAa9qq1.r/Q8gMRa3/W	admin@admin.admin	2024-04-13 19:20:27.54597+01	\N
6	ishwar	user	$2b$10$QGWdJuWljvYhecDZpptoPe2JInQHHvoVMaLkH207JIGf3vhPB9n9y	ishwar@gmail.com	2024-04-15 01:44:15.391018+01	uploads/profileImage-1713142043903.jpg
7	Onkar123	user	$2b$10$vMpKmYLnuGamaljZimw8Aez015uwfU0twwzrkE5JmFyVLCTcu5ZyS	onkar@icloud.com	2024-04-15 01:50:13.573202+01	uploads/profileImage-1713142391542.jpg
8	SatvirP	user	$2b$10$Iz.q4v24.pZJ2i2v6O8px.V0qJGrwON6IRU1qnXZ07qzQANUv3Oka	satvir@gmail.com	2024-04-15 01:53:49.71173+01	uploads/profileImage-1713142749888.jpg
9	Joginder	user	$2b$10$YWezTp1KvWD2G5frTJpzXeuuIY7hIRQiC4Y9XwFyjSjvLfLzRilSS	joginder@gmail.com	2024-04-15 02:01:17.14786+01	uploads/profileImage-1713142898840.jpg
10	SatvirP1234	user	$2b$10$8/ez2fmMQGsH3T7G7pYqzeerKSHgh/Iw3P/QEUBcsM6XBMNz/X8ru	satvirp@live.com	2024-04-15 02:04:53.280502+01	uploads/profileImage-1713144363468.jpg
11	amy555	user	$2b$10$gYKOm1oNX7SAaVHA3.JOb.FCX9H4E8bI.iha2gzTlUWmLjj.jNZ7m	amykate@icloud.com	2024-04-15 02:26:34.958189+01	uploads/profileImage-1713144803489.jpg
12	matrix47	user	$2b$10$tRlkVMZ02Oh8cvJ2EnsgquA1.6IV/XsdiRcumOwSz52OORC.dvdoK	matrix45@hotmail.com	2024-04-15 02:34:45.420352+01	\N
\.


--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.password_reset_tokens_id_seq', 8, true);


--
-- Name: question_feedback_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.question_feedback_feedback_id_seq', 1, false);


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 46, true);


--
-- Name: resources_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.resources_resource_id_seq', 1, false);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.subjects_id_seq', 1, false);


--
-- Name: submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.submissions_id_seq', 1, false);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.topics_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paransaccount
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (id);


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
-- Name: subjects subjects_subject_name_key1; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key1 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key10; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key10 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key11; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key11 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key12; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key12 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key13; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key13 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key14; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key14 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key15; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key15 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key16; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key16 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key17; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key17 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key18; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key18 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key19; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key19 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key2; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key2 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key20; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key20 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key21; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key21 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key22; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key22 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key23; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key23 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key24; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key24 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key25; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key25 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key26; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key26 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key27; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key27 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key28; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key28 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key29; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key29 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key3; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key3 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key30; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key30 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key31; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key31 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key32; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key32 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key33; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key33 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key34; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key34 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key35; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key35 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key36; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key36 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key37; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key37 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key38; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key38 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key39; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key39 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key4; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key4 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key40; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key40 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key41; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key41 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key42; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key42 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key5; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key5 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key6; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key6 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key7; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key7 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key8; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key8 UNIQUE (subject_name);


--
-- Name: subjects subjects_subject_name_key9; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_name_key9 UNIQUE (subject_name);


--
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


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
-- Name: users users_email_key1; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);


--
-- Name: users users_email_key10; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key10 UNIQUE (email);


--
-- Name: users users_email_key11; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key11 UNIQUE (email);


--
-- Name: users users_email_key12; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key12 UNIQUE (email);


--
-- Name: users users_email_key13; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key13 UNIQUE (email);


--
-- Name: users users_email_key14; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key14 UNIQUE (email);


--
-- Name: users users_email_key15; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key15 UNIQUE (email);


--
-- Name: users users_email_key16; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key16 UNIQUE (email);


--
-- Name: users users_email_key17; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key17 UNIQUE (email);


--
-- Name: users users_email_key18; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key18 UNIQUE (email);


--
-- Name: users users_email_key19; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key19 UNIQUE (email);


--
-- Name: users users_email_key2; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);


--
-- Name: users users_email_key20; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key20 UNIQUE (email);


--
-- Name: users users_email_key21; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key21 UNIQUE (email);


--
-- Name: users users_email_key22; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key22 UNIQUE (email);


--
-- Name: users users_email_key23; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key23 UNIQUE (email);


--
-- Name: users users_email_key24; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key24 UNIQUE (email);


--
-- Name: users users_email_key25; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key25 UNIQUE (email);


--
-- Name: users users_email_key26; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key26 UNIQUE (email);


--
-- Name: users users_email_key27; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key27 UNIQUE (email);


--
-- Name: users users_email_key28; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key28 UNIQUE (email);


--
-- Name: users users_email_key29; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key29 UNIQUE (email);


--
-- Name: users users_email_key3; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);


--
-- Name: users users_email_key30; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key30 UNIQUE (email);


--
-- Name: users users_email_key31; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key31 UNIQUE (email);


--
-- Name: users users_email_key32; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key32 UNIQUE (email);


--
-- Name: users users_email_key33; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key33 UNIQUE (email);


--
-- Name: users users_email_key34; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key34 UNIQUE (email);


--
-- Name: users users_email_key35; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key35 UNIQUE (email);


--
-- Name: users users_email_key36; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key36 UNIQUE (email);


--
-- Name: users users_email_key37; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key37 UNIQUE (email);


--
-- Name: users users_email_key38; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key38 UNIQUE (email);


--
-- Name: users users_email_key39; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key39 UNIQUE (email);


--
-- Name: users users_email_key4; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key4 UNIQUE (email);


--
-- Name: users users_email_key40; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key40 UNIQUE (email);


--
-- Name: users users_email_key41; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key41 UNIQUE (email);


--
-- Name: users users_email_key42; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key42 UNIQUE (email);


--
-- Name: users users_email_key5; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key5 UNIQUE (email);


--
-- Name: users users_email_key6; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key6 UNIQUE (email);


--
-- Name: users users_email_key7; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key7 UNIQUE (email);


--
-- Name: users users_email_key8; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key8 UNIQUE (email);


--
-- Name: users users_email_key9; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key9 UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: users users_username_key1; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key1 UNIQUE (username);


--
-- Name: users users_username_key10; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key10 UNIQUE (username);


--
-- Name: users users_username_key11; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key11 UNIQUE (username);


--
-- Name: users users_username_key12; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key12 UNIQUE (username);


--
-- Name: users users_username_key13; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key13 UNIQUE (username);


--
-- Name: users users_username_key14; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key14 UNIQUE (username);


--
-- Name: users users_username_key15; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key15 UNIQUE (username);


--
-- Name: users users_username_key16; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key16 UNIQUE (username);


--
-- Name: users users_username_key17; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key17 UNIQUE (username);


--
-- Name: users users_username_key18; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key18 UNIQUE (username);


--
-- Name: users users_username_key19; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key19 UNIQUE (username);


--
-- Name: users users_username_key2; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key2 UNIQUE (username);


--
-- Name: users users_username_key20; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key20 UNIQUE (username);


--
-- Name: users users_username_key21; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key21 UNIQUE (username);


--
-- Name: users users_username_key22; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key22 UNIQUE (username);


--
-- Name: users users_username_key23; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key23 UNIQUE (username);


--
-- Name: users users_username_key24; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key24 UNIQUE (username);


--
-- Name: users users_username_key25; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key25 UNIQUE (username);


--
-- Name: users users_username_key26; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key26 UNIQUE (username);


--
-- Name: users users_username_key27; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key27 UNIQUE (username);


--
-- Name: users users_username_key28; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key28 UNIQUE (username);


--
-- Name: users users_username_key29; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key29 UNIQUE (username);


--
-- Name: users users_username_key3; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key3 UNIQUE (username);


--
-- Name: users users_username_key30; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key30 UNIQUE (username);


--
-- Name: users users_username_key31; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key31 UNIQUE (username);


--
-- Name: users users_username_key32; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key32 UNIQUE (username);


--
-- Name: users users_username_key33; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key33 UNIQUE (username);


--
-- Name: users users_username_key34; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key34 UNIQUE (username);


--
-- Name: users users_username_key35; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key35 UNIQUE (username);


--
-- Name: users users_username_key36; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key36 UNIQUE (username);


--
-- Name: users users_username_key37; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key37 UNIQUE (username);


--
-- Name: users users_username_key38; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key38 UNIQUE (username);


--
-- Name: users users_username_key39; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key39 UNIQUE (username);


--
-- Name: users users_username_key4; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key4 UNIQUE (username);


--
-- Name: users users_username_key40; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key40 UNIQUE (username);


--
-- Name: users users_username_key41; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key41 UNIQUE (username);


--
-- Name: users users_username_key42; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key42 UNIQUE (username);


--
-- Name: users users_username_key5; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key5 UNIQUE (username);


--
-- Name: users users_username_key6; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key6 UNIQUE (username);


--
-- Name: users users_username_key7; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key7 UNIQUE (username);


--
-- Name: users users_username_key8; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key8 UNIQUE (username);


--
-- Name: users users_username_key9; Type: CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key9 UNIQUE (username);


--
-- Name: password_reset_tokens password_reset_tokens_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT "password_reset_tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


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
    ADD CONSTRAINT questions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: resources resources_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id);


--
-- Name: submissions submissions_questionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT "submissions_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public.questions(question_id);


--
-- Name: submissions submissions_studentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT "submissions_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public.users(id);


--
-- Name: topics topics_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paransaccount
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE accounts_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    userid integer NOT NULL,
    username character varying(40) NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO ravi;

--
-- Name: accounts_user_userid_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE accounts_user_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_userid_seq OWNER TO ravi;

--
-- Name: accounts_user_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE accounts_user_userid_seq OWNED BY accounts_user.userid;


--
-- Name: accounts_userrole; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE accounts_userrole (
    roleid integer NOT NULL,
    rolename character varying(50) NOT NULL
);


ALTER TABLE public.accounts_userrole OWNER TO ravi;

--
-- Name: accounts_userrole_roleid_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE accounts_userrole_roleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userrole_roleid_seq OWNER TO ravi;

--
-- Name: accounts_userrole_roleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE accounts_userrole_roleid_seq OWNED BY accounts_userrole.roleid;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ravi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ravi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ravi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ravi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ravi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ravi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: core_department; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE core_department (
    dept_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.core_department OWNER TO ravi;

--
-- Name: core_department_dept_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE core_department_dept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_department_dept_id_seq OWNER TO ravi;

--
-- Name: core_department_dept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE core_department_dept_id_seq OWNED BY core_department.dept_id;


--
-- Name: core_discussion; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE core_discussion (
    id integer NOT NULL,
    message character varying(1024) NOT NULL,
    issue_id integer NOT NULL
);


ALTER TABLE public.core_discussion OWNER TO ravi;

--
-- Name: core_discussion_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE core_discussion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_discussion_id_seq OWNER TO ravi;

--
-- Name: core_discussion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE core_discussion_id_seq OWNED BY core_discussion.id;


--
-- Name: core_issue; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE core_issue (
    issue_id integer NOT NULL,
    title character varying(256) NOT NULL,
    content text NOT NULL,
    pic character varying(80) NOT NULL,
    latitude character varying(20) NOT NULL,
    longitude character varying(20) NOT NULL,
    geo_address text NOT NULL,
    category_id integer,
    status_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.core_issue OWNER TO ravi;

--
-- Name: core_issue_issue_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE core_issue_issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_issue_issue_id_seq OWNER TO ravi;

--
-- Name: core_issue_issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE core_issue_issue_id_seq OWNED BY core_issue.issue_id;


--
-- Name: core_issuestatus; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE core_issuestatus (
    id integer NOT NULL,
    status character varying(40) NOT NULL
);


ALTER TABLE public.core_issuestatus OWNER TO ravi;

--
-- Name: core_issuestatus_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE core_issuestatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_issuestatus_id_seq OWNER TO ravi;

--
-- Name: core_issuestatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE core_issuestatus_id_seq OWNED BY core_issuestatus.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ravi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ravi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ravi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ravi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ravi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ravi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ravi; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ravi;

--
-- Name: userid; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY accounts_user ALTER COLUMN userid SET DEFAULT nextval('accounts_user_userid_seq'::regclass);


--
-- Name: roleid; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY accounts_userrole ALTER COLUMN roleid SET DEFAULT nextval('accounts_userrole_roleid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: dept_id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY core_department ALTER COLUMN dept_id SET DEFAULT nextval('core_department_dept_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY core_discussion ALTER COLUMN id SET DEFAULT nextval('core_discussion_id_seq'::regclass);


--
-- Name: issue_id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY core_issue ALTER COLUMN issue_id SET DEFAULT nextval('core_issue_issue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY core_issuestatus ALTER COLUMN id SET DEFAULT nextval('core_issuestatus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY accounts_user (password, last_login, userid, username, role_id) FROM stdin;
bcrypt_sha256$$2b$12$zkmu/e.x3HNjIeAatazcUuwBD0DWLRoT6r1p/I/IJ3r5KyyJKzUJi	2016-05-20 00:21:34.007501+05:30	3	ravi	3
bcrypt_sha256$$2b$12$70q8fmliIafrZIk0WYmB3.HWXCRfdwm/YTru7/.NdGb/mYpRXNSBO	2016-05-22 18:47:54.316939+05:30	4	admin	2
\.


--
-- Name: accounts_user_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('accounts_user_userid_seq', 4, true);


--
-- Data for Name: accounts_userrole; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY accounts_userrole (roleid, rolename) FROM stdin;
1	superuser
2	admin
3	user
\.


--
-- Name: accounts_userrole_roleid_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('accounts_userrole_roleid_seq', 3, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add department	6	add_department
17	Can change department	6	change_department
18	Can delete department	6	delete_department
19	Can add issue status	7	add_issuestatus
20	Can change issue status	7	change_issuestatus
21	Can delete issue status	7	delete_issuestatus
22	Can add issue	8	add_issue
23	Can change issue	8	change_issue
24	Can delete issue	8	delete_issue
25	Can add discussion	9	add_discussion
26	Can change discussion	9	change_discussion
27	Can delete discussion	9	delete_discussion
28	Can add user role	10	add_userrole
29	Can change user role	10	change_userrole
30	Can delete user role	10	delete_userrole
31	Can add user	11	add_user
32	Can change user	11	change_user
33	Can delete user	11	delete_user
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('auth_permission_id_seq', 33, true);


--
-- Data for Name: core_department; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY core_department (dept_id, name, description) FROM stdin;
1	RTA - Telangana	Road Transport Authority
2	Indian Railway	Department of Indian Railway, Ministry of Railways.
3	GHMC	Greater Hyderabad Municipal Corporation
\.


--
-- Name: core_department_dept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('core_department_dept_id_seq', 3, true);


--
-- Data for Name: core_discussion; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY core_discussion (id, message, issue_id) FROM stdin;
\.


--
-- Name: core_discussion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('core_discussion_id_seq', 1, false);


--
-- Data for Name: core_issue; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY core_issue (issue_id, title, content, pic, latitude, longitude, geo_address, category_id, status_id, user_id) FROM stdin;
2	High rates in train	The eatable in the train are being sold at prices higher than the MRP\r\n		17.3611224	78.5000187	[{"place_id":"ChIJE2PlRECYyzsRfW6qLH-noZ0","types":["route"],"address_components":[{"long_name":"Road Number 6B","short_name":"Rd Number 6B","types":["route"]},{"long_name":"Sai Lal Thota","short_name":"Sai Lal Thota","types":["sublocality_level_3","sublocality","political"]},{"long_name":"Uppar Guda","short_name":"Uppar Guda","types":["sublocality_level_2","sublocality","political"]},{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Ranga Reddy","short_name":"R.R. District","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]},{"long_name":"500059","short_name":"500059","types":["postal_code"]}],"formatted_address":"Rd Number 6B, Sai Lal Thota, Uppar Guda, Madannapet, Hyderabad, Telangana 500059, India","geometry":{"location_type":"GEOMETRIC_CENTER","location":{"lng":78.49983759999999,"lat":17.3609853},"viewport":{"northeast":{"lng":78.5011865302915,"lat":17.3623342802915},"southwest":{"lng":78.49848856970848,"lat":17.3596363197085}},"bounds":{"northeast":{"lng":78.50000159999999,"lat":17.3610228},"southwest":{"lng":78.4996735,"lat":17.3609478}}}},{"place_id":"ChIJgZX2NkCYyzsR9AKw1csRFoE","types":["sublocality_level_3","sublocality","political"],"address_components":[{"long_name":"Sai Lal Thota","short_name":"Sai Lal Thota","types":["sublocality_level_3","sublocality","political"]},{"long_name":"Uppar Guda","short_name":"Uppar Guda","types":["sublocality_level_2","sublocality","political"]},{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Sai Lal Thota, Uppar Guda, Madannapet, Hyderabad, Telangana, India","geometry":{"location_type":"APPROXIMATE","location":{"lng":78.5004106,"lat":17.3600366},"viewport":{"northeast":{"lng":78.5016111802915,"lat":17.3616440302915},"southwest":{"lng":78.4989132197085,"lat":17.3589460697085}},"bounds":{"northeast":{"lng":78.5012358,"lat":17.3614471},"southwest":{"lng":78.4992886,"lat":17.359143}}}},{"place_id":"ChIJJ0SBtkGYyzsRkXTXULBEjmg","types":["sublocality_level_2","sublocality","political"],"address_components":[{"long_name":"Uppar Guda","short_name":"Uppar Guda","types":["sublocality_level_2","sublocality","political"]},{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Ranga Reddy","short_name":"R.R. District","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Uppar Guda, Madannapet, Hyderabad, Telangana, India","geometry":{"location_type":"APPROXIMATE","location":{"lng":78.5011208,"lat":17.3608056},"viewport":{"northeast":{"lng":78.5048039,"lat":17.3622481},"southwest":{"lng":78.497496,"lat":17.3590529}},"bounds":{"northeast":{"lng":78.5048039,"lat":17.3622481},"southwest":{"lng":78.497496,"lat":17.3590529}}}},{"place_id":"ChIJ5XWAqWqYyzsRZDh52gYRGlI","types":["sublocality_level_1","sublocality","political"],"address_components":[{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Ranga Reddy","short_name":"R.R. District","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Madannapet, Hyderabad, Telangana, India","geometry":{"location_type":"APPROXIMATE","location":{"lng":78.498635,"lat":17.3581141},"viewport":{"northeast":{"lng":78.50663999999999,"lat":17.3622481},"southwest":{"lng":78.4926849,"lat":17.3489911}},"bounds":{"northeast":{"lng":78.50663999999999,"lat":17.3622481},"southwest":{"lng":78.4926849,"lat":17.3489911}}}},{"place_id":"ChIJx9Lr6tqZyzsRwvu6koO3k64","types":["locality","political"],"address_components":[{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Hyderabad, Telangana, India","geometry":{"location_type":"APPROXIMATE","location":{"lng":78.486671,"lat":17.385044},"viewport":{"northeast":{"lng":78.6561694,"lat":17.6078088},"southwest":{"lng":78.1599217,"lat":17.2168886}},"bounds":{"northeast":{"lng":78.6561694,"lat":17.6078088},"southwest":{"lng":78.1599217,"lat":17.2168886}}}},{"place_id":"ChIJS3M8fmiYyzsRkTdSMQ6wqMA","types":["postal_code"],"address_components":[{"long_name":"500059","short_name":"500059","types":["postal_code"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Hyderabad, Telangana 500059, India","geometry":{"location_type":"APPROXIMATE","location":{"lng":78.50653439999999,"lat":17.3523292},"viewport":{"northeast":{"lng":78.5240267,"lat":17.3664482},"southwest":{"lng":78.4940587,"lat":17.3384226}},"bounds":{"northeast":{"lng":78.5240267,"lat":17.3664482},"southwest":{"lng":78.4940587,"lat":17.3384226}}}},{"place_id":"ChIJx9Lr6tqZyzsRMyOXJZHL34s","types":["administrative_area_level_2","political"],"address_components":[{"long_name":"Hyderabad","short_name":"Hyderabad","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Hyderabad, Telangana, India","geometry":{"location_type":"APPROXIMATE","location":{"lng":78.4524591,"lat":17.4027421},"viewport":{"northeast":{"lng":78.55109,"lat":17.52701},"southwest":{"lng":78.3640099,"lat":17.29111}},"bounds":{"northeast":{"lng":78.55109,"lat":17.52701},"southwest":{"lng":78.3640099,"lat":17.29111}}}},{"place_id":"ChIJQ-0plNtQMzoRWUBZQad772M","types":["administrative_area_level_1","political"],"address_components":[{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Telangana, India","geometry":{"location_type":"APPROXIMATE","location":{"lng":79.01929969999999,"lat":18.1124372},"viewport":{"northeast":{"lng":81.3075465,"lat":19.916715},"southwest":{"lng":77.23791299999999,"lat":15.83535}},"bounds":{"northeast":{"lng":81.3075465,"lat":19.916715},"southwest":{"lng":77.23791299999999,"lat":15.83535}}}},{"place_id":"ChIJkbeSa_BfYzARphNChaFPjNc","types":["country","political"],"address_components":[{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"India","geometry":{"location_type":"APPROXIMATE","location":{"lng":78.96288,"lat":20.593684},"viewport":{"northeast":{"lng":97.395561,"lat":35.5087008},"southwest":{"lng":68.16288519999999,"lat":6.7535159}},"bounds":{"northeast":{"lng":97.395561,"lat":35.5087008},"southwest":{"lng":68.1623859,"lat":6.7535159}}}}]	2	4	\N
1	Bad condition of roads	The road at the location is too bad.		17.361275199999998	78.50016509999999	[{"place_id":"ChIJzRWCT0CYyzsRU-o3Cka17qg","types":["route"],"address_components":[{"long_name":"Road Number 6B","short_name":"Rd Number 6B","types":["route"]},{"long_name":"Sai Lal Thota","short_name":"Sai Lal Thota","types":["sublocality_level_3","sublocality","political"]},{"long_name":"Uppar Guda","short_name":"Uppar Guda","types":["sublocality_level_2","sublocality","political"]},{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Ranga Reddy","short_name":"R.R. District","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]},{"long_name":"500059","short_name":"500059","types":["postal_code"]}],"formatted_address":"Rd Number 6B, Sai Lal Thota, Uppar Guda, Madannapet, Hyderabad, Telangana 500059, India","geometry":{"location_type":"GEOMETRIC_CENTER","viewport":{"southwest":{"lat":17.3595809197085,"lng":78.49872386970848},"northeast":{"lat":17.3622788802915,"lng":78.50142183029149}},"location":{"lat":17.3609299,"lng":78.50007289999999},"bounds":{"southwest":{"lat":17.360912,"lng":78.50000159999999},"northeast":{"lat":17.3609478,"lng":78.5001441}}}},{"place_id":"ChIJgZX2NkCYyzsR9AKw1csRFoE","types":["sublocality_level_3","sublocality","political"],"address_components":[{"long_name":"Sai Lal Thota","short_name":"Sai Lal Thota","types":["sublocality_level_3","sublocality","political"]},{"long_name":"Uppar Guda","short_name":"Uppar Guda","types":["sublocality_level_2","sublocality","political"]},{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Sai Lal Thota, Uppar Guda, Madannapet, Hyderabad, Telangana, India","geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.3589460697085,"lng":78.4989132197085},"northeast":{"lat":17.3616440302915,"lng":78.5016111802915}},"location":{"lat":17.3600366,"lng":78.5004106},"bounds":{"southwest":{"lat":17.359143,"lng":78.4992886},"northeast":{"lat":17.3614471,"lng":78.5012358}}}},{"place_id":"ChIJJ0SBtkGYyzsRkXTXULBEjmg","types":["sublocality_level_2","sublocality","political"],"address_components":[{"long_name":"Uppar Guda","short_name":"Uppar Guda","types":["sublocality_level_2","sublocality","political"]},{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Ranga Reddy","short_name":"R.R. District","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Uppar Guda, Madannapet, Hyderabad, Telangana, India","geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.3590529,"lng":78.497496},"northeast":{"lat":17.3622481,"lng":78.5048039}},"location":{"lat":17.3608056,"lng":78.5011208},"bounds":{"southwest":{"lat":17.3590529,"lng":78.497496},"northeast":{"lat":17.3622481,"lng":78.5048039}}}},{"place_id":"ChIJ5XWAqWqYyzsRZDh52gYRGlI","types":["sublocality_level_1","sublocality","political"],"address_components":[{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Ranga Reddy","short_name":"R.R. District","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Madannapet, Hyderabad, Telangana, India","geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.3489911,"lng":78.4926849},"northeast":{"lat":17.3622481,"lng":78.50663999999999}},"location":{"lat":17.3581141,"lng":78.498635},"bounds":{"southwest":{"lat":17.3489911,"lng":78.4926849},"northeast":{"lat":17.3622481,"lng":78.50663999999999}}}},{"place_id":"ChIJx9Lr6tqZyzsRwvu6koO3k64","types":["locality","political"],"address_components":[{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Hyderabad, Telangana, India","geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.2168886,"lng":78.1599217},"northeast":{"lat":17.6078088,"lng":78.6561694}},"location":{"lat":17.385044,"lng":78.486671},"bounds":{"southwest":{"lat":17.2168886,"lng":78.1599217},"northeast":{"lat":17.6078088,"lng":78.6561694}}}},{"place_id":"ChIJS3M8fmiYyzsRkTdSMQ6wqMA","types":["postal_code"],"address_components":[{"long_name":"500059","short_name":"500059","types":["postal_code"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Hyderabad, Telangana 500059, India","geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.3384226,"lng":78.4940587},"northeast":{"lat":17.3664482,"lng":78.5240267}},"location":{"lat":17.3523292,"lng":78.50653439999999},"bounds":{"southwest":{"lat":17.3384226,"lng":78.4940587},"northeast":{"lat":17.3664482,"lng":78.5240267}}}},{"place_id":"ChIJx9Lr6tqZyzsRMyOXJZHL34s","types":["administrative_area_level_2","political"],"address_components":[{"long_name":"Hyderabad","short_name":"Hyderabad","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Hyderabad, Telangana, India","geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.29111,"lng":78.3640099},"northeast":{"lat":17.52701,"lng":78.55109}},"location":{"lat":17.4027421,"lng":78.4524591},"bounds":{"southwest":{"lat":17.29111,"lng":78.3640099},"northeast":{"lat":17.52701,"lng":78.55109}}}},{"place_id":"ChIJQ-0plNtQMzoRWUBZQad772M","types":["administrative_area_level_1","political"],"address_components":[{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Telangana, India","geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":15.83535,"lng":77.23791299999999},"northeast":{"lat":19.916715,"lng":81.3075465}},"location":{"lat":18.1124372,"lng":79.01929969999999},"bounds":{"southwest":{"lat":15.83535,"lng":77.23791299999999},"northeast":{"lat":19.916715,"lng":81.3075465}}}},{"place_id":"ChIJkbeSa_BfYzARphNChaFPjNc","types":["country","political"],"address_components":[{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"India","geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":6.7535159,"lng":68.16288519999999},"northeast":{"lat":35.5087008,"lng":97.395561}},"location":{"lat":20.593684,"lng":78.96288},"bounds":{"southwest":{"lat":6.7535159,"lng":68.1623859},"northeast":{"lat":35.5087008,"lng":97.395561}}}}]	3	1	\N
3	Cleanliness problem	Please look at the cleanliness in this area.		17.3612316	78.50016289999999	[{"place_id":"ChIJzRWCT0CYyzsRU-o3Cka17qg","types":["route"],"geometry":{"location_type":"GEOMETRIC_CENTER","viewport":{"southwest":{"lat":17.3595809197085,"lng":78.49872386970848},"northeast":{"lat":17.3622788802915,"lng":78.50142183029149}},"location":{"lat":17.3609299,"lng":78.50007289999999},"bounds":{"southwest":{"lat":17.360912,"lng":78.50000159999999},"northeast":{"lat":17.3609478,"lng":78.5001441}}},"formatted_address":"Rd Number 6B, Sai Lal Thota, Uppar Guda, Madannapet, Hyderabad, Telangana 500059, India","address_components":[{"long_name":"Road Number 6B","short_name":"Rd Number 6B","types":["route"]},{"long_name":"Sai Lal Thota","short_name":"Sai Lal Thota","types":["sublocality_level_3","sublocality","political"]},{"long_name":"Uppar Guda","short_name":"Uppar Guda","types":["sublocality_level_2","sublocality","political"]},{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Ranga Reddy","short_name":"R.R. District","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]},{"long_name":"500059","short_name":"500059","types":["postal_code"]}]},{"place_id":"ChIJgZX2NkCYyzsR9AKw1csRFoE","types":["sublocality_level_3","sublocality","political"],"geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.3589460697085,"lng":78.4989132197085},"northeast":{"lat":17.3616440302915,"lng":78.5016111802915}},"location":{"lat":17.3600366,"lng":78.5004106},"bounds":{"southwest":{"lat":17.359143,"lng":78.4992886},"northeast":{"lat":17.3614471,"lng":78.5012358}}},"formatted_address":"Sai Lal Thota, Uppar Guda, Madannapet, Hyderabad, Telangana, India","address_components":[{"long_name":"Sai Lal Thota","short_name":"Sai Lal Thota","types":["sublocality_level_3","sublocality","political"]},{"long_name":"Uppar Guda","short_name":"Uppar Guda","types":["sublocality_level_2","sublocality","political"]},{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}]},{"place_id":"ChIJJ0SBtkGYyzsRkXTXULBEjmg","types":["sublocality_level_2","sublocality","political"],"geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.3590529,"lng":78.497496},"northeast":{"lat":17.3622481,"lng":78.5048039}},"location":{"lat":17.3608056,"lng":78.5011208},"bounds":{"southwest":{"lat":17.3590529,"lng":78.497496},"northeast":{"lat":17.3622481,"lng":78.5048039}}},"formatted_address":"Uppar Guda, Madannapet, Hyderabad, Telangana, India","address_components":[{"long_name":"Uppar Guda","short_name":"Uppar Guda","types":["sublocality_level_2","sublocality","political"]},{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Ranga Reddy","short_name":"R.R. District","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}]},{"place_id":"ChIJ5XWAqWqYyzsRZDh52gYRGlI","types":["sublocality_level_1","sublocality","political"],"geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.3489911,"lng":78.4926849},"northeast":{"lat":17.3622481,"lng":78.50663999999999}},"location":{"lat":17.3581141,"lng":78.498635},"bounds":{"southwest":{"lat":17.3489911,"lng":78.4926849},"northeast":{"lat":17.3622481,"lng":78.50663999999999}}},"formatted_address":"Madannapet, Hyderabad, Telangana, India","address_components":[{"long_name":"Madannapet","short_name":"Madannapet","types":["sublocality_level_1","sublocality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Ranga Reddy","short_name":"R.R. District","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}]},{"place_id":"ChIJx9Lr6tqZyzsRwvu6koO3k64","types":["locality","political"],"geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.2168886,"lng":78.1599217},"northeast":{"lat":17.6078088,"lng":78.6561694}},"location":{"lat":17.385044,"lng":78.486671},"bounds":{"southwest":{"lat":17.2168886,"lng":78.1599217},"northeast":{"lat":17.6078088,"lng":78.6561694}}},"formatted_address":"Hyderabad, Telangana, India","address_components":[{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}]},{"place_id":"ChIJS3M8fmiYyzsRkTdSMQ6wqMA","types":["postal_code"],"geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.3384226,"lng":78.4940587},"northeast":{"lat":17.3664482,"lng":78.5240267}},"location":{"lat":17.3523292,"lng":78.50653439999999},"bounds":{"southwest":{"lat":17.3384226,"lng":78.4940587},"northeast":{"lat":17.3664482,"lng":78.5240267}}},"formatted_address":"Hyderabad, Telangana 500059, India","address_components":[{"long_name":"500059","short_name":"500059","types":["postal_code"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["locality","political"]},{"long_name":"Hyderabad","short_name":"Hyderabad","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}]},{"place_id":"ChIJx9Lr6tqZyzsRMyOXJZHL34s","types":["administrative_area_level_2","political"],"geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":17.29111,"lng":78.3640099},"northeast":{"lat":17.52701,"lng":78.55109}},"location":{"lat":17.4027421,"lng":78.4524591},"bounds":{"southwest":{"lat":17.29111,"lng":78.3640099},"northeast":{"lat":17.52701,"lng":78.55109}}},"formatted_address":"Hyderabad, Telangana, India","address_components":[{"long_name":"Hyderabad","short_name":"Hyderabad","types":["administrative_area_level_2","political"]},{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}]},{"place_id":"ChIJQ-0plNtQMzoRWUBZQad772M","types":["administrative_area_level_1","political"],"geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":15.83535,"lng":77.23791299999999},"northeast":{"lat":19.916715,"lng":81.3075465}},"location":{"lat":18.1124372,"lng":79.01929969999999},"bounds":{"southwest":{"lat":15.83535,"lng":77.23791299999999},"northeast":{"lat":19.916715,"lng":81.3075465}}},"formatted_address":"Telangana, India","address_components":[{"long_name":"Telangana","short_name":"Telangana","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}]},{"place_id":"ChIJkbeSa_BfYzARphNChaFPjNc","types":["country","political"],"geometry":{"location_type":"APPROXIMATE","viewport":{"southwest":{"lat":6.7535159,"lng":68.16288519999999},"northeast":{"lat":35.5087008,"lng":97.395561}},"location":{"lat":20.593684,"lng":78.96288},"bounds":{"southwest":{"lat":6.7535159,"lng":68.1623859},"northeast":{"lat":35.5087008,"lng":97.395561}}},"formatted_address":"India","address_components":[{"long_name":"India","short_name":"IN","types":["country","political"]}]}]	3	7	3
\.


--
-- Name: core_issue_issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('core_issue_issue_id_seq', 3, true);


--
-- Data for Name: core_issuestatus; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY core_issuestatus (id, status) FROM stdin;
2	Under verification
3	Assigned
4	Under progress
5	Resolved
6	Spam
7	Put on hold
1	New
8	Cannot be resolved
\.


--
-- Name: core_issuestatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('core_issuestatus_id_seq', 8, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	core	department
7	core	issuestatus
8	core	issue
9	core	discussion
10	accounts	userrole
11	accounts	user
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('django_content_type_id_seq', 11, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	accounts	0001_initial	2016-05-19 13:35:53.199371+05:30
2	contenttypes	0001_initial	2016-05-19 13:35:53.351384+05:30
3	admin	0001_initial	2016-05-19 13:35:53.562699+05:30
4	contenttypes	0002_remove_content_type_name	2016-05-19 13:35:53.617417+05:30
5	auth	0001_initial	2016-05-19 13:35:54.095302+05:30
6	auth	0002_alter_permission_name_max_length	2016-05-19 13:35:54.129014+05:30
7	auth	0003_alter_user_email_max_length	2016-05-19 13:35:54.153897+05:30
8	auth	0004_alter_user_username_opts	2016-05-19 13:35:54.180104+05:30
9	auth	0005_alter_user_last_login_null	2016-05-19 13:35:54.215538+05:30
10	auth	0006_require_contenttypes_0002	2016-05-19 13:35:54.228364+05:30
11	core	0001_initial	2016-05-19 13:35:54.684601+05:30
12	sessions	0001_initial	2016-05-19 13:35:54.863336+05:30
13	core	0002_issue_user	2016-05-19 23:22:26.580003+05:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('django_migrations_id_seq', 13, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
rdlve8w1ptfzyy8wmoisk4yjxboct01l	OWIzZjNlNTYwMWI4NjNkOTNlY2I4MGYyMmYxYjRmZWUxZTYyNjY2NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjEyODMwMDI3NGMxZWJiZWNiN2JlODM2NTJhMTg1ZTUwNzY4MGIiLCJfc2Vzc2lvbl9leHBpcnkiOjYwLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-05-19 20:19:24.14283+05:30
u3wn5buuhidmqgx88bmqqqxq4mnz1kqm	MGVmZTFmNzU0YWIzYjQyNjU0MDcyOWU5NmYxMTFhZjZmMjM4NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwOWMyYjBiZjljNTFmYzU5YWM1ZmY5NzU4ZTdmMzlkNDg1Nzg4ZDQiLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-06-04 21:10:47.613819+05:30
\.


--
-- Name: accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (userid);


--
-- Name: accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


--
-- Name: accounts_userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY accounts_userrole
    ADD CONSTRAINT accounts_userrole_pkey PRIMARY KEY (roleid);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: core_department_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY core_department
    ADD CONSTRAINT core_department_pkey PRIMARY KEY (dept_id);


--
-- Name: core_discussion_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY core_discussion
    ADD CONSTRAINT core_discussion_pkey PRIMARY KEY (id);


--
-- Name: core_issue_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY core_issue
    ADD CONSTRAINT core_issue_pkey PRIMARY KEY (issue_id);


--
-- Name: core_issuestatus_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY core_issuestatus
    ADD CONSTRAINT core_issuestatus_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_6c66f8e54fe9b7d1_uniq; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_6c66f8e54fe9b7d1_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: accounts_user_84566833; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX accounts_user_84566833 ON accounts_user USING btree (role_id);


--
-- Name: accounts_user_username_203d8e833562502d_like; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX accounts_user_username_203d8e833562502d_like ON accounts_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_6ba84d8831937dca_like; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX auth_group_name_6ba84d8831937dca_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: core_discussion_12f3e382; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX core_discussion_12f3e382 ON core_discussion USING btree (issue_id);


--
-- Name: core_issue_b583a629; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX core_issue_b583a629 ON core_issue USING btree (category_id);


--
-- Name: core_issue_dc91ed4b; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX core_issue_dc91ed4b ON core_issue USING btree (status_id);


--
-- Name: core_issue_e8701ad4; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX core_issue_e8701ad4 ON core_issue USING btree (user_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_5ca4aa55b04ba353_like; Type: INDEX; Schema: public; Owner: ravi; Tablespace: 
--

CREATE INDEX django_session_session_key_5ca4aa55b04ba353_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: accounts_u_role_id_2fbb34b811457ad0_fk_accounts_userrole_roleid; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY accounts_user
    ADD CONSTRAINT accounts_u_role_id_2fbb34b811457ad0_fk_accounts_userrole_roleid FOREIGN KEY (role_id) REFERENCES accounts_userrole(roleid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_4392997bbd599102_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_4392997bbd599102_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group__permission_id_1e697db4b9c04c6_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group__permission_id_1e697db4b9c04c6_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_1fd18977455a5e99_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_1fd18977455a5e99_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_discussio_issue_id_3b9da80cd00582cd_fk_core_issue_issue_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY core_discussion
    ADD CONSTRAINT core_discussio_issue_id_3b9da80cd00582cd_fk_core_issue_issue_id FOREIGN KEY (issue_id) REFERENCES core_issue(issue_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_is_category_id_7ce91e55cc426dd0_fk_core_department_dept_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY core_issue
    ADD CONSTRAINT core_is_category_id_7ce91e55cc426dd0_fk_core_department_dept_id FOREIGN KEY (category_id) REFERENCES core_department(dept_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_issue_status_id_6166a7636999969a_fk_core_issuestatus_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY core_issue
    ADD CONSTRAINT core_issue_status_id_6166a7636999969a_fk_core_issuestatus_id FOREIGN KEY (status_id) REFERENCES core_issuestatus(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_issue_user_id_22ce1470e07a2ed3_fk_accounts_user_userid; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY core_issue
    ADD CONSTRAINT core_issue_user_id_22ce1470e07a2ed3_fk_accounts_user_userid FOREIGN KEY (user_id) REFERENCES accounts_user(userid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_5d39b2c08b8b7563_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_5d39b2c08b8b7563_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_l_user_id_4c9f3d7feef0a6fb_fk_accounts_user_userid; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_l_user_id_4c9f3d7feef0a6fb_fk_accounts_user_userid FOREIGN KEY (user_id) REFERENCES accounts_user(userid) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


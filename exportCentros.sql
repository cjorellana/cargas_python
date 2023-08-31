--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Homebrew)
-- Dumped by pg_dump version 14.9 (Homebrew)

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
-- Name: acerca; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.acerca (
    id integer NOT NULL,
    titulo character varying(191) NOT NULL,
    descripcion character varying(191),
    contenido character varying(4000) NOT NULL,
    visible integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.acerca OWNER TO userdatabase;

--
-- Name: acerca_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.acerca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acerca_id_seq OWNER TO userdatabase;

--
-- Name: acerca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.acerca_id_seq OWNED BY public.acerca.id;


--
-- Name: archivos; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.archivos (
    id integer NOT NULL,
    activo integer NOT NULL,
    descripcion character varying(400) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    imagen integer NOT NULL,
    url character varying(191) NOT NULL,
    estado integer NOT NULL,
    name_imagen character varying(191) NOT NULL
);


ALTER TABLE public.archivos OWNER TO userdatabase;

--
-- Name: centros; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.centros (
    centro integer NOT NULL,
    nombre character varying(400) NOT NULL,
    departamento character varying(191),
    municipio character varying(191),
    direccion character varying(191),
    telefono character varying(191),
    encargado character varying(191),
    email character varying(191),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.centros OWNER TO userdatabase;

--
-- Name: cursos; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.cursos (
    id integer NOT NULL,
    "Carrera" character varying(191) NOT NULL,
    "Nombre_Curso" character varying(191) NOT NULL,
    "Curso" character varying(191) NOT NULL,
    "Seccion" character varying(191) NOT NULL,
    "Tipoasig" character varying(191) NOT NULL,
    "Periodo" character varying(191) NOT NULL,
    "Pensum" character varying(191) NOT NULL,
    "Ciclo" character varying(191) NOT NULL,
    "No_Asignados" character varying(191) NOT NULL,
    centro integer NOT NULL,
    "Jornada" character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    desc_seccion character varying(191) NOT NULL,
    inicio date,
    fin date
);


ALTER TABLE public.cursos OWNER TO userdatabase;

--
-- Name: cursos_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.cursos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cursos_id_seq OWNER TO userdatabase;

--
-- Name: cursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.cursos_id_seq OWNED BY public.cursos.id;


--
-- Name: especialidades; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.especialidades (
    id integer NOT NULL,
    "Carrera" character varying(10) NOT NULL,
    "Pensum" character varying(14) NOT NULL,
    "Nombre" character varying(200) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.especialidades OWNER TO userdatabase;

--
-- Name: especialidades_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.especialidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.especialidades_id_seq OWNER TO userdatabase;

--
-- Name: especialidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.especialidades_id_seq OWNED BY public.especialidades.id;


--
-- Name: horarios; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.horarios (
    id integer NOT NULL,
    curso character varying(191) NOT NULL,
    carrera character varying(191) NOT NULL,
    seccion character varying(191) NOT NULL,
    tipoasig character varying(191) NOT NULL,
    portal character varying(191) NOT NULL,
    periodo character varying(191) NOT NULL,
    dia character varying(191) NOT NULL,
    horaini timestamp(0) without time zone NOT NULL,
    horafin timestamp(0) without time zone NOT NULL,
    correlativo integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.horarios OWNER TO userdatabase;

--
-- Name: horarios_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.horarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horarios_id_seq OWNER TO userdatabase;

--
-- Name: horarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.horarios_id_seq OWNED BY public.horarios.id;


--
-- Name: informacion_academica; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.informacion_academica (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    nombre character varying(100) NOT NULL,
    icono character varying(50) NOT NULL,
    descripcion character varying(500) NOT NULL,
    vence timestamp(0) without time zone,
    url character varying(191) NOT NULL
);


ALTER TABLE public.informacion_academica OWNER TO userdatabase;

--
-- Name: informacion_academica_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.informacion_academica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.informacion_academica_id_seq OWNER TO userdatabase;

--
-- Name: informacion_academica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.informacion_academica_id_seq OWNED BY public.informacion_academica.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO userdatabase;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO userdatabase;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(191) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO userdatabase;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(191) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO userdatabase;

--
-- Name: noticias; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.noticias (
    id integer NOT NULL,
    titulo character varying(191) NOT NULL,
    descripcion character varying(191),
    contenido character varying(4000) NOT NULL,
    visible integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.noticias OWNER TO userdatabase;

--
-- Name: noticias_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.noticias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.noticias_id_seq OWNER TO userdatabase;

--
-- Name: noticias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.noticias_id_seq OWNED BY public.noticias.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO userdatabase;

--
-- Name: periodos; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.periodos (
    carrera character varying(191) NOT NULL,
    periodo character varying(191) NOT NULL,
    descripcion character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.periodos OWNER TO userdatabase;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    guard_name character varying(191) NOT NULL,
    title character varying(191) NOT NULL,
    description character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO userdatabase;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO userdatabase;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: preguntas; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.preguntas (
    id integer NOT NULL,
    pregunta character varying(191) NOT NULL,
    respuesta character varying(4000) NOT NULL,
    visible integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.preguntas OWNER TO userdatabase;

--
-- Name: preguntas_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.preguntas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preguntas_id_seq OWNER TO userdatabase;

--
-- Name: preguntas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.preguntas_id_seq OWNED BY public.preguntas.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO userdatabase;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    guard_name character varying(191) NOT NULL,
    title character varying(191) NOT NULL,
    description character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO userdatabase;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO userdatabase;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: userdatabase
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    email character varying(191) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(191) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO userdatabase;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: userdatabase
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO userdatabase;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdatabase
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: acerca id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.acerca ALTER COLUMN id SET DEFAULT nextval('public.acerca_id_seq'::regclass);


--
-- Name: cursos id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id SET DEFAULT nextval('public.cursos_id_seq'::regclass);


--
-- Name: especialidades id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.especialidades ALTER COLUMN id SET DEFAULT nextval('public.especialidades_id_seq'::regclass);


--
-- Name: horarios id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.horarios ALTER COLUMN id SET DEFAULT nextval('public.horarios_id_seq'::regclass);


--
-- Name: informacion_academica id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.informacion_academica ALTER COLUMN id SET DEFAULT nextval('public.informacion_academica_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: noticias id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.noticias ALTER COLUMN id SET DEFAULT nextval('public.noticias_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: preguntas id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.preguntas ALTER COLUMN id SET DEFAULT nextval('public.preguntas_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: acerca; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.acerca (id, titulo, descripcion, contenido, visible, created_at, updated_at) FROM stdin;
1	UNIVERSIDAD GALILEO	Información a mostrar	<p class="ql-align-justify">Consciente de los desafíos a los que se enfrenta el nivel&nbsp;educativo superior, y convencida de las oportunidades que la educación abierta ofrece a personas que no tienen acceso a una educación superior y en respuesta a la creciente demanda de servicios educativos, creó el&nbsp;<strong><em>Programa IDEA</em></strong>, como una opción válida que permite el estudio de carreras universitarias a aquellas personas que por razones geográficas, laborales o económicas, no tienen acceso a educación superior bajo un método convencional.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Los programas de estudio que ofrece, IDEA, están dirigidos a todas las personas que laboran en empresas públicas o privadas, que tengan el deseo de mejorar su eficiencia y productividad por medio del conocimiento de herramientas de informática, gerenciales, contables financieras y administrativas, al mismo tiempo que se concibe como un sistema de pirámide invertida el cual proporciona al alumno desde el inicio de las carreras, cursos de aplicación inmediata.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify"><strong>Educación Superior en toda la República</strong></p><p class="ql-align-justify">El Programa IDEA está integrado por centros de estudio&nbsp;denominados&nbsp;&nbsp;<strong>CEI</strong>, ubicados en diferentes localidades de la República de Guatemala, para facilitarle al alumno el estudio y movilización hasta el lugar en que recibirá las tutorías. Con lo anterior se rompe el concepto tradicional del alumno que asiste a un campus central, y evita de esta manera la saturación de espacio y pérdida de tiempo en el que se incurre al trasladarse de un lugar a otro.</p><p class="ql-align-justify"><br></p><p class="ql-align-center"><strong><em>Un centro de estudios promueve el desarrollo integral de la educación en las diferentes comunidades del país. Asimismo, provee un servicio administrativo y académico de calidad con la finalidad de colaborar con la excelencia académica que distingue a Universidad Galileo.</em></strong></p><p class="ql-align-center"><br></p><p class="ql-align-justify">Actualmente, el Programa cuenta con más de 84 centros de estudio diseminados en toda la República, de los cuales 65 se encuentran abiertos al público en general.</p><p><br></p>	1	2023-08-29 23:04:39	2023-08-29 23:04:39
\.


--
-- Data for Name: archivos; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.archivos (id, activo, descripcion, created_at, updated_at, imagen, url, estado, name_imagen) FROM stdin;
\.


--
-- Data for Name: centros; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.centros (centro, nombre, departamento, municipio, direccion, telefono, encargado, email, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.cursos (id, "Carrera", "Nombre_Curso", "Curso", "Seccion", "Tipoasig", "Periodo", "Pensum", "Ciclo", "No_Asignados", centro, "Jornada", created_at, updated_at, desc_seccion, inicio, fin) FROM stdin;
\.


--
-- Data for Name: especialidades; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.especialidades (id, "Carrera", "Pensum", "Nombre", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.horarios (id, curso, carrera, seccion, tipoasig, portal, periodo, dia, horaini, horafin, correlativo, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: informacion_academica; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.informacion_academica (id, created_at, updated_at, nombre, icono, descripcion, vence, url) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2018_11_23_162127_create_categorias_table	1
4	2020_04_18_071122_create_centros_table	1
5	2020_04_19_012311_create_cursos_table	1
6	2020_05_07_204312_create_archivos_table	1
7	2020_05_12_044642_create_noticias_table	1
8	2020_05_16_202105_create_especialidades_table	1
9	2020_05_27_085013_add_imagen_to_archivos_table	1
10	2020_05_27_194854_create_acerca_table	1
11	2020_05_29_082009_create_horarios_table	1
12	2020_05_30_005050_create_preguntas_table	1
13	2020_06_03_192215_create_periodos_table	1
14	2020_06_05_221550_add_votes_to_desc_seccion_table	1
15	2020_11_20_000330_update_nombre_centros	1
16	2021_01_22_040353_create_permission_tables	1
17	2023_07_17_165120_add_dates_to_cursos_table	1
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\User	1
\.


--
-- Data for Name: noticias; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.noticias (id, titulo, descripcion, contenido, visible, created_at, updated_at) FROM stdin;
1	Información importante	Información importante	<p class="ql-align-justify">Estimados Alumnos</p><p class="ql-align-justify">Programa IDEA</p><p class="ql-align-justify">Universidad Galileo</p><p class="ql-align-justify"><span style="color: black;">&nbsp;</span></p><p class="ql-align-justify">Para el año 2023 puede realizar su inscripción de manera virtual o de forma presencial en el Centro de Estudios que desee. En caso su inscripción sea de forma virtual, tomar en cuenta lo siguiente: </p><p class="ql-align-justify"><span style="color: black;">&nbsp;</span></p><p class="ql-align-justify"><strong>Alumnos de reingreso&nbsp;</strong></p><p class="ql-align-justify">Deben realizar su asignación a través del Portal de Estudiantes Galileo (<a href="http://estudiantes.galileo.edu/" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 123, 255);">estudiantes.galileo.edu</a>).&nbsp;</p><p class="ql-align-justify"><span style="color: black;">&nbsp;</span></p><p class="ql-align-justify"><strong>Alumnos de primer ingreso</strong></p><p class="ql-align-justify">A continuación, encontrará el link con la guía de inscripción para asignarse a través del Portal de Admisiones&nbsp;<a href="https://centrosidea.galileo.edu/files/72.pdf" rel="noopener noreferrer" target="_blank" style="color: black;">https://centrosidea.galileo.edu/files/72.pdf</a>&nbsp;</p><p class="ql-align-justify"><span style="color: black;">&nbsp;</span></p><p class="ql-align-justify">Cualquier consulta o inconveniente, puede escribir a los correos:</p><p class="ql-align-justify"><span style="color: black;">&nbsp;</span></p><ul><li class="ql-align-justify"><strong style="color: rgb(0, 123, 255);">soporte.idea@galileo.edu</strong></li><li class="ql-align-justify"><strong style="color: rgb(0, 123, 255);">atencionalumnosidea@galileo.edu</strong></li></ul><p class="ql-align-justify"><span style="color: black;">&nbsp;</span></p><p class="ql-align-justify">Agradecemos su comprensión ante dicha situación.</p><p class="ql-align-justify"><span style="color: black;">&nbsp;</span></p><p class="ql-align-justify">Atentamente,</p><p><br></p>	1	2023-08-29 23:02:34	2023-08-29 23:02:34
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: periodos; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.periodos (carrera, periodo, descripcion, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.permissions (id, name, guard_name, title, description, created_at, updated_at) FROM stdin;
1	registro	web	Registrar usuarios	Formulario para registar nuevos usuarios	2023-08-29 22:58:30	2023-08-29 22:58:30
2	users.index	web	Navegar usuarios	Lista y navega todos los usuarios del sistema	2023-08-29 22:58:30	2023-08-29 22:58:30
3	users.show	web	Ver detalle de usuario	Ve en detalle cada usuario del sistema	2023-08-29 22:58:30	2023-08-29 22:58:30
4	users.edit	web	Edición de usuarios	Podría editar cualquier dato de un usuario del sistema	2023-08-29 22:58:30	2023-08-29 22:58:30
5	users.destroy	web	Eliminar usuario	Podría eliminar cualquier usuario del sistema	2023-08-29 22:58:30	2023-08-29 22:58:30
6	roles.index	web	Navegar roles	Lista y navega todos los roles del sistema	2023-08-29 22:58:30	2023-08-29 22:58:30
7	roles.show	web	Ver detalle de un rol	Ve en detalle cada rol del sistema	2023-08-29 22:58:30	2023-08-29 22:58:30
8	roles.create	web	Creación de roles	Podría crear nuevos roles en el sistema	2023-08-29 22:58:30	2023-08-29 22:58:30
9	roles.edit	web	Edición de roles	Podría editar cualquier dato de un rol del sistema	2023-08-29 22:58:30	2023-08-29 22:58:30
10	roles.destroy	web	Eliminar roles	Podría eliminar cualquier rol del sistema	2023-08-29 22:58:30	2023-08-29 22:58:30
11	news	web	Nocicias	Acceso a edicion de noticas	2023-08-29 22:58:30	2023-08-29 22:58:30
12	images	web	Imagenes	Acceso a edicion de imagenes	2023-08-29 22:58:30	2023-08-29 22:58:30
13	files	web	Archivos	Acceso a edicion de archivos	2023-08-29 22:58:30	2023-08-29 22:58:30
14	about	web	Acerca De	Acceso a edicion de información	2023-08-29 22:58:30	2023-08-29 22:58:30
15	contact	web	Contacto	Acceso a edicion de contacto	2023-08-29 22:58:30	2023-08-29 22:58:30
\.


--
-- Data for Name: preguntas; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.preguntas (id, pregunta, respuesta, visible, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.roles (id, name, guard_name, title, description, created_at, updated_at) FROM stdin;
1	admin	web	admin	Role de administador total	2023-08-29 22:58:30	2023-08-29 22:58:30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: userdatabase
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
1	Administrador	admin	\N	$2y$10$7VwM32w/8KSe0grjZ7Bnm.OHaNYwmRvYekfPBR4xobDxm45XobTFW	\N	\N	\N
\.


--
-- Name: acerca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.acerca_id_seq', 1, true);


--
-- Name: cursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.cursos_id_seq', 1, false);


--
-- Name: especialidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.especialidades_id_seq', 1, false);


--
-- Name: horarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.horarios_id_seq', 1, false);


--
-- Name: informacion_academica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.informacion_academica_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.migrations_id_seq', 17, true);


--
-- Name: noticias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.noticias_id_seq', 1, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.permissions_id_seq', 15, true);


--
-- Name: preguntas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.preguntas_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdatabase
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: acerca acerca_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.acerca
    ADD CONSTRAINT acerca_pkey PRIMARY KEY (id);


--
-- Name: centros centros_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.centros
    ADD CONSTRAINT centros_pkey PRIMARY KEY (centro);


--
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id);


--
-- Name: especialidades especialidades_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (id);


--
-- Name: horarios horarios_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (id);


--
-- Name: informacion_academica informacion_academica_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.informacion_academica
    ADD CONSTRAINT informacion_academica_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: noticias noticias_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: preguntas preguntas_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.preguntas
    ADD CONSTRAINT preguntas_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: userdatabase
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: userdatabase
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: userdatabase
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: cursos cursos_centro_foreign; Type: FK CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_centro_foreign FOREIGN KEY (centro) REFERENCES public.centros(centro) ON DELETE CASCADE;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: userdatabase
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


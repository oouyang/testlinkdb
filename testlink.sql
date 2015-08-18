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
-- Name: h5tl_assignment_status; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_assignment_status (
    id bigint NOT NULL,
    description character varying(100) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.h5tl_assignment_status OWNER TO tladmin;

--
-- Name: h5tl_assignment_status_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_assignment_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_assignment_status_id_seq OWNER TO tladmin;

--
-- Name: h5tl_assignment_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_assignment_status_id_seq OWNED BY h5tl_assignment_status.id;


--
-- Name: h5tl_assignment_types; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_assignment_types (
    id bigint NOT NULL,
    fk_table character varying(30) DEFAULT ''::character varying,
    description character varying(100) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.h5tl_assignment_types OWNER TO tladmin;

--
-- Name: h5tl_assignment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_assignment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_assignment_types_id_seq OWNER TO tladmin;

--
-- Name: h5tl_assignment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_assignment_types_id_seq OWNED BY h5tl_assignment_types.id;


--
-- Name: h5tl_attachments; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_attachments (
    id bigint NOT NULL,
    fk_id bigint DEFAULT (0)::bigint NOT NULL,
    fk_table character varying(250) DEFAULT ''::character varying,
    title character varying(250) DEFAULT ''::character varying,
    description character varying(250) DEFAULT ''::character varying,
    file_name character varying(250) DEFAULT ''::character varying NOT NULL,
    file_path character varying(250) DEFAULT ''::character varying,
    file_size integer DEFAULT 0 NOT NULL,
    file_type character varying(250) DEFAULT ''::character varying NOT NULL,
    date_added timestamp without time zone DEFAULT now() NOT NULL,
    content bytea,
    compression_type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.h5tl_attachments OWNER TO tladmin;

--
-- Name: h5tl_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_attachments_id_seq OWNER TO tladmin;

--
-- Name: h5tl_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_attachments_id_seq OWNED BY h5tl_attachments.id;


--
-- Name: h5tl_builds; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_builds (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT (0)::bigint NOT NULL,
    name character varying(100) DEFAULT 'undefined'::character varying NOT NULL,
    notes text,
    active smallint DEFAULT (1)::smallint NOT NULL,
    is_open smallint DEFAULT (1)::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    release_date date,
    closed_on_date date
);


ALTER TABLE public.h5tl_builds OWNER TO tladmin;

--
-- Name: h5tl_builds_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_builds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_builds_id_seq OWNER TO tladmin;

--
-- Name: h5tl_builds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_builds_id_seq OWNED BY h5tl_builds.id;


--
-- Name: h5tl_cfield_build_design_values; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_cfield_build_design_values (
    field_id integer DEFAULT 0 NOT NULL,
    node_id integer DEFAULT 0 NOT NULL,
    value character varying(4000) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.h5tl_cfield_build_design_values OWNER TO tladmin;

--
-- Name: h5tl_cfield_design_values; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_cfield_design_values (
    field_id integer DEFAULT 0 NOT NULL,
    node_id integer DEFAULT 0 NOT NULL,
    value character varying(4000) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.h5tl_cfield_design_values OWNER TO tladmin;

--
-- Name: h5tl_cfield_execution_values; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_cfield_execution_values (
    field_id integer DEFAULT 0 NOT NULL,
    execution_id integer DEFAULT 0 NOT NULL,
    testplan_id integer DEFAULT 0 NOT NULL,
    tcversion_id integer DEFAULT 0 NOT NULL,
    value character varying(4000) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.h5tl_cfield_execution_values OWNER TO tladmin;

--
-- Name: h5tl_cfield_node_types; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_cfield_node_types (
    field_id integer DEFAULT 0 NOT NULL,
    node_type_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.h5tl_cfield_node_types OWNER TO tladmin;

--
-- Name: h5tl_cfield_testplan_design_values; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_cfield_testplan_design_values (
    field_id integer DEFAULT 0 NOT NULL,
    link_id integer DEFAULT 0 NOT NULL,
    value character varying(4000) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.h5tl_cfield_testplan_design_values OWNER TO tladmin;

--
-- Name: h5tl_cfield_testprojects; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_cfield_testprojects (
    field_id bigint DEFAULT (0)::bigint NOT NULL,
    testproject_id bigint DEFAULT (0)::bigint NOT NULL,
    display_order integer DEFAULT 1 NOT NULL,
    active smallint DEFAULT (1)::smallint NOT NULL,
    location smallint DEFAULT (1)::smallint NOT NULL,
    required smallint DEFAULT (0)::smallint NOT NULL,
    required_on_design smallint DEFAULT (0)::smallint NOT NULL,
    required_on_execution smallint DEFAULT (0)::smallint NOT NULL
);


ALTER TABLE public.h5tl_cfield_testprojects OWNER TO tladmin;

--
-- Name: h5tl_custom_fields; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_custom_fields (
    id integer NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    label character varying(64) DEFAULT ''::character varying NOT NULL,
    type smallint DEFAULT (0)::smallint NOT NULL,
    possible_values character varying(4000) DEFAULT ''::character varying NOT NULL,
    default_value character varying(4000) DEFAULT ''::character varying NOT NULL,
    valid_regexp character varying(255) DEFAULT ''::character varying NOT NULL,
    length_min integer DEFAULT 0 NOT NULL,
    length_max integer DEFAULT 0 NOT NULL,
    show_on_design smallint DEFAULT (1)::smallint NOT NULL,
    enable_on_design smallint DEFAULT (1)::smallint NOT NULL,
    show_on_execution smallint DEFAULT (0)::smallint NOT NULL,
    enable_on_execution smallint DEFAULT (0)::smallint NOT NULL,
    show_on_testplan_design smallint DEFAULT (0)::smallint NOT NULL,
    enable_on_testplan_design smallint DEFAULT (0)::smallint NOT NULL
);


ALTER TABLE public.h5tl_custom_fields OWNER TO tladmin;

--
-- Name: h5tl_custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_custom_fields_id_seq OWNER TO tladmin;

--
-- Name: h5tl_custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_custom_fields_id_seq OWNED BY h5tl_custom_fields.id;


--
-- Name: h5tl_db_version; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_db_version (
    version character varying(50) DEFAULT 'unknown'::character varying NOT NULL,
    upgrade_ts timestamp without time zone DEFAULT now() NOT NULL,
    notes text
);


ALTER TABLE public.h5tl_db_version OWNER TO tladmin;

--
-- Name: h5tl_events; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_events (
    id bigint NOT NULL,
    transaction_id bigint DEFAULT (0)::bigint NOT NULL,
    log_level smallint DEFAULT (0)::smallint NOT NULL,
    source character varying(45),
    description text NOT NULL,
    fired_at integer DEFAULT 0 NOT NULL,
    activity character varying(45),
    object_id bigint,
    object_type character varying(45)
);


ALTER TABLE public.h5tl_events OWNER TO tladmin;

--
-- Name: h5tl_events_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_events_id_seq OWNER TO tladmin;

--
-- Name: h5tl_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_events_id_seq OWNED BY h5tl_events.id;


--
-- Name: h5tl_execution_bugs; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_execution_bugs (
    execution_id bigint DEFAULT (0)::bigint NOT NULL,
    bug_id character varying(64) DEFAULT '0'::character varying NOT NULL
);


ALTER TABLE public.h5tl_execution_bugs OWNER TO tladmin;

--
-- Name: h5tl_execution_tcsteps; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_execution_tcsteps (
    id bigint NOT NULL,
    execution_id integer DEFAULT 0 NOT NULL,
    tcstep_id integer DEFAULT 0 NOT NULL,
    notes text,
    status character(1) DEFAULT NULL::bpchar
);


ALTER TABLE public.h5tl_execution_tcsteps OWNER TO tladmin;

--
-- Name: h5tl_execution_tcsteps_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_execution_tcsteps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_execution_tcsteps_id_seq OWNER TO tladmin;

--
-- Name: h5tl_execution_tcsteps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_execution_tcsteps_id_seq OWNED BY h5tl_execution_tcsteps.id;


--
-- Name: h5tl_executions; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_executions (
    id bigint NOT NULL,
    build_id integer DEFAULT 0 NOT NULL,
    tester_id bigint,
    execution_ts timestamp without time zone,
    status character(1) DEFAULT NULL::bpchar,
    testplan_id bigint DEFAULT (0)::bigint NOT NULL,
    tcversion_id bigint DEFAULT (0)::bigint NOT NULL,
    tcversion_number integer DEFAULT 1 NOT NULL,
    platform_id bigint DEFAULT (0)::bigint NOT NULL,
    execution_type smallint DEFAULT (1)::smallint NOT NULL,
    execution_duration numeric(6,2),
    notes text
);


ALTER TABLE public.h5tl_executions OWNER TO tladmin;

--
-- Name: h5tl_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_executions_id_seq OWNER TO tladmin;

--
-- Name: h5tl_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_executions_id_seq OWNED BY h5tl_executions.id;


--
-- Name: h5tl_inventory; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_inventory (
    id bigint NOT NULL,
    testproject_id bigint DEFAULT (0)::bigint NOT NULL,
    owner_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    ipaddress character varying(255) NOT NULL,
    content text,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    modification_ts timestamp without time zone
);


ALTER TABLE public.h5tl_inventory OWNER TO tladmin;

--
-- Name: h5tl_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_inventory_id_seq OWNER TO tladmin;

--
-- Name: h5tl_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_inventory_id_seq OWNED BY h5tl_inventory.id;


--
-- Name: h5tl_issuetrackers; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_issuetrackers (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    cfg text
);


ALTER TABLE public.h5tl_issuetrackers OWNER TO tladmin;

--
-- Name: h5tl_issuetrackers_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_issuetrackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_issuetrackers_id_seq OWNER TO tladmin;

--
-- Name: h5tl_issuetrackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_issuetrackers_id_seq OWNED BY h5tl_issuetrackers.id;


--
-- Name: h5tl_keywords; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_keywords (
    id bigint NOT NULL,
    keyword character varying(100) DEFAULT ''::character varying NOT NULL,
    testproject_id bigint DEFAULT (0)::bigint NOT NULL,
    notes text
);


ALTER TABLE public.h5tl_keywords OWNER TO tladmin;

--
-- Name: h5tl_keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_keywords_id_seq OWNER TO tladmin;

--
-- Name: h5tl_keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_keywords_id_seq OWNED BY h5tl_keywords.id;


--
-- Name: h5tl_milestones; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_milestones (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT (0)::bigint NOT NULL,
    target_date date NOT NULL,
    start_date date,
    a smallint DEFAULT (0)::smallint NOT NULL,
    b smallint DEFAULT (0)::smallint NOT NULL,
    c smallint DEFAULT (0)::smallint NOT NULL,
    name character varying(100) DEFAULT 'undefined'::character varying NOT NULL
);


ALTER TABLE public.h5tl_milestones OWNER TO tladmin;

--
-- Name: h5tl_milestones_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_milestones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_milestones_id_seq OWNER TO tladmin;

--
-- Name: h5tl_milestones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_milestones_id_seq OWNED BY h5tl_milestones.id;


--
-- Name: h5tl_node_types; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_node_types (
    id bigint NOT NULL,
    description character varying(100) DEFAULT 'testproject'::character varying NOT NULL
);


ALTER TABLE public.h5tl_node_types OWNER TO tladmin;

--
-- Name: h5tl_node_types_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_node_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_node_types_id_seq OWNER TO tladmin;

--
-- Name: h5tl_node_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_node_types_id_seq OWNED BY h5tl_node_types.id;


--
-- Name: h5tl_nodes_hierarchy; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_nodes_hierarchy (
    id bigint NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    parent_id bigint,
    node_type_id bigint DEFAULT (1)::bigint NOT NULL,
    node_order bigint
);


ALTER TABLE public.h5tl_nodes_hierarchy OWNER TO tladmin;

--
-- Name: h5tl_nodes_hierarchy_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_nodes_hierarchy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_nodes_hierarchy_id_seq OWNER TO tladmin;

--
-- Name: h5tl_nodes_hierarchy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_nodes_hierarchy_id_seq OWNED BY h5tl_nodes_hierarchy.id;


--
-- Name: h5tl_object_keywords; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_object_keywords (
    id bigint NOT NULL,
    fk_id bigint DEFAULT (0)::bigint NOT NULL,
    fk_table character varying(30) DEFAULT ''::character varying,
    keyword_id bigint DEFAULT (0)::bigint NOT NULL
);


ALTER TABLE public.h5tl_object_keywords OWNER TO tladmin;

--
-- Name: h5tl_object_keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_object_keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_object_keywords_id_seq OWNER TO tladmin;

--
-- Name: h5tl_object_keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_object_keywords_id_seq OWNED BY h5tl_object_keywords.id;


--
-- Name: h5tl_platforms; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_platforms (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    testproject_id bigint DEFAULT (0)::bigint NOT NULL,
    notes text NOT NULL
);


ALTER TABLE public.h5tl_platforms OWNER TO tladmin;

--
-- Name: h5tl_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_platforms_id_seq OWNER TO tladmin;

--
-- Name: h5tl_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_platforms_id_seq OWNED BY h5tl_platforms.id;


--
-- Name: h5tl_req_coverage; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_req_coverage (
    req_id integer DEFAULT 0 NOT NULL,
    testcase_id integer DEFAULT 0 NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    review_requester_id bigint,
    review_request_ts timestamp without time zone
);


ALTER TABLE public.h5tl_req_coverage OWNER TO tladmin;

--
-- Name: h5tl_req_relations; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_req_relations (
    id bigint NOT NULL,
    source_id integer DEFAULT 0 NOT NULL,
    destination_id integer DEFAULT 0 NOT NULL,
    relation_type smallint DEFAULT (1)::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.h5tl_req_relations OWNER TO tladmin;

--
-- Name: h5tl_req_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_req_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_req_relations_id_seq OWNER TO tladmin;

--
-- Name: h5tl_req_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_req_relations_id_seq OWNED BY h5tl_req_relations.id;


--
-- Name: h5tl_req_revisions; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_req_revisions (
    parent_id bigint DEFAULT (0)::bigint NOT NULL,
    id bigint DEFAULT (0)::bigint NOT NULL,
    revision integer DEFAULT 1 NOT NULL,
    req_doc_id character varying(64),
    name character varying(100) DEFAULT NULL::character varying,
    scope text,
    status character(1) DEFAULT 'V'::bpchar NOT NULL,
    type character(1) DEFAULT NULL::bpchar,
    active smallint DEFAULT (1)::smallint NOT NULL,
    is_open smallint DEFAULT (1)::smallint NOT NULL,
    expected_coverage integer DEFAULT 1 NOT NULL,
    log_message text,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    modifier_id bigint,
    modification_ts timestamp without time zone
);


ALTER TABLE public.h5tl_req_revisions OWNER TO tladmin;

--
-- Name: h5tl_req_specs; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_req_specs (
    id bigint DEFAULT (0)::bigint NOT NULL,
    testproject_id bigint DEFAULT (0)::bigint NOT NULL,
    doc_id character varying(64) NOT NULL
);


ALTER TABLE public.h5tl_req_specs OWNER TO tladmin;

--
-- Name: h5tl_req_specs_revisions; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_req_specs_revisions (
    parent_id bigint DEFAULT (0)::bigint NOT NULL,
    id bigint DEFAULT (0)::bigint NOT NULL,
    revision integer DEFAULT 1 NOT NULL,
    doc_id character varying(64),
    name character varying(100),
    scope text,
    total_req integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    type character(1) DEFAULT 'N'::bpchar,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    modifier_id bigint,
    modification_ts timestamp without time zone,
    log_message text
);


ALTER TABLE public.h5tl_req_specs_revisions OWNER TO tladmin;

--
-- Name: h5tl_req_versions; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_req_versions (
    id bigint DEFAULT (0)::bigint NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    revision integer DEFAULT 1 NOT NULL,
    scope text,
    status character(1) DEFAULT 'V'::bpchar NOT NULL,
    type character(1) DEFAULT NULL::bpchar,
    active smallint DEFAULT (1)::smallint NOT NULL,
    is_open smallint DEFAULT (1)::smallint NOT NULL,
    expected_coverage integer DEFAULT 1 NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    modifier_id bigint,
    modification_ts timestamp without time zone,
    log_message text
);


ALTER TABLE public.h5tl_req_versions OWNER TO tladmin;

--
-- Name: h5tl_reqmgrsystems; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_reqmgrsystems (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    cfg text
);


ALTER TABLE public.h5tl_reqmgrsystems OWNER TO tladmin;

--
-- Name: h5tl_reqmgrsystems_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_reqmgrsystems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_reqmgrsystems_id_seq OWNER TO tladmin;

--
-- Name: h5tl_reqmgrsystems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_reqmgrsystems_id_seq OWNED BY h5tl_reqmgrsystems.id;


--
-- Name: h5tl_requirements; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_requirements (
    id bigint DEFAULT (0)::bigint NOT NULL,
    srs_id bigint DEFAULT (0)::bigint NOT NULL,
    req_doc_id character varying(64) NOT NULL
);


ALTER TABLE public.h5tl_requirements OWNER TO tladmin;

--
-- Name: h5tl_rights; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_rights (
    id bigint NOT NULL,
    description character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.h5tl_rights OWNER TO tladmin;

--
-- Name: h5tl_rights_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_rights_id_seq OWNER TO tladmin;

--
-- Name: h5tl_rights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_rights_id_seq OWNED BY h5tl_rights.id;


--
-- Name: h5tl_risk_assignments; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_risk_assignments (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT (0)::bigint NOT NULL,
    node_id bigint DEFAULT (0)::bigint NOT NULL,
    risk smallint DEFAULT (2)::smallint NOT NULL,
    importance smallint DEFAULT (2)::smallint NOT NULL
);


ALTER TABLE public.h5tl_risk_assignments OWNER TO tladmin;

--
-- Name: h5tl_risk_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_risk_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_risk_assignments_id_seq OWNER TO tladmin;

--
-- Name: h5tl_risk_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_risk_assignments_id_seq OWNED BY h5tl_risk_assignments.id;


--
-- Name: h5tl_role_rights; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_role_rights (
    role_id integer DEFAULT 0 NOT NULL,
    right_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.h5tl_role_rights OWNER TO tladmin;

--
-- Name: h5tl_roles; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_roles (
    id bigint NOT NULL,
    description character varying(100) DEFAULT ''::character varying NOT NULL,
    notes text
);


ALTER TABLE public.h5tl_roles OWNER TO tladmin;

--
-- Name: h5tl_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_roles_id_seq OWNER TO tladmin;

--
-- Name: h5tl_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_roles_id_seq OWNED BY h5tl_roles.id;


--
-- Name: h5tl_tcversions; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_tcversions (
    id bigint DEFAULT (0)::bigint NOT NULL,
    tc_external_id integer,
    version integer DEFAULT 1 NOT NULL,
    layout integer DEFAULT 1 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    summary text,
    preconditions text,
    importance smallint DEFAULT (2)::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    updater_id bigint,
    modification_ts timestamp without time zone,
    active smallint DEFAULT (1)::smallint NOT NULL,
    is_open smallint DEFAULT (1)::smallint NOT NULL,
    execution_type smallint DEFAULT (1)::smallint NOT NULL,
    estimated_exec_duration numeric(6,2)
);


ALTER TABLE public.h5tl_tcversions OWNER TO tladmin;

--
-- Name: h5tl_tcases_active; Type: VIEW; Schema: public; Owner: tladmin
--

CREATE VIEW h5tl_tcases_active AS
 SELECT DISTINCT nhtcv.parent_id AS tcase_id,
    tcv.tc_external_id
   FROM (h5tl_nodes_hierarchy nhtcv
     JOIN h5tl_tcversions tcv ON ((tcv.id = nhtcv.id)))
  WHERE (tcv.active = 1);


ALTER TABLE public.h5tl_tcases_active OWNER TO tladmin;

--
-- Name: h5tl_tcsteps; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_tcsteps (
    id bigint DEFAULT (0)::bigint NOT NULL,
    step_number integer DEFAULT 1 NOT NULL,
    actions text,
    expected_results text,
    active smallint DEFAULT (1)::smallint NOT NULL,
    execution_type smallint DEFAULT (1)::smallint NOT NULL
);


ALTER TABLE public.h5tl_tcsteps OWNER TO tladmin;

--
-- Name: h5tl_tcversions_last_active; Type: VIEW; Schema: public; Owner: tladmin
--

CREATE VIEW h5tl_tcversions_last_active AS
 SELECT tcv.id,
    tcv.tc_external_id,
    tcv.version,
    tcv.layout,
    tcv.status,
    tcv.summary,
    tcv.preconditions,
    tcv.importance,
    tcv.author_id,
    tcv.creation_ts,
    tcv.updater_id,
    tcv.modification_ts,
    tcv.active,
    tcv.is_open,
    tcv.execution_type,
    ac.tcase_id
   FROM (h5tl_tcversions tcv
     JOIN ( SELECT nhtcv.parent_id AS tcase_id,
            max(tcv_1.id) AS tcversion_id
           FROM (h5tl_nodes_hierarchy nhtcv
             JOIN h5tl_tcversions tcv_1 ON ((tcv_1.id = nhtcv.id)))
          WHERE (tcv_1.active = 1)
          GROUP BY nhtcv.parent_id, tcv_1.tc_external_id) ac ON ((tcv.id = ac.tcversion_id)));


ALTER TABLE public.h5tl_tcversions_last_active OWNER TO tladmin;

--
-- Name: h5tl_testcase_keywords; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_testcase_keywords (
    testcase_id bigint DEFAULT (0)::bigint NOT NULL,
    keyword_id bigint DEFAULT (0)::bigint NOT NULL
);


ALTER TABLE public.h5tl_testcase_keywords OWNER TO tladmin;

--
-- Name: h5tl_testcase_relations; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_testcase_relations (
    id bigint NOT NULL,
    source_id integer DEFAULT 0 NOT NULL,
    destination_id integer DEFAULT 0 NOT NULL,
    relation_type smallint DEFAULT (1)::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.h5tl_testcase_relations OWNER TO tladmin;

--
-- Name: h5tl_testcase_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_testcase_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_testcase_relations_id_seq OWNER TO tladmin;

--
-- Name: h5tl_testcase_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_testcase_relations_id_seq OWNED BY h5tl_testcase_relations.id;


--
-- Name: h5tl_testplan_platforms; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_testplan_platforms (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT (0)::bigint NOT NULL,
    platform_id bigint DEFAULT (0)::bigint NOT NULL
);


ALTER TABLE public.h5tl_testplan_platforms OWNER TO tladmin;

--
-- Name: h5tl_testplan_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_testplan_platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_testplan_platforms_id_seq OWNER TO tladmin;

--
-- Name: h5tl_testplan_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_testplan_platforms_id_seq OWNED BY h5tl_testplan_platforms.id;


--
-- Name: h5tl_testplan_tcversions; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_testplan_tcversions (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT (0)::bigint NOT NULL,
    tcversion_id bigint DEFAULT (0)::bigint NOT NULL,
    platform_id bigint DEFAULT (0)::bigint NOT NULL,
    node_order bigint DEFAULT 1 NOT NULL,
    urgency smallint DEFAULT (2)::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.h5tl_testplan_tcversions OWNER TO tladmin;

--
-- Name: h5tl_testplan_tcversions_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_testplan_tcversions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_testplan_tcversions_id_seq OWNER TO tladmin;

--
-- Name: h5tl_testplan_tcversions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_testplan_tcversions_id_seq OWNED BY h5tl_testplan_tcversions.id;


--
-- Name: h5tl_testplans; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_testplans (
    id bigint DEFAULT (0)::bigint NOT NULL,
    testproject_id bigint DEFAULT (0)::bigint NOT NULL,
    notes text,
    active smallint DEFAULT (1)::smallint NOT NULL,
    is_open smallint DEFAULT (1)::smallint NOT NULL,
    is_public smallint DEFAULT (1)::smallint NOT NULL,
    api_key character varying(64) DEFAULT (md5((random())::text) || md5((random())::text)) NOT NULL
);


ALTER TABLE public.h5tl_testplans OWNER TO tladmin;

--
-- Name: h5tl_testproject_issuetracker; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_testproject_issuetracker (
    testproject_id bigint DEFAULT (0)::bigint NOT NULL,
    issuetracker_id bigint DEFAULT (0)::bigint NOT NULL
);


ALTER TABLE public.h5tl_testproject_issuetracker OWNER TO tladmin;

--
-- Name: h5tl_testproject_reqmgrsystem; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_testproject_reqmgrsystem (
    testproject_id bigint DEFAULT (0)::bigint NOT NULL,
    reqmgrsystem_id bigint DEFAULT (0)::bigint NOT NULL
);


ALTER TABLE public.h5tl_testproject_reqmgrsystem OWNER TO tladmin;

--
-- Name: h5tl_testprojects; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_testprojects (
    id bigint DEFAULT (0)::bigint NOT NULL,
    notes text,
    color character varying(12) DEFAULT '#9BD'::character varying NOT NULL,
    active smallint DEFAULT (1)::smallint NOT NULL,
    option_reqs smallint DEFAULT (0)::smallint NOT NULL,
    option_priority smallint DEFAULT (0)::smallint NOT NULL,
    option_automation smallint DEFAULT (0)::smallint NOT NULL,
    options text,
    prefix character varying(16) NOT NULL,
    tc_counter integer DEFAULT 0 NOT NULL,
    is_public smallint DEFAULT (1)::smallint NOT NULL,
    issue_tracker_enabled smallint DEFAULT (0)::smallint NOT NULL,
    reqmgr_integration_enabled smallint DEFAULT (0)::smallint NOT NULL,
    api_key character varying(64) DEFAULT (md5((random())::text) || md5((random())::text)) NOT NULL
);


ALTER TABLE public.h5tl_testprojects OWNER TO tladmin;

--
-- Name: h5tl_testsuites; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_testsuites (
    id bigint DEFAULT (0)::bigint NOT NULL,
    details text
);


ALTER TABLE public.h5tl_testsuites OWNER TO tladmin;

--
-- Name: h5tl_text_templates; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_text_templates (
    id bigint NOT NULL,
    type integer NOT NULL,
    title character varying(100) NOT NULL,
    template_data text,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    is_public smallint DEFAULT (0)::smallint NOT NULL
);


ALTER TABLE public.h5tl_text_templates OWNER TO tladmin;

--
-- Name: TABLE h5tl_text_templates; Type: COMMENT; Schema: public; Owner: tladmin
--

COMMENT ON TABLE h5tl_text_templates IS 'Global Project Templates';


--
-- Name: h5tl_text_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_text_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_text_templates_id_seq OWNER TO tladmin;

--
-- Name: h5tl_text_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_text_templates_id_seq OWNED BY h5tl_text_templates.id;


--
-- Name: h5tl_transactions; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_transactions (
    id bigint NOT NULL,
    entry_point character varying(45) DEFAULT ''::character varying NOT NULL,
    start_time integer DEFAULT 0 NOT NULL,
    end_time integer DEFAULT 0 NOT NULL,
    user_id bigint DEFAULT 0,
    session_id character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public.h5tl_transactions OWNER TO tladmin;

--
-- Name: h5tl_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_transactions_id_seq OWNER TO tladmin;

--
-- Name: h5tl_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_transactions_id_seq OWNED BY h5tl_transactions.id;


--
-- Name: h5tl_user_assignments; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_user_assignments (
    id bigint NOT NULL,
    type bigint DEFAULT (0)::bigint NOT NULL,
    feature_id bigint DEFAULT (0)::bigint NOT NULL,
    user_id bigint,
    build_id bigint,
    deadline_ts timestamp without time zone DEFAULT (now() + '10 days'::interval) NOT NULL,
    assigner_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.h5tl_user_assignments OWNER TO tladmin;

--
-- Name: h5tl_user_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_user_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_user_assignments_id_seq OWNER TO tladmin;

--
-- Name: h5tl_user_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_user_assignments_id_seq OWNED BY h5tl_user_assignments.id;


--
-- Name: h5tl_user_group; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_user_group (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    owner_id bigint NOT NULL,
    testproject_id bigint NOT NULL
);


ALTER TABLE public.h5tl_user_group OWNER TO tladmin;

--
-- Name: h5tl_user_group_assign; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_user_group_assign (
    usergroup_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.h5tl_user_group_assign OWNER TO tladmin;

--
-- Name: h5tl_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_user_group_id_seq OWNER TO tladmin;

--
-- Name: h5tl_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_user_group_id_seq OWNED BY h5tl_user_group.id;


--
-- Name: h5tl_user_testplan_roles; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_user_testplan_roles (
    user_id integer DEFAULT 0 NOT NULL,
    testplan_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.h5tl_user_testplan_roles OWNER TO tladmin;

--
-- Name: h5tl_user_testproject_roles; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_user_testproject_roles (
    user_id integer DEFAULT 0 NOT NULL,
    testproject_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.h5tl_user_testproject_roles OWNER TO tladmin;

--
-- Name: h5tl_users; Type: TABLE; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE TABLE h5tl_users (
    id bigint NOT NULL,
    login character varying(30) DEFAULT ''::character varying NOT NULL,
    password character varying(32) DEFAULT ''::character varying NOT NULL,
    role_id smallint DEFAULT (0)::smallint NOT NULL,
    email character varying(100) DEFAULT ''::character varying NOT NULL,
    first character varying(30) DEFAULT ''::character varying NOT NULL,
    last character varying(30) DEFAULT ''::character varying NOT NULL,
    locale character varying(10) DEFAULT 'en_GB'::character varying NOT NULL,
    default_testproject_id integer,
    active smallint DEFAULT (1)::smallint NOT NULL,
    script_key character varying(32),
    cookie_string character varying(64) DEFAULT ''::character varying NOT NULL,
    auth_method character varying(10) DEFAULT ''::character varying
);


ALTER TABLE public.h5tl_users OWNER TO tladmin;

--
-- Name: h5tl_users_id_seq; Type: SEQUENCE; Schema: public; Owner: tladmin
--

CREATE SEQUENCE h5tl_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.h5tl_users_id_seq OWNER TO tladmin;

--
-- Name: h5tl_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tladmin
--

ALTER SEQUENCE h5tl_users_id_seq OWNED BY h5tl_users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_assignment_status ALTER COLUMN id SET DEFAULT nextval('h5tl_assignment_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_assignment_types ALTER COLUMN id SET DEFAULT nextval('h5tl_assignment_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_attachments ALTER COLUMN id SET DEFAULT nextval('h5tl_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_builds ALTER COLUMN id SET DEFAULT nextval('h5tl_builds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_custom_fields ALTER COLUMN id SET DEFAULT nextval('h5tl_custom_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_events ALTER COLUMN id SET DEFAULT nextval('h5tl_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_execution_tcsteps ALTER COLUMN id SET DEFAULT nextval('h5tl_execution_tcsteps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_executions ALTER COLUMN id SET DEFAULT nextval('h5tl_executions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_inventory ALTER COLUMN id SET DEFAULT nextval('h5tl_inventory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_issuetrackers ALTER COLUMN id SET DEFAULT nextval('h5tl_issuetrackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_keywords ALTER COLUMN id SET DEFAULT nextval('h5tl_keywords_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_milestones ALTER COLUMN id SET DEFAULT nextval('h5tl_milestones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_node_types ALTER COLUMN id SET DEFAULT nextval('h5tl_node_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_nodes_hierarchy ALTER COLUMN id SET DEFAULT nextval('h5tl_nodes_hierarchy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_object_keywords ALTER COLUMN id SET DEFAULT nextval('h5tl_object_keywords_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_platforms ALTER COLUMN id SET DEFAULT nextval('h5tl_platforms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_relations ALTER COLUMN id SET DEFAULT nextval('h5tl_req_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_reqmgrsystems ALTER COLUMN id SET DEFAULT nextval('h5tl_reqmgrsystems_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_rights ALTER COLUMN id SET DEFAULT nextval('h5tl_rights_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_risk_assignments ALTER COLUMN id SET DEFAULT nextval('h5tl_risk_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_roles ALTER COLUMN id SET DEFAULT nextval('h5tl_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testcase_relations ALTER COLUMN id SET DEFAULT nextval('h5tl_testcase_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testplan_platforms ALTER COLUMN id SET DEFAULT nextval('h5tl_testplan_platforms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testplan_tcversions ALTER COLUMN id SET DEFAULT nextval('h5tl_testplan_tcversions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_text_templates ALTER COLUMN id SET DEFAULT nextval('h5tl_text_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_transactions ALTER COLUMN id SET DEFAULT nextval('h5tl_transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_assignments ALTER COLUMN id SET DEFAULT nextval('h5tl_user_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_group ALTER COLUMN id SET DEFAULT nextval('h5tl_user_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_users ALTER COLUMN id SET DEFAULT nextval('h5tl_users_id_seq'::regclass);


--
-- Data for Name: h5tl_assignment_status; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_assignment_status (id, description) FROM stdin;
1	open
2	closed
3	completed
4	todo_urgent
5	todo
\.


--
-- Name: h5tl_assignment_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_assignment_status_id_seq', 5, true);


--
-- Data for Name: h5tl_assignment_types; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_assignment_types (id, fk_table, description) FROM stdin;
1	testplan_tcversions	testcase_execution
2	tcversions	testcase_review
\.


--
-- Name: h5tl_assignment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_assignment_types_id_seq', 2, true);


--
-- Data for Name: h5tl_attachments; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_attachments (id, fk_id, fk_table, title, description, file_name, file_path, file_size, file_type, date_added, content, compression_type) FROM stdin;
\.


--
-- Name: h5tl_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_attachments_id_seq', 1, false);


--
-- Data for Name: h5tl_builds; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_builds (id, testplan_id, name, notes, active, is_open, author_id, creation_ts, release_date, closed_on_date) FROM stdin;
1	43	29301aa03	<p>\r\n\tfor 1.0</p>\r\n	1	1	\N	2015-08-03 03:29:52	2015-07-31	\N
2	42	ef302022	<p>\r\n\tfor 1.0</p>\r\n	1	1	\N	2015-08-03 03:30:39	2015-07-29	\N
3	42	2849201		1	1	\N	2015-08-03 03:42:08	2015-08-04	\N
\.


--
-- Name: h5tl_builds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_builds_id_seq', 3, true);


--
-- Data for Name: h5tl_cfield_build_design_values; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_cfield_build_design_values (field_id, node_id, value) FROM stdin;
\.


--
-- Data for Name: h5tl_cfield_design_values; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_cfield_design_values (field_id, node_id, value) FROM stdin;
1	17	Telephony
1	35	Media
1	45	Telephony
1	22	Telephony
1	50	Telephony
\.


--
-- Data for Name: h5tl_cfield_execution_values; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_cfield_execution_values (field_id, execution_id, testplan_id, tcversion_id, value) FROM stdin;
\.


--
-- Data for Name: h5tl_cfield_node_types; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_cfield_node_types (field_id, node_type_id) FROM stdin;
1	3
\.


--
-- Data for Name: h5tl_cfield_testplan_design_values; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_cfield_testplan_design_values (field_id, link_id, value) FROM stdin;
\.


--
-- Data for Name: h5tl_cfield_testprojects; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_cfield_testprojects (field_id, testproject_id, display_order, active, location, required, required_on_design, required_on_execution) FROM stdin;
1	2	1	1	1	0	0	0
\.


--
-- Data for Name: h5tl_custom_fields; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_custom_fields (id, name, label, type, possible_values, default_value, valid_regexp, length_min, length_max, show_on_design, enable_on_design, show_on_execution, enable_on_execution, show_on_testplan_design, enable_on_testplan_design) FROM stdin;
1	Feature	Feature	6	Telephony|CMAS|Mail|BT|WIFI|NFC|Media			0	0	1	1	1	0	0	0
\.


--
-- Name: h5tl_custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_custom_fields_id_seq', 3, true);


--
-- Data for Name: h5tl_db_version; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_db_version (version, upgrade_ts, notes) FROM stdin;
DB 1.9.13	2015-07-31 15:31:45.296503	TestLink 1.9.13
\.


--
-- Data for Name: h5tl_events; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_events (id, transaction_id, log_level, source, description, fired_at, activity, object_id, object_type) FROM stdin;
82	27	32	GUI	string 'testcases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438361993	LOCALIZATION	0	\N
87	29	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:5:"admin";i:1;s:15:"122.116.168.126";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513408	LOGIN_FAILED	1	users
89	31	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"admin";i:1;s:15:"122.116.168.126";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513425	LOGIN	1	users
91	33	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_user_created";s:6:"params";a:1:{i:0;s:5:"enpei";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513504	CREATE	4	users
93	35	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_user_created";s:6:"params";a:1:{i:0;s:4:"eric";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513610	CREATE	6	users
95	37	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_user_created";s:6:"params";a:1:{i:0;s:6:"xueqin";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513712	CREATE	8	users
97	39	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"122.116.168.126";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513736	LOGIN	4	users
99	41	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_testproject_created";s:6:"params";a:1:{i:0;s:13:"Feature phone";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438514453	CREATE	3	testprojects
101	43	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_testproject_created";s:6:"params";a:1:{i:0;s:11:"Smart Watch";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438514513	CREATE	5	testprojects
103	45	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:15:"Acceptance Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438514975	CREATE	2	keywords
105	47	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:16:"Performance Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438514999	CREATE	4	keywords
107	49	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:14:"Endurance Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438515038	CREATE	6	keywords
109	51	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:17:"Localization Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438515073	CREATE	8	keywords
112	53	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438566922	LOGIN	4	users
114	55	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438567384	LOCALIZATION	0	\N
115	55	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438567384	LOCALIZATION	0	\N
116	55	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438567384	LOCALIZATION	0	\N
117	55	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438567384	LOCALIZATION	0	\N
129	57	32	GUI	string 'without_keywords' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
130	57	32	GUI	string 'not_linked' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
131	57	32	GUI	string 'testCaseStatus_draft' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
132	57	32	GUI	string 'testCaseStatus_readyForReview' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
133	57	32	GUI	string 'testCaseStatus_reviewInProgress' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
134	57	32	GUI	string 'testCaseStatus_rework' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
135	57	32	GUI	string 'testCaseStatus_obsolete' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
136	57	32	GUI	string 'testCaseStatus_future' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
137	57	32	GUI	string 'testCaseStatus_final' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
138	57	32	GUI	string 'filter_active_inactive' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
139	57	32	GUI	string 'hint_list_of_bugs' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
140	57	32	GUI	string 'bugs_on_context' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
141	57	32	GUI	string 'btn_export_testplan_tree_for_results' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
142	57	32	GUI	string 'tester_works_with_settings' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
144	59	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:5:"admin";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438567645	LOGOUT	1	users
146	61	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:20:"audit_user_pwd_saved";s:6:"params";a:1:{i:0;s:6:"peipei";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438568190	SAVE	7	users
148	63	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438568259	LOGIN	8	users
149	64	2	GUI	E_NOTICE\nUndefined property: stdClass::$direct_link - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 44	1438568886	PHP	0	\N
150	64	2	GUI	E_NOTICE\nUndefined property: stdClass::$direct_link - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 45	1438568886	PHP	0	\N
83	28	32	GUI	string 'navigator_add_remove_tcase_to_tplan' is not localized for locale 'zh_CN'  - using en_GB	1438362007	LOCALIZATION	0	\N
84	28	32	GUI	string 'format_pseudo_msword' is not localized for locale 'zh_CN'  - using en_GB	1438362007	LOCALIZATION	0	\N
85	28	32	GUI	string 'opt_displayVersion' is not localized for locale 'zh_CN'  - using en_GB	1438362007	LOCALIZATION	0	\N
86	28	32	GUI	string 'builds' is not localized for locale 'zh_CN'  - using en_GB	1438362007	LOCALIZATION	0	\N
88	30	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:5:"admin";i:1;s:15:"122.116.168.126";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513417	LOGIN_FAILED	1	users
90	32	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_user_created";s:6:"params";a:1:{i:0;s:5:"brian";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513479	CREATE	3	users
92	34	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_user_created";s:6:"params";a:1:{i:0;s:6:"hubert";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513548	CREATE	5	users
94	36	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_user_created";s:6:"params";a:1:{i:0;s:6:"peipei";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513666	CREATE	7	users
96	38	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:5:"admin";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438513730	LOGOUT	1	users
98	40	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_testproject_created";s:6:"params";a:1:{i:0;s:10:"Smartphone";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438514426	CREATE	2	testprojects
100	42	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_testproject_created";s:6:"params";a:1:{i:0;s:8:"Smart TV";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438514473	CREATE	4	testprojects
102	44	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:10:"Smoke Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438514953	CREATE	1	keywords
104	46	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:15:"Functional Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438514988	CREATE	3	keywords
106	48	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:10:"Power Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438515011	CREATE	5	keywords
108	50	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:13:"Security Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438515057	CREATE	7	keywords
110	52	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:20:"audit_cfield_created";s:6:"params";a:1:{i:0;s:7:"Feature";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438515744	CREATE	1	custom_fields
111	52	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_cfield_assigned";s:6:"params";a:2:{i:0;s:7:"Feature";i:1;s:10:"Smartphone";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438515744	ASSIGN	2	testprojects
113	54	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438567383	LOGIN	2	users
118	56	32	GUI	string 'btn_testcases_table_view' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
119	56	32	GUI	string 'btn_gen_test_spec' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
120	56	32	GUI	string 'btn_gen_test_spec_new_window' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
121	56	32	GUI	string 'btn_gen_test_spec_word' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
122	56	32	GUI	string 'btn_gen_test_suite_spec_word' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
123	56	32	GUI	string 'btn_gen_test_suite_spec' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
124	56	32	GUI	string 'btn_gen_test_suite_spec_new_window' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
125	56	32	GUI	string 'btn_create_from_issue_xml' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
126	56	32	GUI	string 'attachment_title' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
127	56	32	GUI	string 'display_inline' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
128	56	32	GUI	string 'display_inline_string' is not localized for locale 'zh_CN'  - using en_GB	1438567403	LOCALIZATION	0	\N
143	58	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"admin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438567555	LOGIN	1	users
145	60	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"peipei";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438567656	LOGIN	7	users
76	25	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:24:"audit_all_events_deleted";s:6:"params";a:1:{i:0;s:2:"oo";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438361909	DELETE	0	events
77	26	32	GUI	string 'context_design' is not localized for locale 'zh_CN'  - using en_GB	1438361949	LOCALIZATION	0	\N
78	26	32	GUI	string 'context_exec' is not localized for locale 'zh_CN'  - using en_GB	1438361949	LOCALIZATION	0	\N
79	26	32	GUI	string 'context_testplan_design' is not localized for locale 'zh_CN'  - using en_GB	1438361949	LOCALIZATION	0	\N
80	26	32	GUI	string 'enabled_on_context' is not localized for locale 'zh_CN'  - using en_GB	1438361949	LOCALIZATION	0	\N
81	26	32	GUI	string 'display_on_exec' is not localized for locale 'zh_CN'  - using en_GB	1438361949	LOCALIZATION	0	\N
147	62	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"peipei";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438568201	LOGIN	7	users
151	64	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 54	1438568886	PHP	0	\N
152	64	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 124	1438568886	PHP	0	\N
153	64	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 136	1438568886	PHP	0	\N
154	64	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 161	1438568886	PHP	0	\N
155	65	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:20:"audit_user_pwd_saved";s:6:"params";a:1:{i:0;s:6:"xueqin";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438569248	SAVE	8	users
156	66	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438569309	LOGIN	8	users
157	67	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:10:"Smoke Test";i:1;s:20:"Establish voice call";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438569495	ASSIGN	16	nodes_hierarchy
158	68	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:15:"Functional Test";i:1;s:90:"[EAP] Connection to a wireless hotspot with EAP-PEAP security with wrong Username/Password";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438569891	ASSIGN	27	nodes_hierarchy
159	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$tproject_id - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 50	1438569929	PHP	0	\N
160	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$search_important_notice - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 57	1438569929	PHP	0	\N
161	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$targetTestCase - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 69	1438569929	PHP	0	\N
162	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$tcversion - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 77	1438569929	PHP	0	\N
163	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$name - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 82	1438569929	PHP	0	\N
164	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$option_importance - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 95	1438569929	PHP	0	\N
165	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$importance - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 95	1438569929	PHP	0	\N
166	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$domainTCStatus - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 104	1438569929	PHP	0	\N
167	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$status - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 104	1438569929	PHP	0	\N
168	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$summary - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 113	1438569929	PHP	0	\N
169	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$preconditions - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 121	1438569929	PHP	0	\N
170	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$steps - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 129	1438569929	PHP	0	\N
171	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$expected_results - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 137	1438569929	PHP	0	\N
172	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$created_by - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 147	1438569929	PHP	0	\N
173	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$edited_by - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 155	1438569929	PHP	0	\N
174	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$creation_date_from - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 167	1438569929	PHP	0	\N
175	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$creation_date_to - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 188	1438569929	PHP	0	\N
176	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$modification_date_from - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 209	1438569929	PHP	0	\N
177	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$modification_date_to - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 230	1438569929	PHP	0	\N
178	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$jolly - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 254	1438569929	PHP	0	\N
179	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$filter_by - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 262	1438569929	PHP	0	\N
415	162	32	GUI	string 'not_linked' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
180	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$filter_by - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 301	1438569929	PHP	0	\N
181	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$filter_by - in /usr/share/nginx/html/testlink/gui/templates_c/ede35a624897e7bdfd0ad04663b50df605be653f.file.tcSearchGUI.inc.tpl.php - Line 333	1438569929	PHP	0	\N
182	69	2	GUI	E_NOTICE\nUndefined property: stdClass::$doSearch - in /usr/share/nginx/html/testlink/gui/templates_c/2e17d38a16e4fd58944c4e2c3310cbea44254b8b.file.tcSearchResults.tpl.php - Line 68	1438569929	PHP	0	\N
183	70	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:10:"Power Test";i:1;s:55:"Measuring the power consumption while sleep mode on/off";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438570081	ASSIGN	34	nodes_hierarchy
184	71	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:22:"audit_testplan_created";s:6:"params";a:2:{i:0;s:10:"Smartphone";i:1;s:15:"Smoke test_v1.0";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438570972	CREATED	42	testplans
185	72	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:22:"audit_testplan_created";s:6:"params";a:2:{i:0;s:10:"Smartphone";i:1;s:20:"Regression test_v1.0";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438571048	CREATED	43	testplans
186	73	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:15:"Acceptance Test";i:1;s:35:"[IMS] Call Session Control Function";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438571554	ASSIGN	44	nodes_hierarchy
187	74	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571636	PHP	0	\N
188	74	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571636	PHP	0	\N
189	74	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 981	1438571636	PHP	0	\N
190	75	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571638	PHP	0	\N
191	75	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571638	PHP	0	\N
192	75	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571638	PHP	0	\N
193	75	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571638	PHP	0	\N
194	75	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571638	PHP	0	\N
195	75	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571638	PHP	0	\N
196	75	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571638	PHP	0	\N
197	75	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571638	PHP	0	\N
198	76	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:26:"audit_tc_added_to_testplan";s:6:"params";a:3:{i:0;s:27:"SP-1 : Establish voice call";i:1;s:1:"1";i:2;s:15:"Smoke test_v1.0";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438571647	ASSIGN	42	testplans
199	76	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571647	PHP	0	\N
200	76	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571647	PHP	0	\N
201	76	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571647	PHP	0	\N
202	76	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571648	PHP	0	\N
203	76	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571648	PHP	0	\N
204	76	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571648	PHP	0	\N
205	76	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571648	PHP	0	\N
206	76	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571648	PHP	0	\N
207	77	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:10:"Smoke Test";i:1;s:23:"Test Zooming on website";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438571675	ASSIGN	21	nodes_hierarchy
208	78	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571710	PHP	0	\N
209	78	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571710	PHP	0	\N
210	78	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571710	PHP	0	\N
211	78	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571710	PHP	0	\N
212	78	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571710	PHP	0	\N
213	78	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571710	PHP	0	\N
214	78	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571710	PHP	0	\N
215	78	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571710	PHP	0	\N
216	79	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:26:"audit_tc_added_to_testplan";s:6:"params";a:3:{i:0;s:30:"SP-2 : Test Zooming on website";i:1;s:1:"1";i:2;s:15:"Smoke test_v1.0";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438571721	ASSIGN	42	testplans
217	79	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571721	PHP	0	\N
218	79	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571721	PHP	0	\N
219	79	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571721	PHP	0	\N
220	79	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571721	PHP	0	\N
221	79	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571721	PHP	0	\N
222	79	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571721	PHP	0	\N
223	79	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438571721	PHP	0	\N
224	79	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438571721	PHP	0	\N
225	80	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:19:"audit_build_created";s:6:"params";a:3:{i:0;s:10:"Smartphone";i:1;s:20:"Regression test_v1.0";i:2;s:9:"29301aa03";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438572592	CREATE	1	builds
226	81	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:19:"audit_build_created";s:6:"params";a:3:{i:0;s:10:"Smartphone";i:1;s:15:"Smoke test_v1.0";i:2;s:8:"ef302022";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438572639	CREATE	2	builds
227	82	2	GUI	E_WARNING\nIllegal string offset 'node_type_id' - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
228	82	2	GUI	E_NOTICE\nUndefined offset: 0 - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
229	82	2	GUI	E_WARNING\nIllegal string offset 'node_type_id' - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
230	82	2	GUI	E_NOTICE\nUndefined offset: 0 - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
231	82	2	GUI	E_WARNING\nIllegal string offset 'node_type_id' - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
232	82	2	GUI	E_NOTICE\nUndefined offset: 0 - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
233	82	2	GUI	E_WARNING\nIllegal string offset 'node_type_id' - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
234	82	2	GUI	E_NOTICE\nUndefined offset: 0 - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
235	82	2	GUI	E_WARNING\nIllegal string offset 'node_type_id' - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
236	82	2	GUI	E_NOTICE\nUndefined offset: 0 - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
237	82	2	GUI	E_WARNING\nIllegal string offset 'node_type_id' - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
238	82	2	GUI	E_NOTICE\nUndefined offset: 0 - in /usr/share/nginx/html/testlink/lib/functions/print.inc.php - Line 788	1438573178	PHP	0	\N
239	83	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573219	PHP	0	\N
240	83	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573219	PHP	0	\N
241	83	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 981	1438573219	PHP	0	\N
242	84	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573220	PHP	0	\N
243	84	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573220	PHP	0	\N
244	84	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 981	1438573220	PHP	0	\N
245	85	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573287	PHP	0	\N
246	85	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573287	PHP	0	\N
247	85	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 981	1438573287	PHP	0	\N
248	86	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:19:"audit_build_created";s:6:"params";a:3:{i:0;s:10:"Smartphone";i:1;s:15:"Smoke test_v1.0";i:2;s:7:"2849201";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438573328	CREATE	3	builds
249	87	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573367	PHP	0	\N
250	87	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573367	PHP	0	\N
251	87	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573367	PHP	0	\N
252	87	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573367	PHP	0	\N
253	87	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573367	PHP	0	\N
254	87	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573367	PHP	0	\N
255	87	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573367	PHP	0	\N
256	87	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573367	PHP	0	\N
257	88	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573394	PHP	0	\N
258	88	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573394	PHP	0	\N
259	88	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573394	PHP	0	\N
260	88	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573394	PHP	0	\N
261	88	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573394	PHP	0	\N
262	88	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573394	PHP	0	\N
263	88	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438573394	PHP	0	\N
264	88	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438573394	PHP	0	\N
265	89	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438579607	LOGIN	4	users
266	90	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 993	1438581206	PHP	0	\N
267	90	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 999	1438581206	PHP	0	\N
268	90	2	GUI	E_NOTICE\nUndefined variable: the_level - in /usr/share/nginx/html/testlink/lib/functions/specview.php - Line 981	1438581206	PHP	0	\N
269	91	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"peipei";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438581252	LOGIN	7	users
270	92	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 54	1438582472	PHP	0	\N
271	92	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 124	1438582472	PHP	0	\N
272	92	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 136	1438582472	PHP	0	\N
273	92	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 161	1438582472	PHP	0	\N
274	93	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:15:"Functional Test";i:1;s:4:"Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438582493	ASSIGN	49	nodes_hierarchy
275	94	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438587125	LOGIN	8	users
276	95	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"brian";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438591860	LOGIN	3	users
277	96	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"admin";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438591908	LOGIN	1	users
278	97	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438594203	LOGIN	4	users
279	98	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:4:"eric";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438596329	LOGIN	6	users
280	99	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:16:"audit_user_saved";s:6:"params";a:1:{i:0;s:4:"eric";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438596369	SAVE	6	users
281	100	32	GUI	string 'high' is not localized for locale 'en_US'  - using en_GB	1438596369	LOCALIZATION	0	\N
282	100	32	GUI	string 'medium' is not localized for locale 'en_US'  - using en_GB	1438596369	LOCALIZATION	0	\N
283	100	32	GUI	string 'low' is not localized for locale 'en_US'  - using en_GB	1438596369	LOCALIZATION	0	\N
284	100	32	GUI	string 'btn_manage_user' is not localized for locale 'en_US'  - using en_GB	1438596369	LOCALIZATION	0	\N
285	100	32	GUI	string 'demo_special_user' is not localized for locale 'en_US'  - using en_GB	1438596369	LOCALIZATION	0	\N
286	101	32	GUI	string 'default_auth_method' is not localized for locale 'en_US'  - using en_GB	1438596374	LOCALIZATION	0	\N
287	101	32	GUI	string 'authentication_method' is not localized for locale 'en_US'  - using en_GB	1438596374	LOCALIZATION	0	\N
288	101	32	GUI	string 'demo_update_user_disabled' is not localized for locale 'en_US'  - using en_GB	1438596374	LOCALIZATION	0	\N
289	101	32	GUI	string 'demo_reset_password_disabled' is not localized for locale 'en_US'  - using en_GB	1438596374	LOCALIZATION	0	\N
290	102	32	GUI	string 'access_public' is not localized for locale 'en_US'  - using en_GB	1438596378	LOCALIZATION	0	\N
291	103	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438656027	LOGIN	2	users
292	104	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438656027	LOCALIZATION	0	\N
293	104	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438656027	LOCALIZATION	0	\N
294	104	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438656027	LOCALIZATION	0	\N
295	104	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438656027	LOCALIZATION	0	\N
296	105	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438657221	LOGIN	2	users
297	106	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438657222	LOCALIZATION	0	\N
298	106	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438657222	LOCALIZATION	0	\N
299	106	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438657222	LOCALIZATION	0	\N
300	106	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438657222	LOCALIZATION	0	\N
301	107	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:2:"oo";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438657235	LOGOUT	2	users
302	108	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438657240	LOGIN	2	users
303	109	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438657241	LOCALIZATION	0	\N
304	109	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438657241	LOCALIZATION	0	\N
305	109	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438657241	LOCALIZATION	0	\N
306	109	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438657241	LOCALIZATION	0	\N
307	110	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:2:"oo";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438659161	LOGOUT	2	users
308	111	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438661427	LOGIN	2	users
309	112	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438661428	LOCALIZATION	0	\N
310	112	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438661428	LOCALIZATION	0	\N
311	112	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438661428	LOCALIZATION	0	\N
312	112	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438661428	LOCALIZATION	0	\N
313	113	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:2:"oo";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438661624	LOGOUT	2	users
314	114	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438661628	LOGIN	2	users
315	115	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438661629	LOCALIZATION	0	\N
316	115	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438661629	LOCALIZATION	0	\N
317	115	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438661629	LOCALIZATION	0	\N
318	115	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438661629	LOCALIZATION	0	\N
319	116	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:2:"oo";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438661642	LOGOUT	2	users
320	117	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438661645	LOGIN	2	users
321	118	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438661646	LOCALIZATION	0	\N
322	118	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438661646	LOCALIZATION	0	\N
323	118	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438661646	LOCALIZATION	0	\N
324	118	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438661646	LOCALIZATION	0	\N
325	119	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438663768	LOGIN	2	users
326	120	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438663768	LOCALIZATION	0	\N
327	120	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438663768	LOCALIZATION	0	\N
328	120	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438663768	LOCALIZATION	0	\N
329	120	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438663768	LOCALIZATION	0	\N
330	121	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:2:"oo";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438665263	LOGOUT	2	users
331	122	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438665362	LOGIN	4	users
332	123	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:5:"admin";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438665430	LOGIN_FAILED	1	users
333	124	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:4:"eric";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438665438	LOGIN	6	users
334	125	32	GUI	string 'system_config' is not localized for locale 'en_US'  - using en_GB	1438665439	LOCALIZATION	0	\N
335	125	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'en_US'  - using en_GB	1438665439	LOCALIZATION	0	\N
336	125	32	GUI	string 'href_issuetracker_management' is not localized for locale 'en_US'  - using en_GB	1438665439	LOCALIZATION	0	\N
337	125	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'en_US'  - using en_GB	1438665439	LOCALIZATION	0	\N
338	126	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:5:"admin";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438665441	LOGIN_FAILED	1	users
339	127	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"hubert";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438665454	LOGIN	5	users
340	128	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438665492	LOGIN	2	users
341	129	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438665493	LOCALIZATION	0	\N
342	129	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438665493	LOCALIZATION	0	\N
343	129	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438665493	LOCALIZATION	0	\N
344	129	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438665493	LOCALIZATION	0	\N
345	130	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438666146	LOGIN	8	users
346	131	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:6:"hubert";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438668606	LOGOUT	5	users
347	132	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"hubert";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669003	LOGIN	5	users
348	133	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669048	LOGIN	2	users
349	134	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438669049	LOCALIZATION	0	\N
350	134	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438669049	LOCALIZATION	0	\N
351	134	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438669049	LOCALIZATION	0	\N
352	134	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438669049	LOCALIZATION	0	\N
353	135	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669318	LOGIN	2	users
354	136	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438669324	LOCALIZATION	0	\N
355	136	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438669324	LOCALIZATION	0	\N
356	136	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438669324	LOCALIZATION	0	\N
357	136	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438669324	LOCALIZATION	0	\N
358	137	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669469	LOGIN	4	users
359	138	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:6:"hubert";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669486	LOGOUT	5	users
360	139	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"hubert";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669492	LOGIN	5	users
361	140	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:4:"eric";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669520	LOGIN	6	users
362	141	32	GUI	string 'system_config' is not localized for locale 'en_US'  - using en_GB	1438669521	LOCALIZATION	0	\N
363	141	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'en_US'  - using en_GB	1438669521	LOCALIZATION	0	\N
364	141	32	GUI	string 'href_issuetracker_management' is not localized for locale 'en_US'  - using en_GB	1438669521	LOCALIZATION	0	\N
365	141	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'en_US'  - using en_GB	1438669521	LOCALIZATION	0	\N
366	142	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:2:"oo";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669524	LOGOUT	2	users
367	143	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:4:"eric";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669545	LOGOUT	6	users
368	144	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669551	LOGIN	2	users
369	145	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438669552	LOCALIZATION	0	\N
370	145	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438669552	LOCALIZATION	0	\N
371	145	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438669552	LOCALIZATION	0	\N
372	145	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438669552	LOCALIZATION	0	\N
373	146	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:4:"eric";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669556	LOGIN	6	users
374	147	32	GUI	string 'system_config' is not localized for locale 'en_US'  - using en_GB	1438669556	LOCALIZATION	0	\N
375	147	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'en_US'  - using en_GB	1438669556	LOCALIZATION	0	\N
376	147	32	GUI	string 'href_issuetracker_management' is not localized for locale 'en_US'  - using en_GB	1438669556	LOCALIZATION	0	\N
377	147	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'en_US'  - using en_GB	1438669556	LOCALIZATION	0	\N
378	148	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"hubert";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438669608	LOGIN	5	users
379	149	32	GUI	string 'without_keywords' is not localized for locale 'en_US'  - using en_GB	1438669624	LOCALIZATION	0	\N
380	149	32	GUI	string 'filter_active_inactive' is not localized for locale 'en_US'  - using en_GB	1438669624	LOCALIZATION	0	\N
381	149	32	GUI	string 'hint_list_of_bugs' is not localized for locale 'en_US'  - using en_GB	1438669624	LOCALIZATION	0	\N
382	149	32	GUI	string 'bugs_on_context' is not localized for locale 'en_US'  - using en_GB	1438669624	LOCALIZATION	0	\N
383	149	32	GUI	string 'btn_export_testplan_tree_for_results' is not localized for locale 'en_US'  - using en_GB	1438669624	LOCALIZATION	0	\N
384	149	32	GUI	string 'tester_works_with_settings' is not localized for locale 'en_US'  - using en_GB	1438669624	LOCALIZATION	0	\N
385	150	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:5:"enpei";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438670392	LOGOUT	4	users
386	151	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:2:"oo";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438670406	LOGOUT	2	users
387	152	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438670413	LOGIN	2	users
388	153	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438670414	LOCALIZATION	0	\N
389	153	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438670414	LOCALIZATION	0	\N
390	153	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438670414	LOCALIZATION	0	\N
391	153	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438670414	LOCALIZATION	0	\N
392	154	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:6:"hubert";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438670869	LOGIN_FAILED	5	users
393	155	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"hubert";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438670893	LOGIN	5	users
394	156	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:2:"oo";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438670898	LOGOUT	2	users
395	157	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438670902	LOGIN	2	users
396	158	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438670902	LOCALIZATION	0	\N
397	158	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438670902	LOCALIZATION	0	\N
398	158	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438670902	LOCALIZATION	0	\N
399	158	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438670902	LOCALIZATION	0	\N
400	159	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438671146	LOGIN	2	users
401	160	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438671147	LOCALIZATION	0	\N
402	160	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438671147	LOCALIZATION	0	\N
403	160	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438671147	LOCALIZATION	0	\N
404	160	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438671147	LOCALIZATION	0	\N
405	161	32	GUI	string 'build_qty' is not localized for locale 'zh_CN'  - using en_GB	1438671333	LOCALIZATION	0	\N
406	161	32	GUI	string 'testcase_qty' is not localized for locale 'zh_CN'  - using en_GB	1438671333	LOCALIZATION	0	\N
407	161	32	GUI	string 'platform_qty' is not localized for locale 'zh_CN'  - using en_GB	1438671333	LOCALIZATION	0	\N
408	161	32	GUI	string 'active_click_to_change' is not localized for locale 'zh_CN'  - using en_GB	1438671333	LOCALIZATION	0	\N
409	161	32	GUI	string 'inactive_click_to_change' is not localized for locale 'zh_CN'  - using en_GB	1438671333	LOCALIZATION	0	\N
410	161	32	GUI	string 'testcase_number_help' is not localized for locale 'zh_CN'  - using en_GB	1438671333	LOCALIZATION	0	\N
411	161	32	GUI	string 'platform_number_help' is not localized for locale 'zh_CN'  - using en_GB	1438671333	LOCALIZATION	0	\N
412	161	32	GUI	string 'build_number_help' is not localized for locale 'zh_CN'  - using en_GB	1438671333	LOCALIZATION	0	\N
413	161	32	GUI	string 'assign_roles' is not localized for locale 'zh_CN'  - using en_GB	1438671333	LOCALIZATION	0	\N
414	162	32	GUI	string 'without_keywords' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
416	162	32	GUI	string 'testCaseStatus_draft' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
417	162	32	GUI	string 'testCaseStatus_readyForReview' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
418	162	32	GUI	string 'testCaseStatus_reviewInProgress' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
419	162	32	GUI	string 'testCaseStatus_rework' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
420	162	32	GUI	string 'testCaseStatus_obsolete' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
421	162	32	GUI	string 'testCaseStatus_future' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
422	162	32	GUI	string 'testCaseStatus_final' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
423	162	32	GUI	string 'filter_active_inactive' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
424	162	32	GUI	string 'hint_list_of_bugs' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
425	162	32	GUI	string 'bugs_on_context' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
426	162	32	GUI	string 'btn_export_testplan_tree_for_results' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
427	162	32	GUI	string 'tester_works_with_settings' is not localized for locale 'zh_CN'  - using en_GB	1438671344	LOCALIZATION	0	\N
428	163	32	GUI	string 'btn_testcases_table_view' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
429	163	32	GUI	string 'btn_gen_test_spec' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
430	163	32	GUI	string 'btn_gen_test_spec_new_window' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
431	163	32	GUI	string 'btn_gen_test_spec_word' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
432	163	32	GUI	string 'btn_gen_test_suite_spec_word' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
433	163	32	GUI	string 'btn_gen_test_suite_spec' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
434	163	32	GUI	string 'btn_gen_test_suite_spec_new_window' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
435	163	32	GUI	string 'btn_create_from_issue_xml' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
436	163	32	GUI	string 'attachment_title' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
437	163	32	GUI	string 'display_inline' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
438	163	32	GUI	string 'display_inline_string' is not localized for locale 'zh_CN'  - using en_GB	1438671345	LOCALIZATION	0	\N
439	164	32	GUI	string 'block_filter_not_run_latest_exec' is not localized for locale 'zh_CN'  - using en_GB	1438671385	LOCALIZATION	0	\N
440	165	32	GUI	string 'execution_context' is not localized for locale 'zh_CN'  - using en_GB	1438671385	LOCALIZATION	0	\N
441	166	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438685851	LOGIN	2	users
442	167	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438685852	LOCALIZATION	0	\N
443	167	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438685852	LOCALIZATION	0	\N
444	167	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438685852	LOCALIZATION	0	\N
445	167	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438685852	LOCALIZATION	0	\N
446	168	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438741282	LOGIN	2	users
447	169	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438741283	LOCALIZATION	0	\N
448	169	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438741283	LOCALIZATION	0	\N
449	169	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438741283	LOCALIZATION	0	\N
450	169	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438741283	LOCALIZATION	0	\N
451	170	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"60.251.178.163";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438741522	LOGIN	2	users
452	171	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438741523	LOCALIZATION	0	\N
453	171	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438741523	LOCALIZATION	0	\N
454	171	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438741523	LOCALIZATION	0	\N
455	171	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438741523	LOCALIZATION	0	\N
456	172	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:14:"106.65.134.154";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438767183	LOGIN	4	users
457	173	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"hubert";i:1;s:14:"118.167.28.240";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438792717	LOGIN	5	users
458	174	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438827476	LOGIN	4	users
459	175	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:5:"enpei";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438827856	LOGOUT	4	users
460	176	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"admin";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438827860	LOGIN	1	users
461	177	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_user_created";s:6:"params";a:1:{i:0;s:6:"hermes";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438827900	CREATE	9	users
462	178	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438828199	LOGIN	2	users
463	179	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"hermes";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438828200	LOGIN	9	users
464	180	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438828200	LOCALIZATION	0	\N
465	180	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438828200	LOCALIZATION	0	\N
466	180	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438828200	LOCALIZATION	0	\N
467	180	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438828200	LOCALIZATION	0	\N
468	181	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"peipei";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438834368	LOGIN	7	users
469	182	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"175.180.135.40";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438866138	LOGIN	2	users
470	183	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438866139	LOCALIZATION	0	\N
471	183	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438866139	LOCALIZATION	0	\N
472	183	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438866139	LOCALIZATION	0	\N
473	183	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438866139	LOCALIZATION	0	\N
474	184	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"175.180.135.40";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438905760	LOGIN	2	users
475	185	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438905761	LOCALIZATION	0	\N
476	185	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438905761	LOCALIZATION	0	\N
477	185	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438905761	LOCALIZATION	0	\N
478	185	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438905761	LOCALIZATION	0	\N
479	186	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:6:"peipei";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438912739	LOGIN_FAILED	7	users
480	187	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"peipei";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438912749	LOGIN	7	users
481	188	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438914556	LOGIN	2	users
482	189	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438914557	LOCALIZATION	0	\N
483	189	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438914557	LOCALIZATION	0	\N
484	189	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438914557	LOCALIZATION	0	\N
485	189	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438914557	LOCALIZATION	0	\N
486	190	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438931128	LOGIN	2	users
487	191	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438931129	LOCALIZATION	0	\N
488	191	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438931129	LOCALIZATION	0	\N
489	191	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438931129	LOCALIZATION	0	\N
490	191	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438931129	LOCALIZATION	0	\N
491	192	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"175.180.135.40";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438950145	LOGIN	2	users
492	193	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438950146	LOCALIZATION	0	\N
493	193	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438950146	LOCALIZATION	0	\N
494	193	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438950146	LOCALIZATION	0	\N
495	193	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438950146	LOCALIZATION	0	\N
496	194	32	GUI	string 'without_keywords' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
497	194	32	GUI	string 'not_linked' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
498	194	32	GUI	string 'testCaseStatus_draft' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
499	194	32	GUI	string 'testCaseStatus_readyForReview' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
500	194	32	GUI	string 'testCaseStatus_reviewInProgress' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
501	194	32	GUI	string 'testCaseStatus_rework' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
502	194	32	GUI	string 'testCaseStatus_obsolete' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
503	194	32	GUI	string 'testCaseStatus_future' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
504	194	32	GUI	string 'testCaseStatus_final' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
505	194	32	GUI	string 'filter_active_inactive' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
506	194	32	GUI	string 'hint_list_of_bugs' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
507	194	32	GUI	string 'bugs_on_context' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
508	194	32	GUI	string 'btn_export_testplan_tree_for_results' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
509	194	32	GUI	string 'tester_works_with_settings' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
510	195	32	GUI	string 'btn_testcases_table_view' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
511	195	32	GUI	string 'btn_gen_test_spec' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
512	195	32	GUI	string 'btn_gen_test_spec_new_window' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
513	195	32	GUI	string 'btn_gen_test_spec_word' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
514	195	32	GUI	string 'btn_gen_test_suite_spec_word' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
515	195	32	GUI	string 'btn_gen_test_suite_spec' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
516	195	32	GUI	string 'btn_gen_test_suite_spec_new_window' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
517	195	32	GUI	string 'btn_create_from_issue_xml' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
518	195	32	GUI	string 'attachment_title' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
519	195	32	GUI	string 'display_inline' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
520	195	32	GUI	string 'display_inline_string' is not localized for locale 'zh_CN'  - using en_GB	1438950178	LOCALIZATION	0	\N
521	196	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"175.180.135.40";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1438958248	LOGIN	2	users
522	197	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1438958249	LOCALIZATION	0	\N
523	197	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1438958249	LOCALIZATION	0	\N
524	197	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1438958249	LOCALIZATION	0	\N
525	197	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1438958249	LOCALIZATION	0	\N
526	198	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439172437	LOGIN	4	users
527	199	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_pwd_reset_requested";s:6:"params";a:1:{i:0;s:5:"enpei";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439172450	PWD_RESET	4	users
528	200	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:5:"enpei";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439172474	LOGOUT	4	users
529	201	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439172477	LOGIN	4	users
530	202	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439175882	LOGIN	2	users
531	203	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1439175882	LOCALIZATION	0	\N
532	203	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1439175882	LOCALIZATION	0	\N
533	203	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1439175882	LOCALIZATION	0	\N
534	203	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1439175882	LOCALIZATION	0	\N
535	204	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439185461	LOGIN	4	users
536	205	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:10:"Smoke Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439186523	CREATE	9	keywords
537	206	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:15:"Acceptance Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439186566	CREATE	10	keywords
538	207	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:15:"Functional Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439186785	CREATE	11	keywords
539	208	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:16:"Performance Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439186836	CREATE	12	keywords
540	209	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:10:"Power Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439186851	CREATE	13	keywords
541	210	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:13:"Security Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439186885	CREATE	14	keywords
542	211	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:11:"Stress Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439186897	CREATE	15	keywords
543	212	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:17:"Localization Test";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439187343	CREATE	16	keywords
544	213	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"peipei";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439189284	LOGIN	7	users
545	214	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:20:"audit_cfield_created";s:6:"params";a:1:{i:0;s:10:"Valid from";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439193610	CREATE	2	custom_fields
546	214	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_cfield_assigned";s:6:"params";a:2:{i:0;s:10:"Valid from";i:1;s:10:"Smartphone";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439193610	ASSIGN	2	testprojects
547	215	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:20:"audit_cfield_created";s:6:"params";a:1:{i:0;s:8:"Valid to";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439193629	CREATE	3	custom_fields
548	215	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_cfield_assigned";s:6:"params";a:2:{i:0;s:8:"Valid to";i:1;s:10:"Smartphone";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439193629	ASSIGN	2	testprojects
549	216	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:23:"audit_cfield_unassigned";s:6:"params";a:2:{i:0;s:10:"Valid from";i:1;s:10:"Smartphone";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439196361	ASSIGN	2	testprojects
550	216	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:20:"audit_cfield_deleted";s:6:"params";a:1:{i:0;s:10:"Valid from";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439196361	DELETE	2	custom_fields
551	217	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:23:"audit_cfield_unassigned";s:6:"params";a:2:{i:0;s:8:"Valid to";i:1;s:10:"Smartphone";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439196367	ASSIGN	2	testprojects
552	217	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:20:"audit_cfield_deleted";s:6:"params";a:1:{i:0;s:8:"Valid to";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439196367	DELETE	3	custom_fields
553	218	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_keyword_created";s:6:"params";a:1:{i:0;s:3:"RAT";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439200469	CREATE	17	keywords
554	219	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439201296	LOGIN	4	users
555	220	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439201436	LOGIN	4	users
556	221	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:5:"enpei";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439201590	LOGOUT	4	users
557	222	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"admin";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439201596	LOGIN	1	users
558	223	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439201835	LOGIN	4	users
559	224	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:14:"110.27.138.102";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439218013	LOGIN	4	users
560	225	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"peipei";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439259454	LOGIN	7	users
561	226	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439259573	LOGIN_FAILED	8	users
562	227	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439259746	LOGIN_FAILED	8	users
563	228	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_pwd_reset_requested";s:6:"params";a:1:{i:0;s:6:"xueqin";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439259767	PWD_RESET	8	users
564	229	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439259884	LOGIN_FAILED	8	users
565	230	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439259895	LOGIN	8	users
566	231	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439261040	LOGIN_FAILED	4	users
567	232	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439261044	LOGIN	4	users
568	233	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439280050	LOGIN_FAILED	4	users
686	266	32	GUI	string 'display_inline' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
569	234	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439280053	LOGIN	4	users
570	235	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439282752	LOGIN	2	users
571	236	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1439282752	LOCALIZATION	0	\N
572	236	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1439282752	LOCALIZATION	0	\N
573	236	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1439282752	LOCALIZATION	0	\N
574	236	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1439282752	LOCALIZATION	0	\N
575	237	32	GUI	string 'btn_testcases_table_view' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
576	237	32	GUI	string 'btn_gen_test_spec' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
577	237	32	GUI	string 'btn_gen_test_spec_new_window' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
578	237	32	GUI	string 'btn_gen_test_spec_word' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
579	237	32	GUI	string 'btn_gen_test_suite_spec_word' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
580	237	32	GUI	string 'btn_gen_test_suite_spec' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
581	237	32	GUI	string 'btn_gen_test_suite_spec_new_window' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
582	237	32	GUI	string 'btn_create_from_issue_xml' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
583	237	32	GUI	string 'attachment_title' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
584	237	32	GUI	string 'display_inline' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
585	237	32	GUI	string 'display_inline_string' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
586	238	32	GUI	string 'without_keywords' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
587	238	32	GUI	string 'not_linked' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
588	238	32	GUI	string 'testCaseStatus_draft' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
589	238	32	GUI	string 'testCaseStatus_readyForReview' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
590	238	32	GUI	string 'testCaseStatus_reviewInProgress' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
591	238	32	GUI	string 'testCaseStatus_rework' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
592	238	32	GUI	string 'testCaseStatus_obsolete' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
593	238	32	GUI	string 'testCaseStatus_future' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
594	238	32	GUI	string 'testCaseStatus_final' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
595	238	32	GUI	string 'filter_active_inactive' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
596	238	32	GUI	string 'hint_list_of_bugs' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
597	238	32	GUI	string 'bugs_on_context' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
598	238	32	GUI	string 'btn_export_testplan_tree_for_results' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
599	238	32	GUI	string 'tester_works_with_settings' is not localized for locale 'zh_CN'  - using en_GB	1439282757	LOCALIZATION	0	\N
600	239	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439282783	LOGIN	4	users
601	240	32	GUI	string 'estimated_execution_duration' is not localized for locale 'zh_CN'  - using en_GB	1439282836	LOCALIZATION	0	\N
602	241	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439284541	LOGIN	4	users
603	242	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439286768	LOGIN	4	users
604	243	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:10:"Smoke Test";i:1;s:2:"hi";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439286781	ASSIGN	72	nodes_hierarchy
605	243	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:15:"Acceptance Test";i:1;s:2:"hi";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439286781	ASSIGN	72	nodes_hierarchy
606	243	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:15:"Functional Test";i:1;s:2:"hi";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439286781	ASSIGN	72	nodes_hierarchy
607	243	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:16:"Performance Test";i:1;s:2:"hi";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439286781	ASSIGN	72	nodes_hierarchy
608	243	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:10:"Power Test";i:1;s:2:"hi";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439286781	ASSIGN	72	nodes_hierarchy
687	266	32	GUI	string 'display_inline_string' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
609	243	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:14:"Endurance Test";i:1;s:2:"hi";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439286781	ASSIGN	72	nodes_hierarchy
610	243	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:13:"Security Test";i:1;s:2:"hi";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439286781	ASSIGN	72	nodes_hierarchy
611	244	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439287021	LOGIN	4	users
612	245	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439287111	LOGIN	4	users
613	246	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"175.180.135.40";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439298839	LOGIN	2	users
614	247	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1439298840	LOCALIZATION	0	\N
615	247	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1439298840	LOCALIZATION	0	\N
616	247	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1439298840	LOCALIZATION	0	\N
617	247	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1439298840	LOCALIZATION	0	\N
618	248	32	GUI	string 'build_qty' is not localized for locale 'zh_CN'  - using en_GB	1439298997	LOCALIZATION	0	\N
619	248	32	GUI	string 'testcase_qty' is not localized for locale 'zh_CN'  - using en_GB	1439298997	LOCALIZATION	0	\N
620	248	32	GUI	string 'platform_qty' is not localized for locale 'zh_CN'  - using en_GB	1439298997	LOCALIZATION	0	\N
621	248	32	GUI	string 'active_click_to_change' is not localized for locale 'zh_CN'  - using en_GB	1439298997	LOCALIZATION	0	\N
622	248	32	GUI	string 'inactive_click_to_change' is not localized for locale 'zh_CN'  - using en_GB	1439298997	LOCALIZATION	0	\N
623	248	32	GUI	string 'testcase_number_help' is not localized for locale 'zh_CN'  - using en_GB	1439298997	LOCALIZATION	0	\N
624	248	32	GUI	string 'platform_number_help' is not localized for locale 'zh_CN'  - using en_GB	1439298997	LOCALIZATION	0	\N
625	248	32	GUI	string 'build_number_help' is not localized for locale 'zh_CN'  - using en_GB	1439298997	LOCALIZATION	0	\N
626	248	32	GUI	string 'assign_roles' is not localized for locale 'zh_CN'  - using en_GB	1439298997	LOCALIZATION	0	\N
627	249	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439520284	LOGIN	4	users
628	250	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_pwd_reset_requested";s:6:"params";a:1:{i:0;s:5:"enpei";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439520300	PWD_RESET	4	users
629	251	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439534391	LOGIN	2	users
630	252	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1439534391	LOCALIZATION	0	\N
631	252	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1439534391	LOCALIZATION	0	\N
632	252	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1439534391	LOCALIZATION	0	\N
633	252	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1439534391	LOCALIZATION	0	\N
634	253	32	GUI	string 'demo_update_user_disabled' is not localized for locale 'zh_CN'  - using en_GB	1439534396	LOCALIZATION	0	\N
635	254	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439534425	LOGIN	4	users
636	255	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:20:"audit_user_pwd_saved";s:6:"params";a:1:{i:0;s:5:"enpei";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439534447	SAVE	4	users
637	256	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439534454	LOGIN	4	users
638	257	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439538106	LOGIN	4	users
639	258	32	GUI	string 'testsuite_not_found' is not localized for locale 'en_GB' 	1439538121	LOCALIZATION	0	\N
640	259	2	GUI	E_NOTICE\nUndefined property: stdClass::$direct_link - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 44	1439540921	PHP	0	\N
641	259	2	GUI	E_NOTICE\nUndefined property: stdClass::$direct_link - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 45	1439540921	PHP	0	\N
642	259	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 54	1439540921	PHP	0	\N
643	259	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 124	1439540921	PHP	0	\N
644	259	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 136	1439540921	PHP	0	\N
688	267	32	GUI	string 'access_public' is not localized for locale 'zh_CN'  - using en_GB	1439744670	LOCALIZATION	0	\N
645	259	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 161	1439540921	PHP	0	\N
646	260	2	GUI	E_NOTICE\nUndefined property: stdClass::$direct_link - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 44	1439542973	PHP	0	\N
647	260	2	GUI	E_NOTICE\nUndefined property: stdClass::$direct_link - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 45	1439542973	PHP	0	\N
648	260	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 54	1439542973	PHP	0	\N
649	260	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 124	1439542973	PHP	0	\N
650	260	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 136	1439542973	PHP	0	\N
651	260	2	GUI	E_NOTICE\nUndefined property: stdClass::$form_token - in /usr/share/nginx/html/testlink/gui/templates_c/3b9ec2e7e9cf9a3611b71adf3ee2708c9d148169.file.containerViewTestSuiteTextButtons.inc.tpl.php - Line 161	1439542973	PHP	0	\N
652	261	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:14:"175.180.135.40";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439744403	LOGIN	2	users
653	262	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1439744404	LOCALIZATION	0	\N
654	262	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1439744404	LOCALIZATION	0	\N
655	262	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1439744404	LOCALIZATION	0	\N
656	262	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1439744404	LOCALIZATION	0	\N
657	263	32	GUI	string 'btn_manage_user' is not localized for locale 'zh_CN'  - using en_GB	1439744416	LOCALIZATION	0	\N
658	263	32	GUI	string 'demo_special_user' is not localized for locale 'zh_CN'  - using en_GB	1439744416	LOCALIZATION	0	\N
659	264	32	GUI	string 'default_auth_method' is not localized for locale 'zh_CN'  - using en_GB	1439744423	LOCALIZATION	0	\N
660	264	32	GUI	string 'authentication_method' is not localized for locale 'zh_CN'  - using en_GB	1439744423	LOCALIZATION	0	\N
661	264	32	GUI	string 'demo_update_user_disabled' is not localized for locale 'zh_CN'  - using en_GB	1439744423	LOCALIZATION	0	\N
662	264	32	GUI	string 'demo_reset_password_disabled' is not localized for locale 'zh_CN'  - using en_GB	1439744423	LOCALIZATION	0	\N
663	265	32	GUI	string 'without_keywords' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
664	265	32	GUI	string 'not_linked' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
665	265	32	GUI	string 'testCaseStatus_draft' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
666	265	32	GUI	string 'testCaseStatus_readyForReview' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
667	265	32	GUI	string 'testCaseStatus_reviewInProgress' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
668	265	32	GUI	string 'testCaseStatus_rework' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
669	265	32	GUI	string 'testCaseStatus_obsolete' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
670	265	32	GUI	string 'testCaseStatus_future' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
671	265	32	GUI	string 'testCaseStatus_final' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
672	265	32	GUI	string 'filter_active_inactive' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
673	265	32	GUI	string 'hint_list_of_bugs' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
674	265	32	GUI	string 'bugs_on_context' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
675	265	32	GUI	string 'btn_export_testplan_tree_for_results' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
676	265	32	GUI	string 'tester_works_with_settings' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
677	266	32	GUI	string 'btn_testcases_table_view' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
678	266	32	GUI	string 'btn_gen_test_spec' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
679	266	32	GUI	string 'btn_gen_test_spec_new_window' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
680	266	32	GUI	string 'btn_gen_test_spec_word' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
681	266	32	GUI	string 'btn_gen_test_suite_spec_word' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
682	266	32	GUI	string 'btn_gen_test_suite_spec' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
683	266	32	GUI	string 'btn_gen_test_suite_spec_new_window' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
684	266	32	GUI	string 'btn_create_from_issue_xml' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
685	266	32	GUI	string 'attachment_title' is not localized for locale 'zh_CN'  - using en_GB	1439744489	LOCALIZATION	0	\N
689	268	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439774921	LOGIN	8	users
690	269	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:15:"Acceptance Test";i:1;s:59:"Dialer should be launched by inputting a digit from keypad.";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439777964	ASSIGN	87	nodes_hierarchy
691	270	32	GUI	string 'testsuite_not_found' is not localized for locale 'en_GB' 	1439779647	LOCALIZATION	0	\N
692	271	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:15:"Acceptance Test";i:1;s:55:"Dialer should be launched by inputting +#* from keypad.";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439779858	ASSIGN	91	nodes_hierarchy
693	272	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:2:"oo";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439780109	LOGIN	2	users
694	273	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1439780109	LOCALIZATION	0	\N
695	273	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1439780109	LOCALIZATION	0	\N
696	273	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1439780109	LOCALIZATION	0	\N
697	273	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1439780109	LOCALIZATION	0	\N
698	274	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:15:"Acceptance Test";i:1;s:46:"A digit can be cleared and back to homescreen.";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439780568	ASSIGN	96	nodes_hierarchy
699	275	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:15:"Acceptance Test";i:1;s:46:"The +#* can be cleared and back to homescreen.";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439780767	ASSIGN	99	nodes_hierarchy
700	276	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439784759	LOGIN	8	users
701	277	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439792048	LOGIN	4	users
702	278	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"xueqin";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439792148	LOGIN	8	users
703	279	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"peipei";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439793307	LOGIN	7	users
704	280	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:5:"enpei";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439799702	LOGIN	4	users
705	281	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:6:"peipei";i:1;s:14:"111.203.161.50";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439802868	LOGIN	7	users
706	282	2	GUI	No project found: Assume a new installation and redirect to create it	1439883465	\N	0	\N
707	283	32	GUI	string 'api_key' is not localized for locale 'zh_CN'  - using en_GB	1439883465	LOCALIZATION	0	\N
708	283	32	GUI	string 'testproject_issue_tracker_integration' is not localized for locale 'zh_CN'  - using en_GB	1439883465	LOCALIZATION	0	\N
709	283	32	GUI	string 'issue_tracker' is not localized for locale 'zh_CN'  - using en_GB	1439883465	LOCALIZATION	0	\N
710	283	32	GUI	string 'testproject_reqmgr_integration' is not localized for locale 'zh_CN'  - using en_GB	1439883465	LOCALIZATION	0	\N
711	283	32	GUI	string 'reqmgrsystem' is not localized for locale 'zh_CN'  - using en_GB	1439883465	LOCALIZATION	0	\N
712	283	32	GUI	string 'no_rms_defined' is not localized for locale 'zh_CN'  - using en_GB	1439883465	LOCALIZATION	0	\N
713	283	32	GUI	string 'no_issuetracker_defined' is not localized for locale 'zh_CN'  - using en_GB	1439883465	LOCALIZATION	0	\N
714	284	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:17:"audit_user_logout";s:6:"params";a:1:{i:0;s:11:"owen.ouyang";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439883468	LOGOUT	2	users
715	285	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:11:"owen.ouyang";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439883472	LOGIN	2	users
716	286	32	GUI	string 'system_config' is not localized for locale 'zh_CN'  - using en_GB	1439883473	LOCALIZATION	0	\N
717	286	32	GUI	string 'link_report_test_cases_created_per_user' is not localized for locale 'zh_CN'  - using en_GB	1439883473	LOCALIZATION	0	\N
718	286	32	GUI	string 'href_issuetracker_management' is not localized for locale 'zh_CN'  - using en_GB	1439883473	LOCALIZATION	0	\N
719	286	32	GUI	string 'href_reqmgrsystem_management' is not localized for locale 'zh_CN'  - using en_GB	1439883473	LOCALIZATION	0	\N
720	287	32	GUI	string 'context_design' is not localized for locale 'zh_CN'  - using en_GB	1439883679	LOCALIZATION	0	\N
721	287	32	GUI	string 'context_exec' is not localized for locale 'zh_CN'  - using en_GB	1439883679	LOCALIZATION	0	\N
722	287	32	GUI	string 'context_testplan_design' is not localized for locale 'zh_CN'  - using en_GB	1439883679	LOCALIZATION	0	\N
723	287	32	GUI	string 'enabled_on_context' is not localized for locale 'zh_CN'  - using en_GB	1439883679	LOCALIZATION	0	\N
724	287	32	GUI	string 'display_on_exec' is not localized for locale 'zh_CN'  - using en_GB	1439883679	LOCALIZATION	0	\N
725	288	32	GUI	string 'btn_manage_user' is not localized for locale 'zh_CN'  - using en_GB	1439883686	LOCALIZATION	0	\N
726	288	32	GUI	string 'demo_special_user' is not localized for locale 'zh_CN'  - using en_GB	1439883686	LOCALIZATION	0	\N
727	289	32	GUI	string 'demo_update_user_disabled' is not localized for locale 'zh_CN'  - using en_GB	1439883687	LOCALIZATION	0	\N
728	290	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:16:"audit_user_saved";s:6:"params";a:1:{i:0;s:11:"owen.ouyang";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439883936	SAVE	2	users
729	291	32	GUI	string 'default_auth_method' is not localized for locale 'zh_CN'  - using en_GB	1439884145	LOCALIZATION	0	\N
730	291	32	GUI	string 'authentication_method' is not localized for locale 'zh_CN'  - using en_GB	1439884146	LOCALIZATION	0	\N
731	291	32	GUI	string 'demo_reset_password_disabled' is not localized for locale 'zh_CN'  - using en_GB	1439884146	LOCALIZATION	0	\N
732	292	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:16:"audit_user_saved";s:6:"params";a:1:{i:0;s:11:"owen.ouyang";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439884163	SAVE	2	users
733	293	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:16:"audit_user_saved";s:6:"params";a:1:{i:0;s:11:"owen.ouyang";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439884247	SAVE	2	users
734	294	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_testproject_created";s:6:"params";a:1:{i:0;s:13:"testforimport";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439886878	CREATE	1255	testprojects
735	295	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:9:"hubert.lu";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888271	LOGIN_FAILED	5	users
736	296	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:9:"hubert.lu";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888282	LOGIN_FAILED	5	users
737	297	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:9:"hubert.lu";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888301	LOGIN_FAILED	5	users
738	298	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:9:"hubert.lu";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888459	LOGIN	5	users
739	299	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:12:"hermes.cheng";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888489	LOGIN_FAILED	9	users
740	300	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:12:"hermes.cheng";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888501	LOGIN_FAILED	9	users
741	301	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:18:"audit_login_failed";s:6:"params";a:2:{i:0;s:12:"hermes.cheng";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888507	LOGIN_FAILED	9	users
742	302	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:12:"hermes.cheng";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888529	LOGIN	9	users
743	303	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:20:"audit_user_pwd_saved";s:6:"params";a:1:{i:0;s:12:"hermes.cheng";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888574	SAVE	9	users
744	304	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:16:"audit_user_saved";s:6:"params";a:1:{i:0;s:11:"xueqin.shen";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888600	SAVE	8	users
745	305	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:16:"audit_user_saved";s:6:"params";a:1:{i:0;s:9:"hubert.lu";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888613	SAVE	5	users
746	306	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:16:"audit_user_saved";s:6:"params";a:1:{i:0;s:12:"hermes.cheng";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888627	SAVE	9	users
747	307	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:33:"audit_security_user_right_missing";s:6:"params";a:3:{i:0;s:12:"hermes.cheng";i:1;s:13:"usersView.php";i:2;s:3:"any";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888627	any	9	users
748	308	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:21:"audit_login_succeeded";s:6:"params";a:2:{i:0;s:12:"hermes.cheng";i:1;s:15:"220.128.218.209";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439888633	LOGIN	9	users
749	309	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:15:"Acceptance Test";i:1;s:60:"One entry of search result is displayed when input 2 digits.";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439891778	ASSIGN	1315	nodes_hierarchy
750	310	2	GUI	E_NOTICE\nUndefined index: level - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439892773	PHP	0	\N
751	310	2	GUI	E_NOTICE\nTrying to get property of non-object - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439892773	PHP	0	\N
752	311	2	GUI	E_NOTICE\nUndefined index: level - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439892857	PHP	0	\N
753	311	2	GUI	E_NOTICE\nTrying to get property of non-object - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439892857	PHP	0	\N
754	312	2	GUI	E_NOTICE\nUndefined index: level - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439892860	PHP	0	\N
755	312	2	GUI	E_NOTICE\nTrying to get property of non-object - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439892860	PHP	0	\N
756	313	2	GUI	E_NOTICE\nUndefined index: level - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439892862	PHP	0	\N
757	313	2	GUI	E_NOTICE\nTrying to get property of non-object - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439892862	PHP	0	\N
758	314	16	GUI	O:18:"tlMetaStringHelper":4:{s:5:"label";s:25:"audit_keyword_assigned_tc";s:6:"params";a:2:{i:0;s:17:"Localization Test";i:1;s:91:"All strings on the "Camera permission" screens are translated correctly without truncation.";}s:13:"bDontLocalize";b:0;s:14:"bDontFireEvent";b:0;}	1439892874	ASSIGN	105	nodes_hierarchy
759	314	2	GUI	E_NOTICE\nUndefined index: level - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439892874	PHP	0	\N
760	314	2	GUI	E_NOTICE\nTrying to get property of non-object - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439892874	PHP	0	\N
761	315	2	GUI	E_NOTICE\nUndefined index: level - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439893032	PHP	0	\N
762	315	2	GUI	E_NOTICE\nTrying to get property of non-object - in /usr/share/nginx/html/testlink/gui/templates_c/87caa864822b61c3140b2ff5b72e45b63cd188b6.file.keywordsAssign.tpl.php - Line 77	1439893032	PHP	0	\N
\.


--
-- Name: h5tl_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_events_id_seq', 762, true);


--
-- Data for Name: h5tl_execution_bugs; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_execution_bugs (execution_id, bug_id) FROM stdin;
\.


--
-- Data for Name: h5tl_execution_tcsteps; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_execution_tcsteps (id, execution_id, tcstep_id, notes, status) FROM stdin;
\.


--
-- Name: h5tl_execution_tcsteps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_execution_tcsteps_id_seq', 1, false);


--
-- Data for Name: h5tl_executions; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_executions (id, build_id, tester_id, execution_ts, status, testplan_id, tcversion_id, tcversion_number, platform_id, execution_type, execution_duration, notes) FROM stdin;
\.


--
-- Name: h5tl_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_executions_id_seq', 1, false);


--
-- Data for Name: h5tl_inventory; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_inventory (id, testproject_id, owner_id, name, ipaddress, content, creation_ts, modification_ts) FROM stdin;
\.


--
-- Name: h5tl_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_inventory_id_seq', 1, false);


--
-- Data for Name: h5tl_issuetrackers; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_issuetrackers (id, name, type, cfg) FROM stdin;
\.


--
-- Name: h5tl_issuetrackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_issuetrackers_id_seq', 1, false);


--
-- Data for Name: h5tl_keywords; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_keywords (id, keyword, testproject_id, notes) FROM stdin;
1	Smoke Test	2	For smoke test
2	Acceptance Test	2	For acceptance Test
3	Functional Test	2	For Functional Test
4	Performance Test	2	For Performance Test
5	Power Test	2	For Power Test
6	Endurance Test	2	For Endurance Test
7	Security Test	2	For Security Test
8	Localization Test	2	For Localization Test
9	Smoke Test	3	Test cases with this keyword are for smoke test.
10	Acceptance Test	3	Test cases with this keyword are for acceptance test.
11	Functional Test	3	Test cases with this keyword are extra functional test cases derived from user stories or not. e.g. BT HFP that is not defined in any user story but QA still need to test it.
12	Performance Test	3	Non-functional test cases with this keyword are for performance test.
13	Power Test	3	Non-functional test cases with this keyword are for power test.
14	Security Test	3	Non-functional test cases with this keyword are for security test.
15	Stress Test	3	Non-functional test cases with this keyword are for stress test.
16	Localization Test	3	Non-functional test cases with this keyword are for localization test.
17	RAT	3	For release acceptance test cases, differ from acceptance test cases for user stories. Those are basic checklist from broader user flow point of view
\.


--
-- Name: h5tl_keywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_keywords_id_seq', 17, true);


--
-- Data for Name: h5tl_milestones; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_milestones (id, testplan_id, target_date, start_date, a, b, c, name) FROM stdin;
\.


--
-- Name: h5tl_milestones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_milestones_id_seq', 1, false);


--
-- Data for Name: h5tl_node_types; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_node_types (id, description) FROM stdin;
1	testproject
2	testsuite
3	testcase
4	testcase_version
5	testplan
6	requirement_spec
7	requirement
8	requirement_version
9	testcase_step
10	requirement_revision
11	requirement_spec_revision
12	build
13	platform
14	user
\.


--
-- Name: h5tl_node_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_node_types_id_seq', 1, false);


--
-- Data for Name: h5tl_nodes_hierarchy; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_nodes_hierarchy (id, name, parent_id, node_type_id, node_order) FROM stdin;
1	h5os	\N	1	1
2	Smartphone	\N	1	1
3	Feature phone	\N	1	1
4	Smart TV	\N	1	1
5	Smart Watch	\N	1	1
6	1.0	2	2	1
7	1.5	2	2	2
8	1.6	2	2	3
9	Network	6	2	1
10	Wifi	9	2	1
11	Voice call	9	2	2
12	Media	6	2	2
13	Music	12	2	1
14	FM radio	12	2	2
15	Dialer	9	2	3
16	Establish voice call	15	3	1000
17		16	4	0
18		17	9	0
19		17	9	0
20	Browser	9	2	4
22		21	4	0
23		22	9	0
24		22	9	0
25		22	9	0
26		22	9	0
28		27	4	0
29		28	9	0
30		28	9	0
31		28	9	0
32		28	9	0
33	Power	6	2	3
34	Measuring the power consumption while sleep mode on/off	33	3	1000
35		34	4	0
36		35	9	0
37		35	9	0
38		35	9	0
39		35	9	0
40		35	9	0
42	Smoke test_v1.0	2	5	0
43	Regression test_v1.0	2	5	0
44	[IMS] Call Session Control Function	11	3	1000
45		44	4	0
46		45	9	0
47		45	9	0
21	Test Zooming on website	20	3	1000
27	[EAP] Connection to a wireless hotspot with EAP-PEAP security with wrong Username/Password	48	3	0
49	Test	11	3	1001
50		49	4	0
52		51	4	0
53		52	9	0
54		52	9	0
55		52	9	0
56		52	9	0
88		87	4	0
48	EAP	10	2	1
51	[EAP] Connection to a wireless hotspot with EAP-PEAP security with wrong Username/	10	3	0
58	Non-touch Apps	57	2	1
60	Accessibility	57	2	3
61	Dual display	57	2	4
62	Power consumption	57	2	5
63	Settings	58	2	1
64	Dialer/Call/CallLog	58	2	2
65	Contacts	58	2	3
66	Clock	58	2	4
67	Camera	58	2	5
68	Gallery	58	2	6
69	Music	58	2	7
70	Keypad	59	2	1
71	HW key routing	70	2	1
72	hi	9	3	1000
73		72	4	0
74	kd	9	3	1001
75		74	4	0
76	ww	6	3	1000
77		76	4	0
78	sdasd	6	3	1001
79		78	4	0
80	dfsdf	6	3	1002
81		80	4	0
82	d	6	3	1003
83		82	4	0
57	1.0	3	2	1
59	Non-touch Support	57	2	2
84	Dialer	64	2	1
85	Call	64	2	2
86	Call Log	64	2	3
87	Dialer should be launched by inputting a digit from keypad.	84	3	1000
89		88	9	0
90		88	9	0
91	Dialer should be launched by inputting +#* from keypad.	84	3	1001
92		91	4	0
93		92	9	0
94		92	9	0
95		92	9	0
96	A digit can be cleared and back to homescreen.	84	3	1002
97		96	4	0
98		97	9	0
99	The +#* can be cleared and back to homescreen.	84	3	1003
100		99	4	0
101		100	9	0
102		100	9	0
103		100	9	0
104	Smoke test	57	2	6
105	All strings on the "Camera permission" screens are translated correctly without truncation.	67	3	1
106		105	4	0
107		106	9	0
108		106	9	0
109		106	9	0
110		106	9	0
111		106	9	0
112	[Camera] APP Permission view should display correctly in RTL	67	3	2
113		112	4	0
114		113	9	0
115		113	9	0
116		113	9	0
117	[Camera] The position of recording indicator and counter should be mirrored in RTL	67	3	3
118		117	4	0
119		118	9	0
120		118	9	0
121		118	9	0
122		118	9	0
123		118	9	0
124	[Camera] Menu list view and sub-menu list view should display correctly in RTL	67	3	4
125		124	4	0
126		125	9	0
127		125	9	0
128		125	9	0
129		125	9	0
130		125	9	0
131		125	9	0
132	[Camera] Tap to Focus	67	3	5
133		132	4	0
134		133	9	0
135		133	9	0
136		133	9	0
137		133	9	0
138		133	9	0
139		133	9	0
140		133	9	0
141		133	9	0
142	[Camera]Face detection focus	67	3	6
143		142	4	0
144		143	9	0
145		143	9	0
146		143	9	0
147		143	9	0
148		143	9	0
149		143	9	0
150		143	9	0
151		143	9	0
152		143	9	0
153		143	9	0
154	Video recording should stop immediately when going to homescreen	67	3	7
155		154	4	0
156		155	9	0
157		155	9	0
158		155	9	0
159	Size and alignment of the viewfinder changes properly with different aspect ratios	67	3	8
160		159	4	0
161		160	9	0
162		160	9	0
163		160	9	0
164		160	9	0
165	[Camera] Take pictures using Face recognition and Tap to Focus	67	3	9
166		165	4	0
167		166	9	0
168		166	9	0
169		166	9	0
170		166	9	0
171		166	9	0
172		166	9	0
173	The user can return to the homescreen after recording a video without issue	67	3	10
174		173	4	0
175		174	9	0
176		174	9	0
177		174	9	0
178		174	9	0
179		174	9	0
180	The user can select the same camera resolution without issue	67	3	11
181		180	4	0
182		181	9	0
183		181	9	0
184		181	9	0
185	Flash does not go off until the shutter button is pressed when flash is set to auto	67	3	12
186		185	4	0
187		186	9	0
188		186	9	0
189		186	9	0
190		186	9	0
191	Camera viewfinder preview should be smooth when moving the phone around	67	3	13
192		191	4	0
193		192	9	0
194		192	9	0
195		192	9	0
196		192	9	0
197		192	9	0
198	The user should always be returned to the camera viewfinder	67	3	14
199		198	4	0
200		199	9	0
201		199	9	0
202		199	9	0
203		199	9	0
204		199	9	0
205	Camera viewfinder displays properly after editing a photo in the gallery	67	3	15
206		205	4	0
207		206	9	0
208		206	9	0
209		206	9	0
210		206	9	0
211	Zooming in on a photo and panning the photo does perform a gesture to view the next photo	67	3	16
212		211	4	0
213		212	9	0
214		212	9	0
215		212	9	0
216		212	9	0
217		212	9	0
218		212	9	0
219		212	9	0
220	Framerate does not drop erratically when zooming in and out while recording a video	67	3	17
221		220	4	0
222		221	9	0
223		221	9	0
224		221	9	0
225		221	9	0
226		221	9	0
227	Camera app UI is displayed properly after cancelling to share a photo via Email	67	3	18
228		227	4	0
229		228	9	0
230		228	9	0
231		228	9	0
232		228	9	0
233		228	9	0
234		228	9	0
235		228	9	0
236		228	9	0
237	Preview mode UI looks correct and functions properly in Camera	67	3	19
238		237	4	0
239		238	9	0
240		238	9	0
241		238	9	0
242		238	9	0
243		238	9	0
244		238	9	0
245		238	9	0
246		238	9	0
247		238	9	0
248		238	9	0
249		238	9	0
250		238	9	0
251		238	9	0
252		238	9	0
253	Enable HWC and ensure a memory leak does not accur in the b2g process when using the camcorder	67	3	20
254		253	4	0
255		254	9	0
256		254	9	0
257		254	9	0
258	There is a smooth transition animation when swiping through photos	67	3	21
259		258	4	0
260		259	9	0
261		259	9	0
262		259	9	0
263		259	9	0
264		259	9	0
265		259	9	0
266		259	9	0
267	Verify that all sub menus are shown correctly when navigating through the Camera settings menu	67	3	22
268		267	4	0
269		268	9	0
270		268	9	0
271		268	9	0
272		268	9	0
273		268	9	0
274	Thumbnails and previews should always match captured photo	67	3	23
275		274	4	0
276		275	9	0
277		275	9	0
278		275	9	0
279		275	9	0
280		275	9	0
281	Verify the user can take pictures while on a phone call	67	3	24
282		281	4	0
283		282	9	0
284		282	9	0
285		282	9	0
286		282	9	0
287		282	9	0
288		282	9	0
289		282	9	0
290	The user can retake a photo and attach it successfully to a MMS	67	3	25
291		290	4	0
292		291	9	0
293		291	9	0
294		291	9	0
295		291	9	0
296		291	9	0
297		291	9	0
298		291	9	0
299		291	9	0
300		291	9	0
301	After a video is recorded, a preview icon appears and the video is available in	67	3	26
302		301	4	0
303		302	9	0
304		302	9	0
305		302	9	0
306		302	9	0
307		302	9	0
308		302	9	0
309		302	9	0
310		302	9	0
311		302	9	0
312		302	9	0
313	The user can send a large video through a MMS in a reasonable time frame	67	3	27
314		313	4	0
315		314	9	0
316		314	9	0
317		314	9	0
318		314	9	0
319		314	9	0
320		314	9	0
321		314	9	0
322		314	9	0
323	2.0 Visual Refresh : Camera	67	3	28
324		323	4	0
325		324	9	0
326		324	9	0
327		324	9	0
328		324	9	0
329		324	9	0
330		324	9	0
331		324	9	0
332		324	9	0
333		324	9	0
334		324	9	0
335		324	9	0
336	All strings on the "Camera" screen are translated correctly without truncation.	67	3	29
337		336	4	0
338		337	9	0
339	All strings on the "Camera Error Page" screen are translated correctly without truncation.	67	3	30
340		339	4	0
341		340	9	0
342		340	9	0
343		340	9	0
344	Video stops recording when the user receives an incoming call	67	3	31
345		344	4	0
346		345	9	0
347		345	9	0
348		345	9	0
349		345	9	0
350		345	9	0
351	All strings on the "Camera Scanning" screen are translated correctly without truncation.	67	3	32
352		351	4	0
353		352	9	0
354		352	9	0
355		352	9	0
356	All strings on the "Camera App - no SD card" screen are translated correctly without truncation.	67	3	33
357		356	4	0
358		357	9	0
359		357	9	0
360	All strings on the "Camera - SD card is full" screen are translated correctly without truncation.	67	3	34
361		360	4	0
362		361	9	0
363		361	9	0
364	[Camera] When camera is invoked from another app a confirmation prompt is displa	67	3	35
365		364	4	0
366		365	9	0
367		365	9	0
368		365	9	0
369		365	9	0
370		365	9	0
371		365	9	0
372		365	9	0
373		365	9	0
374		365	9	0
375		365	9	0
376		365	9	0
377		365	9	0
378		365	9	0
379		365	9	0
380		365	9	0
381		365	9	0
382		365	9	0
383	[Camera] Launching the camera app from the lockscreen, shows the Geolocation mes	67	3	36
384		383	4	0
385		384	9	0
386		384	9	0
387		384	9	0
388		384	9	0
389		384	9	0
390	[Camera] The preview icon does not overlap with the Switch Camera and Flash icons	67	3	37
391		390	4	0
392		391	9	0
393		391	9	0
394		391	9	0
395	[Camera] Correct camera preview in landscape mode for browser pick activity	67	3	38
396		395	4	0
397		396	9	0
398		396	9	0
399		396	9	0
400		396	9	0
401		396	9	0
402		396	9	0
403		396	9	0
404	[Camera] The toolbar is displayed correctly while viewing photos in the Camera"s preview	67	3	39
405		404	4	0
406		405	9	0
407		405	9	0
408		405	9	0
409		405	9	0
410	[Camera] Verify camera Preview screen goes to sleep mode after screen timeout	67	3	40
411		410	4	0
412		411	9	0
413		411	9	0
414		411	9	0
415		411	9	0
416	[Camera][Sound] Video Recording start sound	67	3	41
417		416	4	0
418		417	9	0
419		417	9	0
420	Verify the user can attach a picture taken from the camera initiated from MMS UI.	67	3	42
421		420	4	0
422		421	9	0
423		421	9	0
424		421	9	0
425		421	9	0
426	[Camera] Using camera to record more than one hour video.	67	3	43
427		426	4	0
428		427	9	0
429		427	9	0
430		427	9	0
431	[Camera]Quickly toggle live camera mode - one photo view	67	3	44
432		431	4	0
433		432	9	0
434		432	9	0
435		432	9	0
436	[Camera]Pinch-zoom saved photo - change view mode	67	3	45
437		436	4	0
438		437	9	0
439		437	9	0
440		437	9	0
441		437	9	0
442		437	9	0
443		437	9	0
444		437	9	0
445		437	9	0
446	[Camera]Double-tap to zoom photo - after changing view mode	67	3	46
447		446	4	0
448		447	9	0
449		447	9	0
450		447	9	0
451		447	9	0
452		447	9	0
453		447	9	0
454		447	9	0
455		447	9	0
456	[Camera] Pan up in galery	67	3	47
457		456	4	0
458		457	9	0
459		457	9	0
460	[Camera]Verify that you can switch to the Gallery app from the  picture viewing mode	67	3	48
461		460	4	0
462		461	9	0
463		461	9	0
464	[Camera]Delete a video when playback is paused	67	3	49
465		464	4	0
466		465	9	0
467		465	9	0
468		465	9	0
469		465	9	0
470	[Camera]Warning message when running out of storage space	67	3	50
471		470	4	0
472		471	9	0
473		471	9	0
474	[Camera]Take a photo with Flash On	67	3	51
475		474	4	0
476		475	9	0
477		475	9	0
478		475	9	0
479	[Camera]Take a photo with Flash AUTO	67	3	52
480		479	4	0
481		480	9	0
482		480	9	0
483		480	9	0
484		480	9	0
485	[Camera] Ability to Double-tap to zoom in on a photo	67	3	53
486		485	4	0
487		486	9	0
488		486	9	0
489		486	9	0
490		486	9	0
491		486	9	0
492	[Camera]Swipe left and right to see previous video	67	3	54
493		492	4	0
494		493	9	0
495		493	9	0
496		493	9	0
497		493	9	0
498	[Camera]Go back to Camera Mode when playback of a video in previous is paused	67	3	55
499		498	4	0
500		499	9	0
501		499	9	0
502		499	9	0
503	[Camera]Switch to camera app when playback of a video is paused in Gallery	67	3	56
504		503	4	0
505		504	9	0
506		504	9	0
507		504	9	0
508		504	9	0
509	[Camera] Ability to quickly toggle live camera mode	67	3	57
510		509	4	0
511		510	9	0
512		510	9	0
513		510	9	0
514	[Camera] Take a photo with Flash OFF	67	3	58
515		514	4	0
516		515	9	0
517		515	9	0
518		515	9	0
519	[Camera]View photo/video in Landscape mode	67	3	59
520		519	4	0
521		520	9	0
522		520	9	0
523		520	9	0
524	[Camera]View photo/video on Portrait mode	67	3	60
525		524	4	0
526		525	9	0
527		525	9	0
528		525	9	0
529	[Camera]Take photo/video in Portrait mode	67	3	61
530		529	4	0
531		530	9	0
532		530	9	0
533		530	9	0
640		639	4	0
534	[Camera]Restart camera  when disconnect from USB mass storage	67	3	62
535		534	4	0
536		535	9	0
537		535	9	0
538		535	9	0
539	[Camera]Use camera while the phone is in USB mass storage mode	67	3	63
540		539	4	0
541		540	9	0
542		540	9	0
543	[Camera]Run out of storage while recording a video	67	3	64
544		543	4	0
545		544	9	0
546		544	9	0
547	[Camera]Full memory card	67	3	65
548		547	4	0
549		548	9	0
550		548	9	0
551		548	9	0
552	[Camera]External storage device not available	67	3	66
553		552	4	0
554		553	9	0
555	[Camera] Transferring photos and videos using the USB Mass Storage mode	67	3	67
556		555	4	0
557		556	9	0
558		556	9	0
559		556	9	0
560		556	9	0
561		556	9	0
562	[Camera] Ability to use the Seek feature in Video controls	67	3	68
563		562	4	0
564		563	9	0
565		563	9	0
566		563	9	0
567		563	9	0
568		563	9	0
569	[Camera] Deleting a single video	67	3	69
570		569	4	0
571		570	9	0
572		570	9	0
573		570	9	0
574	[Camera] Ability to pause videos in the video controls.	67	3	70
575		574	4	0
576		575	9	0
577		575	9	0
578		575	9	0
579		575	9	0
580		575	9	0
581	[Camera] Play icon appears on video thumbnail	67	3	71
582		581	4	0
583		582	9	0
584		582	9	0
585		582	9	0
586	[Camera]Start recording	67	3	72
587		586	4	0
588		587	9	0
589		587	9	0
590	[Camera]Camera Icon - Switch to Photo mode	67	3	73
591		590	4	0
592		591	9	0
593		591	9	0
594	[Camera]Swipe to left to see next photo	67	3	74
595		594	4	0
596		595	9	0
597		595	9	0
598		595	9	0
599	[Camera]Pinch-zoom saved photo	67	3	75
600		599	4	0
601		600	9	0
602		600	9	0
603		600	9	0
604		600	9	0
605	[Camera]Swipe to right to see previous photo	67	3	76
606		605	4	0
607		606	9	0
608		606	9	0
609		606	9	0
610	[Camera] Ability to switch between Video and Camera in the Camera app	67	3	77
611		610	4	0
612		611	9	0
613		611	9	0
614		611	9	0
615	[Camera] Go to video, take a video, go back to camera	67	3	78
616		615	4	0
617		616	9	0
618		616	9	0
619		616	9	0
620		616	9	0
621		616	9	0
622		616	9	0
623	[Camera]Take photo/video in Landscape mode	67	3	79
624		623	4	0
625		624	9	0
626		624	9	0
627		624	9	0
628	[CAMERA] Verify the user can make a video recording.	67	3	80
629		628	4	0
630		629	9	0
631		629	9	0
632		629	9	0
633		629	9	0
634	[Camera]Delete a single photo (from fullscreen view)	67	3	81
635		634	4	0
636		635	9	0
637		635	9	0
638		635	9	0
639	[Camera] Full Screen playback - off	67	3	82
641		640	9	0
642		640	9	0
643		640	9	0
644	[Camera]Verify that you can switch to the Gallery app from the Camera app	67	3	83
645		644	4	0
646		645	9	0
647		645	9	0
648		645	9	0
649		645	9	0
650	[Camera] Full Screen playback - on	67	3	84
651		650	4	0
652		651	9	0
653		651	9	0
654		651	9	0
655	[Camera] switch to Gallery and share	67	3	85
656		655	4	0
657		656	9	0
658		656	9	0
659		656	9	0
660		656	9	0
661	[Camera]Toggle to video mode	67	3	86
662		661	4	0
663		662	9	0
664		662	9	0
665		662	9	0
666		662	9	0
667	[Camera] Ability to take a picture in the Camera app	67	3	87
668		667	4	0
669		668	9	0
670		668	9	0
671	[Camera] Stopping video	67	3	88
672		671	4	0
673		672	9	0
674		672	9	0
675		672	9	0
676		672	9	0
677	[Camera] Verify that the elapsed time is shown while recording a video.	67	3	89
678		677	4	0
679		678	9	0
680		678	9	0
681		678	9	0
682	[Camera] default resolution	67	3	90
683		682	4	0
684		683	9	0
685		683	9	0
686		683	9	0
687		683	9	0
688	[Camera] Front/back camera switch	67	3	91
689		688	4	0
690		689	9	0
691		689	9	0
692		689	9	0
693		689	9	0
694	Ability to launch the Camera app from inside the Gallery app (from the thumbnail view)	67	3	92
695		694	4	0
696		695	9	0
697		695	9	0
698		695	9	0
699	[CAMERA] Verify the user can take a picture with camera from lockscreen.	67	3	93
700		699	4	0
701		700	9	0
702		700	9	0
703		700	9	0
704		700	9	0
705		700	9	0
706	Zoom out by pinch gesture	67	3	94
707		706	4	0
708		707	9	0
709	Zoom in by pinch gesture	67	3	95
710		709	4	0
711		710	9	0
712	[CAMERA] Verify the user can take several pictures with camera.	67	3	96
713		712	4	0
714		713	9	0
715		713	9	0
716		713	9	0
717		713	9	0
718	[Gallery] Thumbnail Photo View	68	3	1
719		718	4	0
720		719	9	0
721	[Gallery] Share information and share icon should display correctly in RTL	68	3	2
722		721	4	0
723		722	9	0
724		722	9	0
725		722	9	0
726		722	9	0
727	[Gallery] A warning is displayed informing the user that an SD card is required for the app to work	68	3	3
728		727	4	0
729		728	9	0
730	[Gallery] Edit mode view should be right aligned in RTL	68	3	4
731		730	4	0
732		731	9	0
733		731	9	0
734		731	9	0
735		731	9	0
736	[Gallery] Helpful message displays in Gallery when no photos are present to be displayed.	68	3	5
737		736	4	0
738		737	9	0
739	The user can share all supported image files without issue	68	3	6
740		739	4	0
741		740	9	0
742		740	9	0
743		740	9	0
744		740	9	0
745		740	9	0
746	Zooming in on a photo and panning the photo does perform a gesture to view the next photo	68	3	7
747		746	4	0
748		747	9	0
749		747	9	0
750		747	9	0
751		747	9	0
752		747	9	0
753		747	9	0
754		747	9	0
755	Verify Gallery Data is Preserved after OTA	68	3	8
756		755	4	0
757		756	9	0
758		756	9	0
759	Gallery app should be killed if the user presses the home button while the app i	68	3	9
760		759	4	0
761		760	9	0
762		760	9	0
763		760	9	0
764		760	9	0
765	[Gallery] Test you can view a thumbnail in large mode	68	3	10
766		765	4	0
767		766	9	0
768		766	9	0
769		766	9	0
770		766	9	0
771		766	9	0
772	After saving a file from a MMS, the user can re-enter the MMS without issue	68	3	11
773		772	4	0
774		773	9	0
775		773	9	0
776		773	9	0
777		773	9	0
778	Thumbnails and previews should always match captured photo	68	3	12
779		778	4	0
780		779	9	0
781		779	9	0
782		779	9	0
783		779	9	0
784		779	9	0
785	There is a smooth transition animation when swiping through photos	68	3	13
786		785	4	0
787		786	9	0
788		786	9	0
789		786	9	0
790		786	9	0
791		786	9	0
792		786	9	0
793		786	9	0
794	Gallery functions properly without issue when there is high memory usage on 1st launch	68	3	14
795		794	4	0
796		795	9	0
797		795	9	0
798		795	9	0
799		795	9	0
800		795	9	0
801	Verify the user can send files to a paired device while receiving files from ano	68	3	15
802		801	4	0
803		802	9	0
804		802	9	0
805		802	9	0
806		802	9	0
807		802	9	0
808		802	9	0
809		802	9	0
810	When adding Contacts with pictures, the contact app functions as expected withou	68	3	16
811		810	4	0
812		811	9	0
813		811	9	0
814		811	9	0
815		811	9	0
816		811	9	0
817		811	9	0
818	Imported videos are shown correctly without issue when switching between portrai	68	3	17
819		818	4	0
820		819	9	0
821		819	9	0
822		819	9	0
823	Camera viewfinder displays properly after editing a photo in the gallery	68	3	18
824		823	4	0
825		824	9	0
826		824	9	0
827		824	9	0
828		824	9	0
829	All strings on the "Memory card in use" page are translated properly without truncation	68	3	19
830		829	4	0
831		830	9	0
832		830	9	0
833		830	9	0
834		830	9	0
835	All strings on the "No photos or videos" page are translated properly without truncation	68	3	20
836		835	4	0
837		836	9	0
838		836	9	0
839		836	9	0
840	The string "Can not edit photos. Memory card is full." is translated properly without truncation	68	3	21
841		840	4	0
842		841	9	0
843		841	9	0
844		841	9	0
845		841	9	0
846	All strings on the  "Delete selected item?" and "Delete 3 items? pages are trans	68	3	22
847		846	4	0
848		847	9	0
849		847	9	0
850		847	9	0
851		847	9	0
852		847	9	0
853		847	9	0
854		847	9	0
855	All strings on the "Single item" and "Multiple items" share pages are translated	68	3	23
856		855	4	0
857		856	9	0
858		856	9	0
859		856	9	0
860		856	9	0
861		856	9	0
862		856	9	0
863	The strings "Select" and "Number Selected" are translated properly without truncation	68	3	24
864		863	4	0
865		864	9	0
866		864	9	0
867		864	9	0
868		864	9	0
869	All strings on the "Edit" page are translated properly without truncation	68	3	25
870		869	4	0
871		870	9	0
872		870	9	0
873		870	9	0
874		870	9	0
875	All strings on the "Delete photo?" page are translated properly without truncation	68	3	26
876		875	4	0
877		876	9	0
878		876	9	0
879		876	9	0
880		876	9	0
881	[OTA] Data Migration of Gallery app	68	3	27
882		881	4	0
883		882	9	0
884		882	9	0
885		882	9	0
886		882	9	0
887		882	9	0
888		882	9	0
889		882	9	0
890	All strings on the "More Information" pages for Photos and Videos are translated	68	3	28
891		890	4	0
892		891	9	0
893		891	9	0
894		891	9	0
895		891	9	0
896		891	9	0
897		891	9	0
898		891	9	0
899	[Gallery] Verify file information displays for content displayed in the gallery app	68	3	29
900		899	4	0
901		900	9	0
902		900	9	0
903		900	9	0
904	All dates for gallery content are translated properly without truncation	68	3	30
905		904	4	0
906		905	9	0
907		905	9	0
908		905	9	0
909	[Gallery] Photo Editor - Automatic Image Enhancement	68	3	31
910		909	4	0
911		910	9	0
912		910	9	0
913		910	9	0
914		910	9	0
915		910	9	0
916	[Gallery] Confirm gallery shows pictures from a single month	68	3	32
917		916	4	0
918		917	9	0
919		917	9	0
920		917	9	0
921	[Gallery] Confirm gallery shows pictures from a range of months within a year	68	3	33
922		921	4	0
923		922	9	0
924		922	9	0
925		922	9	0
926		922	9	0
927	[Gallery] Confirm gallery shows pictures from a range of months over years	68	3	34
928		927	4	0
929		928	9	0
930		928	9	0
931		928	9	0
932		928	9	0
933	Basic  - Photo/Video Browsing & Slideshow	68	3	35
934		933	4	0
935		934	9	0
936		934	9	0
937		934	9	0
938		934	9	0
939		934	9	0
940		934	9	0
941		934	9	0
942	[Gallery] Using the pick activity through a website does not cause the gallery to hang	68	3	36
943		942	4	0
944		943	9	0
945		943	9	0
946		943	9	0
947		943	9	0
948		943	9	0
949	Basic  - Photo Selection, Sharing & Deletion	68	3	37
950		949	4	0
951		950	9	0
952		950	9	0
953		950	9	0
954		950	9	0
955		950	9	0
956	[Gallery] Removing the SD card while vieing the gallery list removes all pics stored externally	68	3	38
957		956	4	0
958		957	9	0
959		957	9	0
960	[Gallery] Setting HD wallpaper in portrait and landscape mode	68	3	39
961		960	4	0
962		961	9	0
963		961	9	0
964		961	9	0
965		961	9	0
966		961	9	0
967		961	9	0
968		961	9	0
969		961	9	0
970	[Gallery] Thumbnail Photo View should not be affected by blank or empty image file	68	3	40
971		970	4	0
972		971	9	0
973		971	9	0
974	[Apps][Media][Gallery] The apps should be ussable with an empy SD card when USB is connected	68	3	41
975		974	4	0
976		975	9	0
977		975	9	0
978		975	9	0
979		975	9	0
980	[Gallery] Confirm gallery shows pictures in chronological order in the user interface	68	3	42
981		980	4	0
982		981	9	0
983		981	9	0
984		981	9	0
985		981	9	0
986	[Gallery] Open the Gallery App with no SD card inserted in the device	68	3	43
987		986	4	0
988		987	9	0
989		987	9	0
990	[GALLERY] The last received file is not deleted if the user denies the incoming	68	3	44
991		990	4	0
992		991	9	0
993		991	9	0
994		991	9	0
995		991	9	0
996		991	9	0
997	[Gallery] Verify the gallery app only sees pictures up to 5 megapixels.	68	3	45
998		997	4	0
999		998	9	0
1000		998	9	0
1001	Photo editor - Landscape mode while in edit mode	68	3	46
1002		1001	4	0
1003		1002	9	0
1004		1002	9	0
1005		1002	9	0
1006		1002	9	0
1007	[Gallery] Verify an alert is displayed if there isn"t enough free space available to enter Edit Mode	68	3	47
1008		1007	4	0
1009		1008	9	0
1010		1008	9	0
1011	[Gallery] Fullscreen Photo View - Switch to Thumbnail Photo View	68	3	48
1012		1011	4	0
1013		1012	9	0
1014		1012	9	0
1015	[Gallery] Single Photo View - Return to default zoom on double tap	68	3	49
1016		1015	4	0
1017		1016	9	0
1018		1016	9	0
1019	[Gallery] Single Photo View - Pan the zoomed image	68	3	50
1020		1019	4	0
1021		1020	9	0
1022		1020	9	0
1023		1020	9	0
1024	[Gallery] Single Photo View - Captured videos are played when tapped	68	3	51
1025		1024	4	0
1026		1025	9	0
1027		1025	9	0
1028	[Gallery] Access Multiple Selection Mode from Thumbnail Photo View	68	3	52
1029		1028	4	0
1030		1029	9	0
1031		1029	9	0
1032	[Gallery] Single tap on a photo thumbnail in Muliple Selection Mode toggles the photo selection	68	3	53
1033		1032	4	0
1034		1033	9	0
1035		1033	9	0
1036		1033	9	0
1037		1033	9	0
1038	[Gallery] Multiple Selection Mode - Share a single photo	68	3	54
1039		1038	4	0
1040		1039	9	0
1041		1039	9	0
1042		1039	9	0
1043	[Gallery] Single Photo View - The photo and toolbars adjust to fit the screen wh	68	3	55
1044		1043	4	0
1045		1044	9	0
1046		1044	9	0
1047	[Gallery] Single Photo View - Set the photo as wallpaper	68	3	56
1048		1047	4	0
1049		1048	9	0
1050		1048	9	0
1051	[Gallery] Ability to return from the Camera App to the Gallery app without taking a new picture	68	3	57
1052		1051	4	0
1053		1052	9	0
1054		1052	9	0
1055		1052	9	0
1056		1052	9	0
1057		1052	9	0
1058		1052	9	0
1059	[Gallery] Ability to return from the Camera App to the Gallery app after taking a photo	68	3	58
1060		1059	4	0
1061		1060	9	0
1062		1060	9	0
1063		1060	9	0
1064		1060	9	0
1065		1060	9	0
1066	[Gallery] Ability to edit a single photo in Gallery by tapping on the Edit button	68	3	59
1067		1066	4	0
1068		1067	9	0
1069		1067	9	0
1070		1067	9	0
1071	Verify the user cannot use and a prompt is displayed while in the gallery app wh	68	3	60
1072		1071	4	0
1073		1072	9	0
1074	Verify the gallery rescans for recently removed content after disengaging USB Mass Storage.	68	3	61
1075		1074	4	0
1076		1075	9	0
1077		1075	9	0
1078	Verify the gallery rescans for new added content after disengaging USB Mass Storage mode.	68	3	62
1079		1078	4	0
1080		1079	9	0
1081		1079	9	0
1082	[GALLERY] View photo in fullscreen mode & check orientation	68	3	63
1083		1082	4	0
1084		1083	9	0
1085		1083	9	0
1086		1083	9	0
1087		1083	9	0
1088		1083	9	0
1089	[Video] Play the video you recorded.  Check for video and sound.	68	3	64
1090		1089	4	0
1091		1090	9	0
1092		1090	9	0
1093	[Gallery] Ensuring edited photo is saved	68	3	65
1094		1093	4	0
1095		1094	9	0
1096		1094	9	0
1097		1094	9	0
1098		1094	9	0
1099	[GALLERY] - Share a picture over email	68	3	66
1100		1099	4	0
1101		1100	9	0
1102		1100	9	0
1103		1100	9	0
1104		1100	9	0
1105	[GALLERY] Verify the user is able share multiple photos to email.	68	3	67
1106		1105	4	0
1107		1106	9	0
1108		1106	9	0
1109		1106	9	0
1110		1106	9	0
1111		1106	9	0
1112	[GALLERY] - Share single photo on Twitter	68	3	68
1113		1112	4	0
1114		1113	9	0
1115		1113	9	0
1116		1113	9	0
1117		1113	9	0
1118		1113	9	0
1119	[GALLERY] While editing a photo user can exit edit mode.	68	3	69
1120		1119	4	0
1121		1120	9	0
1122		1120	9	0
1123		1120	9	0
1124		1120	9	0
1125	Ability to launch the Camera app from inside the Gallery app (from the thumbnail view)	68	3	70
1126		1125	4	0
1127		1126	9	0
1128		1126	9	0
1129		1126	9	0
1130	[Gallery]  Zooming in or out by pinch gesture in single photo view	68	3	71
1131		1130	4	0
1132		1131	9	0
1133		1131	9	0
1134		1131	9	0
1135		1131	9	0
1136		1131	9	0
1137	Selecting wallpaper from the wallpaper gallery	68	3	72
1138		1137	4	0
1139		1138	9	0
1140		1138	9	0
1141		1138	9	0
1142		1138	9	0
1143	[Home Screen] Able to adjust wallpaper	68	3	73
1144		1143	4	0
1145		1144	9	0
1146		1144	9	0
1147		1144	9	0
1148		1144	9	0
1149		1144	9	0
1150	[Home Screen] Able to select wallpaper from camera photos gallery	68	3	74
1151		1150	4	0
1152		1151	9	0
1153		1151	9	0
1154	Photo Editor - Effects - Sepia	68	3	75
1155		1154	4	0
1156		1155	9	0
1157		1155	9	0
1158		1155	9	0
1159		1155	9	0
1160		1155	9	0
1161	[Gallery] Photo Editor - Effects - B&W & Sepia	68	3	76
1162		1161	4	0
1163		1162	9	0
1164		1162	9	0
1165		1162	9	0
1166		1162	9	0
1167	Photo Editor - Adjusting exposure settings	68	3	77
1168		1167	4	0
1169		1168	9	0
1170		1168	9	0
1171		1168	9	0
1172	Photo Editor - Crop - Freeform	68	3	78
1173		1172	4	0
1174		1173	9	0
1175		1173	9	0
1176		1173	9	0
1177		1173	9	0
1178	Photo Editor - Crop - Portrait	68	3	79
1179		1178	4	0
1180		1179	9	0
1181		1179	9	0
1182		1179	9	0
1183	Photo Editor - Crop - Landscape	68	3	80
1184		1183	4	0
1185		1184	9	0
1186		1184	9	0
1187		1184	9	0
1188		1184	9	0
1189		1184	9	0
1190	[Gallery] Photo Editor - Crop - Square	68	3	81
1191		1190	4	0
1192		1191	9	0
1193		1191	9	0
1194	[Gallery] Photo Editor - Effects - Original	68	3	82
1195		1194	4	0
1196		1195	9	0
1197		1195	9	0
1198	[Gallery] Multiple Selection Mode - Share multiple photos	68	3	83
1199		1198	4	0
1200		1199	9	0
1201		1199	9	0
1202		1199	9	0
1203	Verify the user is able to Export photos from device to desktop machine	68	3	84
1204		1203	4	0
1205		1204	9	0
1206	Accessing camera from gallery (single photo view)	68	3	85
1207		1206	4	0
1208		1207	9	0
1209		1207	9	0
1210		1207	9	0
1211	Gallery displays contents of SD card.	68	3	86
1212		1211	4	0
1213		1212	9	0
1214	[Gallery] Ability to pan through photos in full screen view	68	3	87
1215		1214	4	0
1216		1215	9	0
1217		1215	9	0
1218		1215	9	0
1219		1215	9	0
1220	[Gallery] Single Photo View - Delete a single photo	68	3	88
1221		1220	4	0
1222		1221	9	0
1223		1221	9	0
1224		1221	9	0
1225	[GALLERY] Delete multiple photos from select image mode	68	3	89
1226		1225	4	0
1227		1226	9	0
1228		1226	9	0
1229		1226	9	0
1230		1226	9	0
1231	[Gallery] Access Full Screen Photo View from Thumbnail Photo View	68	3	90
1232		1231	4	0
1233		1232	9	0
1234		1232	9	0
1235	Verify that a photo can be set for a contact	68	3	91
1236		1235	4	0
1237		1236	9	0
1238		1236	9	0
1239		1236	9	0
1240		1236	9	0
1241		1236	9	0
1242		1236	9	0
1243		1236	9	0
1244		1236	9	0
1245		1236	9	0
1246	Accessing camera from preview mode	68	3	92
1247		1246	4	0
1248		1247	9	0
1249	[CAMERA] Verify the user can take several pictures with camera.	68	3	93
1250		1249	4	0
1251		1250	9	0
1252		1250	9	0
1253		1250	9	0
1254		1250	9	0
1255	testforimport	\N	1	1
1256	test1	1255	2	1
1257	Operator name is shown correctly for USIM throughout settings	1256	3	1
1258		1257	4	0
1259		1258	9	0
1260		1258	9	0
1261		1258	9	0
1262		1258	9	0
1263		1258	9	0
1264		1258	9	0
1265		1258	9	0
1266	Network operator settings show correctly for both SIMs in a DSDS scenario	1256	3	2
1267		1266	4	0
1268		1267	9	0
1269		1267	9	0
1270		1267	9	0
1271		1267	9	0
1272		1267	9	0
1273		1267	9	0
1274		1267	9	0
1275	All items on the Call Settings screen display properly after enabling FDN	1256	3	3
1276		1275	4	0
1277		1276	9	0
1278		1276	9	0
1279		1276	9	0
1280		1276	9	0
1281		1276	9	0
1282		1276	9	0
1283	Last used SIM will call last contact dialed when double clicking bluetooth headset to dial	1256	3	4
1284		1283	4	0
1285		1284	9	0
1286		1284	9	0
1287		1284	9	0
1288		1257	4	0
1289		1288	9	0
1290		1288	9	0
1291		1288	9	0
1292		1288	9	0
1293		1288	9	0
1294		1288	9	0
1295		1288	9	0
1296		1266	4	0
1297		1296	9	0
1298		1296	9	0
1299		1296	9	0
1300		1296	9	0
1301		1296	9	0
1302		1296	9	0
1303		1296	9	0
1304		1275	4	0
1305		1304	9	0
1306		1304	9	0
1307		1304	9	0
1308		1304	9	0
1309		1304	9	0
1310		1304	9	0
1311		1283	4	0
1312		1311	9	0
1313		1311	9	0
1314		1311	9	0
1315	One entry of search result is displayed when input 2 digits.	84	3	1004
1316		1315	4	0
1317		1316	9	0
\.


--
-- Name: h5tl_nodes_hierarchy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_nodes_hierarchy_id_seq', 1317, true);


--
-- Data for Name: h5tl_object_keywords; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_object_keywords (id, fk_id, fk_table, keyword_id) FROM stdin;
9	9	nodes_hierarchy	1
10	9	nodes_hierarchy	2
11	9	nodes_hierarchy	3
12	9	nodes_hierarchy	4
13	9	nodes_hierarchy	5
14	9	nodes_hierarchy	6
15	9	nodes_hierarchy	7
16	84	nodes_hierarchy	10
17	85	nodes_hierarchy	10
18	86	nodes_hierarchy	10
19	104	nodes_hierarchy	9
\.


--
-- Name: h5tl_object_keywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_object_keywords_id_seq', 19, true);


--
-- Data for Name: h5tl_platforms; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_platforms (id, name, testproject_id, notes) FROM stdin;
1	Woodduck 2	2	<p>\r\n\tWoodduck v2</p>
2	Nexus 6	2	<p>\r\n\tReference phone nexus 6</p>
3	Flame	2	<p>\r\n\tFlame</p>
\.


--
-- Name: h5tl_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_platforms_id_seq', 3, true);


--
-- Data for Name: h5tl_req_coverage; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_req_coverage (req_id, testcase_id, author_id, creation_ts, review_requester_id, review_request_ts) FROM stdin;
\.


--
-- Data for Name: h5tl_req_relations; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_req_relations (id, source_id, destination_id, relation_type, author_id, creation_ts) FROM stdin;
\.


--
-- Name: h5tl_req_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_req_relations_id_seq', 1, false);


--
-- Data for Name: h5tl_req_revisions; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_req_revisions (parent_id, id, revision, req_doc_id, name, scope, status, type, active, is_open, expected_coverage, log_message, author_id, creation_ts, modifier_id, modification_ts) FROM stdin;
\.


--
-- Data for Name: h5tl_req_specs; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_req_specs (id, testproject_id, doc_id) FROM stdin;
\.


--
-- Data for Name: h5tl_req_specs_revisions; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_req_specs_revisions (parent_id, id, revision, doc_id, name, scope, total_req, status, type, author_id, creation_ts, modifier_id, modification_ts, log_message) FROM stdin;
\.


--
-- Data for Name: h5tl_req_versions; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_req_versions (id, version, revision, scope, status, type, active, is_open, expected_coverage, author_id, creation_ts, modifier_id, modification_ts, log_message) FROM stdin;
\.


--
-- Data for Name: h5tl_reqmgrsystems; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_reqmgrsystems (id, name, type, cfg) FROM stdin;
\.


--
-- Name: h5tl_reqmgrsystems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_reqmgrsystems_id_seq', 1, false);


--
-- Data for Name: h5tl_requirements; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_requirements (id, srs_id, req_doc_id) FROM stdin;
\.


--
-- Data for Name: h5tl_rights; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_rights (id, description) FROM stdin;
1	testplan_execute
2	testplan_create_build
3	testplan_metrics
4	testplan_planning
5	testplan_user_role_assignment
6	mgt_view_tc
7	mgt_modify_tc
8	mgt_view_key
9	mgt_modify_key
10	mgt_view_req
11	mgt_modify_req
12	mgt_modify_product
13	mgt_users
14	role_management
15	user_role_assignment
16	mgt_testplan_create
17	cfield_view
18	cfield_management
19	system_configuration
20	mgt_view_events
21	mgt_view_usergroups
22	events_mgt
23	testproject_user_role_assignment
24	platform_management
25	platform_view
26	project_inventory_management
27	project_inventory_view
28	req_tcase_link_management
29	keyword_assignment
30	mgt_unfreeze_req
31	issuetracker_management
32	issuetracker_view
33	reqmgrsystem_management
34	reqmgrsystem_view
35	exec_edit_notes
36	exec_delete
37	testplan_unlink_executed_testcases
38	testproject_delete_executed_testcases
39	testproject_edit_executed_testcases
40	testplan_milestone_overview
41	exec_testcases_assigned_to_me
42	testproject_metrics_dashboard
43	testplan_add_remove_platforms
44	testplan_update_linked_testcase_versions
45	testplan_set_urgent_testcases
46	testplan_show_testcases_newest_versions
\.


--
-- Name: h5tl_rights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_rights_id_seq', 1, false);


--
-- Data for Name: h5tl_risk_assignments; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_risk_assignments (id, testplan_id, node_id, risk, importance) FROM stdin;
\.


--
-- Name: h5tl_risk_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_risk_assignments_id_seq', 1, false);


--
-- Data for Name: h5tl_role_rights; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_role_rights (role_id, right_id) FROM stdin;
8	1
8	2
8	3
8	4
8	5
8	6
8	7
8	8
8	9
8	10
8	11
8	12
8	13
8	14
8	15
8	16
8	17
8	18
8	19
8	20
8	21
8	22
8	23
8	24
8	25
8	26
8	27
8	28
8	29
8	30
8	31
8	33
8	35
8	36
8	37
8	38
8	39
8	40
8	41
8	42
8	43
8	44
8	45
8	46
5	3
5	6
5	8
4	3
4	6
4	7
4	8
4	9
4	10
4	11
7	1
7	3
7	6
7	8
6	1
6	2
6	3
6	6
6	7
6	8
6	9
6	11
6	25
6	27
9	1
9	2
9	3
9	4
9	5
9	6
9	7
9	8
9	9
9	10
9	11
9	15
9	16
9	24
9	25
9	26
9	27
\.


--
-- Data for Name: h5tl_roles; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_roles (id, description, notes) FROM stdin;
3	<no rights>	\N
4	test designer	\N
5	guest	\N
6	senior tester	\N
7	tester	\N
8	admin	\N
9	leader	\N
\.


--
-- Name: h5tl_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_roles_id_seq', 9, true);


--
-- Data for Name: h5tl_tcsteps; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_tcsteps (id, step_number, actions, expected_results, active, execution_type) FROM stdin;
18	1	<p>\r\n\tOpen dialer and make a call to another phone</p>\r\n	<p>\r\n\tMT(Mobile Terminating) side will recieve the call</p>\r\n	1	1
19	2	<p>\r\n\tAnswer the call from MT side</p>\r\n	<p>\r\n\tCall can be established and both can hear each other</p>\r\n	1	1
23	1	<p>\r\n\tLaunch browser</p>\r\n		1	1
24	2	<p>\r\n\tOpen any website that allow user to zoom the page</p>\r\n	<p>\r\n\tWebsite can be loaded</p>\r\n	1	1
25	3	<p>\r\n\tZoom in the page</p>\r\n	<p>\r\n\tPage can be zoomed in</p>\r\n	1	1
26	4	<p>\r\n\tZoom out the page</p>\r\n	<p>\r\n\tPage can be zoomed out</p>\r\n	1	1
29	1	<div class="instruction">\r\n\t<p>\r\n\t\tLet device to be in EAP - PEAP - MSCHAPV2 network coverage and enable wifi detection</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n	<p>\r\n\tThe network is on &quot;Available networks&quot;</p>\r\n	1	1
30	2	<div class="instruction">\r\n\t<p>\r\n\t\tChoose the the network with EAP - PEAP signal</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n	<p>\r\n\tA configuration page is shown. The &quot;Security&quot; is &quot;WPA-EAP&quot;</p>\r\n	1	1
31	3	<div class="instruction">\r\n\t<p>\r\n\t\tSelect &quot;PEAP &quot; in EAP method</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n	<p>\r\n\t&quot;Phase 2 authentication&quot; is shown up</p>\r\n	1	1
32	4	<div class="instruction">\r\n\t<p>\r\n\t\tSelect &quot;No&quot; in &quot;Phase 2 authentication&quot; Type wrong username or wrong password. Tap OK button</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n	<p>\r\n\tThe wireless hotspot with EAP - PEAP security is not connected</p>\r\n	1	1
36	1	<div class="instruction stepitem">\r\n\t<p>\r\n\t\tLaunching &quot;Music&quot; app to listen a song</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n		1	1
37	2	<div class="instruction stepitem">\r\n\t<p>\r\n\t\tMeasuring the power consumption while you are listening music.</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n		1	1
38	3	<p>\r\n\tStop the music and press the power key to enter sleep mode</p>\r\n		1	1
39	4	<p>\r\n\tMeasuring the power consumption after you entered the sleep mode.</p>\r\n		1	1
40	5	<p>\r\n\tCompare the power consumption of step 2 and step 4</p>\r\n	<p>\r\n\tThe power consumption of sleep mode is less than active mode.</p>\r\n	1	1
46	1	<p>\r\n\tTest</p>\r\n	<p>\r\n\ttest</p>\r\n	1	1
47	2	<p>\r\n\tTest</p>\r\n	<p>\r\n\ttest</p>\r\n	1	1
53	1	<div class="instruction">\r\n\t<p>\r\n\t\tLet device to be in EAP - PEAP - MSCHAPV2 network coverage and enable wifi detection</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n	<p>\r\n\tThe network is on &quot;Available networks&quot;</p>\r\n	1	1
54	2	<div class="instruction">\r\n\t<p>\r\n\t\tChoose the the network with EAP - PEAP signal</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n	<p>\r\n\tA configuration page is shown. The &quot;Security&quot; is &quot;WPA-EAP&quot;</p>\r\n	1	1
55	3	<div class="instruction">\r\n\t<p>\r\n\t\tSelect &quot;PEAP &quot; in EAP method</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n	<p>\r\n\t&quot;Phase 2 authentication&quot; is shown up</p>\r\n	1	1
56	4	<div class="instruction">\r\n\t<p>\r\n\t\tSelect &quot;No&quot; in &quot;Phase 2 authentication&quot; Type wrong username or wrong password. Tap OK button</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n	<p>\r\n\tThe wireless hotspot with EAP - PEAP security is not connected</p>\r\n	1	1
89	1	<p>\r\n\tPress a digit from keypad on the homescreen.</p>\r\n	<p>\r\n\tDialer is launched.</p>\r\n	1	1
90	2	<p>\r\n\tPress &quot;Options&quot; key.</p>\r\n	<p>\r\n\tDialer app will show the menu.</p>\r\n	1	1
93	1	<p>\r\n\tPress + from keypad on the homescreen.</p>\r\n	<p>\r\n\tDialer app is launched. Press Options key to see the menu.</p>\r\n	1	1
94	2	<p>\r\n\tPress * from keypad on the homescreen.</p>\r\n	<p>\r\n\tDialer app is launched. Press Options key to see the menu.</p>\r\n	1	1
98	1	<p>\r\n\tPress RSK (right soft key) to clear the digit.</p>\r\n	<p>\r\n\tExit Dialer app and back to homescreen.</p>\r\n	1	1
101	1	<p>\r\n\tPress RSK to clear +.</p>\r\n	<p>\r\n\tExit Dialer app and back to homescreen.</p>\r\n	1	1
102	2	<p>\r\n\tPress RSK to clear #.</p>\r\n	<p>\r\n\tExit Dialer app and back to homescreen.</p>\r\n	1	1
103	3	<p>\r\n\tPress RSK to clear *.</p>\r\n	<p>\r\n\tExit Dialer app and back to homescreen.</p>\r\n	1	1
95	3	<p>\r\n\tPress # from keypad on the homescreen.</p>\r\n	<p>\r\n\tDialer app is lauched. Press Options key to see the menu.</p>\r\n	1	1
107	1	 Flash or reset the phone to bring up the FTE and finish the FTE to view the homescreen\n 	 There is no truncation. Nothing overlaps. The UI should not appear broken in any way.\n 	1	1
108	2	 Tap 'Camera' from the home screen and wait for the Camera permission screen to pop up\n 	 There is no truncation. Nothing overlaps. The UI should not appear broken in any way.\n 	1	1
109	3	 Return home and open the Browser app\n 	 There is no truncation. Nothing overlaps. The UI should not appear broken in any way.\n 	1	1
110	4	 Navigate to webcamtoy.com\n 	 There is no truncation. Nothing overlaps. The UI should not appear broken in any way.\n 	1	1
111	5	 Tap on "Ready? Smile!" and then tap on "Use my camera!"\n 	 There is no truncation. Nothing overlaps. The UI should not appear broken in any way.\n 	1	1
114	1	 Set your phone to a RTL language (Arabic)  \n 	  	1	1
115	2	 Go to the Camera app for the first   \n 	  	1	1
116	3	 Observe the App Permission view \n 	 3.1 The title and text should be right-aligned and read right to left \n3.2 The position of icons should be mirrored but the icon should not be mirrored. \n3.3 Share option is on the left, and “cancel” or “Don't Share” option is on the right.Text within the buttons remains center-aligned, but will read right to left \n3.4 No broken strings appear on the app permission screen when opening camera. \n3.5 Nothing should overlap. The UI should not appear broken in any way. \n 	1	1
119	1	 Set your phone to a RTL language (Arabic)  \n 	  	1	1
120	2	 Go to the Camera app  \n 	  	1	1
121	3	 Switch to Camcorder mode  \n 	  	1	1
122	4	 Tap record button  \n 	  	1	1
123	5	 Observe the recording indicator and counter\n 	 5.1 The position of recording indicator and counter should be mirrored. Align recording icon to the right and place the counter to the immediate left of the icon \n5.2 Nothing should overlap. The UI should not appear broken in any way.\n 	1	1
126	1	 Set your phone to a RTL language (Arabic)  \n 	  	1	1
127	2	 Go to the Camera app  \n 	  	1	1
128	3	 Tap menu icon \n 	  	1	1
129	4	 Observe the menu list view  \n 	 4.1 Title and drawer icon should remain their position as LTR\n4.2 Listed items should be right aligned and read right to left, and these icon should be placed on the right of text but not be mirrored \n4.3 Nothing should overlap. The UI should not appear broken in any way\n 	1	1
130	5	 Tap one menu item  \n 	  	1	1
131	6	 Observe the sub-menu list view\n 	 See expected behavior of step 4\n 	1	1
134	1	 Open camera app, and tap an area in the viewfinder screen \n 	 a red circle appears, then the focus is set to the tapped area, and the circle turns green and  disappears.  The aperture is set to the tapped area as well.\n 	1	1
135	2	 Tap several different regions in the viewfinder screen, including near the edge, center, as well as objects that are near to the camera and far to the camera.\n 	 As in step 1, focus and exposure are set to the tapped area.\n 	1	1
136	3	 zoom in slightly, (1/5 of the slider bar), then repeat step 2.\n 	 As in step 2, focus and exposure are set to the tapped area.\n 	1	1
137	4	 do full zoom in, then repeat step 2.\n 	 As in step 2, focus and exposure are set to the tapped area.\n 	1	1
138	5	 Zoom out fully, take picture and open the picture in preview\n 	 Verify the pictures are correctly focused to the tapped area\n 	1	1
139	6	 Exit preview, and turn on auto flash.  go to a dark place, and try to focus badly illuminated object by tapping on the screen.\n 	 The flash is turned on, and focus and exposure is set to the tapped region as in step 1\n 	1	1
140	7	 Take picture and open the picture in preview\n 	 Verify the flash is fired while the picture is taken, and pictures are correctly focused to the tapped area\n 	1	1
141	8	 change to the front facing camera and tap to focus\n 	 Verify tap to focus is not enabled\n 	1	1
144	1	 Open camera app, and point it towards a human face\n 	 A circle appears to identify the face.  Verify the circle persists as long as the face is shown in the viewfinder, and focus and exposure is set to the detected faces\n 	1	1
145	2	 Move the phone so the location of detected face changes.  Tap screen\n 	 Circle tracks the face, tapping shows focus circle, and focuses to the tapped area\n 	1	1
146	3	 tap face, Take photo, and open in preview\n 	 verify the tapped face in the photo is in focus, and correctly exposed.\n 	1	1
147	4	 zoom in slightly, (1/5 of the zoom slider) and point it towards the face\n 	 A circle appears to identify the face.  Verify the circle persists as long as the face is shown in the viewfinder, and focus and exposure is set to the detected faces\n 	1	1
148	5	 zoom it to maximum, and point it towards the full view of the face \n 	 A circle appears to identify the face.  Verify the circle persists as long as the face is shown in the viewfinder, and focus and exposure is set to the detected faces\n 	1	1
149	6	 go back to the camera app, and point at multiple faces\n 	 verify the circle appears for each faces, and all detected faces are in focus with correct exposure\n 	1	1
150	7	 Move the phone so the location of detected face changes.  Tap screen \n 	 Each circle tracks faces,  tapping shows focus circle for the area and sets the focus\n 	1	1
151	8	 Zoom in camera but still point to multiple faces.\n 	 verify the circle appears for each faces, and all detected faces are in focus with correct exposure\n 	1	1
152	9	 tap a random area, Take photo, and open in preview\n 	 verify the tapped area in the photo is in focus, and correctly exposed.\n 	1	1
153	10	 Change to the front facing camera, tap screen\n 	 verify the face detection circle still correctly identifies faces, but tapping does not show the focus circle\n 	1	1
156	1	 Launch Camera and switch to camcorder. \n 	  	1	1
157	2	 Press home key when it reaches 10 seconds. \n 	  	1	1
158	3	 Go to Gallery and play the recorded video and observe that video will be played for 10 seconds.\n 	 The video should stop recording immediately once the user goes to the homescreen.\n 	1	1
161	1	 Open the Camera app.\n 	  	1	1
162	2	 Change the aspect ratio to 16:9, 4:3, and 1:1.\n 	 The size and alignment of the viewfinder change properly. \n 	1	1
163	3	 Switch to the video mode.\n 	  	1	1
164	4	 Repeat Step 2.\n 	 The size and alignment of the viewfinder change properly. \n 	1	1
167	1	 Launch Camera App\n 	 Camera App launches and is displayed properly\n 	1	1
168	2	 Use view finder to locate fellow testers faces\n 	 A box encircles each face upon recognition and tracks their movements\n 	1	1
169	3	 Take a photo with a face recognized\n 	 The photo is saved to gallery and focus is placed on the recognized face\n 	1	1
170	4	 Repeat Step 1, and use view finder to locate a view with objects in foreground and background\n 	 Camera App responds appropriately\n 	1	1
171	5	 When there is an auto-focus of an object in the foreground, tap on an object in the background.\n 	 The view finder focuses on the object in the background instead.\n 	1	1
172	6	 Take a picture with the focus on an object in the background\n 	 The photo is saved to gallery and auto-focus did not return the focus to the object in the foreground.  The object in the background is the focal point.\n 	1	1
175	1	 Open the Camera app.\n 	  	1	1
176	2	 Switch to the video mode.\n 	  	1	1
177	3	 Start recording a video.\n 	  	1	1
178	4	 After 5 minutes or so, stop recording the video.\n 	  	1	1
179	5	 Press the Home button.\n 	 The Homescreen is displayed properly without issue.\n 	1	1
182	1	 Launch Camera and switch to camcorder. \n 	  	1	1
183	2	 Select any resolution for example cif. \n 	  	1	1
184	3	 Click on the resolutions options and select cif resolution again. \n 	 Viewfinder preview looks as intended without issue. \n 	1	1
187	1	 Open the Camera app.\n 	  	1	1
188	2	 Select the flash mode icon, and set it to ""Auto"".\n 	  	1	1
189	3	 Point the camera at a face.\n 	 A white circle is shown around the detected face.\nThe flash is not automatically turned on when a face is detected. The flash only goes off when the shutter button is pressed.\n 	1	1
190	4	 Repeat step 3 several times.\n 	 Ensure the flash does not go off until the user taps the shutter button.\n 	1	1
193	1	 Change the resolution of the camera to 352X288\n 	  	1	1
194	2	 Launch the camera app.\n 	  	1	1
195	3	 Move the viewfinder around observing the speed of the preview.\n 	 The camera preview is smooth and on par with Android. \n 	1	1
196	4	 Now change the resolution 720X480. \n 	  	1	1
197	5	 Repeat steps 2 and 3. \n 	 The camera preview is smooth and on par with Android. \n 	1	1
200	1	 Open the camera app. \n 	  	1	1
201	2	 Take a picture. \n 	  	1	1
202	3	 Tap the preview icon. \n 	 The user is taken to view the last photo that they took. \n 	1	1
203	4	 While in preview mode hit the home button.\n 	 The user is returned home. \n 	1	1
204	5	 Open the camera app again. \n 	 The user should be returned to the viewfinder not the photo preview so they can quickly take a picture. \n 	1	1
207	1	 Enter the Gallery app and select a picture to edit.\n 	  	1	1
208	2	 Press the edit button and select ""Auto Enhance On"".\n 	  	1	1
209	3	 Press the done button.\n 	  	1	1
210	4	 Press the camera button in the bottom of the screen on the left.\n 	 The camera viewfinder is displayed as normal.\n 	1	1
213	1	 Open the Camera app.\n 	  	1	1
214	2	 Take multiple photos. \n 	  	1	1
215	3	 Select the Preview icon.\n 	  	1	1
216	4	 Zoom in on the photo, and pan the screen left and right.\n 	 The zoomed photo moves around on the screen. The screen is not swiped to the next photo.\n 	1	1
217	5	 Press the Home button, and open the Gallery app.\n 	  	1	1
218	6	 Select any photo.\n 	  	1	1
219	7	 Zoom in on the photo, and pan the screen left and right.\n 	 The zoomed photo moves around on the screen. The screen is not swiped to the next photo.\n 	1	1
222	1	 Enable ADB Debug on Device and plug into computer.\n 	  	1	1
223	2	 Enable Frames per second in Developer Menu > Developer HUD.\n 	  	1	1
224	3	 Launch Video app and toggle to video recording.\n 	  	1	1
225	4	 Press record button on device.\n 	  	1	1
226	5	 While video is recording pinch to zoom in and out while paying attention to the FPS.\n 	 FPS overlay does not show large drop while zooming during video recording. Video recording itself shows no visible frame drop.\n 	1	1
229	1	 Open the Camera app.\n 	  	1	1
230	2	 Rotate the dut to landscape mode.\n 	  	1	1
231	3	 Take a photo. \n 	  	1	1
232	4	 Select the Preview icon.\n 	  	1	1
233	5	 Select the Share icon.\n 	  	1	1
234	6	 Select 'E-Mail'.\n 	  	1	1
235	7	 On the 'Confirmation' message, select 'Cancel'.\n 	  	1	1
236	8	 Observe the user is returned to the Camera app.\n 	 The Camera app UI is displayed properly.\n 	1	1
239	1	 Open the camera app. \n 	 No gallery icon should appear.\n 	1	1
240	2	 Tap the shutter button. \n 	 Photo is taken and a preview icon appears. \n 	1	1
241	3	 Tap on the preview icon and rotate the phone to landscape mode and then back to portrait.\n 	 Orientation can be landscape or portrait. Header says "Preview", there is a back arrow, a share icon and an action menu.\n 	1	1
242	4	 Tap the preview picture. \n 	 The header, back arrow, a share icon and an action menu disappear so the user can view the photo fully.\n 	1	1
243	5	 Tap the picture again.\n 	 The header, back arrow, a share icon and an action menu return.\n 	1	1
244	6	 Tap on the action menu "..."\n 	 The user is presented with "Open Gallery", "Delete" and "Cancel". Gallery should be capitalized.\n 	1	1
245	7	 Tap "Gallery". \n 	 The gallery app opens.\n 	1	1
246	8	 Go back to a picture preview and tap on the action menu again "...".\n 	  	1	1
247	9	 Tap on "Delete".\n 	 Confirmation screen is shown. \n 	1	1
248	10	 Delete the photo and ensure that it has been removed.\n 	 Photo has been deleted.\n 	1	1
249	11	 Take another picture and tap on the preview icon. \n 	  	1	1
250	12	 Tap the "back arrow". \n 	 The user is returned to the view finder.\n 	1	1
251	13	 Take another photo and tap on the preview icon. \n 	  	1	1
252	14	 Tap on the "Share" icon. \n 	 Share menu opens and works as expected.\n 	1	1
255	1	 Enable HWC and begin recording a video. \n 	  	1	1
256	2	 Monitor the logs paying close attention to:\ncat /sys/class/kgsl/kgsl/page_alloc\ncat /sys/class/kgsl/kgsl/pagetables/<<b2g-pid>>/mapped\n 	 Ensure no significant increase is taking place. \n 	1	1
257	3	 Keep recording a video for more than 15 minutes. \n 	 Ensure that the camera app does not close due to a memory leak in the b2g process.\n 	1	1
260	1	 Open the Camera app.\n 	  	1	1
261	2	 Take multiple photos. \n 	  	1	1
262	3	 Select the Preview icon.\n 	  	1	1
263	4	 Swipe through the photos left and right.\n 	 The photos change with a smooth transition animation.\n 	1	1
264	5	 Press the Home button, and open the Gallery app.\n 	  	1	1
265	6	 Select any photo.\n 	  	1	1
266	7	 Swipe through the photos left and right.\n 	 The photos change smoothly with a  transition animation.\n 	1	1
269	1	 Open the Camera app.\n 	  	1	1
270	2	 Select the menu icon.\n 	  	1	1
271	3	 Select Self-Timer and then quickly tap the back button.\n 	  	1	1
272	4	 Quickly select Grid Lines and then tap the back button.\n 	  	1	1
273	5	 Repeat step 3-4 multiple times at a rapid pace, paying close attention to what sub menu is actually being shown.\n 	 Verify the correct sub menus are always being shown. \n 	1	1
276	1	 Open camera app.\n 	  	1	1
277	2	 Switch to the Front Camera.\n 	  	1	1
278	3	 Keep the device in Landscape mode and take a snapshot\n 	  	1	1
279	4	 Check the thumbnail of the captured photo.\n 	 Thumbnail matches the captured picture.\n 	1	1
280	5	 Open the gallery app and check the preview of the captured image.\n 	 Preview should match the captured photo.\n 	1	1
283	1	 Open the Camera app.\n 	  	1	1
284	2	 Take pictures.\n 	  	1	1
285	3	 Call the DUT from another device, and accept the incoming call.\n 	 The user can accept the phone call without issue.\n 	1	1
286	4	 Press the Home button.\n 	 The user is returned to the homescreen and the current call is displayed in the status bar. \n 	1	1
287	5	 Re-open the Camera app.\n 	 The camera app opens without issue and current call is displayed in the status bar. \n 	1	1
288	6	 Take pictures.\n 	 Verify the user is able to take pictures while in a phone call.\n 	1	1
289	7	 Open the gallery app.\n 	 Ensure all pictures taken while in the phone call are saved properly in gallery.\n 	1	1
292	1	 Tap on the "SMS" app. \n 	  	1	1
293	2	 Tap on the "Compose new message" icon. \n 	  	1	1
294	3	 Tap on the "Paperclip" to attach a file. \n 	  	1	1
295	4	 Tap on  "Camera". \n 	  	1	1
296	5	 Take a photo with the camera. Zoom in and out using a pinch gesture on the photo. \n 	 The zoom function is working properly. \n 	1	1
297	6	 Tap on "Retake". \n 	  	1	1
298	7	 Take another photo and then tap "Select". \n 	 The photo is attached successfully to the MMS. \n 	1	1
299	8	 Add a contact and send the MMS to secondary phone. \n 	  	1	1
300	9	 Open the MMS on the targeted phone and view the attached picture. \n 	 The picture shows correctly. \n 	1	1
303	1	 Launch 'Camera' from the home screen\n 	  	1	1
304	2	 Tap the 'Video Camera' icon in the bottom right corner of the screen and start recording a video.\n 	  	1	1
305	3	 Stop recording the video. \n 	 A preview icon appears towards at the bottom left of the screen. \n 	1	1
306	4	 Tap on the preview icon for the video that was just recorded. \n 	  	1	1
307	5	 Tap on "Play" to play the video. \n 	 The video plays without issue. No significant delay occurs when playing the video.\n 	1	1
308	6	 After the video has stopped playing, tap on the "..."  and then "Open Gallery' to access the gallery app. \n 	 The gallery app opens properly and the video that was just recorded appears in the list. \n 	1	1
309	7	 Tap on the video that was recorded and play it. \n 	 The video plays without issue. \n 	1	1
310	8	 Press the "Home" button on the phone. \n 	 The user is returned to the homscreen. \n 	1	1
311	9	 Tap on the "Video" icon. \n 	 The recorded video appears in the list of available videos. \n 	1	1
312	10	 Tap on the video to play it. \n 	 The video plays without issue. \n 	1	1
315	1	 Open Messages app. \n 	  	1	1
316	2	 Tap on the pencil in the top right to create a new message. \n 	  	1	1
317	3	 Type in a valid phone number, or select a contact. \n 	  	1	1
318	4	 Tap on paper clip to add an attachment. \n 	  	1	1
319	5	 Tap on camera. \n 	  	1	1
320	6	 Take video until prompted that you have reached the maximum file size for the attachment. \n 	  	1	1
321	7	 Tap on OK.\n 	  	1	1
322	8	 Tap "Select" and then send the MMS. \n 	 Video sends properly and it does not take a long time to send\n 	1	1
325	1	 Launch camera app\n 	 Camera app should launch.  the preview should be full screen with buttons floating.  Bottom center button depends on the settings for camera/video; red for video, camera icon for camera.\n 	1	1
326	2	 check to see if the device has a front/back camera\n 	 If the device has a front/back camera, there should be a camera switch icon in the upper left hand corner.\n 	1	1
327	3	 Make sure you are in camera mode.  check to see if the device has a flash; if the device has a flash switch to the camera that the flash is associated with; tap it 3 times.\n 	 If the device has a flash associated with a camera, a flash icon should appear in the upper middle.  Tapping it 3 times should cycle the flash on, flash off, flash auto.\n 	1	1
328	4	 Switch to video mode, check to see if the device has a flash; if the device has a flash switch to the camera that the flash is associated with; tap it 2 times.\n 	 it should cycle flash on/flash off.  flash on will keep the flash on.\n 	1	1
329	5	 switch back to camera mode; Hit the options button ( the three lines in the upper right hand corner)\n 	 if the camera is HDR capable, there should be a HDR mode, Self-Timer and Grid lines.\n 	1	1
330	6	 Select Grid Lines, select on.\n 	 Immediate change should be that the gridlines show splitting the screen into thirds.\n 	1	1
331	7	 go back to the options, select self timer, 2 seconds\n 	 an icon to the middle left of the screen should appear indicating there is a timer.\n 	1	1
332	8	 Take a picture.\n 	 when the picture is taken, there are large numbers indicating a countdown to the picture being taken and the picture is taken.\nThere should be a preview of the picture that was taken in the bottom left corner.\n 	1	1
333	9	 go back to the options, turn timer off; turn HDR on if it is a camera that is HDR capable.  Skip this step if the camera is not HDR capable.\n 	 There should be a HDR icon to the middle left\n 	1	1
334	10	 select video\n 	 the button at the bottom middle button should change to a red dot in the middle of a white and red circle.\n 	1	1
335	11	 hit the options button\n 	 If it's a HDR capable camera, HDR should be listed;\nSelf-Timer should be listed and GridLines should be listed.\n 	1	1
338	1	 Tap 'Camera' from the Home Screen\n 	 All strings on the 'Camera' screen are translated correctly without truncation.\n 	1	1
341	1	 Tap 'Settings' and enable USB storage\n 	  	1	1
342	2	 Plug the DUT (phone) into PC/Laptop via USB\n 	  	1	1
343	3	 Return to the Home Screen and tap 'Camera'\n 	 All strings on the 'Camera Error Page' screen are translated correctly without truncation.\n 	1	1
346	1	 Launch the Camera app.\n 	  	1	1
347	2	 Switch the camera to the video recorder.   \n 	  	1	1
348	3	 Tap the "Record" button.\n 	 Video begins recording.\n 	1	1
349	4	 While the video is recording, receive a call from another device.  \n 	 Video recording stops immediately when the phone rings. \n 	1	1
350	5	 Hang up the call and preview the video just recorded listening closely to the audio. \n 	 The video was recorded as intended without the sound of the incoming call present. \n 	1	1
353	1	 Initiate the FTE by Flashing the phone, Resetting, or Dev settings.\n 	  	1	1
354	2	 Step through the FTE\n 	  	1	1
355	3	 On the Home Screen tap 'Camera'\n 	 All strings on the 'Camera Scanning' screen are translated correctly without truncation.\n 	1	1
358	1	 Remove the SD card from the DUT (device under test)\n 	  	1	1
359	2	 Turn on the phone and tap 'Camera' from the home screen\n 	 All strings on the 'Camera App - no SD card' screen are translated correctly without truncation.\n 	1	1
362	1	 Insert a full SD card into the DUT (device under test)\n 	  	1	1
363	2	 Turn on the phone and tap 'Camera' from the home screen\n 	 All strings on the 'Camera - SD card is full' screen are translated correctly without truncation.\n 	1	1
366	1	 Long press on the Homescreen, and choose 'Change WallPaper', Tap on the Camera app.\n 	 The Camera app launches and displays the current view in front of the phone camera.\n 	1	1
367	2	 Tap on the cross button.\n 	 The Camera app exits. The phone home screen is displayed.\n 	1	1
368	3	 Long press on the phone home screen and tap on the wallpaper -> Camera option in the Select from dialog.\n 	 The Camera app launches and displays the current view in front of the phone camera.\n 	1	1
369	4	 Tap on the Camera icon.\n 	 The camera snaps a photo and displays a dialog with 2 buttons: Retake and Select.\n 	1	1
370	5	 Tap on the Retake button.\n 	 The Camera app displays the current view in front of the phone camera.\n 	1	1
371	6	 Tap on the Camera icon again.\n 	 The camera snaps a photo and displays a dialog with 2 buttons: Retake and Select.\n 	1	1
372	7	 Tap on the Select button.\n 	 The camera app exits. The phone home screen is displayed with the photo as wallpaper.\n 	1	1
373	8	 On the phone home screen, tap on the E-Mail icon.\n 	 The Inbox for the configured email account is displayed.\n 	1	1
374	9	 Tap on the Compose icon in the top right corner.\n 	 The Compose dialog is displayed.\n 	1	1
375	10	 Tap on the Attachment icon.\n 	 A Select from dialog opens with options for Wallpaper, Gallery and Camera.\n 	1	1
376	11	 Tap on the Camera icon.\n 	 The Camera app launches and displays the current view in front of the phone camera.\n 	1	1
377	12	 Tap on the cross icon.\n 	 The Camera app exits. The Compose dialog of the E-Mail app is displayed.\n 	1	1
378	13	 Tap on the Attachment icon and tap on the Camera option in the Select from dialog. \n 	 The Camera app launches and displays the current view in front of the phone camera.\n 	1	1
379	14	 Tap on the Camera icon.\n 	 The camera snaps a photo and displays a dialog with 2 buttons: Retake and Select.\n 	1	1
380	15	 Tap on the Retake button.\n 	 The Camera app displays the current view in front of the phone camera.\n 	1	1
381	16	 Tap on the Camera icon.\n 	 The camera snaps a photo and displays a dialog with 2 buttons: Retake and Select.\n 	1	1
382	17	 Tap on the Select button.\n 	 The camera app exits. The Compose dialog of the E-Mail app is displayed with the photo attached. The photo file name and file size are also displayed.\n 	1	1
385	1	 Launch the Settings app.\n 	  	1	1
386	2	 Scroll down to Phone Lock and enable Lock Screen and enable Passcode Lock with a valid passcode.\n 	 Verify the both Lock Screen and Passcode Lock are enabled indicated by a checkmark.\n 	1	1
387	3	 Exit Settings to Home screen then tap the Power button to lock the phone.\n 	 Verify the LCD goes black.\n 	1	1
388	4	 Tap the power button again then tap the Camera icon on the lock screen.\n 	 Verify the Camera app launches from the Lock screen.\n 	1	1
389	5	 Wait a couple seconds.\n 	 Verify that the Geo Location window appears asking for permission for your location.\n 	1	1
392	1	 Open the Camera App\n 	  	1	1
393	2	 Press the Camera button at the bottom of the screen \n 	 Photo is taken and should appear in preview circle on the bottom of the screen\n 	1	1
394	3	 Observe the area near the preview circle\n 	 Verify there is no overlapping between the take picture button and the Switch Camera modes icon.\n 	1	1
397	1	 Tap the Rocketbar\n 	 Keyboard should appear.\n 	1	1
398	2	 Go to www.twitter.com\n 	 Twitter Home page is open\n 	1	1
399	3	 Sign in to Twitter\n 	 User is signed in\n 	1	1
400	4	 Select "New tweet" icon\n 	 New Tweet window is displayed\n 	1	1
401	5	 Select camera icon\n 	 Menu is open\n 	1	1
402	6	 Select "Camera" \n 	 Camera is displayed\n 	1	1
403	7	 Change to landscape mode;\n 	 Camera preview is displayed in landscape mode when orientation of phone is changed\n 	1	1
406	1	 Open the Camera App\n 	  	1	1
407	2	 Press the Camera icon\n 	 Photo is taken and then can be viewed by clicking on the preview icon at the bottom. \n 	1	1
408	3	 Tap the captured photo's preview icon\n 	 Captured photo is displayed in a larger view\n 	1	1
409	4	 View toolbar at the top of the screen\n 	 Toolbar icons are visible and clear\n 	1	1
412	1	 Launch Camera application\n 	 Camera application is open\n 	1	1
413	2	 Take a picture\n 	 Picture is displayed in filmstrip\n 	1	1
414	3	 Tap picture in filmstrip to preview\n 	 Picture is previewed\n 	1	1
415	4	 Wait how ever long "screen timeout" was set to in Settings\n 	 Device goes to sleep mode\n 	1	1
418	1	 Select the Camera app from the home screen. \n 	 Camera app opens up and displays\n 	1	1
419	2	 Start Recording a video. \n 	 Verify that the Video Recording start sound is not distorted. \n 	1	1
422	1	 Open the MMS messaging app.\n 	  	1	1
423	2	 Tap on the attachment icon.\n 	  	1	1
424	3	 Select Camera.\n 	  	1	1
425	4	 Take a photo. \n 	 The photo taken will be attached to the MMS.\n 	1	1
428	1	 Launching camera app and switch to video recorder.\n 	  	1	1
429	2	 Start to record video until the time goes over an hour.\n 	  	1	1
430	3	 Stop the video recorder.\n 	 The video recorder can work over than one hour and the video shows as normal\n 	1	1
433	1	 go to view saved photos/videos \n 	 photos/videos can be viewed\n 	1	1
434	2	 tap on one of the photos/videos\n 	 the photo/video is diaplayed\n 	1	1
435	3	 tap the camera button while viewing the photo/video\n 	 live camera ("take a photo") mode quickly starts\n 	1	1
438	1	 Take a photo using the phone camera\n 	 Photo is properly taken saved in Gallery\n 	1	1
439	2	 Open Gallery app and tap on Photo\n 	 Picture is displayed in view photo (fullscreen) mode\n 	1	1
440	3	 Pinch-to-zoom in over the photo\n 	 The picture is zoomed in\n 	1	1
441	4	 Rotate so you change the view  (ex. Landscape to Portrait; Portrait to Landscape)\n 	 The view mode is changed\n 	1	1
442	5	 Repeat step 3\n 	 The picture is zoomed in\n 	1	1
443	6	 Pinch-to-zoom out over the photo\n 	 The picture is zoomed out\n 	1	1
444	7	 Rotate so you change the view  (ex. Landscape to Portrait; Portrait to Landscape)\n 	 The view mode is changed\n 	1	1
445	8	 Repeat step 6\n 	 The picture is zoomed out\n 	1	1
448	1	 launch camera app\n 	 camera app opens\n 	1	1
449	2	 open a picture in  photo (fullscreen) mode\n 	 photo can be open in fullscreen mode \n 	1	1
450	3	 double tap on photo \n 	 photo is zoomed in\n 	1	1
451	4	 Rotate device (ex. From Landscape to Portrait and viceversa)\n 	 The view mode is changed\n 	1	1
452	5	 Repeat step 3\n 	 photo is zoomed in\n 	1	1
453	6	 double tap again on photo\n 	 photo is zommed out to original (fullscreen) size\n 	1	1
454	7	 Rotate device (ex. From Landscape to Portrait and viceversa)\n 	 The view mode is changed\n 	1	1
455	8	 Repeat step 6\n 	 photo is zoomed out\n 	1	1
458	1	 open  galery \n 	 galey is displayed\n 	1	1
459	2	 Pan up \n 	 Older items from the Galery are displayed \n 	1	1
462	1	 go to Galery and select a pho/video \n 	 you are able to see the photo/video\n 	1	1
463	2	 select gallery icon\n 	 Gallery is launched and running in the foreground\n 	1	1
466	1	 Open Camera app\n 	  	1	1
467	2	 Record a video through the camera. Hit the small square on the left side that indicates preview.\n 	 You should see the video that you just recorded.\n 	1	1
468	3	 Select the video to play the video\n 	 video can be played\n 	1	1
469	4	 Pause playback and tap the icon on top with three dots. It will have a list of options, including Delete video. Press delete video.\n 	 video is deleted, should not appear in preview or gallery.\n 	1	1
472	1	 open camera app \n 	 camera app opens\n 	1	1
473	2	 start recording videos or take photos  \n 	 a warnig message stating that 'you are running out of  storage space'  should be displayed when memory is almost full \n 	1	1
476	1	 Launch camera app\n 	 The camera app opens\n 	1	1
477	2	 Tap the HUD Flash button and select Flash On\n 	 Flash can be set to On. There should be a brief visual indicator in the user interface to confirm this.\n 	1	1
478	3	 Take a picture in a low-light environment\n 	 Flash is triggered when taking picture.\n 	1	1
481	1	 Launch the camera app.\n 	 Camera app launches successfully.\n 	1	1
482	2	 Tap the HUD Flash button and select Flash AUTO.\n 	 Flash can be set to AUTO. There should be a brief visual indicator in the UI that the flash is set to AUTO.\n 	1	1
483	3	 Take a picture in a low-light environment\n 	 Flash is triggered when taking picture.\n 	1	1
484	4	 Take a picture in a high-light environment.\n 	 Flash is NOT triggered when taking picture.\n 	1	1
487	1	 Launch the camera app.\n 	  	1	1
488	2	 Take a photo.\n 	 Verify the new photo appears in the top left corner of the screen.\n 	1	1
489	3	 Tap on the new photo to open the photo in (fullscreen) mode.\n 	 Verify the photo can be opened in fullscreen mode.\n 	1	1
490	4	 Double tap on the photo.\n 	 Verify the photo is zoomed in.\n 	1	1
491	5	 Double tap again on the photo.\n 	 Verify the photo is zoomed out to the original (fullscreen) size.\n 	1	1
494	1	 open camera app\n 	 camera app opens\n 	1	1
495	2	 go to video preview mode by tapping the preview icon on the lower left corner\n 	 videos can be previewed \n 	1	1
496	3	 swipe to right to see previous video\n 	 previous video is properly displayed in preview mode, and can playback properly\n 	1	1
497	4	 swipe to left to go back to the video just shown\n 	 video is properly displayed in preview mode, and can playback properly\n 	1	1
500	1	 open camera app\n 	 camera app opens\n 	1	1
501	2	 Select the preview button, scroll to a video and play a video\n 	 video can be played\n 	1	1
502	3	 Pause playback and tap on the back arrow\n 	 The user is taken back to the camera\n 	1	1
505	1	 open gallery app\n 	  	1	1
506	2	 Select and pull up a previously saved video.\n 	  	1	1
507	3	 play a video\n 	 video can be played\n 	1	1
508	4	 pause playback and tap camera icon on the bottom of Gallery\n 	 tapping on camera icon quickly switches to Photo mode/Camera app\n 	1	1
511	1	 Launch the Camera app.\n 	  	1	1
512	2	 Tap on the gallery icon to view saved photos/videos.\n 	 Verify the photos/videos can be viewed.\n 	1	1
513	3	 Tap the camera button while viewing saved photos/videos.\n 	 Verify the user is quickly taken to the live camera ("take a photo") mode.\n 	1	1
516	1	 launch camera app\n 	 The camera app opens.\n 	1	1
517	2	 Tap the HUD Flash button and select Flash OFF\n 	 Flash can be set to OFF. User should see a visible indication of this briefly user interface.\n 	1	1
518	3	 Take a picture in a low-light environment.\n 	 Flash is NOT triggered when taking picture.\n 	1	1
521	1	 launch camera app\n 	 camera app opens\n 	1	1
522	2	 place device in landscape mode and view a photo in full screen mode\n 	 picture is properly displayed\n 	1	1
523	3	 place device in landscape mode and play a video in full screen mode\n 	 video is properly displayed\n 	1	1
526	1	 launch camera app\n 	 camera app opens\n 	1	1
527	2	 place device in potrait mode and view a photo in full screen mode\n 	 picture is properly displayed\n 	1	1
528	3	 place device in portrait mode and play a video in full screen mode\n 	 video is properly displayed\n 	1	1
531	1	 launch camera app\n 	 camera app opens\n 	1	1
532	2	 place device in portrait mode and take a shot\n 	 picture taken is in portrait\n 	1	1
533	3	 place device in portrait mode and record a video a shot\n 	 recorded video is in portrait\n 	1	1
536	1	 start camera app\n 	 camera app starts\n 	1	1
537	2	 connect device to USB mass storage mode\n 	 USB mass storage mode can be set \n 	1	1
538	3	 disconnect device from USB mass storage mode\n 	 camera app is automatically restarted and can be properly used\n 	1	1
541	1	 open camera\n 	 camera starts\n 	1	1
542	2	 try to take a picture\n 	 a clear message should be displayed if you try to use the camera app while the phone is in USB mass storage mode so that you can decide whether to exit USB mass storage mode so you can use your camera immediately or let it continue\n 	1	1
545	1	 open camera app\n 	 camera app starts\n 	1	1
546	2	 start recording a video \n 	 when memory is full a clear message should be displayed letting the user now that device run out of storage while recording a video\n 	1	1
549	1	 open camera app\n 	 a clear message is displayed if try to start the camera app with a full memory card and can't use it so that the user knows to exit the application and either delete Photos/Videos in gallery or get another memory card\n 	1	1
550	2	 free some space on memory card and try to use camera\n 	 camera can be used to take photos and videos\n 	1	1
551	3	 replace the memory card with an empty card and try to use camera\n 	 camera can be used to take photos and videos\n 	1	1
554	1	 without having a mem card inserted in device open Camera app and try to take pictures/videos\n 	 user should be informed that he needs an external storage device to use camera and don't have it inserted\n 	1	1
557	1	 With USB Mass Storage enabled on your phone, connect your device to a PC using a USB cable.\n 	 Verify the PC can recognize the the phone is connected as a USB Storage device.\n 	1	1
558	2	 On a PC, navigate to your photos/videos stored on phone.\n 	 Verify that from a PC, the user should be able to access the photos and videos stored on the phone.\n 	1	1
559	3	 Copy some of the photos/videos from the device to the PC.\n 	 Verify that the files can be transferred to the PC.\n 	1	1
560	4	 On the PC, try to view a photo that has been transferred.\n 	 Verify that the photo is properly displayed.\n 	1	1
561	5	 On the PC try to watch a video that has been transferred.\n 	 Verify the video can be played.\n 	1	1
564	1	 Launch the Camera app.\n 	  	1	1
565	2	 Play a recorded video.\n 	 Verify the video can be played.\n 	1	1
566	3	 Tap on the video playing.\n 	 Verify the video controls are displayed with the progress bar in the view.\n 	1	1
567	4	 Drag the progress marker to a  further point on the progress bar for the video.\n 	 Verify the video starts to play from the selected point from the progress bar.\n 	1	1
568	5	 Drag the progress marker to a  previous point on the progress bar.\n 	 Verify the video starts to play from the selected point from the progress bar.\n 	1	1
571	1	 Launch the Camera app.\n 	 Verify the Camera app opens.\n 	1	1
572	2	 Record a video.\n 	 Verify the video is recorded and saved to the Gallery.\n 	1	1
573	3	 Go to the Gallery,  tap on a video to see the toolbar then tap on the Garbage icon.\n 	 Video is deleted (should confirm the deletion first).\n 	1	1
576	1	 Launch the Camera app.\n 	  	1	1
577	2	 Tap on a recorded video to play it.\n 	 Verify the video can be played.\n 	1	1
578	3	 Tap on the video playing.\n 	 Verify the video controls are displayed.\n 	1	1
579	4	 Tap on the pause option.\n 	 Verify the video is paused.\n 	1	1
580	5	 Tap on the play option.\n 	 Verify the video resumes playing.\n 	1	1
583	1	 Launch the camera and record a video.\n 	 Verify the video is recorded and saved in the Gallery.\n 	1	1
584	2	 Go to the Gallery app and check the video.\n 	 Verify that the video has a Play icon on it.\n 	1	1
585	3	 Tap on the Play icon.\n 	 Verify the video starts to play.\n 	1	1
588	1	 Open Camera app and tap on the camera button to switch to video mode  \n 	 Camera can be set to video mode. \n 	1	1
589	2	 Tap on the Record button\n 	 Camera starts recording\n 	1	1
592	1	 Open Camera and switch to video mode\n 	 Camera can be set on video mode\n 	1	1
593	2	 Tap on the camera icon located in the bottom-right side of the screen\n 	 Camera mode is changed to Photo\n 	1	1
596	1	 Take a few photos using phone camera\n 	 Photos are properly saved in Gallery\n 	1	1
597	2	 Open Gallery app and tap on one of the photos\n 	 Picture is displayed in view photo (fullscreen) mode\n 	1	1
598	3	 Swipe to the left a few times to see the next photos\n 	 Next photos are properly displayed. \n 	1	1
601	1	 Take a photo using the phone camera\n 	 Photo is properly taken saved in Gallery\n 	1	1
602	2	 Open Gallery app and tap on Photo\n 	 Picture is displayed in view photo (fullscreen) mode\n 	1	1
603	3	 Pinch-to-zoom in over the photo\n 	 The picture is zoomed in\n 	1	1
604	4	 Pinch-to-zoom out over the photo\n 	 The picture is zoomed out\n 	1	1
607	1	 Take a few photos using phone camera\n 	 Photos are properly saved in Gallery\n 	1	1
608	2	 Open Gallery app and tap on one of the photos\n 	 Picture is displayed in view photo (fullscreen) mode\n 	1	1
609	3	 Swipe to the right a few times to see the previous photos\n 	 Previous photos are properly displayed. \n 	1	1
612	1	 Launch the Camera app.\n 	  	1	1
613	2	 Tap the Video mode button.\n 	 Verify the camera switches into video ready mode.\n 	1	1
614	3	 Tap back to Camera mode again.\n 	 Verify the camera goes from Video ready mode to Camera ready mode.\n 	1	1
617	1	 Launch camera app\n 	  	1	1
618	2	 Capture 3+ photos\n 	  	1	1
619	3	 Go to video by pressing the video button\n 	 Go to the video mode successfully.  \n 	1	1
620	4	 press the record button\n 	 A video is recorded successfully and the recording screen displays normally.  \n 	1	1
621	5	 After a while press the stop button\n 	  	1	1
622	6	 Go back to camera by pressing the camera button\n 	 The user goes back to camera mode successfully.\n 	1	1
625	1	 launch camera app\n 	 camera app opens\n 	1	1
626	2	 place device in landscape mode and take a shot\n 	 picture taken is in landscape\n 	1	1
627	3	 place device in landscape mode and record a video\n 	 recorded video is in landscape\n 	1	1
630	1	 Open the Camera app.\n 	 The camera app will be opened.\n 	1	1
631	2	 Press the Video camera icon.\n 	 The app will switch to video camera mode.\n 	1	1
632	3	 Tap on the Video camera icon again.\n 	 The device will start to record video.\n 	1	1
633	4	 Press the Stop icon again.\n 	 The device will stop recording. A new video is created and can be found in the gallery app. The video is saved as ".3gp".\n 	1	1
636	1	 tap the Preview icon on lower right corner to view the photo, and tap ... button on top right\n 	 "Open Gallery" and "Delete" button shows up\n 	1	1
637	2	 Press Delete\n 	 Delete Photo? prompt shows up\n 	1	1
638	3	 Tap on "Delete" when prompted "Delete photo?"\n 	 Current photo is deleted and no longer shows up in any views.  It is also removed from SD card.\n 	1	1
641	1	 Open the Camera app\n 	  	1	1
642	2	 Take a photo.\n 	  	1	1
643	3	 Tap on the thumbnail area.\n 	 Toolbars should hide.\n 	1	1
646	1	 launch camera app\n 	 camera app opens\n 	1	1
647	2	 Take a Picture and tap the preview icon\n 	 Verify the phone is in preview page\n 	1	1
648	3	 Tap Menu icon (The ellipses '...') in upper right corner of screen\n 	 Options screen should be shown now\n 	1	1
649	4	 Tap on 'Open Gallery' button\n 	 The gallery should now be open\n 	1	1
652	1	 Open the Camera app.\n 	  	1	1
653	2	 Tap on the photo preview icon\n 	 preview of the most recently taken image should show up\n 	1	1
654	3	 Tap on the < sign on the top title\n 	 Viewfinder screen should come back in.\n 	1	1
657	1	 Launch camera app\n 	  	1	1
658	2	 Take a picture\n 	  	1	1
659	3	 Select gallery app\n 	  	1	1
660	4	 Select share\n 	 \nVerify that there's an email photo option -> which will bring up email app and compose the email with the attachment\nVerify that there's a Set as Wallpaper option which allows you to choose the picture as the wall paper\nVerify that there's a Bluetooth Transfer option which allows you to send the picture to another device via Bluetooth\n\n 	1	1
663	1	 launch camera app\n 	 camera app opens \n 	1	1
664	2	 Look at the flash icon at the top of the screen.\n 	 Flash is set to "Auto" by default for camera.\n 	1	1
665	3	 tap the video icon to enable video mode\n 	 It should go from still camera to video mode.\n 	1	1
666	4	 Look at the flash icon at the top of the screen. \n 	 Should be "Off" by default for video.\n 	1	1
669	1	 Launch the Camera app.\n 	  	1	1
670	2	 Take a photo.\n 	 Verify there is a 1/2 a second pause when taking a photo then returns to live camera.\n 	1	1
673	1	 Launch camera app\n 	  	1	1
674	2	 Select video toggle\n 	  	1	1
675	3	 Start video\n 	  	1	1
676	4	 Select the stop video button\n 	 video should be added to the collect, there should be a video with the play option so that you can review the video.\n 	1	1
679	1	 Launch the Camera app.\n 	  	1	1
680	2	 Tap the video toggle button.\n 	 Verify the video function loads in the Camera app.\n 	1	1
681	3	 Tap on the record button to start recording.\n 	 Verify that the record button changes to a stop symbol. Verify that the elapsed recording time is displayed in the UI.\n 	1	1
684	1	 Launch camera app\n 	  	1	1
685	2	 Take a picture.\n 	  	1	1
686	3	 Change from orientation (landscape to portrait or vice versa)\n 	  	1	1
687	4	 Take a picture\n 	 verify that both pictures are the same resolution AxB\n 	1	1
690	1	 Tap the front/back camera hud once.\n 	 Preview switches to front camera.  \n 	1	1
691	2	 Take a picture.\n 	 Picture is taken from front camera and saved to gallery.\n 	1	1
692	3	 Tap the front/back camera hud a second time.\n 	 Preview switches to back camera.\n 	1	1
693	4	 Take a picture.\n 	 Picture is taken from back camera and saved to gallery.\n 	1	1
696	1	 Launch the Gallery app.\n 	 Verify the thumbnail view of the photos is viewable.\n 	1	1
697	2	 Tap on the camera icon at the bottom of the screen in the tool bar.\n 	 Verify the camera is invoked in preview view.\n 	1	1
698	3	 Take  picture with the Camera.\n 	 Verify the user is not returned to the  gallery app after taking a picture.\n 	1	1
701	1	 Lock the device by tapping the power button.\n 	  	1	1
702	2	 Unlock the Device by tapping the power button.\n 	  	1	1
703	3	 Slide the slider to the left, toward the camera icon.\n 	 The camera is invoked.\n 	1	1
704	4	 Take a picture, clicking the camera shutter icon.\n 	 The picture is rendered briefly in fullscreen view, and then saved to gallery.\n 	1	1
705	5	 Repeat with passcode enabled\n 	  	1	1
708	1	 Take a picture.   Tap the thumbnail to view the picture full size, and then pinch-zoom out.\n 	 The image pinch-zooms out.\n 	1	1
711	1	 Take a picture.   Tap the thumbnail to view the picture full size, and then pinch-zoom in.\n 	 The image pinch-zooms in.\n 	1	1
714	1	 Open the Camera App.\n 	 The camera app opens and you receive a geolocation prompt asking you if you want to share your location.\n 	1	1
715	2	 Click the camera "shutter" button.\n 	 Picture is taken.  Picture is saved to gallery.  Camera returns control to "preview" view.\n 	1	1
716	3	 Click the thumbnail for the photo just taken.\n 	 Photo is restored to large (full screen) view.\n 	1	1
717	4	 Repeat step 1, taking a series of pictures in both portrait and landscape mode.\n 	 Pictures should be saved to gallery, and after each picture is taken camera should return to preview mode.\n 	1	1
720	1	 Open the Gallery app to the Thumbnail Photo View\n 	 All the photos and captured videos are displayed in a thumbnail grid view. If the grid is larger then the screen it can be scrolled to view all the thumbnails\n 	1	1
723	1	 Set your phone to Arabic  \n 	  	1	1
724	2	 Click on the Gallery app with a few pictures inside  \n 	  	1	1
725	3	 Select one photo, and click the share icon  \n 	  	1	1
726	4	 Observe the share view\n 	 4.1.Title and texts within list items should be right-aligned with any Arabic labels reading right to left. \n4.2.Share icons should be right-aligned and displayed at right side of texts, but should not be mirrored. \n4.3.Text with Cancel button should be center-aligned and read right to left.\n4.4.Nothing should overlap. The UI should not appear broken in any way.\n 	1	1
1049	1	 Open a photo\n 	 The photo is opened in the Single Photo View\n 	1	1
729	1	 With no SD card in the device open the Gallery app\n 	 A warning is displayed informing the user that an SD card is required for the app to work\n 	1	1
732	1	 Set your phone to Arabic  \n 	  	1	1
733	2	 Click on the Gallery app with a few pictures inside  \n 	  	1	1
734	3	 Select one photo, and click the edit icon  \n 	  	1	1
735	4	 Observe the edit mode view\n 	 These controls should remain the same position with that in LTR languages, and text should be read right to left. Nothing should overlap. The UI should not appear broken in any way.\n 	1	1
738	1	 With no photos on the device open the Gallery app\n 	 Information about how to add content is displayed when there is no content to be displayed\n 	1	1
741	1	 Open the gallery app.\n 	  	1	1
742	2	 Tap on the attached photo to view it full screen.\n 	 The image is shown correctly when viewed in full screen mode.\n 	1	1
743	3	 Tap on the "Share" icon.\n 	 The user is presented with the options E-mail, Wallpaper, Messages and Bluetooth transfer.\n 	1	1
744	4	 Share the attached .jpg image to another device using all the available options.\n 	 The image is shared properly without issue.\n 	1	1
745	5	 Repeat steps 1 through 4 covering all the supported image files.\n 	 All supported image types can be shared through Email, Wallpaper, Messages and Bluetooth without issue. \n 	1	1
748	1	 Open the Camera app.\n 	  	1	1
749	2	 Take multiple photos. \n 	  	1	1
750	3	 Select the Preview icon.\n 	  	1	1
751	4	 Zoom in on the photo, and pan the screen left and right.\n 	 The zoomed photo moves around on the screen. The screen is not swiped to the next photo.\n 	1	1
752	5	 Press the Home button, and open the Gallery app.\n 	  	1	1
753	6	 Select any photo.\n 	  	1	1
754	7	 Zoom in on the photo, and pan the screen left and right.\n 	 The zoomed photo moves around on the screen. The screen is not swiped to the next photo.\n 	1	1
757	1	 Launch Gallery\n 	 Verify there are 10 videos and 7 pictures\n 	1	1
758	2	 Switch to Camera app\n 	 Verify Grid Lines are enabled\n 	1	1
761	1	 Launch the Gallery app. \n 	  	1	1
762	2	 While new pictures are still being scanned press the home button to return to homescreen. \n 	  	1	1
763	3	 Long press home button on homescreen to open task manager.\n 	 Gallery should not appear in task manager. If no other apps were open during step 3, "No Recent Apps" should be displayed.\n 	1	1
764	4	 Open the gallery app again.\n 	 The gallery app should resume scanning for pictures. \n 	1	1
767	1	 Launch Gallery App\n 	 Gallery App launches and thumbnails of collection are shown.\n 	1	1
768	2	 Depress Power Button and Volume Down\n 	 Screenshot is taken and is populated in gallery.\n 	1	1
769	3	 Tap on a picture's thumbnail.\n 	 Picture is shown in large mode with 5 options beneath it.\n 	1	1
770	4	 Return to homescreen and Depress Power Button and Volume Down button\n 	 Screenshot is taken and user is given a notification\n 	1	1
771	5	 Tap Notification\n 	 User is shown Preview mode.\n 	1	1
774	1	 Receive a MMS which includes an attached image/audio media file on the DUT. \n 	 MMS is received successfully. \n 	1	1
775	2	 View the MMS, tap the media file to view and select save. \n 	 The file is saved onto the device. \n 	1	1
776	3	 Tap the "Home" button on the phone. \n 	  	1	1
777	4	 Open the "Messaging" app and tap on the received MMS again. \n 	 The user is not prompted an error message. \n 	1	1
780	1	 Open camera app.\n 	  	1	1
781	2	 Switch to the Front Camera.\n 	  	1	1
782	3	 Keep the device in Landscape mode and take a snapshot\n 	  	1	1
783	4	 Check the thumbnail of the captured photo.\n 	 Thumbnail matches the captured picture.\n 	1	1
784	5	 Open the gallery app and check the preview of the captured image.\n 	 Preview should match the captured photo.\n 	1	1
787	1	 Open the Camera app.\n 	  	1	1
788	2	 Take multiple photos. \n 	  	1	1
789	3	 Select the Preview icon.\n 	  	1	1
790	4	 Swipe through the photos left and right.\n 	 The photos change with a smooth transition animation.\n 	1	1
791	5	 Press the Home button, and open the Gallery app.\n 	  	1	1
792	6	 Select any photo.\n 	  	1	1
793	7	 Swipe through the photos left and right.\n 	 The photos change smoothly with a  transition animation.\n 	1	1
796	1	 Flash boot, system and userdata image to 256MB configuration device. (Please make sure that you are flashing userdata partition. This will force gallery app to scan and load all images from sdcard. You will not see varying mem usage without this step.)\n 	  	1	1
797	2	 Put 1000 images and 100 videos on sdcard.\n 	  	1	1
798	3	 Put the sdcard in device and start the gallery app.\n 	  	1	1
799	4	 Run |reset &&  while true; do adb shell b2g-procrank ;  done| on bash shell \n 	 You will see Gallery app memory usage is varying a lot while it takes > 1min to scan all images 1st time.\n 	1	1
800	5	 Keep scrolling the Gallery app while it is scanning images.\n 	 The Gallery app functions properly without crashing. \n 	1	1
803	1	 Pair the DUT with two other Bluetooth devices. \n 	  	1	1
804	2	 Have one of the paired devices send a large file such as a video or song to the DUT using Bluetooth. \n 	  	1	1
805	3	 Accept the transfer request on the DUT. \n 	 The file begins transferring over to the DUT. \n 	1	1
806	4	 While the file is transferring, have the DUT send a file to the other paired Bluetooth device. \n 	  	1	1
807	5	 After the large file from step 2 has been successfully received on the DUT.\n 	 The other paired Bluetooth device receive the transfer request from step 4.\n 	1	1
808	6	 Accept the transfer request on the target Bluetooth device. \n 	 The file begins transferring over to the target device. \n 	1	1
809	7	 After the file has been sent, check the file on the targeted device. \n 	 The file transferred over properly without issue. \n 	1	1
812	1	 Flash a new build on device. \n 	  	1	1
813	2	 Open contact app.\n 	  	1	1
814	3	 Click on "+" icon to add a new contact.\n 	  	1	1
815	4	 Take pic from camera and save this new contact. You will see list of contacts after saving contact with pic.\n 	  	1	1
816	5	 Repeat step (2) and (3) quickly. \n 	 The contact app does not OOM forced closed. \n 	1	1
817	6	 Repeat step (2), (3) and (4) for 2-3 times.\n 	 Contact app functions as expected without a memory leak occurring. \n 	1	1
820	1	 Import and play a HD resolution(720p) video clip.\n 	  	1	1
821	2	 Rotate the device between the landscape and portrait view multiple times while the video is playing.\n 	 Verify the video plays correctly in both portrait and landscape without issue. No abnormalities with the video are seen such as flickering.\n 	1	1
822	3	 Try step 2 using multiple videos with different resolutions. \n 	  	1	1
825	1	 Enter the Gallery app and select a picture to edit.\n 	  	1	1
826	2	 Press the edit button and select ""Auto Enhance On"".\n 	  	1	1
827	3	 Press the done button.\n 	  	1	1
828	4	 Press the camera button in the bottom of the screen on the left.\n 	 The camera viewfinder is displayed as normal.\n 	1	1
831	1	 Enable "USB Storage" in settings. \n 	  	1	1
832	2	 Plug the phone into the computer. \n 	  	1	1
833	3	 Tap on the "Gallery" icon to open the gallery app. \n 	  	1	1
834	4	 Check the strings "Memory card in use. Unplug the phone to use this app."\n 	 All strings are translated properly without truncation. \n 	1	1
837	1	 Ensure the phone's SD card does not have any photos or videos saved on it. \n 	  	1	1
838	2	 Tap on the "Gallery" icon to open the gallery app. . \n 	  	1	1
839	3	 Check all the strings on the "No photos or videos" page. \n 	 All strings are translated properly without truncation. \n 	1	1
842	1	 Insert a SD Card into the phone that is completely full. \n 	  	1	1
843	2	 Tap on the "Gallery" icon to open the gallery app. \n 	  	1	1
844	3	 Tap on a photo and then tap on the "Edit" icon at the bottom. \n 	  	1	1
845	4	 Check the string "Can not edit photos. Memory card is full". \n 	 The string is translated properly without truncation. \n 	1	1
848	1	 Tap on the "Gallery" icon to open the gallery app. \n 	  	1	1
849	2	 Tap on the "dotted box" icon to enter edit mode. \n 	  	1	1
850	3	 Tap on the one picture to select it and then tap on the "Trashcan" icon. \n 	  	1	1
851	4	 Check all strings on the "Delete selected item?" page. \n 	 All strings are translated properly without truncation. \n 	1	1
852	5	 Tap on "Cancel".\n 	  	1	1
853	6	 Tap on multiple pictures to select them and then tap on the "Trashcan" icon. \n 	  	1	1
854	7	 Check all the strings on the "Delete (3) items?" page. \n 	 All strings are translated properly without truncation. \n 	1	1
857	1	 Tap on the "Gallery" icon to open the gallery app. \n 	  	1	1
858	2	 Tap on the "dotted box" icon to enter edit mode. \n 	  	1	1
859	3	 Tap on one picture to select it and then tap the "Share"" icon. \n 	  	1	1
860	4	 Check all the strings on the "Sharing" options page. \n 	 All strings are translated properly without truncation.\n 	1	1
861	5	 Tap "Cancel" and then tap on multiple pictures to select them. \n 	  	1	1
862	6	 Tap on the "Share" icon and check all the strings on the "Sharing" options page. \n 	 All strings are translated properly without truncation.\n 	1	1
865	1	 Tap on the "Gallery" icon to open the gallery app. \n 	  	1	1
866	2	 Tap on the "dotted box" icon to enter edit mode. \n 	  	1	1
867	3	 Check the header string "Select".\n 	 The string is translated properly without truncation. \n 	1	1
868	4	 Tap on multiple pictures and check the header string "Number selected". \n 	 The string is translated properly without truncation. \n 	1	1
871	1	 Tap on the "Gallery" icon to open the gallery app. \n 	  	1	1
872	2	 Tap on a picture. \n 	  	1	1
873	3	 Tap on the "Edit" icon at the bottom of the screen. \n 	  	1	1
874	4	 Check all the strings on the "Edit" page. \n 	 All strings are translated properly without truncation. \n 	1	1
877	1	 Tap on the "Gallery" icon to open the gallery app. \n 	  	1	1
878	2	 Tap on a photo to view it. \n 	  	1	1
879	3	 Tap on the "Trashcan" icon at the bottom of the screen. \n 	  	1	1
880	4	 Check all the strings on the "Delete photo?" page. \n 	 All strings are translated properly without truncation. \n 	1	1
883	1	 Open Gallery app.\n 	 Gallery app can be launched.\n 	1	1
884	2	 Check the photos and videos.\n 	 There are the photos and videos (see prerequisite-3) in Gallery.\n 	1	1
885	3	 Take 10 photos and 5 videos.\n 	 It could take the photos and videos properly without any problem.\n 	1	1
886	4	 Edit 3 pictures and save them in Gallery.\n 	 The photos could be edited and save properly.\n 	1	1
887	5	 Run #8952 - [OTA] Install OTA update package.\n 	 Pass #8952.\n 	1	1
888	6	 Open Gallery app.\n 	 Gallery app can be launched.\n 	1	1
889	7	 Check the photos and videos.\n 	 There are still the photos and videos (see prerequisite-3) in Gallery. The edited photos still also exist in Gallery.\n 	1	1
892	1	 Tap on the "Gallery" icon to open the gallery app. \n 	  	1	1
893	2	 Tap on a picture to view it. \n 	  	1	1
894	3	 Tap on the "i" icon to view more information about the picture. \n 	  	1	1
895	4	 Check all strings on the "Image Information" page. \n 	 All strings are translated properly without truncation. \n 	1	1
896	5	 Tap on "Close", back out and select a "Video". \n 	  	1	1
897	6	 Tap on the "i" icon to view more information on the video. \n 	  	1	1
898	7	 Check all strings on the "Video Information" page. \n 	 All strings are translated properly without truncation. \n 	1	1
901	1	 Open the camera app and take a photo.\n 	 The Camera app opens and you are able to successfully take a photo.\n 	1	1
902	2	 Open the gallery app and find the photo that you took in Step 1.\n 	 The photo you took in Step 1 is displayed in the Gallery app.\n 	1	1
903	3	 Select the icon at the bottom of the screen that is next to the trash can icon.\n 	 A screen opens showing the image name, size, image type, date taken and resolution.\n 	1	1
906	1	 Make sure the phone has several photos and videos saved on the SD card. The user should have content that covers all the months of the year.  \n 	  	1	1
907	2	 Tap on the "Gallery" icon to open the gallery app. \n 	  	1	1
908	3	 Check all the dates above the gallery content. \n 	 All dates are translated properly without truncation. \n 	1	1
911	1	 Select the Edit option. \n 	  	1	1
912	2	 Select the magic wand.\n 	 The text at the bottom of the screen changes to "Auto-enhance on" and the picture adjusts slightly (relative to color balance).\n 	1	1
913	3	 Select the "Save" button.\n 	 The picture is saved with the auto enhancement features preserved.\n"New Copy Save" caption appears below briefly and then disappears.\n 	1	1
914	4	 Repeat Steps 1 and 2.\n 	  	1	1
915	5	 Select the magic wand again.\n 	 The text at the bottom of the screen changes to "Auto-enhance off" and the picture returns to its original state.\n 	1	1
918	1	 It is recommended for this testing to start with a clean SD card.\n 	  	1	1
919	2	 Take six or more pictures with the camera at the same time.\n 	 Photos are taken and are available to be seen in the gallery.\n 	1	1
920	3	 Open the gallery app.\n 	 Since you have taken six or more pictures within a single month, the month will create its own section. For example, if you are taking the pictures in December 2013, that label will be shown in the UI and the six pictures will be shown in grid format below the label.\n 	1	1
923	1	 It is recommended for this testing to start with a clean SD card and to have pictures taken from different months available to be imported to the SD card.\n 	  	1	1
924	2	 Take three pictures with the camera at the same time.\n 	 Photos are taken and are available to be seen in the gallery.\n 	1	1
925	3	 Turn on the USB Mass Storage option and import 2-3 pictures from different months within the same year.\n 	 Photos are imported and are available to be seen in the gallery.\n 	1	1
926	4	 Open the gallery app.\n 	 Since the user has not taken at least six pictures within a single month but within a range of months, the pictures will be lumped within a single section and the title will reflect the span of time. An example label might be: June - July 2013.\n 	1	1
929	1	 It is recommended for this testing to start with a clean SD card and to have pictures taken from different months and different years available to be imported to the SD card.\n 	  	1	1
930	2	 Take at least 3 pictures with the camera at the same time.\n 	 Photos are taken and are available to be seen in the gallery.\n 	1	1
931	3	 Turn on the USB Mass Storage option and import 4-6 pictures from different months and different years. \n 	 Photos are imported and are available to be seen in the gallery.\n 	1	1
932	4	 Open the gallery app.\n 	 Since the user has taken at least six pictures spanning more than one year, first and last month and relevant years will be displayed. A sample label might be: December 2012 - December 2013 if you had taken pictures during the period from December, 2012 up until December, 2013.\n 	1	1
935	1	 Launch Gallery app in landscape mode.\n 	 Gallery launched with thumbnails on the left pane, the photo on the top-left corner shown in preview pane.\n"Gallery" shown above thumbnails, "camera" & "select" button below it.\n 	1	1
936	2	 Swipe photo in the preview pane to the left in landscape mode.\n 	 The highlight in thumbnail also changed to the one currently in the preview pane.\n 	1	1
937	3	 Rotate the tablet for couple times, then rotate back to landscape mode.\n 	 The photo shown in landscape mode should be the same as in portrait mode.\n 	1	1
938	4	 Tap 1 photo to enter full screen mode.\n 	 With 5 buttons on the tool bar above. Make sure the 2nd to the left ("Play Slideshow") is there.\n 	1	1
939	5	 Tap the "Slideshow" button.\n 	 Slideshow starts, time to show a photo is ?? sec, transition effect shown as ??.\n 	1	1
940	6	 Press "Power" button to turn off screen, press it again to bring screen back. Switch to another app, and switch it back to "Gallery".\n 	 Slideshow continues to play.\n 	1	1
941	7	 While slideshow playing, tap anywhere on the screen to stop. (In landscape mode and in portrait mode)\n 	 Slideshow stops, toolbar shown.\n 	1	1
944	1	 Open the Browser App. \n 	  	1	1
945	2	 Tap on the URL bar. Type and go to the address: http://robnyman.github.com/Firefox-OS-Boilerplate-App/\n 	  	1	1
946	3	 Select "Pick image"\n 	  	1	1
947	4	 Select "Gallery"\n 	  	1	1
948	5	 Select a picture\n 	 Selected image is loaded onto the website. If the photo loads slowly, the user is shown a loading/spinner icon.\n 	1	1
951	1	 Launch Gallery app in landscape mode.\n 	 Gallery launched with thumbnails on the left pane, the photo on the top-left corner shown in preview pane.\n"Gallery" shown above thumbnails, "camera" & "select" button below it.\n 	1	1
952	2	 Tap the "select" button, select one photo from thumbnail, deselect it.\nSelect more than 1 photo, rotate the tablet to portrait mode, and back to landscape mode.\n(repeat this for more than 1 time)\n 	 When 1 photo is selected, count shown above thumbnail, selected photo shown in preview pane.\nWhen more than 1 photo are selected, count shown above thumbnail, last selected photo shown in preview pane.\nWhen rotating the tablet to portrait mode, the count and the selection should be no change. \n 	1	1
953	3	 With more than 1 photo selected, tap the "Share" button. \nPress "Power" button to turn off screen, press it again to bring screen back. Switch to another app, and switch it back to "Gallery".\n 	 List of action shown and "Gallery" apps should be in the same state before and after pressing power button, or switching between another app.\n 	1	1
954	4	 Try to send via E-mail or Bluetooth.\n 	 Photos can be opened on recipient's device.\n 	1	1
955	5	 With more than 1 photo selected, tap the "Delete" button.\n 	 Selected photos deleted and thumbnail refreshed.\n 	1	1
958	1	 Open the Gallery App\n 	 Photos that are stored on both the SD card and the phone's internal memory are displayed\n 	1	1
959	2	 Remove the SD card from the device\n 	 Gallery's picture list updates to removed all photos stored on the SD card \n 	1	1
962	1	 On the phone home screen, tap on the Gallery icon.\n 	 The Gallery app launches, scans the SD Card for images and rearranges the thumbnails in portrait mode (normal mode)\n 	1	1
963	2	 In Portrait mode, tap on the high-resolution image.\n 	 Full screen  high-resolution image is seen.\n 	1	1
964	3	 Tap on the share icon.\n 	 The Share feature  opens with options such as E-Mail, Wallpaper, Messages and Bluetooth Transfer.\n 	1	1
965	4	 Select Wallpaper option.\n 	 User is prompted with "Cancel" and "Set as wallpaper" buttons at the bottom of the screen.\n 	1	1
966	5	 Tap on the Set as wallpaper button.\n 	 The user is taken back to the gallery\n 	1	1
967	6	 Tap on the  Home button on the device.\n 	 The phone home screen is displayed with the new wallpaper created from the high-resolution image.\n 	1	1
968	7	 Go to  Gallery app.\n 	 The Gallery app launches and displays thumbnails in the portrait mode only.\n 	1	1
969	8	 Repeat steps 2-5 with the gallery thumbnail  on landscape mode.\n 	 The user is able to set the wallpaper from a landscape mode. The quality of the wallpaper set is same as the portrait mode. \n 	1	1
972	1	 On the B2G phone Home screen, tap on the Gallery icon.\n 	 The Gallery app launches.\n 	1	1
973	2	 Wait for the Gallery app to create thumbnails for all the images on the SD Card.\n 	 The process of creating thumbnails should complete smoothly. It should not be affected by the presence of the blank or empty image file.\n 	1	1
976	1	 Clear all image and media from the SD card\n 	 Should be able to delete all media from SD card\n 	1	1
977	2	 Kill all apps\n 	 Should be able to Kill all the apps.\n 	1	1
978	3	 Plug in USB cable and then Load the gallery app \n 	 Should able to access the gallery app with  empty content.\n 	1	1
979	4	 Also open the camera, music and video apps\n 	 All of them should be accessible and usable.\n 	1	1
982	1	 It is recommended for this testing to start with a clean SD card and have a variety of pictures with taken in different months and different years.\n 	  	1	1
983	2	 Take six or more pictures with the camera at the same time.\n 	 Photos are taken and are available to be seen in the gallery.\n 	1	1
984	3	 Turn on USB Mass storage and import a series of pictures that were taken on different months and different years.\n 	 Photos are imported and are available to be seen in the gallery.\n 	1	1
985	4	 Open the gallery app.\n 	 Pictures taken from Step 2 should show at the top of the UI, as they are the most recent. Pictures that were imported should show the relevant date or month or by grouped according to (1) Single Month, (2) Range of months within a year, and (3) Range of months over years.\n 	1	1
988	1	 Open the Gallery App\n 	 Image list is displayed\n 	1	1
989	2	 View the images in the Gallery\n 	 Only files that are saved on the device's internal storage are displayed\n 	1	1
992	1	 Send a photo from an extra device to a B2G device \n 	 Notification to receive file pops up\n 	1	1
993	2	 Press 'Transfer' when  receiving confirmation dialog pops up\n 	 File should be received\n 	1	1
994	3	 Send the same photo again\n 	 Notification to receive file pops up\n 	1	1
995	4	 Press 'Deny' when receiving confirmation dialog pops up\n 	 Transfer should be denied\n 	1	1
996	5	 Verify the file received in step 2 is not deleted (can use ADB to to check the file received)\n 	 Should be able to find the file on B2G device\n 	1	1
999	1	 Open the gallery app.\n 	  	1	1
1000	2	 Select each .png photo.\n 	 The only photos that will be displayed will be up to 5 megapixels.\n 	1	1
1003	1	 Open gallery app\n 	  	1	1
1004	2	 Select a picture \n 	  	1	1
1005	3	 Enter edit mode\n 	  	1	1
1006	4	 Rotate the device to landscape\n 	 Picture should be shown correctly, not reversal\n 	1	1
1009	1	 Open the Gallery app\n 	 The Gallery app is opened\n 	1	1
1010	2	 Select a photo and enter Edit Mode\n 	 An alert is displayed that there is not enough space left to enter Edit Mode\n 	1	1
1013	1	 Open a photo in the Gallery app Single Photo View\n 	 The photo is displayed in the Fullscreen Photo View\n 	1	1
1014	2	 Tap on the Back "<" button\n 	 The user is taken to the Thumbnail Photo View\n 	1	1
1017	1	 Open a photo in Fullscreen Photo View and zoom in using pinch zoom\n 	 The user can zoom the photo when in Single Photo View\n 	1	1
1018	2	 Double-tap on the photo\n 	 The photo is returned to the default zoom level\n 	1	1
1021	1	 Open a photo using the Gallery app in Single Photo View\n 	 The photo is opened in Fullscreen Photo View\n 	1	1
1022	2	 Pinch zoom-in\n 	 The user can zoom in using the pinch gesture\n 	1	1
1023	3	 Pan the photo around to see the areas that remained outside the viewport on zoom\n 	 The user can pan the zoomed image to see the areas that are outside of the viewport\n 	1	1
1026	1	 Open a video in Single Photo View\n 	 A thumbnail of the video is presented in Single Photo View\n 	1	1
1027	2	 Tap on the video thumbnail to start the video playback\n 	 The video playback is started when the user taps on the video thumbnail\n 	1	1
1030	1	 Open the Gallery app in Thumbnail Photo View\n 	 A grid of thumbnails of the available photos is displayed\n 	1	1
1031	2	 Tap the "Multiple Selection Mode" button\n 	 The Gallery app is switched to the Multi-select mode and the user can select multiple photos\n 	1	1
1034	1	 Open the Gallery app in Thumbnail Photo View\n 	 A grid of thumbnails of the available photos is displayed\n 	1	1
1035	2	 Tap the "Multiple Selection Mode" button\n 	 The Gallery app is switched to the Multi-select mode and the user can select multiple photos\n 	1	1
1036	3	 Tap on one of the photo thumbnails\n 	 The photo is selected and a blue border is displayed indicating that the photo is selected\n 	1	1
1037	4	 Tap on the selected photo again\n 	 The photo is deselected and the border is removed\n 	1	1
1040	1	 Open the Gallery app and go to Thumbnail Photo View\n 	 The photo thumbnails are displayed in a grid view\n 	1	1
1041	2	 Enter Multiple Selection Mode, select one of the photos and tap on the share button\n 	 A pop-up menu is displayed listing the available share options\n 	1	1
1042	3	 Select one of the options\n 	 The selected photo can be shared\n 	1	1
1045	1	 With the device in Portrait open a photo\n 	 The photo is opened in the Single Photo View\n 	1	1
1046	2	 Rotate the device from Portrait to landscape\n 	 The photo and toolbars resize to fit the screen size\n 	1	1
1050	2	 Tap the "Share" button and choose "Set as Wallpaper" \n 	 The current photo is set as wallpaper\n 	1	1
1053	1	 Launch the Gallery app.\n 	  	1	1
1054	2	 Tap on a photo in the Gallery.\n 	 Verify the image is displayed.\n 	1	1
1055	3	 Tap on the Camera icon in the bottom toolbar to go to the Camera app.\n 	 Verify the Camera app is opened and ready to take a picture.\n 	1	1
1056	4	 Take a picture with the camera. \n 	  	1	1
1057	5	 Tap on the picture to view it. \n 	  	1	1
1058	6	 Tap on the "..."  icon and then tap on "Open Gallery". \n 	 Verify the user is returned to the Gallery app Grid View.\n 	1	1
1061	1	 Launch the Gallery app.\n 	  	1	1
1062	2	 Tap on a photo in the gallery.\n 	 Verify the image is displayed in single photo view.\n 	1	1
1063	3	 Tap on the Camera button to go to the Camera app.\n 	 Verify the Camera app is opened and ready to take a picture.\n 	1	1
1064	4	 Take a picture.\n 	 Verify the user can take a picture using the Camera App.\n 	1	1
1065	5	 Tap on the option icon on top right, and select Open Gallery App button to go back to the Gallery app.\n 	 Verify the user is returned to the Gallery app Grid View and the top position in the grid is the new picture.\n 	1	1
1068	1	 Launch the Gallery app.\n 	  	1	1
1069	2	 Open a photo by tapping on it.\n 	 Verify the photo is displayed in Single Photo View.\n 	1	1
1070	3	 Tap on the "Photo Edit" button which appears as a pencil in a rectangle.\n 	 Verify the photo is opened in Photo Edit View.\n 	1	1
1073	1	 Open the Gallery app.\n 	 You should get a prompt to the effect that:  "You cannot use gallery when USB Mass Storage mode is enabled.  Please turn it off and launch gallery again."\n 	1	1
1076	1	 Unplug the device.\n 	  	1	1
1077	2	 Open the Gallery app.\n 	 Gallery app scans and notices any removed content.  The recently removed pictures no longer show up in gallery, and cannot be browsed, perused or edited in any view. \n 	1	1
1080	1	 Unplug the deivce.\n 	  	1	1
1081	2	 Open the Gallery app.\n 	 Gallery app scans for the new content.  The recently added pictures show up in gallery view and can be browsed, edited and viewed on the device as the other pictures.\n 	1	1
1084	1	 Click on a thumbnail photo in the gallery to enlarge it.\n 	 The photo appears in "large" mode, with toolbar (5 icons) below the photo view.\n 	1	1
1085	2	 Rotate the phone 90 degrees\n 	 The photo appears in landscape mode\n 	1	1
1086	3	 Tap on the photo\n 	 The photo appears in full screen mode\n 	1	1
1087	4	 Rotate the phone back 90 degrees\n 	 The photo appears in portrait mode\n 	1	1
1088	5	 Tap on the photo\n 	 The photo appears in "large" mode, with toolbar (5 icons) below the photo view.\n 	1	1
1091	1	 Open the video app.\n 	  	1	1
1092	2	 Select recently recorded video.\n 	 Video should play back.  There should be visuals with no gap.  There should be continuous sound in sync with the video, also with no gaps.\n 	1	1
1095	1	 Launch the Gallery app.\n 	  	1	1
1096	2	 Tap on a photo in the gallery.\n 	 Verify the user is taken to a large version of the photo with options available at the bottom of the screen.\n 	1	1
1097	3	 Tap on the Edit button which appears as a pencil at the bottom of the screen.\n 	 Verify the user is now in Edit mode.\n 	1	1
1098	4	 Use any of the available edit options e.g. crop, border, exposure settings, etc. then save the photo.\n 	 Verify the original photo still exists and a new one with the changes is created and available in the gallery.\n 	1	1
1101	1	 Launch the Gallery app.\n 	 Verify that all the photos are shown on the device.\n 	1	1
1102	2	 Tap on a photo to view a large image  and tap the Share button at the bottom of the screen.\n 	 Verify a list of share options appear for the photo.\n 	1	1
1103	3	 Tap on the email option.\n 	 Verify the Email app is launched.  \n 	1	1
1104	4	 Add a recipient, subject and click Send.\n 	 Verify the message with the image is sent successfully.\n 	1	1
1107	1	 Open the Gallery app.\n 	  	1	1
1108	2	 Tap on the Outline icon. (the dotted line icon)\n 	  	1	1
1109	3	 Select more than one photo.\n 	  	1	1
1110	4	 Click on the Share icon in the bottom right.\n 	  	1	1
1111	5	 Complete the e-mail and click the send icon.\n 	 The e-mail will be sent and the recipient will get all photos attached.\n 	1	1
1114	1	 Open Gallery App\n 	  	1	1
1115	2	 Tap on any photo.\n 	 Photo is opened in full screen mode. \n 	1	1
1116	3	 Tap "share picture" button icon\n 	 A prompt is shown which requests way of sharing (email in this case) or allows the user the cancel the operation. \n 	1	1
1117	4	 Select "Twitter".\n 	 Twitter app  is launched. User is prompted for credentials (if so configured) and message text.\n 	1	1
1118	5	 Enter any text in the message field and select the "Tweet" button\n 	 Tweet is sent w/ image\n 	1	1
1121	1	 Launch the Gallery app.\n 	  	1	1
1122	2	 Tap on a photo in the gallery.\n 	 Verify the user is taken to a large version of the photo with options available at the bottom of the screen.\n 	1	1
1123	3	 Tap on the Edit button which appears as a pencil at the bottom of the screen.\n 	 Verify the user is now in Edit mode.\n 	1	1
1124	4	 Tap the X in the upper left hand corner of the screen to exit Edit mode.\n 	 The user is returned to the view photo screen for the current picture.\n 	1	1
1127	1	 Launch the Gallery app.\n 	 Verify the thumbnail view of the photos is viewable.\n 	1	1
1128	2	 Tap on the camera icon at the bottom of the screen in the tool bar.\n 	 Verify the camera is invoked in preview view.\n 	1	1
1129	3	 Take  picture with the Camera.\n 	 Verify the user is not returned to the  gallery app after taking a picture.\n 	1	1
1132	1	 Launch the Gallery app.\n 	 Verify that photos exist.\n 	1	1
1133	2	 Tap on a single photo.\n 	 Verify the photo is viewable in full screen view now.\n 	1	1
1134	3	 Pinch out with your fingers.\n 	 Verify the photo zooms in.\n 	1	1
1135	4	 Drag the picture around on the screen.\n 	 Verify the visible area of the picture changes.\n 	1	1
1136	5	 Pinch in with your fingers.\n 	 Verify the photo zooms out.\n 	1	1
1139	1	 Navigate to the Home screen by tapping the Home button on the device.\n 	  	1	1
1140	2	 Tap and hold on the background.\n 	 Verify that the different options for accessing wallpapers appears.\n 	1	1
1141	3	 Select the 'Wallpapers' option.\n 	 Verify that the user now sees the devices default wallpaper in a grid style layout.\n 	1	1
1142	4	 Tap on an image to select it.\n 	 Verify the user is able to select wallpaper from wallpapers gallery and that the wallpaper is applied correctly.\n 	1	1
1145	1	 From the home screen  press and hold background and select image gallery option.\n 	 Gallery opens.\n 	1	1
1146	2	 Select an image and edit image by pinching to scale.\n 	 Able to edit image scale.\n 	1	1
1147	3	 Edit image by dragging to re-position.\n 	 Able to edit image position.\n 	1	1
1148	4	 Edit image and view preview.\n 	 Image preview overlay shows final cropping.\n 	1	1
1149	5	 Edit image and select for wallpaper.\n 	 Able to adjust wallpaper.\n 	1	1
1152	1	 From the home screen press and hold background. \n 	  	1	1
1153	2	 Select Gallery option and select a photo taken from the Camera.\n 	 Able to select wallpaper from camera photos gallery, wallpaper is applied correctly.\n 	1	1
1156	1	 Open the Gallery app.\n 	  	1	1
1157	2	 Select a photo.\n 	  	1	1
1158	3	 At the bottom tap on the Edit Icon. (The picture with a pencil)\n 	  	1	1
1159	4	 Tap on the "Effects" tab.\n 	  	1	1
1160	5	 Select the "Sepia" effect.\n 	 The photo will change color.\n 	1	1
1163	1	 Open the gallery from the home screen and enter into edit mode. Select Effects => B&W\n 	 Photo is changed to B&W.\n 	1	1
1164	2	 Save the photo.\n 	 Photo is shown, as saved in Thumbnails.  (On restart, photo as saved is also in thumbnails).\n 	1	1
1165	3	 Select Effects => Sepia\n 	 Photo is changed to Sepia.\n 	1	1
1166	4	 Save the photo.\n 	 Photo is shown, as saved in Thumbnails.  (On restart, photo as saved is also in thumbnails).\n 	1	1
1169	1	 Click "Exposure" tab on the far left.\n 	 Exposure settings bar is shown.\n 	1	1
1170	2	 Toggle slider slightly to the left.\n 	 Number on slider decreases.  Picture generally becomes darker.  Bar is easily toggled.\n 	1	1
1171	3	 Toggle slider slightly to the right.\n 	 Number on slider increases.  Picture generally becomes brighter.\n 	1	1
1174	1	 Select the Crop option\n 	  	1	1
1175	2	 Select the Freeform crop option [the option chosen as default]\n 	  	1	1
1176	3	 Click any border or corner, drag and release it to crop the photo in any way\n 	 Area of photo is cropped and represented in the view\n 	1	1
1177	4	 Tap the Done button in the top right corner\n 	 Photo is saved and appears in thumbnails immediately.  It also appears in gallery e.g. after reboot.\n 	1	1
1180	1	 Select the Crop option. \n 	  	1	1
1181	2	 Select the Portrait option [the second option labeled "2:3"]\n 	 Area of photo is cropped and represented in the view.\n 	1	1
1182	3	 Click the "save" button (top right checkmark in edit mode). \n 	 Photo is saved and appears in thumbnails immediately. It also appears in gallery e.g. after reboot.\n 	1	1
1185	1	 Open the Gallery app.\n 	  	1	1
1186	2	 Rotate the phone to Landscape mode.\n 	  	1	1
1187	3	 Select a picture in the gallery.\n 	  	1	1
1188	4	 Tap on the edit icon.(The picture with a pencil)\n 	  	1	1
1189	5	 Select Crop in the bottom.\n 	 New option are available for cropping the picture.\n 	1	1
1192	1	 Open up the gallery and Select Crop => Square. Crop the photo. Click on Portrait or another edit mode.\n 	 Area of photo is cropped and represented in the view.\n 	1	1
1193	2	 Click the "save" button (top right checkmark in edit mode). \n 	 Photo is saved and appears in thumbnails immediately. It also appears in gallery e.g. after reboot.\n 	1	1
1196	1	 Open the gallery from the home screen.\n 	  	1	1
1197	2	 Select the edit button and click "Effects". Select "original".\n 	 Photo is view-able as original.\n 	1	1
1200	1	 Open the Gallery app and go to Thumbnail Photo View\n 	 The photo thumbnails are displayed in a grid view\n 	1	1
1201	2	 Enter Multiple Selection Mode, select multiple photos and tap on the share button\n 	 A pop-up menu is displayed listing the available share options\n 	1	1
1202	3	 Select one of the options\n 	 Depending on the selected option's limitations the user can share multiple photos\n 	1	1
1205	1	 Connect phone via USB to desktop machine or laptop.\n 	 Device appears on desktop like a USB thumbnail drive.  It is possible to access the 'Photos' directory.\n 	1	1
1208	1	 Open Gallery app\n 	  	1	1
1209	2	 Tap any picture to open it in a Single Photo View\n 	  	1	1
1210	3	 Click the camera icon \n 	 Camera is invoked, and is ready to take a picture.\n 	1	1
1213	1	 Launch the gallery app.\n 	 Verify all photos stored in SD card are displayed in the gallery.\n 	1	1
1216	1	 Launch  Gallery.\n 	  	1	1
1217	2	 Tap on a photo to make it full screen.\n 	 Photo is enlarged to full screen view.\n 	1	1
1218	3	 With your finger, swipe left on the photo.\n 	 Picture to the right is shown.\n 	1	1
1219	4	 With your finger, swipe right on the photo.\n 	 Previous picture (one to the left) is shown.  \n 	1	1
1222	1	 Open a photo in Single Photo View\n 	 The photo is opened in the Thumbnail Photo View\n 	1	1
1223	2	 Tap the "Delete" icon\n 	 User is prompted with a confirmation message\n 	1	1
1224	3	 Select "OK"\n 	 Photo is deleted\n 	1	1
1227	1	 Invoke select image mode  (invoke thumbnail view), click the square dotted lasso on the bottom right.\n 	 A screen called "select images" is invoked, with an X in the upper left.\n 	1	1
1228	2	 Tap three photos in succession.\n 	 Text on top changes to "3 Selected".  The three selected photos are shown as selected (red border around each).\n 	1	1
1229	3	 Click the trashcan icon.\n 	 System gives a prompt  "Delete 3 photos?"  [OK] [Cancel]\n 	1	1
1230	4	 Click [OK].\n 	 The three photos are deleted.  Thumbnail review is rearranged without the three photos. \n\nTBD:  If control returns to select mode, then text at top returns to "select images (no items are selected).  Otherwise control returns to thumbnail mode - no text at top of page.\n 	1	1
1233	1	 Open the Gallery app in Thumbnail Photo View\n 	 A grid with thumbnails of all photos on the device is displayed\n 	1	1
1234	2	 Tap on any photo in the Thumbnail Photo View\n 	 The photo is opened in Full Screen Photo View (Single Photo View)\n 	1	1
1237	1	 Launch the Contact App\n 	  	1	1
1238	2	 Select a Contact\n 	 The contact details page appears\n 	1	1
1239	3	 Click the Edit icon\n 	 Edit Contact page will open\n 	1	1
1240	4	 Click Add Picture\n 	 Select from menu is opened\n 	1	1
1241	5	 Select Gallery\n 	 Gallery App will be opened in Grid View\n 	1	1
1242	6	 Select a Photo\n 	 Crop Page will open to allow the editing of the photo\n 	1	1
1243	7	 Select Done button in the top right corner\n 	 The user is returned to the Contact's Edit Page with the photo shown in the Add Photo area\n 	1	1
1244	8	 Press Update to save the changes made to the contact\n 	 The user is returned to the contact details page and a part of the photo is shown just below the header\n 	1	1
1245	9	 Receive a call from the contact updated in steps 1-7\n 	 The Photo appears onscreen and is associated with the correct phone number\n 	1	1
1248	1	 Click the camera icon (bottom, leftmost).\n 	 Camera is invoked.  Camera is in state ready to take a picture.\n 	1	1
1251	1	 Open the Camera App.\n 	 The camera app opens and you receive a geolocation prompt asking you if you want to share your location.\n 	1	1
1252	2	 Click the camera "shutter" button.\n 	 Picture is taken.  Picture is saved to gallery.  Camera returns control to "preview" view.\n 	1	1
1253	3	 Click the thumbnail for the photo just taken.\n 	 Photo is restored to large (full screen) view.\n 	1	1
1254	4	 Repeat step 1, taking a series of pictures in both portrait and landscape mode.\n 	 Pictures should be saved to gallery, and after each picture is taken camera should return to preview mode.\n 	1	1
1259	1	 Insert a USIM card into the device. For example, a china unicom SIM.\n 	  	1	1
1260	2	 Power on the device. \n 	  	1	1
1261	3	 Tap on "Settings".\n 	  	1	1
1262	4	 Tap on "Call Settings". \n 	 Operator name is shown under the correct SIM slot. \n 	1	1
1263	5	 Tap the "Back arrow" and tap on "Cellular and Data". \n 	 Operator name is shown under the correct SIM slot. \n 	1	1
1264	6	 Tap on the SIM and look under "Carrier". \n 	 Operator name is shown properly. \n 	1	1
1265	7	 Back out to the main settings page and tap on "SIM manager". \n 	 Operator name is shown properly under the correct SIM slot in SIM manager. \n 	1	1
1268	1	 Insert an active roaming SIM in Slot 1 and an active GSM SIM in Slot 2\n 	  	1	1
1269	2	 Reset phone. \n 	  	1	1
1270	3	 Navigate to Settings > Cellular & Data > SIM 1 > Network Operator (ER1)\n 	  	1	1
1271	4	 Navigate to Settings > Cellular & Data > SIM 2 > Network Operator (ER2)\n 	  	1	1
1272	5	 Reset phone. \n 	  	1	1
1273	6	 Navigate to Settings > Cellular & Data > SIM 2 > Network Operator (ER3)\n 	  	1	1
1274	7	 Navigate to Settings > Cellular & Data > SIM 1 > Network Operator (ER4)\n 	 ER1 & ER4 - Network operator options displayed like roaming preferences for roaming. (e.g. 3G preferred)\nER2 & ER3 - Network operator options are displayed as Automatic Selection for GSM. (Automatic selection is switched on)\n 	1	1
1277	1	 Go to Settings > Call Settings > Select any available SIM card.\n 	  	1	1
1278	2	 Select 'Fixed dialing numbers'.\n 	  	1	1
1279	3	 Select the toggle.\n 	  	1	1
1280	4	 Enter SIM PIN2, and Select 'Done'.\n 	  	1	1
1281	5	 Select the Back arrow.\n 	  	1	1
1282	6	 Observe the user is returned to the 'Call Settings' screen.\n 	 All items are displayed properly, including 'Call waiting'."\n 	1	1
1285	1	 Go to settings > SIM manager > Outgoing calls > Always ask.\n 	  	1	1
1286	2	 Dial a phone number using any SIM card.\n 	  	1	1
1287	3	 Connect bluetooth headset, and double click button of bluetooth headset to dial\n 	 The last used SIM card will make a call to the last contact that was dialed on the phone. \n\nPlease note:\nIf the outgoing call SIM is set to anything else, we use that SIM and call the last-called contact with it.\n 	1	1
1289	1	 Insert a USIM card into the device. For example, a china unicom SIM.\n 	  	1	1
1290	2	 Power on the device. \n 	  	1	1
1291	3	 Tap on "Settings".\n 	  	1	1
1292	4	 Tap on "Call Settings". \n 	 Operator name is shown under the correct SIM slot. \n 	1	1
1293	5	 Tap the "Back arrow" and tap on "Cellular and Data". \n 	 Operator name is shown under the correct SIM slot. \n 	1	1
1294	6	 Tap on the SIM and look under "Carrier". \n 	 Operator name is shown properly. \n 	1	1
1295	7	 Back out to the main settings page and tap on "SIM manager". \n 	 Operator name is shown properly under the correct SIM slot in SIM manager. \n 	1	1
1297	1	 Insert an active roaming SIM in Slot 1 and an active GSM SIM in Slot 2\n 	  	1	1
1298	2	 Reset phone. \n 	  	1	1
1299	3	 Navigate to Settings > Cellular & Data > SIM 1 > Network Operator (ER1)\n 	  	1	1
1300	4	 Navigate to Settings > Cellular & Data > SIM 2 > Network Operator (ER2)\n 	  	1	1
1301	5	 Reset phone. \n 	  	1	1
1302	6	 Navigate to Settings > Cellular & Data > SIM 2 > Network Operator (ER3)\n 	  	1	1
1303	7	 Navigate to Settings > Cellular & Data > SIM 1 > Network Operator (ER4)\n 	 ER1 & ER4 - Network operator options displayed like roaming preferences for roaming. (e.g. 3G preferred)\nER2 & ER3 - Network operator options are displayed as Automatic Selection for GSM. (Automatic selection is switched on)\n 	1	1
1305	1	 Go to Settings > Call Settings > Select any available SIM card.\n 	  	1	1
1306	2	 Select 'Fixed dialing numbers'.\n 	  	1	1
1307	3	 Select the toggle.\n 	  	1	1
1308	4	 Enter SIM PIN2, and Select 'Done'.\n 	  	1	1
1309	5	 Select the Back arrow.\n 	  	1	1
1310	6	 Observe the user is returned to the 'Call Settings' screen.\n 	 All items are displayed properly, including 'Call waiting'."\n 	1	1
1312	1	 Go to settings > SIM manager > Outgoing calls > Always ask.\n 	  	1	1
1313	2	 Dial a phone number using any SIM card.\n 	  	1	1
1314	3	 Connect bluetooth headset, and double click button of bluetooth headset to dial\n 	 The last used SIM card will make a call to the last contact that was dialed on the phone. \n\nPlease note:\nIf the outgoing call SIM is set to anything else, we use that SIM and call the last-called contact with it.\n 	1	1
1317	1	<p>\r\n\tinput 2 digits (like 72) from keypad.</p>\r\n	<p>\r\n\tDialer app is launched.</p>\r\n<p>\r\n\tCheck the search result( contact name starts with 72, p2,q2,r2,s2 .... is highlighted. phone number starts with 72 is highlighted).</p>\r\n	1	1
\.


--
-- Data for Name: h5tl_tcversions; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_tcversions (id, tc_external_id, version, layout, status, summary, preconditions, importance, author_id, creation_ts, updater_id, modification_ts, active, is_open, execution_type, estimated_exec_duration) FROM stdin;
45	5	1	1	1	<p>\r\n\tCall Session Control Function</p>\r\n	<p>\r\n\tLTE network</p>\r\n	2	4	2015-08-03 03:12:34	4	2015-08-03 03:12:51	1	1	1	5.00
22	2	1	1	1	<p>\r\n\tMake sure user can zoom in and out a website on browser</p>\r\n	<p>\r\n\tEither WiFi or Data call is established</p>\r\n	3	4	2015-08-03 02:41:00	4	2015-08-03 03:14:35	1	1	1	5.00
17	1	1	1	1	<p>\r\n\tMake sure user can dial out a call and answered by another side</p>\r\n	<p>\r\n\tPrepare another DUT</p>\r\n	3	4	2015-08-03 02:38:15	4	2015-08-03 02:39:12	1	1	1	5.00
50	6	1	1	1	<p>\r\n\ttest</p>\r\n		2	4	2015-08-03 06:14:53	\N	\N	1	1	1	\N
52	7	1	1	1		<p>\r\n\tWifi environment with EAP-SIM/EAP-TTLS/EAP-PEAP/EAP-TLS enabled. Follow the steps in http://mzl.la/1w6Krqn.</p>\r\n	2	4	2015-08-03 07:16:21	4	2015-08-03 07:16:39	0	1	1	10.00
73	8	1	1	1			2	4	2015-08-11 09:53:01	\N	\N	1	1	1	\N
75	9	1	1	1			2	4	2015-08-11 09:55:05	\N	\N	1	1	1	\N
28	3	1	1	1		<p>\r\n\tWifi environment with EAP-SIM/EAP-TTLS/EAP-PEAP/EAP-TLS enabled. Follow the steps in http://mzl.la/1w6Krqn.</p>\r\n	2	4	2015-08-03 02:44:51	4	2015-08-03 02:45:51	1	1	1	10.00
77	10	1	1	1			2	4	2015-08-11 09:55:51	\N	\N	1	1	1	\N
79	11	1	1	1			2	4	2015-08-11 09:56:31	\N	\N	1	1	1	\N
81	12	1	1	1			2	4	2015-08-11 09:57:31	\N	\N	1	1	1	\N
83	13	1	1	1			2	4	2015-08-11 09:58:46	\N	\N	1	1	1	\N
88	1	1	1	1	<p>\r\n\tThe case is for the first way to launch Dialer app which is inputting a digit from keypad.</p>\r\n	<p>\r\n\t1. The feature phone is ready with SIM card.</p>\r\n	3	8	2015-08-17 02:19:24	8	2015-08-17 02:23:02	1	1	1	5.00
97	3	1	1	1	<p>\r\n\tThe case is testing for the way to exit Dialer app by clearing a digit.</p>\r\n	<p>\r\n\t1. The feature phone is ready with SIM card.</p>\r\n<p>\r\n\t2. Press a digit from keypad.</p>\r\n	3	8	2015-08-17 03:02:48	8	2015-08-17 03:04:14	1	1	1	5.00
35	4	1	1	1	<p>\r\n\tThis case is in order to measure the power consumption of Firefox OS while the sleep mode on/off.</p>\r\n	<p>\r\n\tYou need a power meter to run this case.</p>\r\n	1	4	2015-08-03 02:48:01	4	2015-08-03 02:49:40	1	1	1	30.00
100	4	1	1	1	<p>\r\n\tThe case is for testing the way to exit Dialer app - by clearing +#* and back to the homescreen.</p>\r\n	<p>\r\n\t1. The feature phone is ready with SIM card.</p>\r\n<p>\r\n\t2. Press + or # or * from the keypad.</p>\r\n	3	8	2015-08-17 03:06:07	8	2015-08-17 03:10:37	1	1	1	5.00
92	2	1	1	1	<p>\r\n\tThe case is testing for the second way to launch Dialer app by inputting +, #, * from keypad.</p>\r\n	<p>\r\n\t1. The feature phone is ready with SIM card.</p>\r\n	3	8	2015-08-17 02:50:58	8	2015-08-17 04:13:22	1	1	1	5.00
106	5	1	1	1	 <p class="description">\n        <p>Verify that all strings are translated into the locale you are testing. If you find an untranslated string, look at the same string in a pseudolocale (preferably Accented English). If the string appears in normal English, it is hard-coded and not\nlocalizable. File a bug under the "Firefox OS" component and add the keyword "l12y". If the string appears in a pseudolocale, then the localizer hasn't got to it yet. Please don't file a bug.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
113	6	1	1	1	 <p class="description">\n        <ul>\n<li>Media Specs: https://drive.google.com/file/d/0B6fkEC1pmwTid1d4R0JfZ2ZpQW8/view?usp=sharing  </li>\n<li>General UX Specs: https://mozilla.app.box.com/s/bcm3s5i2v6js5uk0ws3tsywse8bgncgo</li>\n</ul>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
118	7	1	1	1	 <p class="description">\n        <ul>\n<li>Media Specs: https://drive.google.com/file/d/0B6fkEC1pmwTid1d4R0JfZ2ZpQW8/view?usp=sharing  </li>\n<li>General UX Specs: https://mozilla.app.box.com/s/bcm3s5i2v6js5uk0ws3tsywse8bgncgo</li>\n</ul>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
125	8	1	1	1	 <p class="description">\n        <ul>\n<li>Media Specs: https://drive.google.com/file/d/0B6fkEC1pmwTid1d4R0JfZ2ZpQW8/view?usp=sharing  </li>\n<li>General UX Specs: https://mozilla.app.box.com/s/bcm3s5i2v6js5uk0ws3tsywse8bgncgo</li>\n</ul>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
133	9	1	1	1	 <p class="description">\n        <p>This test verifies the feature where the user can tap an area on the viewfinder to change focus to the tapped region.  (when using the back facing camera only)</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
143	10	1	1	1	 <p class="description">\n        <p>Verify the phone can detect presence of single or multiple faces and focus correctly</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
155	11	1	1	1	 <p class="description">\n        <p>Video recording should stop immediately when the user returns to the homescreen.</p>\n\n<p>Please see this issue:</p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=1051172</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
160	12	1	1	1	 <p class="description">\n        <p>Verify that the size and alignment of the viewfinder change accordingly with different aspect ratio.</p>\n\n<p>Please see this issue:</p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=974119</p>\n\n<p>Please see this attachment as well:</p>\n\n<p>https://bug974119.bugzilla.mozilla.org/attachment.cgi?id=8377823</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
166	13	1	1	1	 <p class="description">\n        <p>Ensure user is able to utilize Facial Recognition and the tap to focus features appropriately with the Camera App.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
174	14	1	1	1	 <p class="description">\n        <p>Verify that the user can return to the Home screen after recording a video file. </p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1050751</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
181	15	1	1	1	 <p class="description">\n        <p>The user can select the same camera resolution without issue. </p>\n\n<p>Prerequisite:\nCreate a custom build using these steps:</p>\n\n<ol>\n<li><p>Uncommenting out the commented-out sections of the following file will enable the picture-size and video-resolution menu options:\nhttps://github.com/mozilla-b2g/gaia/blob/master/apps/camera/js/config/config.js#L361</p></li>\n<li><p>Once you make the change locally, you'll need to re- |make install-gaia| to push the changes to your test device</p></li>\n</ol>\n\n<p>Please see this issue:</p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=1043705</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
186	16	1	1	1	 <p class="description">\n        <p>The flash does not go off until the shutter button is pressed when the flash mode is set to Auto and the camera is detecting a face.</p>\n\n<p>Pre-requisite: The testing is done in a low light environment, so the flash goes off when the picture is taken with the flash Auto mode.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1046115</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
192	17	1	1	1	 <p class="description">\n        <p>Camera viewfinder preview should be smooth when moving the phone around. </p>\n\n<p>Prerequisite: </p>\n\n<p>So in order to change the resolution to 480p, we need to build custom gaia.  The steps are following:</p>\n\n<p>clone the gaia repo, and change the following file:\ngo into gaia/master/apps/camera/js/config/config.js, open it with text editor</p>\n\n<p>Go to ‘exclude’ property where it lists ‘1080p'.  add ‘720p’ in the list, save.</p>\n\n<p>build gaia with make reset-gaia command while the device is connected.  the newly built gaia will be pushed to the device.  Upon reboot, the camera will be defaulted to 480p.</p>\n\n<p>Please see this issue:</p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=988704</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
199	18	1	1	1	 <p class="description">\n        <p>The user should always be returned to the camera viewfinder. If the user is in the camera app previewing a picture, goes home and then reopens the app, they should be taken to the viewfinder so they can quickly take a picture.</p>\n\n<p>Please see this issue:</p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=988670</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
206	19	1	1	1	 <p class="description">\n        <p>Camera viewfinder displays properly after editing a photo in the gallery.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=989113</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
212	20	1	1	1	 <p class="description">\n        <p>When the user pans around the screen after zooming in on a photo in the Gallery app or in the preview mode in the Camera app, the screen is not swiped to the next photo.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=989361</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
221	21	1	1	1	 <p class="description">\n        <p>Verify that there is no noticeable frame rate decrease if user zooms in/out while recording video.</p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1030007</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
228	22	1	1	1	 <p class="description">\n        <p>The Camera app UI is displayed properly after cancelling to share a photo via Email.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1021583</p>\n\n<p>Prerequisite: Email account is not set up on the device. </p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
238	23	1	1	1	 <p class="description">\n        <p>Preview mode UI looks correct and functions properly in Camera. </p>\n\n<p>Please see this issue:</p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=992393</p>\n\n<p>Please see the following attachments:</p>\n\n<p>https://bugzilla.mozilla.org/attachment.cgi?id=8405554</p>\n\n<p>https://bug992393.bugzilla.mozilla.org/attachment.cgi?id=8405554</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
254	24	1	1	1	 <p class="description">\n        <p>When HWC is enabled ensure that a memory leak does not occur in the b2g process when using the camcorder.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1029856</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
259	25	1	1	1	 <p class="description">\n        <p>Verify that there is a smooth transition animation when the user swipes through the photos in the Gallery app or in the preview mode in the Camera app.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=987569</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:50	\N	\N	1	1	1	\N
268	26	1	1	1	 <p class="description">\n        <p>Verify that all sub menus are shown correctly when navigating through the Camera settings menu.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=985006</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
275	27	1	1	1	 <p class="description">\n        <p>The thumbnails in the camera app and the previews in the gallery should always match the captured photo.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1043307</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
282	28	1	1	1	 <p class="description">\n        <p>Verify the user can access the snapshot button on the camera and take pictures while on a phone call. </p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=989087</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
291	29	1	1	1	 <p class="description">\n        <p>The user can retake a photo and attach it successfully to a MMS. </p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=972136</p>\n\n<p>*Keep in the mind that the functionality has changed</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
302	30	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (105 chars) > 100 => has been truncated<br />\nOriginal name<br />\nAfter a video is recorded, a preview icon appears and the video is available in the galley and video apps<br />\n---- *** ----<br />\n <p class="description">\n        <p>After a video is recorded, a preview icon appears and the video is available in the galley and video apps.</p>\n\n<p>Please see these issues:</p>\n\n<p>https://bugzilla.mozilla.org/showbug.cgi?id=1037383 </p>\n\n<p>https://bugzilla.mozilla.org/showbug.cgi?id=945562</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
314	31	1	1	1	 <p class="description">\n        <p>The user can send a large video through a MMS in a reasonable time frame. </p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=976897</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
324	32	1	1	1			2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
337	33	1	1	1	 <p class="description">\n        <p>All strings on the 'Camera' screen are translated correctly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
340	34	1	1	1	 <p class="description">\n        <p>All strings on the 'Camera Error Page' screen are translated correctly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
587	76	1	1	1	 <p class="description">\n        <p>As a user, I want to tap the record button so that I can quickly start recording a video</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
345	35	1	1	1	 <p class="description">\n        <p>If the user is recording a video and receives an incoming call, the video should stop recording instantly. The audio of the incoming call should not be heard when previewing the video. </p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=995540</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
352	36	1	1	1	 <p class="description">\n        <p>All strings on the 'Camera Scanning' screen are translated correctly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
357	37	1	1	1	 <p class="description">\n        <p>All strings on the 'Camera App - no SD card' screen are translated correctly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
361	38	1	1	1	 <p class="description">\n        <p>All strings on the 'Camera - SD card is full' screen are translated correctly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n<p>Pre-requisites: a Full SD card</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
365	39	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (102 chars) > 100 => has been truncated<br />\nOriginal name<br />\n[Camera] When camera is invoked from another app a confirmation prompt is displayed after taking photo<br />\n---- *** ----<br />\n <p class="description">\n        <p>Test case created for Bug 870726 https://bugzilla.mozilla.org/show_bug.cgi?id=870726</p>\n\n<p>Prerequisites: An email account is configured on the phone.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
384	40	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (111 chars) > 100 => has been truncated<br />\nOriginal name<br />\n[Camera] Launching the camera app from the lockscreen, shows the Geolocation message even with passcode lock on<br />\n---- *** ----<br />\n <p class="description">\n        <p>As a user, I want like to be informed by a UI-wide indicator when the geolocation (explicit) API is currently or recently in use by an open app, so that I can monitor use of sensitive APIs.</p>\n\n<p>Prerequisites:</p>\n\n<h1>a. Geolocation option needs to be enabled in Settings.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
391	41	1	1	1	 <p class="description">\n        <p>The filmstrip preview at the top of the Camera app screen does not overlap with the take Picture button or switch camera mode button.</p>\n\n<h1>Pre-Requisistes: Have enough internal storage or room on an SD card to take and save a picture</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
396	42	1	1	1	 <p class="description">\n        <p>Verify that when camera is launched from Browser activities, camera is displaying properly when in landscape mode.</p>\n\n<p>Precondition : Mobile phone should be connected to internet</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
405	43	1	1	1	 <p class="description">\n        <p>While viewing the preview of a photo recently taken with the Camera app the toolbar options at the top of the screen should be easily visible. </p>\n\n<h1>Pre-requisites: Have available internal memory or an SD card so that pictures can be saved.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
411	44	1	1	1	 <p class="description">\n        <p>*Prerequisite: \nSD card is inserted in device\nScreen timeout option should be set</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
417	45	1	1	1	 <p class="description">\n        <p>Verify that the Video Recording start sound is not distorted. </p>\n\n<p>(Test using headphones as well as device speakers) </p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
421	46	1	1	1	 <p class="description">\n        <p>The user will be able to attach a photo directly from the camera app while in a MMS.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
427	47	1	1	1	 <p class="description">\n        <p>This case tests camera whether it can record more than one hour video.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
432	48	1	1	1	 <p class="description">\n        <p>As a user, I want to tap the camera button while viewing saved photos/videos so that I can quickly go to live camera ("take a photo") mode</p>\n\n<p>Prerequisites: Have some photos/videos saved on device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
437	49	1	1	1	 <p class="description">\n        <p>As a user, I want to spread/pinch my fingers so that I can see zoom in and out to see more and fewer details of my saved photo</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
447	50	1	1	1	 <p class="description">\n        <p>As a user, I want to double-tap to zoom on a photo so that I can see more photo detail</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
457	51	1	1	1	 <p class="description">\n        <p>As a user I want to swipe left while previewing a video so that I can quickly view the next video</p>\n\n<p>Prerequisites: Have a few saved videos</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
461	52	1	1	1	 <p class="description">\n        <p>As a user I want to tap the gallery icon so that I can see all my photos and videos quickly</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
465	53	1	1	1	 <p class="description">\n        <p>As a user, when playback of my video is paused, I want to Tap on the the Garbage Icon so that I can quickly Delete my Video</p>\n\n<p>(Note: this test case is now in python marionette suite with Bug 1100390)</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
471	54	1	1	1	 <p class="description">\n        <p>As a user I want to see a warning when I am running out of storage space on my memory card so that I do not lose data or the opportunity to record new videos/take new pictures</p>\n\n<p>Prerequisites: Make sure you there is not much storage space free on your device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
475	55	1	1	1	 <p class="description">\n        <p>Media 64\nAs a user, I like to see flash (on, off, auto) as a camera setting.</p>\n\n<p>Version 0.5 Camera Spec:\nhttps://app.box.com/files/0/f/1211601585/1/f<em>11402480095\nhttps://bugzilla.mozilla.org/show</em>bug.cgi?id=933898</p>\n\n<p>Note: This feature can only be tested on devices that support flash functionality, such as the Flame device.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
480	56	1	1	1	 <p class="description">\n        <p>Media 64\nAs a user, I like to see flash (on, off, auto) as a camera setting.</p>\n\n<p>Version 0.5 Camera Spec:\nhttps://app.box.com/files/0/f/1211601585/1/f<em>11402480095\nhttps://bugzilla.mozilla.org/show</em>bug.cgi?id=933898</p>\n\n<p>Note: This feature can only be tested on devices that support flash functionality, such as the Flame device.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
486	57	1	1	1	 <p class="description">\n        <p>As a user, I want to double-tap to zoom on a photo so that I can see more photo detail.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
493	58	1	1	1	 <p class="description">\n        <p>As a user I want to swipe right while previewing a video so that I can quickly view the previous video</p>\n\n<p>Prerequisites: Have a few videos saved on device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
499	59	1	1	1	 <p class="description">\n        <p>When playback of my video is paused, tap on the back arrow so that I can quickly go to the Camera</p>\n\n<p>Pre-Req: (Video must be taken recently prior to test)</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
504	60	1	1	1	 <p class="description">\n        <p>As a user, when playback of my video is paused, I want to Tap on the Camera Icon in Gallery so that I can quickly switch to Photo Mode</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
510	61	1	1	1	 <p class="description">\n        <p>As a user, I want to tap the camera button while viewing saved photos/videos so that I can quickly go to live camera ("take a photo") mode.</p>\n\n<p>Prerequisites: </p>\n\n<h1>a. Have some photos/videos saved on device.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
515	62	1	1	1	 <p class="description">\n        <p>Media 64\nAs a user, I like to see flash (on, off, auto) as a camera setting.</p>\n\n<p>Version 0.5 Camera Spec:\nhttps://app.box.com/files/0/f/1211601585/1/f<em>11402480095\nhttps://bugzilla.mozilla.org/show</em>bug.cgi?id=933898</p>\n\n<p>Note: This feature can only be tested on devices that support flash functionality, such as the Flame device.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
520	63	1	1	1	 <p class="description">\n        <p>As a user I want to rotate the device to move to Landscape Mode so that I can view wider saved photos/videos more easily </p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
525	64	1	1	1	 <p class="description">\n        <p>As a user I want to rotate the device to move to Portrait Mode so that I can view taller saved photos/videos more easily</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
530	65	1	1	1	 <p class="description">\n        <p>As a user I want to rotate the device to move to Portrait Mode so that I can take taller photos/videos more easily</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
535	66	1	1	1	 <p class="description">\n        <p>As a user if I don't exit the camera app before connecting to USB mass storage,I want the camera app to restart when I disconnect form USB mass storage so that I can quickly start using my camera again</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
540	67	1	1	1	 <p class="description">\n        <p>As a user I want a clear message displayed if I try to use the camera app while the phone is in USB mass storage mode so that I can decide whether to exit USB mass storage mode so I can use my camera immediately or let it continue</p>\n\n<p>Prerequisites: Set device in USB mass storage mode</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
544	68	1	1	1	 <p class="description">\n        <p>As a user I want a clear message displayed if I run out of storage while I am recording a video so that I know what has happened and can take corrective action (e.g. go to the gallery and delete photos,etc)</p>\n\n<p>Prerequisites: Have one device that has &lt; 10Mb free storage space </p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
548	69	1	1	1	 <p class="description">\n        <p>As a user I want a clear message displayed if I try to start the camera app with a full memory card and can't use it so that I know to exit the application and either delete Photos/Videos in gallery or get another memory card (either of which allow me to start using the camera again)</p>\n\n<p>Prerequisites: \n* Insert a full memory card in device\n*  Make sure your device is set to store photos and videos on memory card</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
553	70	1	1	1	 <p class="description">\n        <p>As a user I want a clear message displayed if I need an external storage device to use my camera and don't have it inserted so that I can insert it and start using my camera</p>\n\n<p>Prerequisites: Make sure there is no memory card inserted in device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
556	71	1	1	1	 <p class="description">\n        <p>As a user I want to be access my photos and recorded videos by enabling USB Mass Storage mode so that I can save/archive my videos/photos to my PC.</p>\n\n<p>Prerequisites: </p>\n\n<h1>a. Have a few photos and videos stored on phone.</h1>\n\n<h1>b. USB mass storage must be enabled in Settings.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
563	72	1	1	1	 <p class="description">\n        <p>As a user, when playback of my video is paused, I want to press and hold to control jog dial or slider so that I can quickly seek to another place in the video stream.</p>\n\n<p>Prerequisites: Have at least one recorded video.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
570	73	1	1	1	 <p class="description">\n        <p>As a user I want to tap on the Garbage icon so that I can quickly delete my video.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
575	74	1	1	1	 <p class="description">\n        <p>As a user, I want to tap a playing video so that I can quickly pause the video and bring up the controls.</p>\n\n<p>Prerequisites: Have at least one recorded video on the device.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
582	75	1	1	1	 <p class="description">\n        <p>As a user I want to tap on the Play icon on top of a video so that I can easily play and view my video on my device.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
591	77	1	1	1	 <p class="description">\n        <p>As a user, I want to tap the camera icon so that I can quickly go to camera mode</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
595	78	1	1	1	 <p class="description">\n        <p>As a user, I want to swipe to the left while viewing a photo so that I can quickly see my next photo</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
600	79	1	1	1	 <p class="description">\n        <p>As a user, I want to spread/pinch my fingers so that I can see zoom in and out to see more and fewer details of my saved photo</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
606	80	1	1	1	 <p class="description">\n        <p>As a user, I want to swipe to the right while viewing a photo so that I can quickly see my previous photo</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
611	81	1	1	1	 <p class="description">\n        <p>As a user, when playback of my video is paused, I want to Tap on the Camera Icon so that I can quickly switch to Photo Mode.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
616	82	1	1	1			2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
624	83	1	1	1	 <p class="description">\n        <p>As a user I want to rotate the device to move to Landscape Mode so that I can take wider photos/videos more easily </p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
629	84	1	1	1	 <p class="description">\n        <p>It must be possible to create a video using the camera.  The video output should be H.264.  It should be possible to play back the recording from the gallery.\nVideos are saved as ".3gp".</p>\n\n<p>Prerequisites: \nHave a micro SD card in the device.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
635	85	1	1	1	 <p class="description">\n        <p>As an user, I can Tap garbage to delete current photo.</p>\n\n<p>Prereqs:  you are in full screen photo view</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
640	86	1	1	1	 <p class="description">\n        <p>After taking a picture with the camera app, the user will be able to look at the newly created photo while still in the Camera app.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
645	87	1	1	1	 <p class="description">\n        <p>As a user I want to tap the gallery icon so that I can see all my photos and videos quickly</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
651	88	1	1	1	 <p class="description">\n        <p>The user will be able to close the preview of the newly taken photo in the top right by taping on the screen again.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
656	89	1	1	1			2	7	2015-08-18 08:29:51	\N	\N	1	1	1	\N
662	90	1	1	1	 <p class="description">\n        <p>As a user I want to tap the video icon so that I can quickly switch to video mode.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=984730</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
668	91	1	1	1	 <p class="description">\n        <p>As a user I want to tap the camera button so that I can quickly and easily take a photo.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
672	92	1	1	1			2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
678	93	1	1	1	 <p class="description">\n        <p>As a user, I want to see elapsed time on the stop button label so that I can see how long I have been recording my video.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
683	94	1	1	1	 <p class="description">\n        <p>Verify that all pictures are taken at a default resolution.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
689	95	1	1	1	 <p class="description">\n        <p>As a user, I want to Tap the HUD Camera flip button so that I can quickly switch between the front/back camera (dependent on hardware)</p>\n\n<p>Note: this feature is hardware-dependent and this functionality is present on the Flame device.</p>\n\n<p>Prerequisites: Camera is invoked.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
695	96	1	1	1	 <p class="description">\n        <p>As a user, in LIST VIEW, I should be able to open the camera application by single-tapping the camera button in the toolbar. If I choose to return to the Gallery app from the Camera app (via the Gallery button), I should be returned to the grid view at the position I started - if a new picture(s) was taken during my interaction with the Camera app, I should be placed at a position in the grid where my new picture is in view.</p>\n\n<p>Prerequisites:</p>\n\n<h1>a. Have at least 1 photo on the SD card.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
700	97	1	1	1	 <p class="description">\n        <p>It should be possible to access the camera directly from lockscreen.</p>\n\n<p>Prerequisites: <br />\nHave a micro sd card inserted in the device with enough room for pictures.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
707	98	1	1	1	 <p class="description">\n        <p>User should be able to zoom out by pinch gesture.</p>\n\n<p>Prerequisites: Camera App launched.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
710	99	1	1	1	 <p class="description">\n        <p>User should be able to zoom in or out by pinch gesture.</p>\n\n<p>Prerequisites:  Camera app is launched</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
713	100	1	1	1	 <p class="description">\n        <p>It should be possible to take a picture using the device camera. The first time you use the camera you should receive a geolocation prompt.</p>\n\n<p>Prerequisites: <br />\nPhone has micro SD card with space to save pictures.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:29:52	\N	\N	1	1	1	\N
719	101	1	1	1	 <p class="description">\n        <p>As a user, I want to view my gallery content (photos and captured videos) in a scrollable grid, so I can access everything quickly</p>\n\n<p>Prerequisites: Have some captured videos and photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
722	102	1	1	1	 <p class="description">\n        <ul>\n<li>Media Specs: https://drive.google.com/file/d/0B6fkEC1pmwTid1d4R0JfZ2ZpQW8/view?usp=sharing  </li>\n<li>General UX Specs: https://mozilla.app.box.com/s/bcm3s5i2v6js5uk0ws3tsywse8bgncgo</li>\n</ul>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
728	103	1	1	1	 <p class="description">\n        <p>As a user, if I try to open the Gallery app without an SD Card in my device, a prompt should inform me that the Gallery app is not available without an SD Card present</p>\n\n<p>Prerequisites: Make sure there is no SD card in the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
731	104	1	1	1	 <p class="description">\n        <ul>\n<li>Media Specs: https://drive.google.com/file/d/0B6fkEC1pmwTid1d4R0JfZ2ZpQW8/view?usp=sharing  </li>\n<li>General UX Specs: https://mozilla.app.box.com/s/bcm3s5i2v6js5uk0ws3tsywse8bgncgo</li>\n</ul>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
737	105	1	1	1	 <p class="description">\n        <p>As a user, when I open the gallery app when there is no content on my device to display, I should see a blank view with actions/text in the center that point me at various mechanism for adding new content</p>\n\n<p>Prerequisites: Make sure there are no photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
740	106	1	1	1	 <p class="description">\n        <p>The user can share all supported image files no matter what their source using E-mail, Wallpaper, Messages and Bluetooth.</p>\n\n<p>Prerequisite:\nAttached .jpg is imported to the device as well as all supported image files. Have a good mix of pictures taken from the camera, downloaded from the web and images that were moved over from the desktop onto the SD card. \n(jpeg, png, gif, bmp) and subtypes (progressive jpeg, animated gif, etc.) and a variety of sizes.  A full set of EXIF orientations for jpeg images. </p>\n\n<p>Please see these issue: </p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=1039988</p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=1070207</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
747	107	1	1	1	 <p class="description">\n        <p>When the user pans around the screen after zooming in on a photo in the Gallery app or in the preview mode in the Camera app, the screen is not swiped to the next photo.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=989361</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
756	108	1	1	1	 <p class="description">\n        <p>Pre-requisites: Refer to document https://etherpad.mozilla.org/YMt5ON7KNd for setup instructions and checklist.</p>\n\n<p>Verify Gallery data is Preserved after user OTA</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
760	109	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (103 chars) > 100 => has been truncated<br />\nOriginal name<br />\nGallery app should be killed if the user presses the home button while the app is scanning for pictures<br />\n---- *** ----<br />\n <p class="description">\n        <p>Gallery app should be killed if the user presses the home button while the app is scanning for pictures.</p>\n\n<p>Prerequisite: A large number of photos and videos are saved on the SD card.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1039943</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
766	110	1	1	1	 <p class="description">\n        <p>Pre-requisites: Have a few supported pictures available for viewing.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
773	111	1	1	1	 <p class="description">\n        <p>After saving a file from a MMS, the user can re-enter the MMS without issue.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=976454</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
779	112	1	1	1	 <p class="description">\n        <p>The thumbnails in the camera app and the previews in the gallery should always match the captured photo.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1043307</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
786	113	1	1	1	 <p class="description">\n        <p>Verify that there is a smooth transition animation when the user swipes through the photos in the Gallery app or in the preview mode in the Camera app.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=987569</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
795	114	1	1	1	 <p class="description">\n        <p>Gallery functions properly without issue when there is high memory usage on 1st launch.</p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=963917</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
802	115	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (101 chars) > 100 => has been truncated<br />\nOriginal name<br />\nVerify the user can send files to a paired device while receiving files from another bluetooth device<br />\n---- *** ----<br />\n <p class="description">\n        <p>Verify the user can send files to a paired device while receiving files from another bluetooth device. </p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=897782</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
811	116	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (105 chars) > 100 => has been truncated<br />\nOriginal name<br />\nWhen adding Contacts with pictures, the contact app functions as expected without a memory leak occurring<br />\n---- *** ----<br />\n <p class="description">\n        <p>When adding Contacts with pictures, the contact app functions as expected without a memory leak occurring.</p>\n\n<p>Prerequisite:  Able to monitor memory usage of applications, contact list is empty - |adb shell cat /sys/kernel/debug/ion/iommu|</p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=983885</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
819	117	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (101 chars) > 100 => has been truncated<br />\nOriginal name<br />\nImported videos are shown correctly without issue when switching between portrait and landscape modes<br />\n---- *** ----<br />\n <p class="description">\n        <p>Verify an imported 720p video is shown correctly without issue when switching between portrait and landscape modes.</p>\n\n<p>Prerequisite: ""Lock orientation"" is disabled in Settings.</p>\n\n<p>Please see these issues: </p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=963624</p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=1020003</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
824	118	1	1	1	 <p class="description">\n        <p>Camera viewfinder displays properly after editing a photo in the gallery.</p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=989113</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
830	119	1	1	1	 <p class="description">\n        <p>All strings on the "Memory card in use" page are translated properly without truncation. </p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
836	120	1	1	1	 <p class="description">\n        <p>All strings on the "No photos or videos" page are translated properly without truncation. </p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
841	121	1	1	1	 <p class="description">\n        <p>The string "Can not edit photos. Memory card is full." is translated properly without truncation. </p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
847	122	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (113 chars) > 100 => has been truncated<br />\nOriginal name<br />\nAll strings on the  "Delete selected item?" and "Delete 3 items? pages are translated properly without truncation<br />\n---- *** ----<br />\n <p class="description">\n        <p>All strings on the  "Delete selected item?" and "Delete 3 items? pages are translated properly without truncation. </p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
856	123	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (108 chars) > 100 => has been truncated<br />\nOriginal name<br />\nAll strings on the "Single item" and "Multiple items" share pages are translated properly without truncation<br />\n---- *** ----<br />\n <p class="description">\n        <p>All strings on the "Single item" and "Multiple items" share pages are translated properly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
864	124	1	1	1	 <p class="description">\n        <p>The strings "Select" and "Number Selected" are translated properly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
870	125	1	1	1	 <p class="description">\n        <p>All strings on the "Edit" page are translated properly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
876	126	1	1	1	 <p class="description">\n        <p>All strings on the "Delete photo?" page are translated properly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
882	127	1	1	1	 <p class="description">\n        <p>Prerequisite: 1. Replace the Update URL to workable URL (optional) 2. Take 10 photos and 5 videos before this test.</p>\n\n<p>Reference: https://moztrap.mozilla.org/manage/case/8952/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
891	128	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (108 chars) > 100 => has been truncated<br />\nOriginal name<br />\nAll strings on the "More Information" pages for Photos and Videos are translated properly without truncation<br />\n---- *** ----<br />\n <p class="description">\n        <p>All strings on the "More Information" pages for Photos and Videos are translated properly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
900	129	1	1	1	 <p class="description">\n        <p>User story:\nAs a user, I want to see the file type, size, resolution and date of creation of the content displayed in the gallery app</p>\n\n<p>Bug 925216</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
905	130	1	1	1	 <p class="description">\n        <p>All dates for gallery content are translated properly without truncation.</p>\n\n<p>*Make sure to check Transvision tool before writing any issues.</p>\n\n<p>http://transvision-beta.mozfr.org/?recherche=mobile&amp;repo=gaia13&amp;sourcelocale=en-US&amp;locale=bg&amp;search_type=strings</p>\n\n<p>Also refer to this document https://hg.mozilla.org/gaia-l10n/</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
910	131	1	1	1	 <p class="description">\n        <p>Implementation Bug: https://bugzilla.mozilla.org/show_bug.cgi?id=917445</p>\n\n<h1>Pre-Requisites:</h1>\n\n<h1>Gallery is launched and photo is in edit mode.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
917	132	1	1	1	 <p class="description">\n        <p>User Story:\nAs a user, I want the gallery app to automatically arrange content by the month </p>\n\n<p>If the user has taken six or more pictures within a single month, the month will create its own section.</p>\n\n<p>Acceptance Criteria:\n- When the gallery app is opened the user can see that all the content (images, videos) are arranged by month</p>\n\n<p>Implementation bug: https://bugzilla.mozilla.org/show_bug.cgi?id=925179</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
922	133	1	1	1	 <p class="description">\n        <p>User Story:\nAs a user, I want the gallery app to automatically arrange content by the month </p>\n\n<p>If a user has not taken at least six pictures within a single month but within a range of months, the pictures will be lumped within a single section and the title will reflect the span of time.</p>\n\n<p>Acceptance Criteria:\n- When the gallery app is opened the user can see that all the content (images, videos) are arranged by month</p>\n\n<p>Implementation bug: https://bugzilla.mozilla.org/show_bug.cgi?id=925179</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
928	134	1	1	1	 <p class="description">\n        <p>User Story:\nAs a user, I want the gallery app to automatically arrange content by the month </p>\n\n<p>If the user has taken at least six pictures spanning more than one year, first and last month and relevant years will be displayed.</p>\n\n<p>Acceptance Criteria:\n- When the gallery app is opened the user can see that all the content (images, videos) are arranged by month</p>\n\n<p>Implementation bug: https://bugzilla.mozilla.org/show_bug.cgi?id=925179</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
934	135	1	1	1	 <p class="description">\n        <p>Prerequisite: \n1. Having more than 1 photos stored on device. </p>\n\n<p>As a user, I should be able to browse through photos and play slideshow.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
943	136	1	1	1	 <p class="description">\n        <p>Using the pick activity and confirming an image for the gallery - app should not get hung with no perceived performance. </p>\n\n<h1>Prerequistes: At least 1 image is in the gallery</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
950	137	1	1	1	 <p class="description">\n        <p>Prerequisite: \n1. Having more than 1 photos stored on device. </p>\n\n<p>As a user, I should be able to select photo(s) to share or to delete.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
957	138	1	1	1	 <p class="description">\n        <p>If the Gallery list is open while the user removes the SD card, the list should be reloaded and updated to show only files on the internal memory storage. </p>\n\n<h1>Pre-requisites: Have a SD card inserted. Have photos stored on both the SD card and on the phone's internal memory</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
961	139	1	1	1	 <p class="description">\n        <p>The user is able to set HD wallpaper from the gallery app in both landscape and portrait modes. The quality of the wallpaper is not compromised.</p>\n\n<p>Test case created for bug 883016 https://bugzilla.mozilla.org/show_bug.cgi?id=883016</p>\n\n<p>Prerequisites: Store two  high-resolution images (1920x1080) on the phone's SD Card. </p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
971	140	1	1	1	 <p class="description">\n        <p>Test case created for Bug 865772 https://bugzilla.mozilla.org/show_bug.cgi?id=865772</p>\n\n<p>Prerequisites: There should be a blank or empty (zero bytes) image file on the SD Card of the phone. There should also be several other image files.</p>\n\n<p>Automated.  See bug 1110158</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
975	141	1	1	1			2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
981	142	1	1	1	 <p class="description">\n        <p>User Story:\nAs a user, I want the gallery app to automatically arrange content by the month </p>\n\n<p>The date order will be chronological with the most recent pictures appearing at the top of the page. </p>\n\n<p>Acceptance Criteria:\n- When the gallery app is opened the user can see that all the content (images, videos) are arranged by month</p>\n\n<p>Implementation bug: https://bugzilla.mozilla.org/show_bug.cgi?id=925179</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
987	143	1	1	1	 <p class="description">\n        <p>Using a device with internal storage, the Gallery App should load only images stored on the device when the SD card has been removed.</p>\n\n<h1>Pre-requisites: Make sure there is no sd card in the device. Have images saved on the internal phone storage</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
991	144	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (101 chars) > 100 => has been truncated<br />\nOriginal name<br />\n[GALLERY] The last received file is not deleted if the user denies the incoming file transfer request<br />\n---- *** ----<br />\n <p class="description">\n        <p>The last received file is not deleted if the user denies the incoming file transfer request</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
998	145	1	1	1	 <p class="description">\n        <p>The gallery app can only view photos up to 5 megapixels.</p>\n\n<p>Prerequisite:\nHave .png photos up to and past 5 megapixel on the media storage</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1002	146	1	1	1	 <p class="description">\n        <p>The aim of this test case is to verify the correct behaviour of edit mode inside gallery app when rotating the device to landscape.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1008	147	1	1	1	 <p class="description">\n        <p>As a user, I will not be able to enter Edit mode without sufficient storage space on my phone. I will be alerted that i will not be able to edit my photos unless i free up more storage space.</p>\n\n<p>Prerequisites: Make sure there are a few photos on the device and that the available free space is smaller then 1-2 MB</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1012	148	1	1	1	 <p class="description">\n        <p>As a user, in SINGLE PHOTO VIEW, I should be able to quickly switch to grid view by single-tapping an icon in the top left section of the screen.</p>\n\n<p>Prerequisites: Have a few photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1016	149	1	1	1	 <p class="description">\n        <p>As a user, in SINGLE PHOTO VIEW, I should be able to double-tap the screen to return the image to the center of the screen at normal/100% zoom</p>\n\n<p>Prerequisites: Have a few photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1020	150	1	1	1	 <p class="description">\n        <p>As a user, in SINGLE PHOTO VIEW, when zoomed in on the photo, I should be able to drag the photo to change the area of the photo show in the viewport</p>\n\n<p>Prerequisites: Have a few photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1025	151	1	1	1	 <p class="description">\n        <p>As a user, in LIST VIEW, I should be able to play a video by single tapping on the thumbnail of a capture video</p>\n\n<p>Prerequisites: Have a few captured videos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1029	152	1	1	1	 <p class="description">\n        <p>As a user, in LIST VIEW, I should be able to enter a "Select Mode" by single-tapping the "Select" button in the toolbar. In "Select Mode", single-tapping photos should toggle their selected state, as evidenced by a clear visual indicator</p>\n\n<p>Prerequisites: Have some photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1033	153	1	1	1	 <p class="description">\n        <p>As a user, in LIST VIEW, I should be able to enter a "Select Mode" by single-tapping the "Select" button in the toolbar. In "Select Mode", single-tapping photos should toggle their selected state, as evidenced by a clear visual indicator</p>\n\n<p>Prerequisites: Have some photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1039	154	1	1	1	 <p class="description">\n        <p>As a user, in LIST VIEW "Select Mode", I should be able to share one or more selected photos by single-tapping the share button in the toolbar. Tapping the share button should present a pop-up menu with various share options. After selecting a share option, and completing its sharing flow, I should be returned to the place in the grid view I started from</p>\n\n<p>Prerequisites:  Have multiple photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1044	155	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (102 chars) > 100 => has been truncated<br />\nOriginal name<br />\n[Gallery] Single Photo View - The photo and toolbars adjust to fit the screen when rotating the device<br />\n---- *** ----<br />\n <p class="description">\n        <p>As a user, in SINGLE PHOTO VIEW, when I rotate the device to portrait or landscape, the photo and toolbars should adjust to fit the new constraints of the currently active orientation</p>\n\n<p>Prerequisites: Have a few photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1048	156	1	1	1	 <p class="description">\n        <p>As a user, in SINGLE PHOTO VIEW, I should be able to single-tap the "Share" button in the toolbar and trigger an action that sets the current photo as my wallpaper background</p>\n\n<p>Prerequisites: Have a few photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1052	157	1	1	1	 <p class="description">\n        <p>As a user, in SINGLE PHOTO VIEW, I should be able to open the camera application by single-tapping the camera button in the toolbar. If I choose to return to the Gallery app from the Camera app (via the Gallery button), I should be returned to the grid view at the position I started - if a new picture(s) was taken during my interaction with the Camera app, I should be placed at a position in the grid where my new picture is in view.</p>\n\n<p>Prerequisites:</p>\n\n<h1>a. There must be at least 1 photo in the Gallery.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1060	158	1	1	1	 <p class="description">\n        <p>As a user, in SINGLE PHOTO VIEW, I should be able to open the camera application by single-tapping the camera button in the toolbar. If I choose to return to the Gallery app from the Camera app (via the Gallery button), I should be returned to the grid view at the position I started - if a new picture(s) was taken during my interaction with the Camera app, I should be placed at a position in the grid where my new picture is in view.</p>\n\n<p>Prerequisites:</p>\n\n<h1>a. Have at least 1 photo in the Gallery.</h1>\n\n<p>Automated.  See bug 1111637</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1067	159	1	1	1	 <p class="description">\n        <p>As a user, in SINGLE PHOTO VIEW, I should be able to edit the current photo in view by single-tapping the edit button in the toolbar.</p>\n\n<p>Prerequisites: </p>\n\n<h1>a. Have a few photos on the device</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1072	160	1	1	1	---- Warning ----<br />\nTestLink Warning<br />\ntest case name is too long (108 chars) > 100 => has been truncated<br />\nOriginal name<br />\nVerify the user cannot use and a prompt is displayed while in the gallery app when in USB mass storage mode.<br />\n---- *** ----<br />\n <p class="description">\n        <p>As a user, when my device is in "USB Mass Storage Mode", I should recieve a prompt when trying to open the gallery app that tells me that I cannot use the gallery app when this mode is engaged</p>\n\n<p>Prerequisites: Phone is in USB Mass Storage mode.(Plugged into a computer and has USB mass storage turned on.)</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1075	161	1	1	1	 <p class="description">\n        <p>As a user, after disengaging from "USB Mass Storage Mode", I expect the Gallery app to rescan my device for new content.  Same goes for recently removed content.</p>\n\n<p>Prerequisites:  Gallery app not open.  USB Mass Storage engaged.  While it is engaged, some pictures were removed.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1079	162	1	1	1	 <p class="description">\n        <p>As a user, after disengaging from "USB Mass Storage Mode", I expect the Gallery app to rescan my device for new content.</p>\n\n<p>Prerequisites:  Gallery app not open.  USB Mass Storage engaged.  While it is engaged, some pictures were added.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1083	163	1	1	1	 <p class="description">\n        <p>From the gallery, it should be possible to view the photos in the fullscreen mode.</p>\n\n<p>Prerequisites:  the gallery application is launched, in thumbnail view.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1090	164	1	1	1	 <p class="description">\n        <p>It should be possible, using the video functionality, to play back a video that's been shot with the onboard camera.  Both Video and Sound must work.</p>\n\n<p>Prerequisite:   A video has been recorded with sound, using the onboard camera.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1094	165	1	1	1	 <p class="description">\n        <p>As a user, in EDIT MODE, I should be able to save a photo I have edited by single-tapping the OK button in the toolbar. I should then be returned to the BROWSE PHOTO grid view and placed at a location with the newly created, edited version of the photo in view.</p>\n\n<p>Prerequisites:</p>\n\n<h1>a. Must have at least 1 photo on the SD card.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1100	166	1	1	1	 <p class="description">\n        <p>As a user, in LIST VIEW "Select Mode", I should be able to share one or more selected photos by single-tapping the share button in the toolbar. Tapping the share button should present a pop-up menu with various share options. After selecting a share option, and completing its sharing flow, I should be returned to the place in the grid view I started from.</p>\n\n<p>Prerequisites:  </p>\n\n<h1>a. An email account is already active on the test device.</h1>\n\n<h1>b. At least 1 photo is present on the test device.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1106	167	1	1	1	 <p class="description">\n        <p>When selecting multiple photos in the Gallery, the user will be able to share them   in an e-mail.</p>\n\n<p>Prerequisite: Have at least 2 pictures also have an e-mail account setup.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1113	168	1	1	1	 <p class="description">\n        <p>As a user, at the view photo screen I can share a picture (through twitter).</p>\n\n<h1>Prerequisites: Twitter app from the Marketplace is installed. A photo is saved in the Gallery.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:06	\N	\N	1	1	1	\N
1120	169	1	1	1	 <p class="description">\n        <p>As a user, in EDIT MODE, I should be able to exit edit mode at any time by single-tapping the cancel button in the toolbar.</p>\n\n<p>Prerequisites:</p>\n\n<h1>a. Must have at least 1 photo on the SD card.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1126	170	1	1	1	 <p class="description">\n        <p>As a user, in LIST VIEW, I should be able to open the camera application by single-tapping the camera button in the toolbar. If I choose to return to the Gallery app from the Camera app (via the Gallery button), I should be returned to the grid view at the position I started - if a new picture(s) was taken during my interaction with the Camera app, I should be placed at a position in the grid where my new picture is in view.</p>\n\n<p>Prerequisites:</p>\n\n<h1>a. Have at least 1 photo on the SD card.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1131	171	1	1	1	 <p class="description">\n        <p>As a user I can zoom-in and zoom-out on a picture when viewing it in detail by pinching it. When the picture is zoomed-in user can drag the picture to change the visible area.</p>\n\n<p>Prerequisites:</p>\n\n<h1>a. Have at least 1 photo on the SD card.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1138	172	1	1	1	 <p class="description">\n        <p>As a user I want to be able to change the wallpaper of the Lock/Home apps from the Home grid, so that I am empowered to customize the wallpaper from the location within the system where I will encounter it the most.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1144	173	1	1	1	 <p class="description">\n        <p>User is able to adjust wallpaper. </p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1151	174	1	1	1	 <p class="description">\n        <p>Able to select wallpaper from camera photos gallery.</p>\n\n<h1>Pre-Requisite:</h1>\n\n<h1>Have a photo taken by the device's camera in the photo Gallery</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1155	175	1	1	1	 <p class="description">\n        <p>As a user, in EDIT MODE, I should be able to add common effects to a photo by single-tapping the "Effects" tab in the toolbar. I should presented with common effect options in a secondary toolbar. Tapping an effect type will apply the effect option to the photo</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1162	176	1	1	1	 <p class="description">\n        <p>As a user, in EDIT MODE, I should be able to add common effects to a photo by single-tapping the "Effects" tab in the toolbar. I should presented with common effect options in a secondary toolbar. Tapping an effect type will apply the effect option to the photo</p>\n\n<p>Prerequisites: gallery is launched and photo is in edit mode.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1168	177	1	1	1	 <p class="description">\n        <p>As a user, in EDIT MODE, I should be able to adjust the exposure of the photo by single-tapping the exposure tab in toolbar - the exposure edit view should present me with a slider that can be dragged to increase or decrease "Exposure" along a preset scale</p>\n\n<p>Prerequisites:  Photo editor is launched.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1173	178	1	1	1	 <p class="description">\n        <p>As a user, in EDIT MODE, I should be able to crop a photo by single-tapping the "Crop" tab in the toolbar. I should presented with common crop options in a secondary toolbar. Tapping a crop type will apply the crop option to the photo - if I select "Freedom Mode", drag UI handles shall be overlayed on the edge of the photo I can used to manually adjust the crop area.</p>\n\n<h1>Pre-Requisites:</h1>\n\n<h1>Gallery is launched and photo is in edit mode.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1179	179	1	1	1	 <p class="description">\n        <p>As a user, in EDIT MODE, I should be able to crop a photo by single-tapping the "Crop" tab in the toolbar. I should presented with common crop options in a secondary toolbar. Tapping a crop type will apply the crop option to the photo - if I select "Freedom Mode", drag UI handles shall be overlayed on the edge of the photo I can used to manually adjust the crop area.</p>\n\n<h1>Pre-Requisite:</h1>\n\n<h1>Gallery is launched and photo is in edit mode</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1184	180	1	1	1	 <p class="description">\n        <p>As a user, in EDIT MODE, I should be able to crop a photo by single-tapping the "Crop" tab in the toolbar. I should presented with common crop options in a secondary toolbar. Tapping a crop type will apply the crop option to the photo - if I select "Freedom Mode", drag UI handles shall be overlayed on the edge of the photo I can used to manually adjust the crop area.</p>\n\n<p>Prerequisite: Have some pictures located on the storage media.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1191	181	1	1	1	 <p class="description">\n        <p>As a user, in EDIT MODE, I should be able to crop a photo by single-tapping the "Crop" tab in the toolbar. I should presented with common crop options in a secondary toolbar. Tapping a crop type will apply the crop option to the photo - if I select "Freedom Mode", drag UI handles shall be overlayed on the edge of the photo I can used to manually adjust the crop area.</p>\n\n<p>Prerequisites: gallery is launched and photo is in edit mode.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1195	182	1	1	1	 <p class="description">\n        <p>As a user, in EDIT MODE, I should be able to add common effects to a photo by single-tapping the "Effects" tab in the toolbar. I should presented with common effect options in a secondary toolbar. Tapping an effect type will apply the effect option to the photo</p>\n\n<p>Prerequisites: gallery is launched and photo is in edit mode.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1199	183	1	1	1	 <p class="description">\n        <p>As a user, in LIST VIEW "Select Mode", I should be able to share one or more selected photos by single-tapping the share button in the toolbar. Tapping the share button should present a pop-up menu with various share options. After selecting a share option, and completing its sharing flow, I should be returned to the place in the grid view I started from</p>\n\n<p>Prerequisites:  Have multiple photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1204	184	1	1	1	 <p class="description">\n        <p>It should be possible to export photos from device to desktop machine.</p>\n\n<p>Prerequisite: Have mass storage turned on in the device settings and also have some photos on the storage device.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1207	185	1	1	1	 <p class="description">\n        <p>It should be possible to access the camera from the gallery, from a Single Photo View.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1212	186	1	1	1	 <p class="description">\n        <p>User should be able to view any photos added to the devices SD card.</p>\n\n<p>Prerequisites:  Phone with SD card that has photos, which is already inserted into the device.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1215	187	1	1	1	 <p class="description">\n        <p>As a user, in Gallery when viewing a photo in full screen view, I should be able to swipe across the current photo to view the next photo (left swipe) or last photo (right swipe) in the photo set.</p>\n\n<p>Prerequisites:</p>\n\n<h1>a. Must have several photos on your device.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1221	188	1	1	1	 <p class="description">\n        <p>As a user, in SINGLE PHOTO VIEW, I should be able to delete the photo currently displayed by single-tapping the delete icon in the toolbar</p>\n\n<p>Prerequisites: Have a few pictures in on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1226	189	1	1	1	 <p class="description">\n        <p>As a user, within the LIST VIEW "Select Mode", I should be able to delete multiple photos simultaneously by selecting the desired photos and single-tapping the delete button in the toolbar</p>\n\n<p>Automated. See Bug 1112227</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1232	190	1	1	1	 <p class="description">\n        <p>As a user, in LIST VIEW, I should be able view a larger view of a photo by single-tapping the photo's thumbnail</p>\n\n<p>Prerequisites: Have some photos on the device</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1236	191	1	1	1	 <p class="description">\n        <p>It should be possible to set a specific photo to a specific contact.</p>\n\n<h1>Prerequisites:  a previously created contact is available.</h1>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1247	192	1	1	1	 <p class="description">\n        <p>It should be possible to access the camera from the gallery preview mode.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1250	193	1	1	1	 <p class="description">\n        <p>It should be possible to take a picture using the device camera. The first time you use the camera you should receive a geolocation prompt.</p>\n\n<p>Prerequisites: <br />\nPhone has micro SD card with space to save pictures.</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	7	2015-08-18 08:31:07	\N	\N	1	1	1	\N
1258	1	1	1	1	 <p class="description">\n        <p>Operator name is shown correctly for USIM throughout settings. </p>\n\n<p>Please see this issue: </p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=1046649</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	4	2015-08-18 08:35:36	\N	\N	1	1	1	\N
1267	2	1	1	1	 <p class="description">\n        <p>Network operator settings show correctly for both SIMs in a DSDS scenario.</p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1010394</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	4	2015-08-18 08:35:36	\N	\N	1	1	1	\N
1276	3	1	1	1	 <p class="description">\n        <p>Verify that all items are displayed properly on the 'Call Settings' screen after FDN is enabled.</p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1039957</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	4	2015-08-18 08:35:36	\N	\N	1	1	1	\N
1284	4	1	1	1	 <p class="description">\n        <p>If outgoing call SIM is set to "always ask", the last used SIM will make the call and the last contact that SIM called will be dialed when double clicking the bluetooth headset to dial</p>\n\n<p>Prerequisites: Have two SIM cards in device, and a bluetooth headset available. </p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1021478</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	4	2015-08-18 08:35:36	\N	\N	1	1	1	\N
1288	1	2	1	1	 <p class="description">\n        <p>Operator name is shown correctly for USIM throughout settings. </p>\n\n<p>Please see this issue: </p>\n\n<p>https://bugzilla.mozilla.org/show_bug.cgi?id=1046649</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	4	2015-08-18 08:35:59	\N	\N	1	1	1	\N
1296	2	2	1	1	 <p class="description">\n        <p>Network operator settings show correctly for both SIMs in a DSDS scenario.</p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1010394</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	4	2015-08-18 08:35:59	\N	\N	1	1	1	\N
1304	3	2	1	1	 <p class="description">\n        <p>Verify that all items are displayed properly on the 'Call Settings' screen after FDN is enabled.</p>\n\n<p>Please see issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1039957</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	4	2015-08-18 08:35:59	\N	\N	1	1	1	\N
1311	4	2	1	1	 <p class="description">\n        <p>If outgoing call SIM is set to "always ask", the last used SIM will make the call and the last contact that SIM called will be dialed when double clicking the bluetooth headset to dial</p>\n\n<p>Prerequisites: Have two SIM cards in device, and a bluetooth headset available. </p>\n\n<p>Please see this issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1021478</p>\n\n    </p>\n  \n\n  <ol class="steps"> 		2	4	2015-08-18 08:35:59	\N	\N	1	1	1	\N
1316	194	1	1	1	<p>\r\n\tThe test case is for testing one entry of search result when input 2 digits.</p>\r\n	<p>\r\n\t1. Feature phone with SIM card.</p>\r\n<p>\r\n\t2. Prepare a contact with name and phone number starting with 2 digits you input.(e.g user input 72, it stands for all the combination. 7 stands for pqrs, 2 stands for abc.)</p>\r\n<p>\r\n\t&nbsp;</p>\r\n	3	8	2015-08-18 09:56:18	8	2015-08-18 09:58:49	1	1	1	5.00
\.


--
-- Data for Name: h5tl_testcase_keywords; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_testcase_keywords (testcase_id, keyword_id) FROM stdin;
16	1
27	3
34	5
44	2
21	1
49	3
72	1
72	2
72	3
72	4
72	5
72	6
72	7
87	10
91	10
96	10
99	10
1315	10
105	16
\.


--
-- Data for Name: h5tl_testcase_relations; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_testcase_relations (id, source_id, destination_id, relation_type, author_id, creation_ts) FROM stdin;
\.


--
-- Name: h5tl_testcase_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_testcase_relations_id_seq', 1, false);


--
-- Data for Name: h5tl_testplan_platforms; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_testplan_platforms (id, testplan_id, platform_id) FROM stdin;
1	42	1
2	43	2
3	43	3
\.


--
-- Name: h5tl_testplan_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_testplan_platforms_id_seq', 3, true);


--
-- Data for Name: h5tl_testplan_tcversions; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_testplan_tcversions (id, testplan_id, tcversion_id, platform_id, node_order, urgency, author_id, creation_ts) FROM stdin;
1	42	17	1	10000	2	4	2015-08-03 03:14:07
2	42	22	1	10000	2	4	2015-08-03 03:15:21
\.


--
-- Name: h5tl_testplan_tcversions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_testplan_tcversions_id_seq', 2, true);


--
-- Data for Name: h5tl_testplans; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_testplans (id, testproject_id, notes, active, is_open, is_public, api_key) FROM stdin;
42	2	<p>\r\n\tSmoke test for v1.0</p>	1	1	1	740176dbd3919fa2a1802a730a7dd98a8d0112812dac77858dc29c08a424fc35
43	2	<p>\r\n\t1.0 regression test</p>	1	1	1	1a8beffae2772f6197db03a4f8e98778f88711666ce98c7169d3ea5e872616e1
\.


--
-- Data for Name: h5tl_testproject_issuetracker; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_testproject_issuetracker (testproject_id, issuetracker_id) FROM stdin;
\.


--
-- Data for Name: h5tl_testproject_reqmgrsystem; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_testproject_reqmgrsystem (testproject_id, reqmgrsystem_id) FROM stdin;
\.


--
-- Data for Name: h5tl_testprojects; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_testprojects (id, notes, color, active, option_reqs, option_priority, option_automation, options, prefix, tc_counter, is_public, issue_tracker_enabled, reqmgr_integration_enabled, api_key) FROM stdin;
1			1	0	0	0	O:8:"stdClass":4:{s:19:"requirementsEnabled";i:1;s:19:"testPriorityEnabled";i:1;s:17:"automationEnabled";i:1;s:16:"inventoryEnabled";i:1;}	h5	0	1	0	0	1e2f4889190df4f31a7f0edaf3a7c16da0a6b0ec58f66c6cd2d23e3187adf3aa
2	<p>\r\n\tTest cases collection and management for smartphone products.</p>		1	0	0	0	O:8:"stdClass":4:{s:19:"requirementsEnabled";i:1;s:19:"testPriorityEnabled";i:1;s:17:"automationEnabled";i:1;s:16:"inventoryEnabled";i:0;}	SP	13	1	0	0	787306fb55e51b4fd1f067137eafad53f69769aa7e9419557f1e0538c030f64e
4	<p>\r\n\tTest cases collection and management for smart TV products.</p>		1	0	0	0	O:8:"stdClass":4:{s:19:"requirementsEnabled";i:1;s:19:"testPriorityEnabled";i:1;s:17:"automationEnabled";i:1;s:16:"inventoryEnabled";i:0;}	TV	0	1	0	0	56856143dd77f623d80582d9b46c068b5cf634b4bba4f6d9903ea072222c8475
5	<p>\r\n\tTest cases collection and management for smart watch products.</p>		1	0	0	0	O:8:"stdClass":4:{s:19:"requirementsEnabled";i:1;s:19:"testPriorityEnabled";i:1;s:17:"automationEnabled";i:1;s:16:"inventoryEnabled";i:0;}	SW	0	1	0	0	30cfe9d109e5e6d990bd88e0ddd678c739f5abfa65c902668af2199a06164d8d
1255	<p>\r\n\ttest</p>		1	0	0	0	O:8:"stdClass":4:{s:19:"requirementsEnabled";i:1;s:19:"testPriorityEnabled";i:1;s:17:"automationEnabled";i:1;s:16:"inventoryEnabled";i:0;}	ti	4	1	0	0	9b32bc023c75d33fe98cbc28a8268fd561a88c02c76a7bcea8405415a4f886a6
3	<p>\r\n\tTest cases collection and management for feature phone products.</p>		1	0	0	0	O:8:"stdClass":4:{s:19:"requirementsEnabled";i:1;s:19:"testPriorityEnabled";i:1;s:17:"automationEnabled";i:1;s:16:"inventoryEnabled";i:0;}	FP	194	1	0	0	3f2780a5a534437d566b96e1d94e04d1609f756671d6008d8bdd6579d8656f5c
\.


--
-- Data for Name: h5tl_testsuites; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_testsuites (id, details) FROM stdin;
6	
7	
8	
9	<p>\r\n\tContain test cases related to network function</p>\r\n
10	<p>\r\n\tFor Wifi releated test cases</p>\r\n
11	<p>\r\n\tFor voice test cases</p>\r\n
12	<p>\r\n\tFor media related test cases</p>\r\n
13	<p>\r\n\tFor music app related test cases</p>\r\n
14	<p>\r\n\tFor FM radio app related test cases</p>\r\n
15	<p>\r\n\tFor dialer related test cases</p>\r\n
20	<p>\r\n\tCases related to browser</p>\r\n
33	<p>\r\n\tBattery life related test cases</p>\r\n
48	
58	<p>\r\n\tContain sub test suites and test cases for non-touch apps.</p>\r\n
60	<p>\r\n\tDocument test suites and test cases for following features:</p>\r\n<p>\r\n\t&nbsp;</p>\r\n<table border="0" cellpadding="0" cellspacing="0" style="width:215px;" width="215">\r\n\t<colgroup>\r\n\t\t<col />\r\n\t</colgroup>\r\n\t<tbody>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;width:215px;">\r\n\t\t\t\tFTU Talkback</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tQuick Access</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tTTY</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tCaption Settings</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tSettings Menu</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="105" rowspan="5" style="height:107px;">\r\n\t\t\t\tTalkback Options</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tInverted Colors</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tLarge Text</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tMono Audio</td>\r\n\t\t</tr>\r\n\t\t<tr height="44">\r\n\t\t\t<td height="44" style="height:44px;">\r\n\t\t\t\tL/R Control</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tTurn Off All Sounds</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n<p>\r\n\t&nbsp;</p>\r\n
61	<p>\r\n\tDocument test suites and test cases for dual display releated features.</p>\r\n
62	<p>\r\n\tDocument test suites and test cases for power issues.</p>\r\n
63	<p>\r\n\tFor settings test cases</p>\r\n
64	<p>\r\n\tFor Dialer test cases</p>\r\n
65	<p>\r\n\tFor contacts test cases</p>\r\n
66	<p>\r\n\tFor clock test cases</p>\r\n
67	<p>\r\n\tFor camera test cases</p>\r\n
68	<p>\r\n\tFor Gallery test cases</p>\r\n
69	<p>\r\n\tFor Music test cases</p>\r\n
70	<p>\r\n\tFor keypad test cases</p>\r\n
71	<p>\r\n\tFor related test cases</p>\r\n
57	<p>\r\n\tVersion number.&nbsp;</p>\r\n
59	<p>\r\n\tDocument test suites and test cases for following categories.</p>\r\n<table border="0" cellpadding="0" cellspacing="0" style="width:215px;" width="215">\r\n\t<colgroup>\r\n\t\t<col />\r\n\t</colgroup>\r\n\t<tbody>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tKeypad</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tSoftkey</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tDOM key mappying</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tFlip open/close</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tCursor support</td>\r\n\t\t</tr>\r\n\t\t<tr height="21">\r\n\t\t\t<td height="21" style="height:21px;">\r\n\t\t\t\tSpatial Navigation</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n<hr />\r\n<p>\r\n\t&nbsp;</p>\r\n
84	<p>\r\n\tThis test suite is for testing dialer launch, exit, menu, UI,etc.</p>\r\n
85	<p>\r\n\tThis test suite is for testing call UI, e.g outgoing call, incoming call, call waiting, conference call,etc.</p>\r\n
86	<p>\r\n\tThis test suite is for testing Call log related UI, menu, etc.</p>\r\n
104	<p>\r\n\tSuite for smoke test</p>\r\n
1256	
\.


--
-- Data for Name: h5tl_text_templates; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_text_templates (id, type, title, template_data, author_id, creation_ts, is_public) FROM stdin;
\.


--
-- Name: h5tl_text_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_text_templates_id_seq', 1, false);


--
-- Data for Name: h5tl_transactions; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_transactions (id, entry_point, start_time, end_time, user_id, session_id) FROM stdin;
29	/testlink/login.php	1438513408	1438513408	0	\N
30	/testlink/login.php	1438513417	1438513417	0	\N
31	/testlink/login.php	1438513425	1438513425	1	m2rtvakl01srlo3qi7pscre9d2
32	/testlink/lib/usermanagement/usersEdit.php	1438513479	1438513479	1	m2rtvakl01srlo3qi7pscre9d2
33	/testlink/lib/usermanagement/usersEdit.php	1438513504	1438513504	1	m2rtvakl01srlo3qi7pscre9d2
34	/testlink/lib/usermanagement/usersEdit.php	1438513548	1438513548	1	m2rtvakl01srlo3qi7pscre9d2
35	/testlink/lib/usermanagement/usersEdit.php	1438513610	1438513610	1	m2rtvakl01srlo3qi7pscre9d2
36	/testlink/lib/usermanagement/usersEdit.php	1438513666	1438513666	1	m2rtvakl01srlo3qi7pscre9d2
37	/testlink/lib/usermanagement/usersEdit.php	1438513712	1438513712	1	m2rtvakl01srlo3qi7pscre9d2
38	/testlink/logout.php	1438513730	1438513730	1	m2rtvakl01srlo3qi7pscre9d2
39	/testlink/login.php	1438513736	1438513736	4	m2rtvakl01srlo3qi7pscre9d2
40	/testlink/lib/project/projectEdit.php	1438514426	1438514426	4	m2rtvakl01srlo3qi7pscre9d2
41	/testlink/lib/project/projectEdit.php	1438514453	1438514453	4	m2rtvakl01srlo3qi7pscre9d2
42	/testlink/lib/project/projectEdit.php	1438514473	1438514474	4	m2rtvakl01srlo3qi7pscre9d2
43	/testlink/lib/project/projectEdit.php	1438514513	1438514513	4	m2rtvakl01srlo3qi7pscre9d2
44	/testlink/lib/keywords/keywordsEdit.php	1438514953	1438514953	4	m2rtvakl01srlo3qi7pscre9d2
45	/testlink/lib/keywords/keywordsEdit.php	1438514975	1438514975	4	m2rtvakl01srlo3qi7pscre9d2
46	/testlink/lib/keywords/keywordsEdit.php	1438514988	1438514988	4	m2rtvakl01srlo3qi7pscre9d2
47	/testlink/lib/keywords/keywordsEdit.php	1438514999	1438514999	4	m2rtvakl01srlo3qi7pscre9d2
48	/testlink/lib/keywords/keywordsEdit.php	1438515011	1438515011	4	m2rtvakl01srlo3qi7pscre9d2
49	/testlink/lib/keywords/keywordsEdit.php	1438515038	1438515038	4	m2rtvakl01srlo3qi7pscre9d2
50	/testlink/lib/keywords/keywordsEdit.php	1438515057	1438515057	4	m2rtvakl01srlo3qi7pscre9d2
51	/testlink/lib/keywords/keywordsEdit.php	1438515073	1438515073	4	m2rtvakl01srlo3qi7pscre9d2
52	/testlink/lib/cfields/cfieldsEdit.php	1438515744	1438515744	4	m2rtvakl01srlo3qi7pscre9d2
25	/testlink/lib/events/eventviewer.php	1438361909	1438361909	2	sgi9adg7qne23u4mdqf763j1q0
26	/testlink/lib/cfields/cfieldsView.php	1438361949	1438361949	2	sgi9adg7qne23u4mdqf763j1q0
27	/results/tcCreatedPerUserOnTestProject.php	1438361993	1438361993	2	sgi9adg7qne23u4mdqf763j1q0
28	/testlink/lib/results/printDocOptions.php	1438362007	1438362007	2	sgi9adg7qne23u4mdqf763j1q0
53	/testlink/login.php	1438566922	1438566922	4	m2rtvakl01srlo3qi7pscre9d2
54	/testlink/login.php	1438567383	1438567383	2	uhs2h73q0f4qo3bfaeibhb6ar5
55	/testlink/lib/general/mainPage.php	1438567384	1438567384	2	uhs2h73q0f4qo3bfaeibhb6ar5
56	/testlink/lib/testcases/archiveData.php	1438567403	1438567403	2	uhs2h73q0f4qo3bfaeibhb6ar5
57	/testlink/lib/testcases/listTestCases.php	1438567403	1438567403	2	uhs2h73q0f4qo3bfaeibhb6ar5
58	/testlink/login.php	1438567555	1438567555	1	18dfl6kdn0bssv2iu385ud9ff5
59	/testlink/logout.php	1438567645	1438567645	1	18dfl6kdn0bssv2iu385ud9ff5
60	/testlink/login.php	1438567656	1438567656	7	18dfl6kdn0bssv2iu385ud9ff5
61	/testlink/lib/usermanagement/userInfo.php	1438568190	1438568190	7	18dfl6kdn0bssv2iu385ud9ff5
62	/testlink/login.php	1438568201	1438568201	7	18dfl6kdn0bssv2iu385ud9ff5
63	/testlink/login.php	1438568259	1438568259	8	0467nbh17av87g5hipa3legj10
64	/testlink/lib/testcases/containerEdit.php	1438568886	1438568886	4	m2rtvakl01srlo3qi7pscre9d2
65	/testlink/lib/usermanagement/userInfo.php	1438569248	1438569248	8	0467nbh17av87g5hipa3legj10
66	/testlink/login.php	1438569309	1438569309	8	0467nbh17av87g5hipa3legj10
67	/testlink/lib/testcases/tcEdit.php	1438569495	1438569496	4	m2rtvakl01srlo3qi7pscre9d2
68	/testlink/lib/testcases/tcEdit.php	1438569891	1438569891	4	m2rtvakl01srlo3qi7pscre9d2
69	/testlink/lib/testcases/archiveData.php	1438569929	1438569929	8	0467nbh17av87g5hipa3legj10
70	/testlink/lib/testcases/tcEdit.php	1438570081	1438570081	4	m2rtvakl01srlo3qi7pscre9d2
71	/testlink/lib/plan/planEdit.php	1438570972	1438570972	4	m2rtvakl01srlo3qi7pscre9d2
72	/testlink/lib/plan/planEdit.php	1438571048	1438571048	4	m2rtvakl01srlo3qi7pscre9d2
73	/testlink/lib/testcases/tcEdit.php	1438571554	1438571554	4	m2rtvakl01srlo3qi7pscre9d2
74	/testlink/lib/plan/planAddTC.php	1438571636	1438571637	4	m2rtvakl01srlo3qi7pscre9d2
75	/testlink/lib/plan/planAddTC.php	1438571638	1438571638	4	m2rtvakl01srlo3qi7pscre9d2
76	/testlink/lib/plan/planAddTC.php	1438571647	1438571648	4	m2rtvakl01srlo3qi7pscre9d2
77	/testlink/lib/testcases/tcEdit.php	1438571675	1438571675	4	m2rtvakl01srlo3qi7pscre9d2
78	/testlink/lib/plan/planAddTC.php	1438571710	1438571710	4	m2rtvakl01srlo3qi7pscre9d2
79	/testlink/lib/plan/planAddTC.php	1438571721	1438571721	4	m2rtvakl01srlo3qi7pscre9d2
80	/testlink/lib/plan/buildEdit.php	1438572592	1438572592	4	m2rtvakl01srlo3qi7pscre9d2
81	/testlink/lib/plan/buildEdit.php	1438572639	1438572639	4	m2rtvakl01srlo3qi7pscre9d2
82	/testlink/lib/results/printDocument.php	1438573178	1438573178	4	m2rtvakl01srlo3qi7pscre9d2
83	/testlink/lib/plan/planAddTC.php	1438573219	1438573219	4	m2rtvakl01srlo3qi7pscre9d2
84	/testlink/lib/plan/planAddTC.php	1438573220	1438573220	4	m2rtvakl01srlo3qi7pscre9d2
85	/testlink/lib/plan/planAddTC.php	1438573287	1438573288	4	m2rtvakl01srlo3qi7pscre9d2
86	/testlink/lib/plan/buildEdit.php	1438573328	1438573328	4	m2rtvakl01srlo3qi7pscre9d2
87	/testlink/lib/plan/planAddTC.php	1438573367	1438573367	4	m2rtvakl01srlo3qi7pscre9d2
88	/testlink/lib/plan/planAddTC.php	1438573394	1438573394	4	m2rtvakl01srlo3qi7pscre9d2
89	/testlink/login.php	1438579607	1438579607	4	m2rtvakl01srlo3qi7pscre9d2
90	/testlink/lib/plan/planAddTC.php	1438581206	1438581206	4	m2rtvakl01srlo3qi7pscre9d2
91	/testlink/login.php	1438581252	1438581252	7	18dfl6kdn0bssv2iu385ud9ff5
92	/testlink/lib/testcases/tcEdit.php	1438582472	1438582472	4	m2rtvakl01srlo3qi7pscre9d2
93	/testlink/lib/testcases/tcEdit.php	1438582493	1438582493	4	m2rtvakl01srlo3qi7pscre9d2
94	/testlink/login.php	1438587125	1438587125	8	0467nbh17av87g5hipa3legj10
95	/testlink/login.php	1438591860	1438591860	3	795p463060f1demtsq0eemgqk4
96	/testlink/login.php	1438591908	1438591908	1	1h8cctm568tapf7esebpjbm4t3
97	/testlink/login.php	1438594203	1438594203	4	m2rtvakl01srlo3qi7pscre9d2
98	/testlink/login.php	1438596329	1438596329	6	ghk19tuv7vecvpq8ktt1lfreq7
99	/testlink/lib/usermanagement/usersEdit.php	1438596369	1438596369	6	ghk19tuv7vecvpq8ktt1lfreq7
100	/testlink/lib/usermanagement/usersView.php	1438596369	1438596369	6	ghk19tuv7vecvpq8ktt1lfreq7
101	/testlink/lib/usermanagement/usersEdit.php	1438596374	1438596374	6	ghk19tuv7vecvpq8ktt1lfreq7
102	/testlink/lib/usermanagement/usersAssign.php	1438596378	1438596378	6	ghk19tuv7vecvpq8ktt1lfreq7
103	/testlink/login.php	1438656027	1438656027	2	rp375ocsgg1vgdp60sroqliqk7
104	/testlink/lib/general/mainPage.php	1438656027	1438656027	2	rp375ocsgg1vgdp60sroqliqk7
105	/testlink/login.php	1438657221	1438657221	2	q0roj4af3oup114t0biam73lh3
106	/testlink/lib/general/mainPage.php	1438657222	1438657222	2	q0roj4af3oup114t0biam73lh3
107	/testlink/logout.php	1438657235	1438657235	2	rp375ocsgg1vgdp60sroqliqk7
108	/testlink/login.php	1438657240	1438657240	2	rp375ocsgg1vgdp60sroqliqk7
109	/testlink/lib/general/mainPage.php	1438657241	1438657241	2	rp375ocsgg1vgdp60sroqliqk7
110	/testlink/logout.php	1438659161	1438659161	2	q0roj4af3oup114t0biam73lh3
111	/testlink/login.php	1438661427	1438661427	2	rp375ocsgg1vgdp60sroqliqk7
112	/testlink/lib/general/mainPage.php	1438661428	1438661428	2	rp375ocsgg1vgdp60sroqliqk7
113	/testlink/logout.php	1438661624	1438661624	2	rp375ocsgg1vgdp60sroqliqk7
114	/testlink/login.php	1438661628	1438661628	2	rp375ocsgg1vgdp60sroqliqk7
115	/testlink/lib/general/mainPage.php	1438661629	1438661629	2	rp375ocsgg1vgdp60sroqliqk7
116	/logout.php	1438661642	1438661642	2	rp375ocsgg1vgdp60sroqliqk7
117	/login.php	1438661645	1438661645	2	rp375ocsgg1vgdp60sroqliqk7
118	/lib/general/mainPage.php	1438661646	1438661646	2	rp375ocsgg1vgdp60sroqliqk7
119	/login.php	1438663768	1438663768	2	pov6ptdrdfd9qi4scqb6jd7290
120	/lib/general/mainPage.php	1438663768	1438663768	2	pov6ptdrdfd9qi4scqb6jd7290
121	/logout.php	1438665263	1438665263	2	pov6ptdrdfd9qi4scqb6jd7290
122	/login.php	1438665362	1438665362	4	a3qs1k3hl96b3q5noefgm0vor3
123	/login.php	1438665430	1438665430	0	\N
124	/login.php	1438665438	1438665438	6	gk6makci52fqd30bi2r77k4rc3
125	/lib/general/mainPage.php	1438665439	1438665439	6	gk6makci52fqd30bi2r77k4rc3
126	/login.php	1438665441	1438665441	0	\N
127	/login.php	1438665454	1438665454	5	f5paeomd0re9dh5d5cv9f0o6s2
128	/login.php	1438665492	1438665492	2	pov6ptdrdfd9qi4scqb6jd7290
129	/lib/general/mainPage.php	1438665493	1438665493	2	pov6ptdrdfd9qi4scqb6jd7290
130	/testlink/login.php	1438666146	1438666146	8	gsep3ttvf96j5h4fc9lqri0ak4
131	/logout.php	1438668606	1438668606	5	f5paeomd0re9dh5d5cv9f0o6s2
132	/login.php	1438669003	1438669003	5	f5paeomd0re9dh5d5cv9f0o6s2
133	/login.php	1438669048	1438669048	2	pov6ptdrdfd9qi4scqb6jd7290
134	/lib/general/mainPage.php	1438669049	1438669049	2	pov6ptdrdfd9qi4scqb6jd7290
135	/login.php	1438669318	1438669318	2	57917745sd9su8qba0qh2jrlv5
136	/lib/general/mainPage.php	1438669324	1438669324	2	57917745sd9su8qba0qh2jrlv5
137	/testlink/login.php	1438669469	1438669469	4	m2rtvakl01srlo3qi7pscre9d2
138	/logout.php	1438669486	1438669486	5	f5paeomd0re9dh5d5cv9f0o6s2
139	/login.php	1438669492	1438669492	5	f5paeomd0re9dh5d5cv9f0o6s2
140	/login.php	1438669520	1438669520	6	gk6makci52fqd30bi2r77k4rc3
141	/lib/general/mainPage.php	1438669521	1438669521	6	gk6makci52fqd30bi2r77k4rc3
142	/logout.php	1438669524	1438669524	2	pov6ptdrdfd9qi4scqb6jd7290
143	/logout.php	1438669545	1438669545	6	gk6makci52fqd30bi2r77k4rc3
144	/login.php	1438669551	1438669551	2	pov6ptdrdfd9qi4scqb6jd7290
145	/lib/general/mainPage.php	1438669552	1438669552	2	pov6ptdrdfd9qi4scqb6jd7290
146	/login.php	1438669556	1438669556	6	gk6makci52fqd30bi2r77k4rc3
147	/lib/general/mainPage.php	1438669556	1438669556	6	gk6makci52fqd30bi2r77k4rc3
148	/login.php	1438669608	1438669608	5	at7nmccl8agvjomjvrv52nkir4
149	/lib/requirements/reqSpecListTree.php	1438669624	1438669624	6	gk6makci52fqd30bi2r77k4rc3
150	/testlink/logout.php	1438670392	1438670392	4	m2rtvakl01srlo3qi7pscre9d2
151	/logout.php	1438670406	1438670406	2	pov6ptdrdfd9qi4scqb6jd7290
152	/login.php	1438670413	1438670413	2	pov6ptdrdfd9qi4scqb6jd7290
153	/lib/general/mainPage.php	1438670414	1438670414	2	pov6ptdrdfd9qi4scqb6jd7290
154	/login.php	1438670869	1438670869	0	\N
155	/login.php	1438670893	1438670893	5	pgiuu5hipij649onrpk4beoqb6
156	/logout.php	1438670898	1438670898	2	57917745sd9su8qba0qh2jrlv5
157	/login.php	1438670902	1438670902	2	57917745sd9su8qba0qh2jrlv5
158	/lib/general/mainPage.php	1438670902	1438670902	2	57917745sd9su8qba0qh2jrlv5
159	/login.php	1438671146	1438671146	2	gefq6st283i9pe919q8qqp4hv6
234	/login.php	1439280053	1439280053	4	tq6tkvutifpfngft6h0hd0c5n6
235	/login.php	1439282752	1439282752	2	7g6q17am6j4ord5kpvn1u3m8j0
160	/lib/general/mainPage.php	1438671147	1438671147	2	gefq6st283i9pe919q8qqp4hv6
161	/lib/plan/planView.php	1438671333	1438671333	2	pov6ptdrdfd9qi4scqb6jd7290
162	/lib/testcases/listTestCases.php	1438671344	1438671344	2	pov6ptdrdfd9qi4scqb6jd7290
163	/lib/testcases/archiveData.php	1438671345	1438671345	2	pov6ptdrdfd9qi4scqb6jd7290
164	/lib/execute/execNavigator.php	1438671385	1438671385	2	pov6ptdrdfd9qi4scqb6jd7290
165	/lib/execute/execDashboard.php	1438671385	1438671385	2	pov6ptdrdfd9qi4scqb6jd7290
166	/login.php	1438685851	1438685851	2	gefq6st283i9pe919q8qqp4hv6
167	/lib/general/mainPage.php	1438685852	1438685852	2	gefq6st283i9pe919q8qqp4hv6
168	/testlink/login.php	1438741282	1438741282	2	e8d0k5vmnf248kio06806f5ni5
169	/testlink/lib/general/mainPage.php	1438741283	1438741283	2	e8d0k5vmnf248kio06806f5ni5
170	/login.php	1438741522	1438741522	2	kcimqcql9b3p1vd689mk87hd45
171	/lib/general/mainPage.php	1438741523	1438741523	2	kcimqcql9b3p1vd689mk87hd45
172	/login.php	1438767183	1438767183	4	njohsjjf8qes14rabdkftgaij6
173	/login.php	1438792717	1438792717	5	ktefi24ekgau4d0ltma369n4j0
174	/login.php	1438827476	1438827476	4	njohsjjf8qes14rabdkftgaij6
175	/logout.php	1438827856	1438827856	4	njohsjjf8qes14rabdkftgaij6
176	/login.php	1438827860	1438827860	1	njohsjjf8qes14rabdkftgaij6
177	/lib/usermanagement/usersEdit.php	1438827900	1438827900	1	njohsjjf8qes14rabdkftgaij6
178	/login.php	1438828199	1438828199	2	57917745sd9su8qba0qh2jrlv5
179	/login.php	1438828200	1438828200	9	l5c1e4qo6pnoo0pvki2keldjs6
180	/lib/general/mainPage.php	1438828200	1438828200	2	57917745sd9su8qba0qh2jrlv5
181	/testlink/login.php	1438834368	1438834368	7	18dfl6kdn0bssv2iu385ud9ff5
182	/login.php	1438866138	1438866138	2	vgq0qp7hf7g6lkabimcf167k61
183	/lib/general/mainPage.php	1438866139	1438866139	2	vgq0qp7hf7g6lkabimcf167k61
184	/login.php	1438905760	1438905760	2	vgq0qp7hf7g6lkabimcf167k61
185	/lib/general/mainPage.php	1438905761	1438905761	2	vgq0qp7hf7g6lkabimcf167k61
186	/login.php	1438912739	1438912739	0	\N
187	/login.php	1438912749	1438912749	7	bgrnv8tgg4mlsjtg9pdca7t6u1
188	/login.php	1438914556	1438914556	2	vgq0qp7hf7g6lkabimcf167k61
189	/lib/general/mainPage.php	1438914557	1438914557	2	vgq0qp7hf7g6lkabimcf167k61
190	/login.php	1438931128	1438931128	2	57917745sd9su8qba0qh2jrlv5
191	/lib/general/mainPage.php	1438931129	1438931129	2	57917745sd9su8qba0qh2jrlv5
192	/login.php	1438950145	1438950145	2	vgq0qp7hf7g6lkabimcf167k61
193	/lib/general/mainPage.php	1438950146	1438950146	2	vgq0qp7hf7g6lkabimcf167k61
194	/lib/testcases/listTestCases.php	1438950178	1438950178	2	vgq0qp7hf7g6lkabimcf167k61
195	/lib/testcases/archiveData.php	1438950178	1438950178	2	vgq0qp7hf7g6lkabimcf167k61
196	/login.php	1438958248	1438958248	2	hm8aqm6c32i4talfs5gquvjqe1
197	/lib/general/mainPage.php	1438958249	1438958249	2	hm8aqm6c32i4talfs5gquvjqe1
198	/login.php	1439172437	1439172437	4	tq6tkvutifpfngft6h0hd0c5n6
199	/lib/usermanagement/usersEdit.php	1439172450	1439172450	4	tq6tkvutifpfngft6h0hd0c5n6
200	/logout.php	1439172474	1439172474	4	tq6tkvutifpfngft6h0hd0c5n6
201	/login.php	1439172477	1439172477	4	tq6tkvutifpfngft6h0hd0c5n6
202	/login.php	1439175882	1439175882	2	7g6q17am6j4ord5kpvn1u3m8j0
203	/lib/general/mainPage.php	1439175882	1439175882	2	7g6q17am6j4ord5kpvn1u3m8j0
204	/login.php	1439185461	1439185461	4	tq6tkvutifpfngft6h0hd0c5n6
205	/lib/keywords/keywordsEdit.php	1439186523	1439186523	4	tq6tkvutifpfngft6h0hd0c5n6
206	/lib/keywords/keywordsEdit.php	1439186566	1439186566	4	tq6tkvutifpfngft6h0hd0c5n6
207	/lib/keywords/keywordsEdit.php	1439186785	1439186785	4	tq6tkvutifpfngft6h0hd0c5n6
208	/lib/keywords/keywordsEdit.php	1439186836	1439186836	4	tq6tkvutifpfngft6h0hd0c5n6
209	/lib/keywords/keywordsEdit.php	1439186851	1439186851	4	tq6tkvutifpfngft6h0hd0c5n6
210	/lib/keywords/keywordsEdit.php	1439186885	1439186885	4	tq6tkvutifpfngft6h0hd0c5n6
211	/lib/keywords/keywordsEdit.php	1439186897	1439186897	4	tq6tkvutifpfngft6h0hd0c5n6
212	/lib/keywords/keywordsEdit.php	1439187343	1439187343	4	tq6tkvutifpfngft6h0hd0c5n6
213	/login.php	1439189284	1439189284	7	bgrnv8tgg4mlsjtg9pdca7t6u1
214	/lib/cfields/cfieldsEdit.php	1439193610	1439193610	4	tq6tkvutifpfngft6h0hd0c5n6
215	/lib/cfields/cfieldsEdit.php	1439193629	1439193629	4	tq6tkvutifpfngft6h0hd0c5n6
216	/lib/cfields/cfieldsEdit.php	1439196361	1439196361	4	tq6tkvutifpfngft6h0hd0c5n6
217	/lib/cfields/cfieldsEdit.php	1439196367	1439196367	4	tq6tkvutifpfngft6h0hd0c5n6
218	/lib/keywords/keywordsEdit.php	1439200469	1439200469	4	tq6tkvutifpfngft6h0hd0c5n6
219	/login.php	1439201296	1439201296	4	85q3j98td0k7ub76kog006mhq0
220	/login.php	1439201436	1439201436	4	ec3tltver313g6d52rqhhdl4k4
221	/logout.php	1439201590	1439201590	4	ec3tltver313g6d52rqhhdl4k4
222	/login.php	1439201596	1439201596	1	ec3tltver313g6d52rqhhdl4k4
223	/login.php	1439201835	1439201835	4	buvele4m0v9kes352st1k9cp40
224	/login.php	1439218013	1439218013	4	buvele4m0v9kes352st1k9cp40
225	/login.php	1439259454	1439259454	7	bgrnv8tgg4mlsjtg9pdca7t6u1
226	/login.php	1439259573	1439259573	0	\N
227	/login.php	1439259746	1439259746	0	\N
228	/lostPassword.php	1439259767	1439259767	0	\N
229	/login.php	1439259884	1439259884	0	\N
230	/login.php	1439259895	1439259895	8	rcks6fmerf6177nme8s6uqv3f5
231	/login.php	1439261040	1439261040	0	\N
232	/login.php	1439261044	1439261044	4	tq6tkvutifpfngft6h0hd0c5n6
233	/login.php	1439280050	1439280050	0	\N
236	/lib/general/mainPage.php	1439282752	1439282752	2	7g6q17am6j4ord5kpvn1u3m8j0
237	/lib/testcases/archiveData.php	1439282757	1439282757	2	7g6q17am6j4ord5kpvn1u3m8j0
238	/lib/testcases/listTestCases.php	1439282757	1439282757	2	7g6q17am6j4ord5kpvn1u3m8j0
239	/login.php	1439282783	1439282783	4	buvele4m0v9kes352st1k9cp40
240	/lib/testcases/tcEdit.php	1439282836	1439282836	2	7g6q17am6j4ord5kpvn1u3m8j0
241	/login.php	1439284541	1439284541	4	tq6tkvutifpfngft6h0hd0c5n6
242	/login.php	1439286768	1439286768	4	buvele4m0v9kes352st1k9cp40
243	/lib/testcases/tcEdit.php	1439286781	1439286781	4	buvele4m0v9kes352st1k9cp40
244	/login.php	1439287021	1439287021	4	8o7fh6dbsp0k8ihh1ulhbprnv6
245	/login.php	1439287111	1439287111	4	blbeg5umlfqmav4577baj9epe6
246	/login.php	1439298839	1439298839	2	7g6q17am6j4ord5kpvn1u3m8j0
247	/lib/general/mainPage.php	1439298840	1439298840	2	7g6q17am6j4ord5kpvn1u3m8j0
248	/lib/plan/planView.php	1439298997	1439298997	2	7g6q17am6j4ord5kpvn1u3m8j0
249	/login.php	1439520284	1439520284	4	oo8a6l5sbv5bhgros3ur8qfdv0
250	/lib/usermanagement/usersEdit.php	1439520300	1439520300	4	oo8a6l5sbv5bhgros3ur8qfdv0
251	/login.php	1439534391	1439534391	2	7g6q17am6j4ord5kpvn1u3m8j0
252	/lib/general/mainPage.php	1439534391	1439534392	2	7g6q17am6j4ord5kpvn1u3m8j0
253	/lib/usermanagement/userInfo.php	1439534396	1439534396	2	7g6q17am6j4ord5kpvn1u3m8j0
254	/login.php	1439534425	1439534425	4	46m3c85g05gjmuge1vdac02os7
255	/lib/usermanagement/userInfo.php	1439534447	1439534447	4	46m3c85g05gjmuge1vdac02os7
256	/login.php	1439534454	1439534454	4	46m3c85g05gjmuge1vdac02os7
257	/login.php	1439538106	1439538106	4	46m3c85g05gjmuge1vdac02os7
258	/linkto.php	1439538121	1439538121	4	46m3c85g05gjmuge1vdac02os7
259	/lib/testcases/containerEdit.php	1439540921	1439540921	4	46m3c85g05gjmuge1vdac02os7
260	/lib/testcases/containerEdit.php	1439542973	1439542973	4	46m3c85g05gjmuge1vdac02os7
261	/login.php	1439744403	1439744403	2	7g6q17am6j4ord5kpvn1u3m8j0
262	/lib/general/mainPage.php	1439744404	1439744404	2	7g6q17am6j4ord5kpvn1u3m8j0
263	/lib/usermanagement/usersView.php	1439744416	1439744416	2	7g6q17am6j4ord5kpvn1u3m8j0
264	/lib/usermanagement/usersEdit.php	1439744423	1439744423	2	7g6q17am6j4ord5kpvn1u3m8j0
265	/lib/testcases/listTestCases.php	1439744489	1439744489	2	7g6q17am6j4ord5kpvn1u3m8j0
266	/lib/testcases/archiveData.php	1439744489	1439744489	2	7g6q17am6j4ord5kpvn1u3m8j0
267	/lib/usermanagement/usersAssign.php	1439744670	1439744670	2	7g6q17am6j4ord5kpvn1u3m8j0
268	/testlink/login.php	1439774921	1439774921	8	huamc5klp48jkrd6md7id312m5
269	/testlink/lib/testcases/tcEdit.php	1439777964	1439777964	8	huamc5klp48jkrd6md7id312m5
270	/testlink/linkto.php	1439779647	1439779647	8	huamc5klp48jkrd6md7id312m5
271	/testlink/lib/testcases/tcEdit.php	1439779858	1439779858	8	huamc5klp48jkrd6md7id312m5
272	/login.php	1439780109	1439780109	2	7g6q17am6j4ord5kpvn1u3m8j0
273	/lib/general/mainPage.php	1439780109	1439780109	2	7g6q17am6j4ord5kpvn1u3m8j0
274	/testlink/lib/testcases/tcEdit.php	1439780568	1439780568	8	huamc5klp48jkrd6md7id312m5
275	/testlink/lib/testcases/tcEdit.php	1439780767	1439780767	8	huamc5klp48jkrd6md7id312m5
276	/testlink/login.php	1439784759	1439784759	8	huamc5klp48jkrd6md7id312m5
277	/login.php	1439792048	1439792048	4	cbpbb7aaeaefqiqakg4gtelun7
278	/login.php	1439792148	1439792148	8	qh0ps6hs59if86gehj87e75ul2
279	/login.php	1439793307	1439793307	7	bgrnv8tgg4mlsjtg9pdca7t6u1
280	/login.php	1439799702	1439799702	4	cbpbb7aaeaefqiqakg4gtelun7
281	/login.php	1439802868	1439802868	7	kecnasq9h0qvn5ghel70umdt62
282	/lib/general/mainPage.php	1439883465	1439883465	2	7g6q17am6j4ord5kpvn1u3m8j0
283	/lib/project/projectEdit.php	1439883465	1439883465	2	7g6q17am6j4ord5kpvn1u3m8j0
284	/logout.php	1439883468	1439883468	2	7g6q17am6j4ord5kpvn1u3m8j0
285	/login.php	1439883472	1439883472	2	7g6q17am6j4ord5kpvn1u3m8j0
286	/lib/general/mainPage.php	1439883473	1439883473	2	7g6q17am6j4ord5kpvn1u3m8j0
287	/lib/cfields/cfieldsView.php	1439883679	1439883679	2	7g6q17am6j4ord5kpvn1u3m8j0
288	/lib/usermanagement/usersView.php	1439883686	1439883686	2	7g6q17am6j4ord5kpvn1u3m8j0
289	/lib/usermanagement/userInfo.php	1439883687	1439883687	2	7g6q17am6j4ord5kpvn1u3m8j0
290	/lib/usermanagement/userInfo.php	1439883936	1439883937	2	7g6q17am6j4ord5kpvn1u3m8j0
291	/lib/usermanagement/usersEdit.php	1439884145	1439884146	2	7g6q17am6j4ord5kpvn1u3m8j0
292	/lib/usermanagement/usersEdit.php	1439884163	1439884163	2	7g6q17am6j4ord5kpvn1u3m8j0
293	/lib/usermanagement/usersEdit.php	1439884247	1439884247	2	7g6q17am6j4ord5kpvn1u3m8j0
294	/lib/project/projectEdit.php	1439886878	1439886878	4	lutvl8ad8cuks12736um5crcv0
295	/login.php	1439888271	1439888271	0	\N
296	/login.php	1439888282	1439888282	0	\N
297	/login.php	1439888301	1439888301	0	\N
298	/login.php	1439888459	1439888459	5	hl70t2mo7523kqcvc7dal6ud12
299	/login.php	1439888489	1439888489	0	\N
300	/login.php	1439888501	1439888501	0	\N
301	/login.php	1439888507	1439888507	0	\N
302	/login.php	1439888529	1439888529	9	8hemn4rs51sb2qeu8pq5c9ii46
303	/lib/usermanagement/userInfo.php	1439888574	1439888574	9	8hemn4rs51sb2qeu8pq5c9ii46
304	/lib/usermanagement/usersEdit.php	1439888600	1439888600	9	8hemn4rs51sb2qeu8pq5c9ii46
305	/lib/usermanagement/usersEdit.php	1439888613	1439888613	9	8hemn4rs51sb2qeu8pq5c9ii46
306	/lib/usermanagement/usersEdit.php	1439888627	1439888627	9	8hemn4rs51sb2qeu8pq5c9ii46
307	/lib/usermanagement/usersView.php	1439888627	1439888627	9	8hemn4rs51sb2qeu8pq5c9ii46
308	/login.php	1439888633	1439888633	9	8hemn4rs51sb2qeu8pq5c9ii46
309	/lib/testcases/tcEdit.php	1439891778	1439891778	8	bnoioaerqtts97geqhhi1uugo6
310	/lib/keywords/keywordsAssign.php	1439892773	1439892773	7	bgrnv8tgg4mlsjtg9pdca7t6u1
311	/lib/keywords/keywordsAssign.php	1439892857	1439892857	7	bgrnv8tgg4mlsjtg9pdca7t6u1
312	/lib/keywords/keywordsAssign.php	1439892860	1439892860	7	bgrnv8tgg4mlsjtg9pdca7t6u1
313	/lib/keywords/keywordsAssign.php	1439892862	1439892862	7	bgrnv8tgg4mlsjtg9pdca7t6u1
314	/lib/keywords/keywordsAssign.php	1439892874	1439892874	7	bgrnv8tgg4mlsjtg9pdca7t6u1
315	/lib/keywords/keywordsAssign.php	1439893032	1439893032	7	bgrnv8tgg4mlsjtg9pdca7t6u1
\.


--
-- Name: h5tl_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_transactions_id_seq', 315, true);


--
-- Data for Name: h5tl_user_assignments; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_user_assignments (id, type, feature_id, user_id, build_id, deadline_ts, assigner_id, creation_ts, status) FROM stdin;
1	1	1	4	3	2015-08-13 03:44:27.39735	4	2015-08-03 03:44:27	1
2	1	2	7	3	2015-08-13 03:44:27.399672	4	2015-08-03 03:44:27	1
3	1	1	5	3	2015-08-13 09:31:47.534934	4	2015-08-03 09:31:47	1
\.


--
-- Name: h5tl_user_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_user_assignments_id_seq', 3, true);


--
-- Data for Name: h5tl_user_group; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_user_group (id, title, description, owner_id, testproject_id) FROM stdin;
\.


--
-- Data for Name: h5tl_user_group_assign; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_user_group_assign (usergroup_id, user_id) FROM stdin;
\.


--
-- Name: h5tl_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_user_group_id_seq', 1, false);


--
-- Data for Name: h5tl_user_testplan_roles; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_user_testplan_roles (user_id, testplan_id, role_id) FROM stdin;
\.


--
-- Data for Name: h5tl_user_testproject_roles; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_user_testproject_roles (user_id, testproject_id, role_id) FROM stdin;
\.


--
-- Data for Name: h5tl_users; Type: TABLE DATA; Schema: public; Owner: tladmin
--

COPY h5tl_users (id, login, password, role_id, email, first, last, locale, default_testproject_id, active, script_key, cookie_string, auth_method) FROM stdin;
1	admin	819a07afa4abc8660ec9042038a8c597	8	tladmin@acadine.com	Testlink	Administrator	en_GB	\N	1	6ffca592bfd48b0f46e1594b3498121a	b94536fe7ccb81780ff60ea65c1f6c546b34ab467c506a127d6eb1e0f6a62a94	
3	brian.huang	819a07afa4abc8660ec9042038a8c597	8	brian.huang@acadine.com	brian	huang	en_GB	\N	1	\N	0f13bca76f6cbb7e7c30a4f5c35b8706664bb328b1bfb5cd70bbb9a2c03b875b	
7	peipei.cheng	34317be00312038ff242a10887eed9d1	8	peipei.cheng@acadine.com	peipei	cheng	en_GB	\N	1	\N	0d6c5343fa3dc9f91ba3f6839ac6c995fa02e175c44ccda0972291d9524b2fdc	
6	eric.chang	819a07afa4abc8660ec9042038a8c597	8	eric.chang@acadine.com	eric	chang	en_US	\N	1	\N	3ea31295359b6c97f8f30ea981c3968bcb8b2a0205ae0cb4c8eb5de309f45f52	
4	enpei.chu	6292677c8a2acac465c5c28b1da7ff75	8	enpei.chu@acadine.com	enpei	chu	en_GB	\N	1	\N	cbb3c0bc9e1a12ea461a72c3c4be69b713da0a504bcd788e1d7c69c93436fff2	
2	owen.ouyang	819a07afa4abc8660ec9042038a8c597	8	owen.ouyang@acadine.com	oo	oo	zh_CN	\N	1	10fb2560683dc141258dbce4c21a37cf	b3e17ae30c84f8be0dccaccb6fa4593f0a14c13d3818f050a554f9bc77a4b904	DB
8	xueqin.shen	19a339dff19c7da0a8c088e3b7ca420b	6	xueqin.shen@acadine.com	xueqin	shen	en_GB	\N	1	\N	604166c0487dff94de557488336a314a0aacf8951a44b4d3e46c0dba622354d8	
5	hubert.lu	819a07afa4abc8660ec9042038a8c597	6	hubert.lu@acadine.com	hubert	lu	en_GB	\N	1	\N	6812fbcd7e15e0a28e99c56b3590e0af67986091484b23b81456349e8980efab	
9	hermes.cheng	c18123554c59020989e49309165493c5	6	hermes.cheng@acadine.com	hermes	cheng	en_GB	\N	1	\N	0f72a35b25babe3536942da6c3fbbff6abc6db19dd12ca237208c78f4336299f	
\.


--
-- Name: h5tl_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_users_id_seq', 9, true);


--
-- Name: h5tl_assignment_status_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_assignment_status
    ADD CONSTRAINT h5tl_assignment_status_pkey PRIMARY KEY (id);


--
-- Name: h5tl_assignment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_assignment_types
    ADD CONSTRAINT h5tl_assignment_types_pkey PRIMARY KEY (id);


--
-- Name: h5tl_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_attachments
    ADD CONSTRAINT h5tl_attachments_pkey PRIMARY KEY (id);


--
-- Name: h5tl_builds_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_builds
    ADD CONSTRAINT h5tl_builds_pkey PRIMARY KEY (id);


--
-- Name: h5tl_cfield_build_design_values_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_cfield_build_design_values
    ADD CONSTRAINT h5tl_cfield_build_design_values_pkey PRIMARY KEY (field_id, node_id);


--
-- Name: h5tl_cfield_design_values_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_cfield_design_values
    ADD CONSTRAINT h5tl_cfield_design_values_pkey PRIMARY KEY (field_id, node_id);


--
-- Name: h5tl_cfield_execution_values_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_cfield_execution_values
    ADD CONSTRAINT h5tl_cfield_execution_values_pkey PRIMARY KEY (field_id, execution_id, testplan_id, tcversion_id);


--
-- Name: h5tl_cfield_node_types_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_cfield_node_types
    ADD CONSTRAINT h5tl_cfield_node_types_pkey PRIMARY KEY (field_id, node_type_id);


--
-- Name: h5tl_cfield_testplan_design_values_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_cfield_testplan_design_values
    ADD CONSTRAINT h5tl_cfield_testplan_design_values_pkey PRIMARY KEY (field_id, link_id);


--
-- Name: h5tl_cfield_testprojects_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_cfield_testprojects
    ADD CONSTRAINT h5tl_cfield_testprojects_pkey PRIMARY KEY (field_id, testproject_id);


--
-- Name: h5tl_custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_custom_fields
    ADD CONSTRAINT h5tl_custom_fields_pkey PRIMARY KEY (id);


--
-- Name: h5tl_db_version_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_db_version
    ADD CONSTRAINT h5tl_db_version_pkey PRIMARY KEY (version);


--
-- Name: h5tl_events_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_events
    ADD CONSTRAINT h5tl_events_pkey PRIMARY KEY (id);


--
-- Name: h5tl_execution_bugs_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_execution_bugs
    ADD CONSTRAINT h5tl_execution_bugs_pkey PRIMARY KEY (execution_id, bug_id);


--
-- Name: h5tl_execution_tcsteps_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_execution_tcsteps
    ADD CONSTRAINT h5tl_execution_tcsteps_pkey PRIMARY KEY (id);


--
-- Name: h5tl_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_executions
    ADD CONSTRAINT h5tl_executions_pkey PRIMARY KEY (id);


--
-- Name: h5tl_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_inventory
    ADD CONSTRAINT h5tl_inventory_pkey PRIMARY KEY (id);


--
-- Name: h5tl_issuetrackers_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_issuetrackers
    ADD CONSTRAINT h5tl_issuetrackers_pkey PRIMARY KEY (id);


--
-- Name: h5tl_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_keywords
    ADD CONSTRAINT h5tl_keywords_pkey PRIMARY KEY (id);


--
-- Name: h5tl_milestones_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_milestones
    ADD CONSTRAINT h5tl_milestones_pkey PRIMARY KEY (id);


--
-- Name: h5tl_node_types_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_node_types
    ADD CONSTRAINT h5tl_node_types_pkey PRIMARY KEY (id);


--
-- Name: h5tl_nodes_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_nodes_hierarchy
    ADD CONSTRAINT h5tl_nodes_hierarchy_pkey PRIMARY KEY (id);


--
-- Name: h5tl_object_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_object_keywords
    ADD CONSTRAINT h5tl_object_keywords_pkey PRIMARY KEY (id);


--
-- Name: h5tl_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_platforms
    ADD CONSTRAINT h5tl_platforms_pkey PRIMARY KEY (id);


--
-- Name: h5tl_req_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_req_relations
    ADD CONSTRAINT h5tl_req_relations_pkey PRIMARY KEY (id);


--
-- Name: h5tl_req_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_req_revisions
    ADD CONSTRAINT h5tl_req_revisions_pkey PRIMARY KEY (id);


--
-- Name: h5tl_req_specs_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_req_specs
    ADD CONSTRAINT h5tl_req_specs_pkey PRIMARY KEY (id);


--
-- Name: h5tl_req_specs_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_req_specs_revisions
    ADD CONSTRAINT h5tl_req_specs_revisions_pkey PRIMARY KEY (id);


--
-- Name: h5tl_req_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_req_versions
    ADD CONSTRAINT h5tl_req_versions_pkey PRIMARY KEY (id);


--
-- Name: h5tl_reqmgrsystems_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_reqmgrsystems
    ADD CONSTRAINT h5tl_reqmgrsystems_pkey PRIMARY KEY (id);


--
-- Name: h5tl_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_requirements
    ADD CONSTRAINT h5tl_requirements_pkey PRIMARY KEY (id);


--
-- Name: h5tl_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_rights
    ADD CONSTRAINT h5tl_rights_pkey PRIMARY KEY (id);


--
-- Name: h5tl_risk_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_risk_assignments
    ADD CONSTRAINT h5tl_risk_assignments_pkey PRIMARY KEY (id);


--
-- Name: h5tl_role_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_role_rights
    ADD CONSTRAINT h5tl_role_rights_pkey PRIMARY KEY (role_id, right_id);


--
-- Name: h5tl_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_roles
    ADD CONSTRAINT h5tl_roles_pkey PRIMARY KEY (id);


--
-- Name: h5tl_tcsteps_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_tcsteps
    ADD CONSTRAINT h5tl_tcsteps_pkey PRIMARY KEY (id);


--
-- Name: h5tl_tcversions_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_tcversions
    ADD CONSTRAINT h5tl_tcversions_pkey PRIMARY KEY (id);


--
-- Name: h5tl_testcase_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_testcase_keywords
    ADD CONSTRAINT h5tl_testcase_keywords_pkey PRIMARY KEY (testcase_id, keyword_id);


--
-- Name: h5tl_testcase_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_testcase_relations
    ADD CONSTRAINT h5tl_testcase_relations_pkey PRIMARY KEY (id);


--
-- Name: h5tl_testplan_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_testplan_platforms
    ADD CONSTRAINT h5tl_testplan_platforms_pkey PRIMARY KEY (id);


--
-- Name: h5tl_testplan_tcversions_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_testplan_tcversions
    ADD CONSTRAINT h5tl_testplan_tcversions_pkey PRIMARY KEY (id);


--
-- Name: h5tl_testplans_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_testplans
    ADD CONSTRAINT h5tl_testplans_pkey PRIMARY KEY (id);


--
-- Name: h5tl_testproject_issuetracker_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_testproject_issuetracker
    ADD CONSTRAINT h5tl_testproject_issuetracker_pkey PRIMARY KEY (testproject_id);


--
-- Name: h5tl_testproject_reqmgrsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_testproject_reqmgrsystem
    ADD CONSTRAINT h5tl_testproject_reqmgrsystem_pkey PRIMARY KEY (testproject_id);


--
-- Name: h5tl_testprojects_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_testprojects
    ADD CONSTRAINT h5tl_testprojects_pkey PRIMARY KEY (id);


--
-- Name: h5tl_testsuites_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_testsuites
    ADD CONSTRAINT h5tl_testsuites_pkey PRIMARY KEY (id);


--
-- Name: h5tl_text_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_text_templates
    ADD CONSTRAINT h5tl_text_templates_pkey PRIMARY KEY (id);


--
-- Name: h5tl_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_transactions
    ADD CONSTRAINT h5tl_transactions_pkey PRIMARY KEY (id);


--
-- Name: h5tl_user_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_user_assignments
    ADD CONSTRAINT h5tl_user_assignments_pkey PRIMARY KEY (id);


--
-- Name: h5tl_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_user_group
    ADD CONSTRAINT h5tl_user_group_pkey PRIMARY KEY (id);


--
-- Name: h5tl_user_testplan_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_user_testplan_roles
    ADD CONSTRAINT h5tl_user_testplan_roles_pkey PRIMARY KEY (user_id, testplan_id);


--
-- Name: h5tl_user_testproject_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_user_testproject_roles
    ADD CONSTRAINT h5tl_user_testproject_roles_pkey PRIMARY KEY (user_id, testproject_id);


--
-- Name: h5tl_users_pkey; Type: CONSTRAINT; Schema: public; Owner: tladmin; Tablespace: 
--

ALTER TABLE ONLY h5tl_users
    ADD CONSTRAINT h5tl_users_pkey PRIMARY KEY (id);


--
-- Name: h5tl_builds_testplan_id; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_builds_testplan_id ON h5tl_builds USING btree (testplan_id);


--
-- Name: h5tl_builds_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_builds_uidx1 ON h5tl_builds USING btree (testplan_id, name);


--
-- Name: h5tl_cfield_node_types_idx_custom_fields_assign; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_cfield_node_types_idx_custom_fields_assign ON h5tl_cfield_node_types USING btree (node_type_id);


--
-- Name: h5tl_custom_fields_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_custom_fields_uidx1 ON h5tl_custom_fields USING btree (name);


--
-- Name: h5tl_events_fired_at; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_events_fired_at ON h5tl_events USING btree (fired_at);


--
-- Name: h5tl_events_transaction_id; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_events_transaction_id ON h5tl_events USING btree (transaction_id);


--
-- Name: h5tl_execution_tcsteps_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_execution_tcsteps_uidx1 ON h5tl_execution_tcsteps USING btree (execution_id, tcstep_id);


--
-- Name: h5tl_executions_idx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_executions_idx1 ON h5tl_executions USING btree (testplan_id, tcversion_id, platform_id, build_id);


--
-- Name: h5tl_executions_idx2; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_executions_idx2 ON h5tl_executions USING btree (execution_type);


--
-- Name: h5tl_inventory_idx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_inventory_idx1 ON h5tl_inventory USING btree (testproject_id);


--
-- Name: h5tl_inventory_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_inventory_uidx1 ON h5tl_inventory USING btree (name, testproject_id);


--
-- Name: h5tl_issuetrackers_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_issuetrackers_uidx1 ON h5tl_issuetrackers USING btree (name);


--
-- Name: h5tl_ix_cfield_build_design_values; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_ix_cfield_build_design_values ON h5tl_cfield_build_design_values USING btree (node_id);


--
-- Name: h5tl_ix_cfield_design_values; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_ix_cfield_design_values ON h5tl_cfield_design_values USING btree (node_id);


--
-- Name: h5tl_ix_cfield_tplan_design_val; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_ix_cfield_tplan_design_val ON h5tl_cfield_testplan_design_values USING btree (link_id);


--
-- Name: h5tl_keywords_keyword; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_keywords_keyword ON h5tl_keywords USING btree (keyword);


--
-- Name: h5tl_keywords_testproject_id; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_keywords_testproject_id ON h5tl_keywords USING btree (testproject_id);


--
-- Name: h5tl_milestones_testplan_id; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_milestones_testplan_id ON h5tl_milestones USING btree (testplan_id);


--
-- Name: h5tl_milestones_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_milestones_uidx1 ON h5tl_milestones USING btree (name, testplan_id);


--
-- Name: h5tl_nodes_hierarchy_pid_m_nodeorder; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_nodes_hierarchy_pid_m_nodeorder ON h5tl_nodes_hierarchy USING btree (parent_id, node_order);


--
-- Name: h5tl_platforms_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_platforms_uidx1 ON h5tl_platforms USING btree (testproject_id, name);


--
-- Name: h5tl_req_coverage_req_testcase; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_req_coverage_req_testcase ON h5tl_req_coverage USING btree (req_id, testcase_id);


--
-- Name: h5tl_req_revisions_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_req_revisions_uidx1 ON h5tl_req_revisions USING btree (parent_id, revision);


--
-- Name: h5tl_req_specs_revisions_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_req_specs_revisions_uidx1 ON h5tl_req_revisions USING btree (parent_id, revision);


--
-- Name: h5tl_req_specs_testproject_id; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_req_specs_testproject_id ON h5tl_req_specs USING btree (testproject_id);


--
-- Name: h5tl_req_specs_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_req_specs_uidx1 ON h5tl_req_specs USING btree (doc_id, testproject_id);


--
-- Name: h5tl_reqmgrsystems_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_reqmgrsystems_uidx1 ON h5tl_reqmgrsystems USING btree (name);


--
-- Name: h5tl_requirements_idx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_requirements_idx1 ON h5tl_requirements USING btree (srs_id, req_doc_id);


--
-- Name: h5tl_rights_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_rights_uidx1 ON h5tl_rights USING btree (description);


--
-- Name: h5tl_risk_assignments_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_risk_assignments_uidx1 ON h5tl_risk_assignments USING btree (testplan_id, node_id);


--
-- Name: h5tl_roles_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_roles_uidx1 ON h5tl_roles USING btree (description);


--
-- Name: h5tl_testplan_platforms_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_testplan_platforms_uidx1 ON h5tl_testplan_platforms USING btree (testplan_id, platform_id);


--
-- Name: h5tl_testplan_tcversions_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_testplan_tcversions_uidx1 ON h5tl_testplan_tcversions USING btree (testplan_id, tcversion_id, platform_id);


--
-- Name: h5tl_testplans_testproject_id_active; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_testplans_testproject_id_active ON h5tl_testplans USING btree (testproject_id, active);


--
-- Name: h5tl_testplans_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_testplans_uidx1 ON h5tl_testplans USING btree (api_key);


--
-- Name: h5tl_testprojects_id_active; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_testprojects_id_active ON h5tl_testprojects USING btree (id, active);


--
-- Name: h5tl_testprojects_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_testprojects_uidx1 ON h5tl_testprojects USING btree (prefix);


--
-- Name: h5tl_testprojects_uidx2; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_testprojects_uidx2 ON h5tl_testprojects USING btree (api_key);


--
-- Name: h5tl_text_templates_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_text_templates_uidx1 ON h5tl_text_templates USING btree (type, title);


--
-- Name: h5tl_user_assignments_feature_id; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE INDEX h5tl_user_assignments_feature_id ON h5tl_user_assignments USING btree (feature_id);


--
-- Name: h5tl_user_group_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_user_group_uidx1 ON h5tl_user_group USING btree (title);


--
-- Name: h5tl_users_uidx1; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_users_uidx1 ON h5tl_users USING btree (login);


--
-- Name: h5tl_users_uidx2; Type: INDEX; Schema: public; Owner: tladmin; Tablespace: 
--

CREATE UNIQUE INDEX h5tl_users_uidx2 ON h5tl_users USING btree (cookie_string);


--
-- Name: h5tl_builds_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_builds
    ADD CONSTRAINT h5tl_builds_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES h5tl_testplans(id);


--
-- Name: h5tl_cfield_build_design_values_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_build_design_values
    ADD CONSTRAINT h5tl_cfield_build_design_values_field_id_fkey FOREIGN KEY (field_id) REFERENCES h5tl_custom_fields(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_build_design_values_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_build_design_values
    ADD CONSTRAINT h5tl_cfield_build_design_values_node_id_fkey FOREIGN KEY (node_id) REFERENCES h5tl_builds(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_design_values_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_design_values
    ADD CONSTRAINT h5tl_cfield_design_values_field_id_fkey FOREIGN KEY (field_id) REFERENCES h5tl_custom_fields(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_design_values_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_design_values
    ADD CONSTRAINT h5tl_cfield_design_values_node_id_fkey FOREIGN KEY (node_id) REFERENCES h5tl_nodes_hierarchy(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_execution_values_execution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_execution_values
    ADD CONSTRAINT h5tl_cfield_execution_values_execution_id_fkey FOREIGN KEY (execution_id) REFERENCES h5tl_executions(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_execution_values_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_execution_values
    ADD CONSTRAINT h5tl_cfield_execution_values_field_id_fkey FOREIGN KEY (field_id) REFERENCES h5tl_custom_fields(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_execution_values_tcversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_execution_values
    ADD CONSTRAINT h5tl_cfield_execution_values_tcversion_id_fkey FOREIGN KEY (tcversion_id) REFERENCES h5tl_tcversions(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_execution_values_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_execution_values
    ADD CONSTRAINT h5tl_cfield_execution_values_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES h5tl_testplans(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_node_types_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_node_types
    ADD CONSTRAINT h5tl_cfield_node_types_field_id_fkey FOREIGN KEY (field_id) REFERENCES h5tl_custom_fields(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_node_types_node_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_node_types
    ADD CONSTRAINT h5tl_cfield_node_types_node_type_id_fkey FOREIGN KEY (node_type_id) REFERENCES h5tl_node_types(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_testplan_design_values_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_testplan_design_values
    ADD CONSTRAINT h5tl_cfield_testplan_design_values_field_id_fkey FOREIGN KEY (field_id) REFERENCES h5tl_custom_fields(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_testplan_design_values_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_testplan_design_values
    ADD CONSTRAINT h5tl_cfield_testplan_design_values_link_id_fkey FOREIGN KEY (link_id) REFERENCES h5tl_testplan_tcversions(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_testprojects_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_testprojects
    ADD CONSTRAINT h5tl_cfield_testprojects_field_id_fkey FOREIGN KEY (field_id) REFERENCES h5tl_custom_fields(id) ON DELETE CASCADE;


--
-- Name: h5tl_cfield_testprojects_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_cfield_testprojects
    ADD CONSTRAINT h5tl_cfield_testprojects_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES h5tl_testprojects(id) ON DELETE CASCADE;


--
-- Name: h5tl_execution_bugs_execution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_execution_bugs
    ADD CONSTRAINT h5tl_execution_bugs_execution_id_fkey FOREIGN KEY (execution_id) REFERENCES h5tl_executions(id) ON DELETE CASCADE;


--
-- Name: h5tl_execution_tcsteps_execution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_execution_tcsteps
    ADD CONSTRAINT h5tl_execution_tcsteps_execution_id_fkey FOREIGN KEY (execution_id) REFERENCES h5tl_executions(id);


--
-- Name: h5tl_execution_tcsteps_tcstep_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_execution_tcsteps
    ADD CONSTRAINT h5tl_execution_tcsteps_tcstep_id_fkey FOREIGN KEY (tcstep_id) REFERENCES h5tl_tcsteps(id);


--
-- Name: h5tl_executions_build_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_executions
    ADD CONSTRAINT h5tl_executions_build_id_fkey FOREIGN KEY (build_id) REFERENCES h5tl_builds(id);


--
-- Name: h5tl_executions_tcversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_executions
    ADD CONSTRAINT h5tl_executions_tcversion_id_fkey FOREIGN KEY (tcversion_id) REFERENCES h5tl_tcversions(id);


--
-- Name: h5tl_executions_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_executions
    ADD CONSTRAINT h5tl_executions_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES h5tl_testplans(id);


--
-- Name: h5tl_inventory_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_inventory
    ADD CONSTRAINT h5tl_inventory_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_inventory_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_inventory
    ADD CONSTRAINT h5tl_inventory_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES h5tl_testprojects(id) ON DELETE CASCADE;


--
-- Name: h5tl_keywords_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_keywords
    ADD CONSTRAINT h5tl_keywords_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES h5tl_testprojects(id) ON DELETE CASCADE;


--
-- Name: h5tl_milestones_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_milestones
    ADD CONSTRAINT h5tl_milestones_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES h5tl_testplans(id) ON DELETE CASCADE;


--
-- Name: h5tl_nodes_hierarchy_node_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_nodes_hierarchy
    ADD CONSTRAINT h5tl_nodes_hierarchy_node_type_id_fkey FOREIGN KEY (node_type_id) REFERENCES h5tl_node_types(id);


--
-- Name: h5tl_object_keywords_keyword_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_object_keywords
    ADD CONSTRAINT h5tl_object_keywords_keyword_id_fkey FOREIGN KEY (keyword_id) REFERENCES h5tl_keywords(id) ON DELETE CASCADE;


--
-- Name: h5tl_platforms_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_platforms
    ADD CONSTRAINT h5tl_platforms_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES h5tl_testprojects(id) ON DELETE CASCADE;


--
-- Name: h5tl_req_coverage_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_coverage
    ADD CONSTRAINT h5tl_req_coverage_author_id_fkey FOREIGN KEY (author_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_req_coverage_req_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_coverage
    ADD CONSTRAINT h5tl_req_coverage_req_id_fkey FOREIGN KEY (req_id) REFERENCES h5tl_requirements(id) ON DELETE CASCADE;


--
-- Name: h5tl_req_coverage_review_requester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_coverage
    ADD CONSTRAINT h5tl_req_coverage_review_requester_id_fkey FOREIGN KEY (review_requester_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_req_relations_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_relations
    ADD CONSTRAINT h5tl_req_relations_author_id_fkey FOREIGN KEY (author_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_req_relations_destination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_relations
    ADD CONSTRAINT h5tl_req_relations_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES h5tl_requirements(id) ON DELETE CASCADE;


--
-- Name: h5tl_req_relations_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_relations
    ADD CONSTRAINT h5tl_req_relations_source_id_fkey FOREIGN KEY (source_id) REFERENCES h5tl_requirements(id) ON DELETE CASCADE;


--
-- Name: h5tl_req_revisions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_revisions
    ADD CONSTRAINT h5tl_req_revisions_id_fkey FOREIGN KEY (id) REFERENCES h5tl_nodes_hierarchy(id);


--
-- Name: h5tl_req_revisions_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_revisions
    ADD CONSTRAINT h5tl_req_revisions_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES h5tl_req_versions(id) ON DELETE CASCADE;


--
-- Name: h5tl_req_specs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_specs
    ADD CONSTRAINT h5tl_req_specs_id_fkey FOREIGN KEY (id) REFERENCES h5tl_nodes_hierarchy(id) ON DELETE CASCADE;


--
-- Name: h5tl_req_specs_revisions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_specs_revisions
    ADD CONSTRAINT h5tl_req_specs_revisions_id_fkey FOREIGN KEY (id) REFERENCES h5tl_nodes_hierarchy(id);


--
-- Name: h5tl_req_specs_revisions_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_specs_revisions
    ADD CONSTRAINT h5tl_req_specs_revisions_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES h5tl_req_specs(id) ON DELETE CASCADE;


--
-- Name: h5tl_req_specs_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_specs
    ADD CONSTRAINT h5tl_req_specs_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES h5tl_testprojects(id) ON DELETE CASCADE;


--
-- Name: h5tl_req_versions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_req_versions
    ADD CONSTRAINT h5tl_req_versions_id_fkey FOREIGN KEY (id) REFERENCES h5tl_nodes_hierarchy(id);


--
-- Name: h5tl_requirements_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_requirements
    ADD CONSTRAINT h5tl_requirements_id_fkey FOREIGN KEY (id) REFERENCES h5tl_nodes_hierarchy(id);


--
-- Name: h5tl_requirements_srs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_requirements
    ADD CONSTRAINT h5tl_requirements_srs_id_fkey FOREIGN KEY (srs_id) REFERENCES h5tl_req_specs(id) ON DELETE CASCADE;


--
-- Name: h5tl_risk_assignments_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_risk_assignments
    ADD CONSTRAINT h5tl_risk_assignments_node_id_fkey FOREIGN KEY (node_id) REFERENCES h5tl_nodes_hierarchy(id);


--
-- Name: h5tl_risk_assignments_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_risk_assignments
    ADD CONSTRAINT h5tl_risk_assignments_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES h5tl_testplans(id) ON DELETE CASCADE;


--
-- Name: h5tl_role_rights_right_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_role_rights
    ADD CONSTRAINT h5tl_role_rights_right_id_fkey FOREIGN KEY (right_id) REFERENCES h5tl_rights(id) ON DELETE CASCADE;


--
-- Name: h5tl_role_rights_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_role_rights
    ADD CONSTRAINT h5tl_role_rights_role_id_fkey FOREIGN KEY (role_id) REFERENCES h5tl_roles(id) ON DELETE CASCADE;


--
-- Name: h5tl_tcsteps_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_tcsteps
    ADD CONSTRAINT h5tl_tcsteps_id_fkey FOREIGN KEY (id) REFERENCES h5tl_nodes_hierarchy(id);


--
-- Name: h5tl_tcversions_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_tcversions
    ADD CONSTRAINT h5tl_tcversions_author_id_fkey FOREIGN KEY (author_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_tcversions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_tcversions
    ADD CONSTRAINT h5tl_tcversions_id_fkey FOREIGN KEY (id) REFERENCES h5tl_nodes_hierarchy(id);


--
-- Name: h5tl_tcversions_updater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_tcversions
    ADD CONSTRAINT h5tl_tcversions_updater_id_fkey FOREIGN KEY (updater_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_testcase_keywords_keyword_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testcase_keywords
    ADD CONSTRAINT h5tl_testcase_keywords_keyword_id_fkey FOREIGN KEY (keyword_id) REFERENCES h5tl_keywords(id) ON DELETE CASCADE;


--
-- Name: h5tl_testcase_keywords_testcase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testcase_keywords
    ADD CONSTRAINT h5tl_testcase_keywords_testcase_id_fkey FOREIGN KEY (testcase_id) REFERENCES h5tl_nodes_hierarchy(id);


--
-- Name: h5tl_testcase_relations_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testcase_relations
    ADD CONSTRAINT h5tl_testcase_relations_author_id_fkey FOREIGN KEY (author_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_testcase_relations_destination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testcase_relations
    ADD CONSTRAINT h5tl_testcase_relations_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES h5tl_nodes_hierarchy(id) ON DELETE CASCADE;


--
-- Name: h5tl_testcase_relations_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testcase_relations
    ADD CONSTRAINT h5tl_testcase_relations_source_id_fkey FOREIGN KEY (source_id) REFERENCES h5tl_nodes_hierarchy(id) ON DELETE CASCADE;


--
-- Name: h5tl_testplan_platforms_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testplan_platforms
    ADD CONSTRAINT h5tl_testplan_platforms_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES h5tl_testplans(id) ON DELETE CASCADE;


--
-- Name: h5tl_testplan_tcversions_tcversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testplan_tcversions
    ADD CONSTRAINT h5tl_testplan_tcversions_tcversion_id_fkey FOREIGN KEY (tcversion_id) REFERENCES h5tl_tcversions(id);


--
-- Name: h5tl_testplan_tcversions_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testplan_tcversions
    ADD CONSTRAINT h5tl_testplan_tcversions_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES h5tl_testplans(id);


--
-- Name: h5tl_testplans_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testplans
    ADD CONSTRAINT h5tl_testplans_id_fkey FOREIGN KEY (id) REFERENCES h5tl_nodes_hierarchy(id);


--
-- Name: h5tl_testproject_issuetracker_issuetracker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testproject_issuetracker
    ADD CONSTRAINT h5tl_testproject_issuetracker_issuetracker_id_fkey FOREIGN KEY (issuetracker_id) REFERENCES h5tl_issuetrackers(id) ON DELETE CASCADE;


--
-- Name: h5tl_testproject_issuetracker_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testproject_issuetracker
    ADD CONSTRAINT h5tl_testproject_issuetracker_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES h5tl_testprojects(id) ON DELETE CASCADE;


--
-- Name: h5tl_testproject_reqmgrsystem_reqmgrsystem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testproject_reqmgrsystem
    ADD CONSTRAINT h5tl_testproject_reqmgrsystem_reqmgrsystem_id_fkey FOREIGN KEY (reqmgrsystem_id) REFERENCES h5tl_reqmgrsystems(id) ON DELETE CASCADE;


--
-- Name: h5tl_testproject_reqmgrsystem_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testproject_reqmgrsystem
    ADD CONSTRAINT h5tl_testproject_reqmgrsystem_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES h5tl_testprojects(id) ON DELETE CASCADE;


--
-- Name: h5tl_testprojects_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testprojects
    ADD CONSTRAINT h5tl_testprojects_id_fkey FOREIGN KEY (id) REFERENCES h5tl_nodes_hierarchy(id) ON DELETE CASCADE;


--
-- Name: h5tl_testsuites_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_testsuites
    ADD CONSTRAINT h5tl_testsuites_id_fkey FOREIGN KEY (id) REFERENCES h5tl_nodes_hierarchy(id);


--
-- Name: h5tl_text_templates_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_text_templates
    ADD CONSTRAINT h5tl_text_templates_author_id_fkey FOREIGN KEY (author_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_user_assignments_assigner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_assignments
    ADD CONSTRAINT h5tl_user_assignments_assigner_id_fkey FOREIGN KEY (assigner_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_user_assignments_build_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_assignments
    ADD CONSTRAINT h5tl_user_assignments_build_id_fkey FOREIGN KEY (build_id) REFERENCES h5tl_builds(id) ON DELETE CASCADE;


--
-- Name: h5tl_user_assignments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_assignments
    ADD CONSTRAINT h5tl_user_assignments_user_id_fkey FOREIGN KEY (user_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_user_group_assign_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_group_assign
    ADD CONSTRAINT h5tl_user_group_assign_user_id_fkey FOREIGN KEY (user_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_user_group_assign_usergroup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_group_assign
    ADD CONSTRAINT h5tl_user_group_assign_usergroup_id_fkey FOREIGN KEY (usergroup_id) REFERENCES h5tl_user_group(id);


--
-- Name: h5tl_user_group_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_group
    ADD CONSTRAINT h5tl_user_group_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_user_group_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_group
    ADD CONSTRAINT h5tl_user_group_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES h5tl_testprojects(id) ON DELETE CASCADE;


--
-- Name: h5tl_user_testplan_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_testplan_roles
    ADD CONSTRAINT h5tl_user_testplan_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES h5tl_roles(id) ON DELETE CASCADE;


--
-- Name: h5tl_user_testplan_roles_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_testplan_roles
    ADD CONSTRAINT h5tl_user_testplan_roles_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES h5tl_testplans(id) ON DELETE CASCADE;


--
-- Name: h5tl_user_testplan_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_testplan_roles
    ADD CONSTRAINT h5tl_user_testplan_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_user_testproject_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_testproject_roles
    ADD CONSTRAINT h5tl_user_testproject_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES h5tl_roles(id) ON DELETE CASCADE;


--
-- Name: h5tl_user_testproject_roles_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_testproject_roles
    ADD CONSTRAINT h5tl_user_testproject_roles_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES h5tl_testprojects(id) ON DELETE CASCADE;


--
-- Name: h5tl_user_testproject_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_user_testproject_roles
    ADD CONSTRAINT h5tl_user_testproject_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES h5tl_users(id);


--
-- Name: h5tl_users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tladmin
--

ALTER TABLE ONLY h5tl_users
    ADD CONSTRAINT h5tl_users_role_id_fkey FOREIGN KEY (role_id) REFERENCES h5tl_roles(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO tladmin;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


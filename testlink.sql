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
\.


--
-- Name: h5tl_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_events_id_seq', 727, true);


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
\.


--
-- Name: h5tl_nodes_hierarchy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_nodes_hierarchy_id_seq', 104, true);


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
3	<p>\r\n\tTest cases collection and management for feature phone products.</p>		1	0	0	0	O:8:"stdClass":4:{s:19:"requirementsEnabled";i:1;s:19:"testPriorityEnabled";i:1;s:17:"automationEnabled";i:1;s:16:"inventoryEnabled";i:0;}	FP	4	1	0	0	3f2780a5a534437d566b96e1d94e04d1609f756671d6008d8bdd6579d8656f5c
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
\.


--
-- Name: h5tl_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tladmin
--

SELECT pg_catalog.setval('h5tl_transactions_id_seq', 289, true);


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
2	owen.ouyang	819a07afa4abc8660ec9042038a8c597	8	o@oo.oo	o	o	zh_CN	\N	1	10fb2560683dc141258dbce4c21a37cf	b3e17ae30c84f8be0dccaccb6fa4593f0a14c13d3818f050a554f9bc77a4b904	DB
3	brian.huang	819a07afa4abc8660ec9042038a8c597	8	brian.huang@acadine.com	brian	huang	en_GB	\N	1	\N	0f13bca76f6cbb7e7c30a4f5c35b8706664bb328b1bfb5cd70bbb9a2c03b875b	
5	hubert.lu	819a07afa4abc8660ec9042038a8c597	8	hubert.lu@acadine.com	hubert	lu	en_GB	\N	1	\N	6812fbcd7e15e0a28e99c56b3590e0af67986091484b23b81456349e8980efab	
7	peipei.cheng	34317be00312038ff242a10887eed9d1	8	peipei.cheng@acadine.com	peipei	cheng	en_GB	\N	1	\N	0d6c5343fa3dc9f91ba3f6839ac6c995fa02e175c44ccda0972291d9524b2fdc	
8	xueqin.shen	19a339dff19c7da0a8c088e3b7ca420b	8	xueqin.shen@acadine.com	xueqin	shen	en_GB	\N	1	\N	604166c0487dff94de557488336a314a0aacf8951a44b4d3e46c0dba622354d8	
6	eric.chang	819a07afa4abc8660ec9042038a8c597	8	eric.chang@acadine.com	eric	chang	en_US	\N	1	\N	3ea31295359b6c97f8f30ea981c3968bcb8b2a0205ae0cb4c8eb5de309f45f52	
9	hermes.cheng	819a07afa4abc8660ec9042038a8c597	8	hermes.cheng@acadine.com	hermes	cheng	en_GB	\N	1	\N	99e2c1d4d52c5684f63329579877ca90eecaf1ea62c2b50c4507e5fb27d50ab9	
4	enpei.chu	6292677c8a2acac465c5c28b1da7ff75	8	enpei.chu@acadine.com	enpei	chu	en_GB	\N	1	\N	cbb3c0bc9e1a12ea461a72c3c4be69b713da0a504bcd788e1d7c69c93436fff2	
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


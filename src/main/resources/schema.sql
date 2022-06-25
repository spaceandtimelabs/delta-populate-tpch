-- https://ignite.apache.org/docs/latest/sql-reference/data-types
create table if not exists LINEITEM
(
    L_ORDERKEY      INTEGER,
    L_PARTKEY       INTEGER,
    L_SUPPKEY       INTEGER,
    L_LINENUMBER    INTEGER,
    L_QUANTITY      DOUBLE,
    L_EXTENDEDPRICE DOUBLE,
    L_DISCOUNT      DOUBLE,
    L_TAX           DOUBLE,
    L_RETURNFLAG    VARCHAR,
    L_LINESTATUS    VARCHAR,
    L_SHIPDATE      DATE,
    L_COMMITDATE    DATE,
    L_RECEIPTDATE   DATE,
    L_SHIPINSTRUCT  VARCHAR,
    L_SHIPMODE      VARCHAR,
    L_COMMENT       VARCHAR,
    constraint pk_lineitem primary key (L_ORDERKEY, L_LINENUMBER)
);

create table if not exists partsupp (
    ps_partkey INTEGER,
    ps_suppkey INTEGER,
    ps_availqty INTEGER,
    ps_supplycost DOUBLE,
    ps_comment VARCHAR,
    constraint pk_partsupp primary key (PS_PARTKEY, PS_SUPPKEY)
);

create table if not exists orders (
    o_orderkey INTEGER,
    o_custkey INTEGER,
    o_orderstatus VARCHAR,
    o_totalprice DOUBLE,
    o_orderdate DATE,
    o_orderpriority VARCHAR,
    o_clerk VARCHAR,
    o_shippriority INTEGER,
    o_comment VARCHAR,
    constraint pk_orders primary key (O_ORDERKEY)
);

create table if not exists region (
    r_regionkey INTEGER,
    r_name VARCHAR,
    r_comment VARCHAR,
    constraint pk_region primary key (r_regionkey)
);

create table if not exists nation (
    n_nationkey INTEGER,
    n_name VARCHAR,
    n_regionkey INTEGER,
    n_comment VARCHAR,
    constraint pk_nation primary key (N_NATIONKEY)
);

create table if not exists customer (
    c_custkey INTEGER,
    c_name VARCHAR,
    c_address VARCHAR,
    c_nationkey INTEGER,
    c_phone VARCHAR,
    c_acctbal DOUBLE,
    c_mktsegment VARCHAR,
    c_comment VARCHAR,
    constraint pk_customer primary key (C_CUSTKEY)
);

create table if not exists supplier (
    s_suppkey INTEGER,
    s_name VARCHAR,
    s_address VARCHAR,
    s_nationkey INTEGER,
    s_phone VARCHAR,
    s_acctbal DOUBLE,
    s_comment VARCHAR,
    constraint pk_supplier primary key (S_SUPPKEY)
);

create table if not exists part (
    p_partkey INTEGER,
    p_name VARCHAR,
    p_mfgr VARCHAR,
    p_brand VARCHAR,
    p_type VARCHAR,
    p_size INTEGER,
    p_container VARCHAR,
    p_retailprice DOUBLE,
    p_comment VARCHAR,
    constraint pk_part primary key (P_PARTKEY)
);

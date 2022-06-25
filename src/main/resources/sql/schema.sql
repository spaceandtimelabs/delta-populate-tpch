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
    L_RETURNFLAG    STRING,
    L_LINESTATUS    STRING,
    L_SHIPDATE      DATE,
    L_COMMITDATE    DATE,
    L_RECEIPTDATE   DATE,
    L_SHIPINSTRUCT  STRING,
    L_SHIPMODE      STRING,
    L_COMMENT       STRING
) using delta;

create table if not exists partsupp (
    ps_partkey INTEGER,
    ps_suppkey INTEGER,
    ps_availqty INTEGER,
    ps_supplycost DOUBLE,
    ps_comment STRING
) using delta;

create table if not exists orders (
    o_orderkey INTEGER,
    o_custkey INTEGER,
    o_orderstatus STRING,
    o_totalprice DOUBLE,
    o_orderdate DATE,
    o_orderpriority STRING,
    o_clerk STRING,
    o_shippriority INTEGER,
    o_comment STRING
) using delta;

create table if not exists region (
    r_regionkey INTEGER,
    r_name STRING,
    r_comment STRING
) using delta;

create table if not exists nation (
    n_nationkey INTEGER,
    n_name STRING,
    n_regionkey INTEGER,
    n_comment STRING
) using delta;

create table if not exists customer (
    c_custkey INTEGER,
    c_name STRING,
    c_address STRING,
    c_nationkey INTEGER,
    c_phone STRING,
    c_acctbal DOUBLE,
    c_mktsegment STRING,
    c_comment STRING
) using delta;

create table if not exists supplier (
    s_suppkey INTEGER,
    s_name STRING,
    s_address STRING,
    s_nationkey INTEGER,
    s_phone STRING,
    s_acctbal DOUBLE,
    s_comment STRING
) using delta;

create table if not exists part (
    p_partkey INTEGER,
    p_name STRING,
    p_mfgr STRING,
    p_brand STRING,
    p_type STRING,
    p_size INTEGER,
    p_container STRING,
    p_retailprice DOUBLE,
    p_comment STRING
) using delta;

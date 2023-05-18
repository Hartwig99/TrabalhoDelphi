--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.0

-- Started on 2017-04-07 21:50:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 25250)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    idcliente integer NOT NULL,
    nome character varying(50),
    nascimento date,
    cidade character varying(45),
    uf character varying(2)
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 25248)
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_idcliente_seq OWNER TO postgres;

--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 187
-- Name: cliente_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_idcliente_seq OWNED BY cliente.idcliente;


--
-- TOC entry 200 (class 1259 OID 25313)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE compra (
    idcompra integer NOT NULL,
    idfornecedor integer,
    idloja integer,
    idcondicao_pagamento integer,
    data_compra date
);


ALTER TABLE compra OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 25311)
-- Name: compra_idcompra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE compra_idcompra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compra_idcompra_seq OWNER TO postgres;

--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 199
-- Name: compra_idcompra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE compra_idcompra_seq OWNED BY compra.idcompra;


--
-- TOC entry 192 (class 1259 OID 25266)
-- Name: condicao_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE condicao_pagamento (
    idcondicao_pagamento integer NOT NULL,
    descricao character varying(45),
    numero_vezes integer,
    pagamentos character varying(255)
);


ALTER TABLE condicao_pagamento OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 25264)
-- Name: condicao_pagamento_idcondicao_pagamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE condicao_pagamento_idcondicao_pagamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE condicao_pagamento_idcondicao_pagamento_seq OWNER TO postgres;

--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 191
-- Name: condicao_pagamento_idcondicao_pagamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE condicao_pagamento_idcondicao_pagamento_seq OWNED BY condicao_pagamento.idcondicao_pagamento;


--
-- TOC entry 203 (class 1259 OID 25347)
-- Name: exemplo_01; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW exemplo_01 AS
 SELECT cli.nome,
    cli.cidade
   FROM cliente cli
  ORDER BY cli.nome;


ALTER TABLE exemplo_01 OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25351)
-- Name: exemplo_2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW exemplo_2 AS
 SELECT cli.nome AS nome_cliente,
    cli.cidade
   FROM cliente cli
  ORDER BY cli.nome;


ALTER TABLE exemplo_2 OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 25305)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fornecedor (
    idfornecedor integer NOT NULL,
    razao_social character varying(50),
    nome_fantasia character varying(50),
    fundacao date,
    cidade character varying(45),
    uf character varying(2)
);


ALTER TABLE fornecedor OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 25303)
-- Name: fornecedor_idfornecedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fornecedor_idfornecedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fornecedor_idfornecedor_seq OWNER TO postgres;

--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 197
-- Name: fornecedor_idfornecedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fornecedor_idfornecedor_seq OWNED BY fornecedor.idfornecedor;


--
-- TOC entry 194 (class 1259 OID 25274)
-- Name: loja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE loja (
    idloja integer NOT NULL,
    descricao character varying(45),
    cod_loja integer
);


ALTER TABLE loja OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 25272)
-- Name: loja_idloja_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE loja_idloja_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja_idloja_seq OWNER TO postgres;

--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 193
-- Name: loja_idloja_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE loja_idloja_seq OWNED BY loja.idloja;


--
-- TOC entry 202 (class 1259 OID 25336)
-- Name: movimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE movimento (
    idmovimento integer NOT NULL,
    idorigem character(10),
    idproduto integer,
    quantidade integer,
    tipo_movimento character(1),
    data_movimento date
);


ALTER TABLE movimento OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 25334)
-- Name: movimento_idmovimento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movimento_idmovimento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movimento_idmovimento_seq OWNER TO postgres;

--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 201
-- Name: movimento_idmovimento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movimento_idmovimento_seq OWNED BY movimento.idmovimento;


--
-- TOC entry 190 (class 1259 OID 25258)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    idproduto integer NOT NULL,
    descricao character varying(45),
    preco numeric(10,2)
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 25256)
-- Name: produto_idproduto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_idproduto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produto_idproduto_seq OWNER TO postgres;

--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 189
-- Name: produto_idproduto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_idproduto_seq OWNED BY produto.idproduto;


--
-- TOC entry 196 (class 1259 OID 25282)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venda (
    idvenda integer NOT NULL,
    idcliente integer,
    idcondicao_pagamento integer,
    idloja integer,
    data_venda date
);


ALTER TABLE venda OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 25280)
-- Name: venda_idvenda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venda_idvenda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE venda_idvenda_seq OWNER TO postgres;

--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 195
-- Name: venda_idvenda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venda_idvenda_seq OWNED BY venda.idvenda;


--
-- TOC entry 2056 (class 2604 OID 25253)
-- Name: cliente idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN idcliente SET DEFAULT nextval('cliente_idcliente_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 25316)
-- Name: compra idcompra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra ALTER COLUMN idcompra SET DEFAULT nextval('compra_idcompra_seq'::regclass);


--
-- TOC entry 2058 (class 2604 OID 25269)
-- Name: condicao_pagamento idcondicao_pagamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY condicao_pagamento ALTER COLUMN idcondicao_pagamento SET DEFAULT nextval('condicao_pagamento_idcondicao_pagamento_seq'::regclass);


--
-- TOC entry 2061 (class 2604 OID 25308)
-- Name: fornecedor idfornecedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fornecedor ALTER COLUMN idfornecedor SET DEFAULT nextval('fornecedor_idfornecedor_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 25277)
-- Name: loja idloja; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY loja ALTER COLUMN idloja SET DEFAULT nextval('loja_idloja_seq'::regclass);


--
-- TOC entry 2063 (class 2604 OID 25339)
-- Name: movimento idmovimento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimento ALTER COLUMN idmovimento SET DEFAULT nextval('movimento_idmovimento_seq'::regclass);


--
-- TOC entry 2057 (class 2604 OID 25261)
-- Name: produto idproduto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN idproduto SET DEFAULT nextval('produto_idproduto_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 25285)
-- Name: venda idvenda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda ALTER COLUMN idvenda SET DEFAULT nextval('venda_idvenda_seq'::regclass);


--
-- TOC entry 2208 (class 0 OID 25250)
-- Dependencies: 188
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (idcliente, nome, nascimento, cidade, uf) FROM stdin;
1	JOANA FERNANDES	1977-12-07	UBIRATA	PR
2	JURACY CARVALHO	1954-01-25	LINDOESTE	PR
3	MARIA DE SOUZA	1983-01-14	LINDOESTE	PR
4	MARIA SILVA FARIAS	2035-07-01	STA TERZA	PR
5	ALICE DA SILVA	1989-01-30	FRANCA	SP
6	ELZA FERREIRA	1990-12-06	JOINVILLE	SC
7	HORAIDES RODRIGUES	1969-02-23	CONCORDIA	SC
8	GENI ROSA DE JESUS	1973-05-24	DIONISIO CERQUEIRA	SC
9	EDER APARECIDO	1995-10-25	GUARANIACU	PR
10	LUIZA PEREIRA	1984-12-28	SANTA TEREZA	RS
\.


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 187
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_idcliente_seq', 10, true);


--
-- TOC entry 2220 (class 0 OID 25313)
-- Dependencies: 200
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY compra (idcompra, idfornecedor, idloja, idcondicao_pagamento, data_compra) FROM stdin;
1	1	1	1	2013-03-24
2	1	1	2	2016-07-27
3	2	1	1	2016-03-08
4	3	2	3	2016-03-08
5	3	1	1	2016-03-08
6	2	1	2	2016-03-08
7	2	1	2	2016-03-08
8	1	2	2	2016-03-08
9	2	2	3	2016-03-08
10	1	2	2	2014-01-27
11	3	2	1	2014-01-27
12	3	2	2	2014-01-27
13	2	1	2	2014-01-27
14	2	1	1	2014-01-27
15	2	2	2	2014-01-27
\.


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 199
-- Name: compra_idcompra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('compra_idcompra_seq', 15, true);


--
-- TOC entry 2212 (class 0 OID 25266)
-- Dependencies: 192
-- Data for Name: condicao_pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY condicao_pagamento (idcondicao_pagamento, descricao, numero_vezes, pagamentos) FROM stdin;
1	A VISTA	1	\N
2	30 E 60 DIAS	2	\N
3	30, 60 E 90 DIAS	3	\N
\.


--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 191
-- Name: condicao_pagamento_idcondicao_pagamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('condicao_pagamento_idcondicao_pagamento_seq', 3, true);


--
-- TOC entry 2218 (class 0 OID 25305)
-- Dependencies: 198
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fornecedor (idfornecedor, razao_social, nome_fantasia, fundacao, cidade, uf) FROM stdin;
1	JOSEFA MARIA GOMES	AZIMIRA FELICIANO	2017-03-17	CASCAVEL	PR
2	LUCIDALVA SANTOS SOUTO	RAIMUNDO NONATO DE MELO	2017-03-17	CASCAVEL	PR
3	NELDI PAULINA BEHLING	LUIZA PEREIRA DE ANDRADE	2017-03-17	CASCAVEL	PR
4	VALDECIR CANDIDO	MARIA ROSALIA ALVES	2017-03-17	CASCAVEL	PR
\.


--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 197
-- Name: fornecedor_idfornecedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fornecedor_idfornecedor_seq', 4, true);


--
-- TOC entry 2214 (class 0 OID 25274)
-- Dependencies: 194
-- Data for Name: loja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY loja (idloja, descricao, cod_loja) FROM stdin;
1	LOJA CENTRO	1
2	LOJA BAIRRO	2
\.


--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 193
-- Name: loja_idloja_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('loja_idloja_seq', 2, true);


--
-- TOC entry 2222 (class 0 OID 25336)
-- Dependencies: 202
-- Data for Name: movimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movimento (idmovimento, idorigem, idproduto, quantidade, tipo_movimento, data_movimento) FROM stdin;
1	CP#10     	4	1	E	2013-03-24
2	CP#15     	4	1	E	2016-07-27
3	CP#6      	3	1	E	2016-03-08
4	CP#13     	2	6	E	2016-03-08
5	CP#11     	2	4	E	2016-03-08
6	CP#12     	1	2	E	2016-03-08
7	CP#10     	3	3	E	2016-03-08
8	CP#1      	3	7	E	2016-03-08
9	CP#13     	2	7	E	2016-03-08
10	CP#4      	2	3	E	2014-01-27
11	CP#14     	3	3	E	2014-01-27
12	CP#11     	4	5	E	2014-01-27
13	CP#4      	2	2	E	2014-01-27
14	CP#8      	1	6	E	2014-01-27
15	CP#7      	2	1	E	2014-01-27
16	VD#24     	3	6	S	2008-12-09
17	VD#27     	3	1	S	2008-12-15
18	VD#5      	3	5	S	2009-02-10
19	VD#3      	1	6	S	2010-01-12
20	VD#20     	1	6	S	2010-05-08
21	VD#23     	2	3	S	2010-10-02
22	VD#29     	1	6	S	2010-10-02
23	VD#29     	2	2	S	2011-11-12
24	VD#16     	4	1	S	2011-12-07
25	VD#13     	3	3	S	2011-12-20
26	VD#13     	3	2	S	2012-02-16
27	VD#27     	4	7	S	2012-06-02
28	VD#28     	3	6	S	2012-06-08
29	VD#19     	3	5	S	2012-08-04
30	VD#4      	3	3	S	2012-08-04
31	VD#27     	4	5	S	2012-11-03
32	VD#28     	1	2	S	2012-12-26
33	VD#9      	1	1	S	2013-02-09
34	VD#23     	2	7	S	2013-04-06
35	VD#15     	2	7	S	2013-07-06
36	VD#16     	3	5	S	2013-12-07
37	VD#2      	3	2	S	2014-01-08
38	VD#28     	2	3	S	2014-01-10
39	VD#9      	2	6	S	2014-03-08
40	VD#16     	2	3	S	2014-06-12
41	VD#27     	1	4	S	2014-08-09
42	VD#29     	2	2	S	2014-10-11
43	VD#9      	3	2	S	2014-12-13
44	VD#25     	2	6	S	2015-03-07
45	VD#14     	4	6	S	2015-05-09
\.


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 201
-- Name: movimento_idmovimento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movimento_idmovimento_seq', 45, true);


--
-- TOC entry 2210 (class 0 OID 25258)
-- Dependencies: 190
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY produto (idproduto, descricao, preco) FROM stdin;
1	CANTONEIRA	1.93
2	BANDEJAS	17.56
3	CAMISETA	63.56
4	TENIS COCA COLA	41.90
\.


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 189
-- Name: produto_idproduto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produto_idproduto_seq', 4, true);


--
-- TOC entry 2216 (class 0 OID 25282)
-- Dependencies: 196
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY venda (idvenda, idcliente, idcondicao_pagamento, idloja, data_venda) FROM stdin;
1	1	1	1	2008-12-09
2	2	1	1	2008-12-15
3	3	1	1	2009-02-10
4	4	1	1	2010-01-12
5	5	2	2	2010-05-08
6	6	2	1	2010-10-02
7	7	2	1	2010-10-02
8	8	3	1	2011-11-12
9	1	2	2	2011-12-07
10	2	2	1	2011-12-20
11	3	1	2	2012-02-16
12	4	1	1	2012-06-02
13	5	1	1	2012-06-08
14	6	1	1	2012-08-04
15	7	1	1	2012-08-04
16	1	1	1	2012-11-03
17	2	1	1	2012-12-26
18	4	1	1	2013-02-09
19	6	3	2	2013-04-06
20	8	1	1	2013-07-06
21	3	1	1	2013-12-07
22	5	2	1	2014-01-08
23	7	2	1	2014-01-10
24	1	2	2	2014-03-08
25	2	2	1	2014-06-12
26	3	2	1	2014-08-09
27	4	2	1	2014-10-11
28	5	2	1	2014-12-13
29	6	2	2	2015-03-07
30	7	1	1	2015-05-09
\.


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 195
-- Name: venda_idvenda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('venda_idvenda_seq', 30, true);


--
-- TOC entry 2065 (class 2606 OID 25255)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 2077 (class 2606 OID 25318)
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (idcompra);


--
-- TOC entry 2069 (class 2606 OID 25271)
-- Name: condicao_pagamento condicao_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY condicao_pagamento
    ADD CONSTRAINT condicao_pagamento_pkey PRIMARY KEY (idcondicao_pagamento);


--
-- TOC entry 2075 (class 2606 OID 25310)
-- Name: fornecedor fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (idfornecedor);


--
-- TOC entry 2071 (class 2606 OID 25279)
-- Name: loja loja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY loja
    ADD CONSTRAINT loja_pkey PRIMARY KEY (idloja);


--
-- TOC entry 2079 (class 2606 OID 25341)
-- Name: movimento movimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimento
    ADD CONSTRAINT movimento_pkey PRIMARY KEY (idmovimento);


--
-- TOC entry 2067 (class 2606 OID 25263)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (idproduto);


--
-- TOC entry 2073 (class 2606 OID 25287)
-- Name: venda venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (idvenda);


--
-- TOC entry 2085 (class 2606 OID 25329)
-- Name: compra compra_fkey_con; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_fkey_con FOREIGN KEY (idcondicao_pagamento) REFERENCES condicao_pagamento(idcondicao_pagamento);


--
-- TOC entry 2083 (class 2606 OID 25319)
-- Name: compra compra_fkey_for; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_fkey_for FOREIGN KEY (idfornecedor) REFERENCES fornecedor(idfornecedor);


--
-- TOC entry 2084 (class 2606 OID 25324)
-- Name: compra compra_fkey_loj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_fkey_loj FOREIGN KEY (idloja) REFERENCES loja(idloja);


--
-- TOC entry 2086 (class 2606 OID 25342)
-- Name: movimento movimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimento
    ADD CONSTRAINT movimento_fkey FOREIGN KEY (idproduto) REFERENCES produto(idproduto);


--
-- TOC entry 2080 (class 2606 OID 25288)
-- Name: venda venda_fkey_cli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_fkey_cli FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2081 (class 2606 OID 25293)
-- Name: venda venda_fkey_con; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_fkey_con FOREIGN KEY (idcondicao_pagamento) REFERENCES condicao_pagamento(idcondicao_pagamento);


--
-- TOC entry 2082 (class 2606 OID 25298)
-- Name: venda venda_fkey_loj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_fkey_loj FOREIGN KEY (idloja) REFERENCES loja(idloja);


-- Completed on 2017-04-07 21:50:53

--
-- PostgreSQL database dump complete
--


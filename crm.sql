-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1-beta
-- PostgreSQL version: 9.6
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database
-- ;
-- -- ddl-end --
-- 

-- object: configuracoes | type: SCHEMA --
-- DROP SCHEMA IF EXISTS configuracoes CASCADE;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE SCHEMA configuracoes;
-- ddl-end --
ALTER SCHEMA configuracoes OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,configuracoes;
-- ddl-end --

-- object: public."Contato" | type: TABLE --
-- DROP TABLE IF EXISTS public."Contato" CASCADE;
CREATE TABLE public."Contato"(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	nome text,
	email text,
	telefone text,
	genero char(1),
	cnpjcpf text,
	cargo text,
	endereco text,
	"redesSociais" jsonb,
	status char(1),
	classificacao text,
	obs text,
	"id_Empresa" uuid,
	principal bool,
	CONSTRAINT "Contato_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."Contato" OWNER TO postgres;
-- ddl-end --

-- object: public."Empresa" | type: TABLE --
-- DROP TABLE IF EXISTS public."Empresa" CASCADE;
CREATE TABLE public."Empresa"(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	"razaoSocial" text,
	setor text,
	endereco text,
	email text,
	cnpj text,
	clientes text,
	telefone text,
	"dataFundacao" date,
	segmento text,
	CONSTRAINT "Empresa_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."Empresa" OWNER TO postgres;
-- ddl-end --

-- object: "Empresa_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Contato" DROP CONSTRAINT IF EXISTS "Empresa_fk" CASCADE;
ALTER TABLE public."Contato" ADD CONSTRAINT "Empresa_fk" FOREIGN KEY ("id_Empresa")
REFERENCES public."Empresa" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: configuracoes."statusLead" | type: TABLE --
-- DROP TABLE IF EXISTS configuracoes."statusLead" CASCADE;
CREATE TABLE configuracoes."statusLead"(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	descricao text,
	CONSTRAINT status_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE configuracoes."statusLead" OWNER TO postgres;
-- ddl-end --

-- object: public.lead | type: TABLE --
-- DROP TABLE IF EXISTS public.lead CASCADE;
CREATE TABLE public.lead(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	obs text,
	id_lead uuid,
	"id_statusLead" uuid,
	created_at timestamp DEFAULT now(),
	id_pessoa uuid,
	CONSTRAINT lead_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.lead OWNER TO postgres;
-- ddl-end --

-- object: public.produto | type: TABLE --
-- DROP TABLE IF EXISTS public.produto CASCADE;
CREATE TABLE public.produto(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	nome text,
	"valorBase" decimal(10,2),
	descricao text,
	CONSTRAINT produto_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.produto OWNER TO postgres;
-- ddl-end --

-- object: public.pessoa | type: TABLE --
-- DROP TABLE IF EXISTS public.pessoa CASCADE;
CREATE TABLE public.pessoa(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	nome text,
	email text,
	celular text,
	endereco text,
	cargo text,
	CONSTRAINT vendedor_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.pessoa OWNER TO postgres;
-- ddl-end --

-- object: "statusLead_fk" | type: CONSTRAINT --
-- ALTER TABLE public.lead DROP CONSTRAINT IF EXISTS "statusLead_fk" CASCADE;
ALTER TABLE public.lead ADD CONSTRAINT "statusLead_fk" FOREIGN KEY ("id_statusLead")
REFERENCES configuracoes."statusLead" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pessoa_fk | type: CONSTRAINT --
-- ALTER TABLE public.lead DROP CONSTRAINT IF EXISTS pessoa_fk CASCADE;
ALTER TABLE public.lead ADD CONSTRAINT pessoa_fk FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.many_produto_has_many_lead | type: TABLE --
-- DROP TABLE IF EXISTS public.many_produto_has_many_lead CASCADE;
CREATE TABLE public.many_produto_has_many_lead(
	id_produto uuid NOT NULL,
	id_lead uuid NOT NULL,
	CONSTRAINT many_produto_has_many_lead_pk PRIMARY KEY (id_produto,id_lead)

);
-- ddl-end --

-- object: produto_fk | type: CONSTRAINT --
-- ALTER TABLE public.many_produto_has_many_lead DROP CONSTRAINT IF EXISTS produto_fk CASCADE;
ALTER TABLE public.many_produto_has_many_lead ADD CONSTRAINT produto_fk FOREIGN KEY (id_produto)
REFERENCES public.produto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: lead_fk | type: CONSTRAINT --
-- ALTER TABLE public.many_produto_has_many_lead DROP CONSTRAINT IF EXISTS lead_fk CASCADE;
ALTER TABLE public.many_produto_has_many_lead ADD CONSTRAINT lead_fk FOREIGN KEY (id_lead)
REFERENCES public.lead (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.oportunidade | type: TABLE --
-- DROP TABLE IF EXISTS public.oportunidade CASCADE;
CREATE TABLE public.oportunidade(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	id_pessoa uuid,
	importancia char(1),
	obs text,
	valor decimal(10,2),
	"dataConclusao" timestamp,
	"dataInicio" timestamp,
	"id_Empresa" uuid,
	"id_statusOportunidade" uuid,
	id_lead uuid,
	CONSTRAINT oportunidade_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.oportunidade OWNER TO postgres;
-- ddl-end --

-- object: pessoa_fk | type: CONSTRAINT --
-- ALTER TABLE public.oportunidade DROP CONSTRAINT IF EXISTS pessoa_fk CASCADE;
ALTER TABLE public.oportunidade ADD CONSTRAINT pessoa_fk FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Empresa_fk" | type: CONSTRAINT --
-- ALTER TABLE public.oportunidade DROP CONSTRAINT IF EXISTS "Empresa_fk" CASCADE;
ALTER TABLE public.oportunidade ADD CONSTRAINT "Empresa_fk" FOREIGN KEY ("id_Empresa")
REFERENCES public."Empresa" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: configuracoes."statusOportunidade" | type: TABLE --
-- DROP TABLE IF EXISTS configuracoes."statusOportunidade" CASCADE;
CREATE TABLE configuracoes."statusOportunidade"(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	descricao text,
	CONSTRAINT "statusOportunidade_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE configuracoes."statusOportunidade" OWNER TO postgres;
-- ddl-end --

-- object: "statusOportunidade_fk" | type: CONSTRAINT --
-- ALTER TABLE public.oportunidade DROP CONSTRAINT IF EXISTS "statusOportunidade_fk" CASCADE;
ALTER TABLE public.oportunidade ADD CONSTRAINT "statusOportunidade_fk" FOREIGN KEY ("id_statusOportunidade")
REFERENCES configuracoes."statusOportunidade" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: lead_fk | type: CONSTRAINT --
-- ALTER TABLE public.oportunidade DROP CONSTRAINT IF EXISTS lead_fk CASCADE;
ALTER TABLE public.oportunidade ADD CONSTRAINT lead_fk FOREIGN KEY (id_lead)
REFERENCES public.lead (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: configuracoes.cargo | type: TABLE --
-- DROP TABLE IF EXISTS configuracoes.cargo CASCADE;
CREATE TABLE configuracoes.cargo(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	descricao text,
	CONSTRAINT cargo_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE configuracoes.cargo OWNER TO postgres;
-- ddl-end --



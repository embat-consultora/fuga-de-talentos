SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."instances" ("id", "uuid", "raw_base_config", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_factors" ("id", "user_id", "friendly_name", "factor_type", "status", "created_at", "updated_at", "secret", "phone", "last_challenged_at", "web_authn_credential", "web_authn_aaguid") FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_challenges" ("id", "factor_id", "created_at", "verified_at", "ip_address", "otp_code", "web_authn_session_data") FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."one_time_tokens" ("id", "user_id", "token_type", "token_hash", "relates_to", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_providers" ("id", "resource_id", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_providers" ("id", "sso_provider_id", "entity_id", "metadata_xml", "metadata_url", "attribute_mapping", "created_at", "updated_at", "name_id_format") FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_relay_states" ("id", "sso_provider_id", "request_id", "for_email", "redirect_to", "created_at", "updated_at", "flow_state_id") FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_domains" ("id", "sso_provider_id", "domain", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: aspiraciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."aspiraciones" ("id", "created_at", "nombre", "lang") FROM stdin;
28	2025-05-15 12:27:47.496851+00	Crecimiento jerárquico	es
29	2025-05-15 12:27:47.496851+00	Movimiento horizontal	es
30	2025-05-15 12:27:47.496851+00	Participación en proyectos	es
31	2025-05-15 12:27:47.496851+00	Liderar proyectos	es
32	2025-05-15 12:27:47.496851+00	Desafíos en su rol - autonomía	es
33	2025-05-15 12:27:47.496851+00	Consolidar su rol	es
34	2025-05-15 12:27:47.496851+00	No manifiesta	es
35	2025-05-15 12:27:47.496851+00	Balance vida profesional - personal	es
36	2025-05-15 12:27:47.496851+00	Otros - con opción a detallar cuál.	es
37	2025-05-15 12:27:47.496851+00	Hierarchical growth	en
38	2025-05-15 12:27:47.496851+00	Horizontal movement	en
39	2025-05-15 12:27:47.496851+00	Participation in projects	en
40	2025-05-15 12:27:47.496851+00	Lead projects	en
41	2025-05-15 12:27:47.496851+00	Challenges in their role - autonomy	en
42	2025-05-15 12:27:47.496851+00	Consolidate their role	en
43	2025-05-15 12:27:47.496851+00	Does not express	en
44	2025-05-15 12:27:47.496851+00	Work-life balance	en
45	2025-05-15 12:27:47.496851+00	Other – with option to specify which	en
46	2025-05-15 12:27:47.496851+00	Crescimento hierárquico	pt
47	2025-05-15 12:27:47.496851+00	Movimento horizontal	pt
48	2025-05-15 12:27:47.496851+00	Participação em projetos	pt
49	2025-05-15 12:27:47.496851+00	Liderar projetos	pt
50	2025-05-15 12:27:47.496851+00	Desafios no seu papel – autonomia	pt
51	2025-05-15 12:27:47.496851+00	Consolidar seu papel	pt
52	2025-05-15 12:27:47.496851+00	Não manifesta	pt
53	2025-05-15 12:27:47.496851+00	Equilíbrio vida profissional – pessoal	pt
54	2025-05-15 12:27:47.496851+00	Outros – com opção de especificar qual	pt
\.


--
-- Data for Name: colores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."colores" ("id", "created_at", "nombre", "codigo") FROM stdin;
1	2025-05-15 09:54:46.217275+00	verde claro	#d4edbc
2	2025-05-15 09:55:03.91712+00	amarillo claro	#ffe5a0
3	2025-05-15 09:55:20.888507+00	rojo claro	#ffc8aa
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."company" ("id", "created_at", "nombre", "telefono", "emailContacto", "estado", "project_start_date") FROM stdin;
3	2025-04-23 11:49:50.38367+00	AXA	635244888	ruben@axa.com	Activo	\N
2	2025-04-23 11:49:32.025566+00	NH	635844444	nacho@nh.com	Inactivo	\N
4	2025-04-23 12:07:09.225701+00	LUZU	9541122445	nico@luzu.com	Activo	2025-05-05
1	2025-04-23 11:49:18.045114+00	Iberostar	634058777	miquel@iberostar.com	Revision Contrato	2025-05-05
\.


--
-- Data for Name: competencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."competencias" ("id", "created_at", "nombre") FROM stdin;
9	2025-05-21 16:09:08.098708+00	Excelencia con el cliente
1	2025-05-21 15:31:14.141419+00	Liderazgo
2	2025-05-21 15:59:02.776336+00	Colaboración
10	2025-05-21 16:09:51.161324+00	Eficiencia y eficacia 
13	2025-06-02 19:13:22.736465+00	Sostenibilidad
\.


--
-- Data for Name: competenciaCompany; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."competenciaCompany" ("id", "created_at", "competenciaId", "companyId") FROM stdin;
32	2025-05-21 16:10:25.310344+00	2	1
33	2025-05-21 16:10:25.378022+00	1	1
34	2025-05-21 16:10:29.971373+00	2	1
35	2025-05-21 16:10:30.035028+00	1	1
36	2025-05-21 16:10:30.125423+00	9	1
37	2025-05-21 16:10:45.755394+00	2	1
38	2025-05-21 16:10:45.842269+00	1	1
39	2025-05-21 16:10:45.898491+00	9	1
40	2025-05-21 16:10:47.587386+00	2	1
41	2025-05-21 16:10:47.65658+00	1	1
42	2025-05-21 16:10:47.736844+00	9	1
43	2025-05-21 16:10:47.799387+00	10	1
44	2025-05-21 16:11:23.980649+00	2	1
45	2025-05-21 16:11:24.054449+00	1	1
46	2025-05-21 16:11:24.14571+00	9	1
47	2025-05-21 16:11:24.23864+00	10	1
48	2025-05-21 16:18:51.110862+00	2	1
49	2025-05-21 16:18:51.298314+00	1	1
50	2025-05-21 16:18:51.800415+00	9	1
51	2025-05-21 16:18:51.996293+00	10	1
\.


--
-- Data for Name: idiomas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."idiomas" ("id", "created_at", "idioma", "lang") FROM stdin;
1	2025-05-08 14:02:06.151134+00	Español	es
2	2025-05-08 14:02:16.692661+00	English	en
3	2025-05-08 14:02:50.348815+00	Português	pt
4	2025-05-08 15:03:12.18533+00	Inglés	es
5	2025-05-08 15:04:26.904292+00	Portugués	es
6	2025-05-08 15:04:40.913441+00	Spanish	en
7	2025-05-08 15:05:11.57762+00	Portuguese	en
8	2025-05-08 15:05:30.02187+00	Espanhol	pt
9	2025-05-08 15:05:40.621574+00	Inglês	pt
10	2025-05-14 12:33:56.980646+00	Italiano	es
11	2025-05-14 12:34:03.940042+00	Francés	es
12	2025-05-14 12:34:10.066314+00	Alemán	es
13	2025-05-14 12:34:16.396164+00	Catalán	es
14	2025-05-14 12:34:22.898886+00	Chino	es
15	2025-05-14 12:34:30.12169+00	Árabe	es
16	2025-05-14 12:34:38.121456+00	Italian	en
17	2025-05-14 12:34:44.543284+00	French	en
18	2025-05-14 12:34:51.841444+00	German	en
19	2025-05-14 12:34:56.828733+00	Catalan	en
20	2025-05-14 12:35:07.630231+00	Chinese	en
21	2025-05-14 12:35:15.331615+00	Arabic	en
22	2025-05-14 12:35:24.375214+00	Italiano	pt
23	2025-05-14 12:35:31.484904+00	Francês	pt
24	2025-05-14 12:35:38.057705+00	Alemão	pt
25	2025-05-14 12:35:46.923688+00	Catalão	pt
26	2025-05-14 12:35:53.316993+00	Chinês	pt
27	2025-05-14 12:36:01.881957+00	Árabe	pt
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."roles" ("id", "created_at", "rol", "description") FROM stdin;
1	2025-05-06 06:25:50.102169+00	cliente	\N
2	2025-05-06 06:25:59.962616+00	admin	\N
3	2025-05-06 06:26:08.155341+00	pm	
4	2025-05-06 06:26:13.606619+00	consultora	\N
5	2025-06-04 06:28:37.130319+00	embatAdmin	\N
\.


--
-- Data for Name: users1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."users1" ("id", "created_at", "email", "password", "language", "nombre", "estado", "companyId", "rol") FROM stdin;
44	2025-06-09 05:48:39.795771+00	g.vieiro@embatconsultora.com	iYQicfigsz	es	Guadalupe Vieiro	Activo	1	4
45	2025-06-09 05:54:54.195207+00	m.moreira@embatconsultora.com	4ZM0jEfRlP	es	Melisa Moreira	Activo	1	4
3	2025-04-22 14:28:45.015092+00	antopiscio@gmail.com	admin123	es	Mica Vazquez	Activo	1	5
9	2025-05-21 14:59:06.764136+00	embat.consultora@gmail.com	\N	es	Admin PM	\N	\N	3
2	2025-04-22 12:05:35.938096+00	sofia.aguirre@embatconsultora.com	pm123	en	Sofia Aguirre	Activo	1	3
1	2025-04-22 12:04:08+00	antonela.pisciolari@embatconsultora.com	cons123	es	Anto Pisciolari	Activo	2	4
33	2025-05-23 18:21:20.409596+00	msofia.aguirre@gmail.com 	eLyOwC6JKt	es	So Consultora	Activo	3	4
42	2025-05-27 19:02:22.559782+00	natalia.lanzacastelli@embatconsultora.com	H26etNkd0b	es	Natalia Lanza Castelli	Activo	1	4
40	2025-05-27 19:01:34.559106+00	cecilia.rios@embatconsultora.com	dSXvE8ezha	es	Cecilia Rios	Activo	1	5
8	2025-04-24 13:27:29.466494+00	romina.coll@embatconsultora.com	Pm11x6gXH6	es	Romina Coll	Activo	1	5
32	2025-05-23 18:20:48.689316+00	romicoll008@gmail.com	DBX2jswumc	es	Ro PM	Activo	3	3
\.


--
-- Data for Name: evaluado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."evaluado" ("id", "created_at", "companyId", "consultora", "idioma", "region", "id_empleado", "nombre", "correo_electronico", "telefono", "hotel", "departamento", "posicion", "fecha_nacimiento", "fecha_entrada", "evaluacion_2024", "evaluadora", "cita_ok", "entrevista_ok", "cancelacion_1", "cancelacion_2", "cv", "bfq", "pais") FROM stdin;
8	2025-05-23 16:26:24.374451+00	\N	44	1	BALEARES	HRP30000008840	CARRASCO ALCAIDE RAFAEL	RAFACARAL@YAHOO.ES	\N	Iberostar Selection Santa Eulalia	Recepción	2º JEFE/A RECEPCIÓN	1973-05-05	\N	\N	Guada	f	f	f	f	f	f	\N
14	2025-05-23 16:26:24.374451+00	\N	44	1	PENINSULA	HRP30000005900	HIDALGO SALGUERO, ALEJANDRO	ALEXHISAL@GMAIL.COM	625826086.0	Iberostar Málaga Playa	COCINA	2º JEFE/A COCINA	1986-09-24	2016-07-06	Supera_110%	Guada	f	f	f	f	f	f	\N
15	2025-05-23 16:26:24.374451+00	\N	45	1	PENINSULA	HRP30000004868	PALMA MANCEBO, MARIA DEL AMOR	AMOR_HOTEL@HOTMAIL.ES	667643536.0	Iberostar Málaga Playa	BAR/RESTAURANTE	COORDINADOR/A BR	1985-06-10	2003-08-05	Excelente_120%	Meli	f	f	f	f	f	f	\N
16	2025-05-23 16:26:24.374451+00	\N	45	1	PENINSULA	HRP30000010081	CORONA HUMANES ESPERANZA MACARENA (ID 10081)	MACARENACH4@GMAIL.COM	696733793.0	Iberostar Selection Marbella Coral Beach	PISOS	Subgobernanta	1993-08-02	2024-03-01	100%	Meli	f	f	f	f	f	f	\N
11	2025-05-23 16:26:24.374451+00	\N	\N	1	PENINSULA	HRP30000004741	MARTIN PEREZ, JUAN	JUANMARTIN1964RIENDA@GMAIL.COM	659139159.0	Iberostar Málaga Playa	BAR/RESTAURANTE	2º JEFE/A BR	1964-01-04	1997-04-08	Supera_110%	Guada	f	f	f	f	f	f	\N
17	2025-05-23 16:26:24.374451+00	\N	45	1	PENINSULA	HRP30000109956	MORALES BOLEA SALVADOR MARIA (ID 109956)	SALVADORMORALESBOLEA@GMAIL.COM	691809759.0	Iberostar Selection Marbella Coral Beach	SSTT	2º JEFE DE SSTT	1984-12-25	2024-07-01	100%	Meli	f	f	f	f	f	f	\N
18	2025-05-23 16:26:24.374451+00	\N	45	1	PENINSULA	HRP30000034056	GONZALEZ DE LA ORDEN, SARA (ID 34056)	GUEST.INFO.BALEARES@IBEROSTAR.COM	659062374.0	Iberostar Selection Marbella Coral Beach	RECEPCIÓN	2º RECEPCIÓN	1996-03-28	2025-03-05	\N	Meli	f	f	f	f	f	f	\N
9	2025-05-23 16:26:24.374451+00	\N	\N	1	BALEARES	HRP30000002303	INIRIO JIMENEZ TOMAS ALBERTO	THOMAS1842016EMILI@GMAIL.COM	\N	Iberostar Waves Bahía de Palma	Cocina	Jefe de Partida	1992-08-17	2013-04-01	Excelente_120%	Guada	f	f	f	f	f	f	\N
12	2025-05-23 16:26:24.374451+00	\N	44	1	PENINSULA	HRP30000004846	FERNANDEZ MARTIN, FRANCISCO RAFAEL	FRANCISCORFM78@GMAIL.COM	630353953.0	Iberostar Málaga Playa	SSTT	2º JEFE/A SSTT	1978-12-15	2003-05-26	Supera_110%	Guada	f	f	f	f	f	f	\N
10	2025-05-23 16:26:24.374451+00	\N	44	1	PENINSULA	HRP30000004859	PALACIOS GONZALEZ, MIGUEL ANGEL	MIGUELIKER9511@GMAIL.COM	629555183.0	Iberostar Málaga Playa	BAR/RESTAURANTE	2º JEFE/A BR	1982-03-08	2003-06-04	Supera_110%	Guada	f	f	f	f	f	f	\N
13	2025-05-23 16:26:24.374451+00	\N	44	1	PENINSULA	HRP30000004836	ALMOGUERA ORDAZ, MARIA CONCEPCION	GUAYABA-75@HOTMAIL.COM	639275711.0	Iberostar Málaga Playa	RECEPCIÓN	2º JEFE/A RECEPCIÓN	1975-08-22	2004-05-10	Supera_110%	Guada	f	f	f	f	f	f	\N
32	2025-05-23 18:08:19.020406+00	\N	8	\N	BALEARES	HRP30000037148	NOTO FABRIZIO	FABRIZION1991@GMAIL.COM	\N	Iberostar Waves Bahía de Palma	Recepción	2º JEFE/A RECEPCIÓN	1991-06-22	2024-05-27	Supera_110%	\N	f	f	f	f	f	f	\N
20	2025-05-23 16:26:24.374451+00	\N	45	1	CANARIAS	HRP30000007202	LADO FERNANDEZ, MARIA JOSE	MARIFUER@HOTMAIL.COM	\N	Iberostar Selection Fuerteventura Palace	Pisos	2º JEFE/A PISOS	1977-07-19	2001-11-09	Supera_110%	Meli	f	f	f	f	f	f	\N
21	2025-05-23 16:26:24.374451+00	\N	45	1	CANARIAS	HRP30000006612	COLON MARTIN, FERNANDO JESUS	ACOMETIDA.FC@GMAIL.COM	\N	Iberostar Selection Fuerteventura Palace	Bar	2º JEFE/A BR	1976-04-26	2016-11-11	Supera_110%	Meli	f	f	f	f	f	f	\N
23	2025-05-23 16:26:24.374451+00	\N	45	1	CANARIAS	HRP30000006451	DIAZ GARCIA, PABLO	PAPAUMAMA@HOTMAIL.COM	\N	Iberostar Selection Fuerteventura Palace	Cocina	2º JEFE/A COCINA	1979-06-11	2025-05-12	Supera_110%	Meli	f	f	f	f	f	f	\N
36	2025-05-23 18:08:19.020406+00	\N	40	\N	BALEARES	HRP30000006370	CARDONA COLL NURIA	NURIA2510@HOTMAIL.COM	\N	Iberostar Selection Jardín del Sol	Recepción	2º JEFE/A RECEPCIÓN	1983-10-29	2006-04-24	Supera_110%	\N	f	f	f	f	f	f	\N
33	2025-05-23 18:08:19.020406+00	\N	40	\N	BALEARES	HRP30000009305	CARRILLO BAENA FRANCISCO JAVIER	TITOCUKITO95@GMAIL.COM	\N	Iberostar Selection Playa de P	Cocina	2º JEFE/A COCINA	1988-07-30	2025-03-03	Supera_110%	\N	f	f	f	f	f	f	\N
30	2025-05-23 17:16:51.595507+00	\N	8	\N	BALEARES	HRP30000004307	ARROGANTE ROMERO TANIA	XIFRY@HOTMAIL.ES	\N	Iberostar Selection Jardín del Sol	BR	2º JEFE/A BR	1989-09-27	2006-06-28	Supera_110%	\N	f	f	f	f	f	f	\N
31	2025-05-23 17:16:51.595507+00	\N	40	\N	BALEARES	HRP30000004640	GOMONOVA GUMENYUK EKATERINA	BKM.81@MAIL.RU	\N	Iberostar Selection Jardín del Sol	BR	2º JEFE/A BR	1981-10-17	2009-06-11	Supera_110%	\N	f	f	f	f	f	f	\N
34	2025-05-23 18:08:19.020406+00	\N	40	\N	BALEARES	HRP30000037159	HERNANDEZ ACOSTA JULIETA VALERIA	JULIETAVHERNANDEZ@HOTMAIL.COM	\N	Iberostar Selection Llaut Palm	BR	2º JEFE/A BR	1978-12-26	2025-02-10	Supera_110%	\N	f	f	f	f	f	f	\N
35	2025-05-23 18:08:19.020406+00	\N	8	\N	BALEARES	HRP30000091631	TORREJON BONILLA JOSE MANUEL	JOSEMTORREJONB@HOTMAIL.COM	\N	Iberostar Waves Bahía de Palma	Cocina	2º JEFE/A COCINA	1988-10-13	2023-05-01	Excelente_120%	\N	f	f	f	f	f	f	\N
37	2025-05-23 18:08:19.020406+00	\N	42	\N	BALEARES	HRP30000002827	MARGINEAN FLORIN STEFAN	ASYRASTEFANIA@HOTMAIL.COM	\N	Iberostar Waves Bahía de Palma	BR	2º JEFE/A BR	1980-03-16	2003-05-20	Excelente_120%	\N	f	f	f	f	f	f	\N
38	2025-05-23 18:08:19.020406+00	\N	40	\N	BALEARES	HRP30000006325	ACUÑAS SOTO VANESA	VANE.07687@GMAIL.COM	\N	Iberostar Waves Bahía de Palma	BR	2º JEFE/A BR	1989-04-16	2015-05-05	Supera_110%	\N	f	f	f	f	f	f	\N
39	2025-05-23 18:08:19.020406+00	\N	42	\N	BALEARES	HRP30000001249	MONCAYO REAL NEREA	MONCAYONEREA@GMAIL.COM	\N	Iberostar Selection Llaut Palm	PISOS	2º JEFE/A PISOS	1985-12-06	2016-05-30	Supera_110%	\N	f	f	f	f	f	f	\N
40	2025-05-23 18:08:19.020406+00	\N	8	\N	BALEARES	HRP30000037110	SORIANO IBAÑEZ FUENSANTA CONSOLACION	FUENSANTASORIANO68@GMAIL.COM	\N	Iberostar Selection Llaut Palm	PISOS	2º JEFE/A PISOS	1968-03-27	2016-12-01	Supera_110%	\N	f	f	f	f	f	f	\N
41	2025-05-23 18:08:19.020406+00	\N	8	\N	BALEARES	HRP30000009968	ARUZAMEN ROCHA BEATRIZ TATIANA	TATITA_441@HOTMAIL.COM	\N	Iberostar Selection Playa de P	PISOS	2º JEFE/A PISOS	1988-11-06	2024-03-29	Supera_110%	\N	f	f	f	f	f	f	\N
42	2025-05-23 18:08:19.020406+00	\N	42	\N	BALEARES	HRP30000012730	TURCAN ALINA DANIELA	ALINA87DANIELA@GMAIL.COM	\N	Iberostar Selection Playa de P	Recepción	2º JEFE/A RECEPCIÓN	1987-10-07	2016-05-06	Supera_110%	\N	f	f	f	f	f	f	\N
43	2025-05-24 09:40:53.927532+00	\N	8	\N	BALEARES	HRP30000005322	LUQUE PALOU JOSE DAVID	JOSEPLUQUE89@GMAIL.COM	\N	Iberostar Albufera Park	Recepción	2º JEFE/A RECEPCIÓN	1989-04-24	2007-04-09	Excelente_120%	\N	f	f	f	f	f	f	\N
44	2025-05-24 09:40:53.927532+00	\N	42	\N	BALEARES	HRP30000004366	ZULETA PINEDA CARLOS MARIO	LEYDI_NATALIA92@HOTMAIL.COM	\N	Iberostar Albufera Park	BR	2º JEFE/A BR	1990-03-02	\N	Supera_110%	\N	f	f	f	f	f	f	\N
45	2025-05-24 09:40:53.927532+00	\N	40	\N	BALEARES	HRP30000004428	GARCIA TEJADA JUAN CARLOS	JUANCA_GT_92@HOTMAIL.ES	\N	Iberostar Albufera Park	BR	2º JEFE/A BR	1992-04-21	2016-10-06	Supera_110%	\N	f	f	f	f	f	f	\N
46	2025-05-24 09:40:53.927532+00	\N	42	\N	BALEARES	HRP30000003761	JURADO ROMERO JUAN ANTONIO	JUANALINE@HOTMAIL.COM	\N	Iberostar Albufera Park	BR	2º JEFE/A BR	1977-04-29	\N	Supera_110%	\N	f	f	f	f	f	f	\N
47	2025-05-24 09:40:53.927532+00	\N	42	\N	BALEARES	HRP30000094481	ALVAREZ FEITO FERNANDO MANUEL	NANOJAH92@GMAIL.COM	\N	Iberostar Albufera Park	Cocina	2º JEFE/A COCINA	1992-11-28	\N	Excelente_120%	\N	f	f	f	f	f	f	\N
7	2025-05-23 16:26:24.374451+00	\N	44	1	BALEARES	HRP30000008490	RODRIGUEZ RUIZ VANESA	RODRIGUEZRUIZVANESSA596@GMAIL.COM	\N	Iberostar Selection Santa Eulalia	PISOS	2º JEFE/A PISOS	1980-08-02	\N	\N	Guada	f	f	f	f	f	f	\N
19	2025-05-23 16:26:24.374451+00	\N	45	1	CANARIAS	HRP30000020915	NAVAS TERRERO, SERAFIN	ELSERADECAY@HOTMAIL.COM	\N	Iberostar Selection Fuerteventura Palace	Cocina	COORDINADOR/A COCINA	1971-12-21	2018-05-16	Excelente_120%	Meli	f	f	f	f	f	f	\N
22	2025-05-23 16:26:24.374451+00	\N	45	1	CANARIAS	HRP30000006698	DIALLO DIALLO, MAMADOU ALIOU	AFRICAGUINEE123@GMAIL.COM	\N	Iberostar Selection Fuerteventura Palace	Bar	2º JEFE/A BR	1975-01-01	2016-11-07	Supera_110%	Meli	f	f	f	f	f	f	\N
24	2025-05-23 17:16:51.595507+00	\N	8	\N	BALEARES	HRP30000037099	ANDRADE DE MORAES ESMERALDA	ESMELLANDRADE@GMAIL.COM	\N	Iberostar Selection Llaut Palm	Cocina	Jefe de Partida	1969-11-20	2016-12-20	Excelente_120%	\N	f	f	f	f	f	f	\N
29	2025-05-23 17:16:51.595507+00	\N	\N	\N	BALEARES	HRP30000009044	FERNANDEZ FRASCHETTI SANTIAGO PABLO	TOMEURANGER@HOTMAIL.COM	\N	Iberostar Waves Cala Domingos	Cocina	Jefe de Partida	1971-10-02	2021-07-01	Excelente_120%	\N	f	f	f	f	f	f	\N
27	2025-05-23 17:16:51.595507+00	\N	40	\N	BALEARES	HRP30000002031	PANEZO GUARANDA DEYSI KATIUSKA	KATIUSKAPANEZO22@HOTMAIL.COM	\N	Iberostar Waves Bahía de Palma	Cocina	Jefe de Partida	1993-05-22	2016-01-09	Excelente_120%	\N	f	f	f	f	f	f	\N
28	2025-05-23 17:16:51.595507+00	\N	8	\N	BALEARES	HRP30000105398	GARCIA PEREZ JAIME	JAIMEGARCIALUCH@GMAIL.COM	\N	Iberostar Waves Bahía de Palma	Cocina	Jefe de Partida	2002-09-04	2024-03-25	Excelente_120%	\N	f	f	f	f	f	f	\N
26	2025-05-23 17:16:51.595507+00	\N	40	\N	BALEARES	HRP30000046061	ROJO ARENAL CRISTINA	CRISROJOARENAL@GMAIL.COM	\N	Iberostar Selection Llaut Palm	Cocina	Jefe de Partida	1981-09-23	2019-06-08	Excelente_120%	\N	f	f	f	f	f	f	\N
55	2025-05-24 09:40:53.927532+00	\N	\N	\N	BALEARES	HRP30000004893	RODRIGUEZ APARICIO ISABEL MARIA	ISABEL.R.A@HOTMAIL.ES	\N	Iberostar Waves Club Cala Barc	PISOS	2º JEFE/A PISOS	1986-07-23	2015-04-05	Supera_110%	\N	f	f	f	f	f	f	\N
73	2025-05-24 09:50:30.790995+00	\N	\N	\N	Baleares	HRP30000044593	ZHANG KUNKUN	ZUMO@LIVE.CN	\N	Iberostar Waves Club Cala Barc	Cocina	2º JEFE/A COCINA	1987-10-21	2023-11-12	Excelente_120%	\N	f	f	f	f	f	f	\N
74	2025-05-24 09:50:30.790995+00	\N	\N	\N	Baleares	HRP30000004460	MORENILLA CORTES ALEX	ALEXYALECILLO@GMAIL.COM	\N	Iberostar Waves Club Cala Barc	Cocina	2º JEFE/A COCINA	1989-09-18	2024-11-03	Excelente_120%	\N	f	f	f	f	f	f	\N
49	2025-05-24 09:40:53.927532+00	\N	40	\N	BALEARES	HRP30000003319	CORRALIZA NIETO MARIA CRISTINA	CORRALIZANIETO@GMAIL.COM	\N	Iberostar Waves Playa de Muro	Cocina	2º JEFE/A COCINA	1984-07-24	\N	Supera_110%	\N	f	f	f	f	f	f	\N
50	2025-05-24 09:40:53.927532+00	\N	40	\N	BALEARES	HRP30000003407	PATON LOPEZ MARIA YOLANDA	MARIAYOLANDAPL1967@GMAIL.COM	\N	Iberostar Waves Playa de Muro	PISOS	2º JEFE/A PISOS	1967-09-12	\N	Supera_110%	\N	f	f	f	f	f	f	\N
51	2025-05-24 09:40:53.927532+00	\N	8	\N	BALEARES	HRP30000003466	GARCIA COBOS DOLORES	LOLI-23-@HOTMAIL.COM	\N	Iberostar Waves Playa de Muro	PISOS	2º JEFE/A PISOS	1985-08-20	2024-12-06	Supera_110%	\N	f	f	f	f	f	f	\N
69	2025-05-24 09:49:47.359735+00	\N	8	\N	BALEARES	HRP30000006035	PONS SEGUI ANTONIA	PONS.ANTONIA@GMAIL.COM	\N	Iberostar Waves Ciudad Blanca	Recepción	2º JEFE/A RECEPCIÓN	\N	\N	Supera_110%	\N	f	f	f	f	f	f	\N
53	2025-05-24 09:40:53.927532+00	\N	42	\N	BALEARES	HRP30000006829	BOCANEGRA PEREZ ANTONIO JESUS	BOCANEGRAPANTONIO@HOTMAIL.COM	\N	Iberostar Waves Club Cala Barc	BR	2º JEFE/A BR	1978-07-30	\N	Supera_110%	\N	f	f	f	f	f	f	\N
54	2025-05-24 09:40:53.927532+00	\N	8	\N	BALEARES	HRP30000006300	WIJATA RADOSLAW	WIJATARADEK@GMAIL.COM	\N	Iberostar Waves Club Cala Barc	BR	2º JEFE/A BR	1984-04-09	2025-01-05	Supera_110%	\N	f	f	f	f	f	f	\N
56	2025-05-24 09:40:53.927532+00	\N	8	\N	BALEARES	HRP30000003961	BALLESTER PUIGSERVER ANTONI	DHBALLESTER@GMAIL.COM	\N	Iberostar Waves Club Cala Barc	SSTT	2º JEFE/A SSTT	1992-08-22	2014-02-04	Excelente_120%	\N	f	f	f	f	f	f	\N
57	2025-05-24 09:49:47.359735+00	\N	8	\N	BALEARES	HRP30000006036	BENNASAR SALAS MARIA MAGDALENA	MARIAMAGBS@GMAIL.COM	\N	Iberostar Selection Albufera	Recepción	2º JEFE/A RECEPCIÓN	1972-04-04	2023-05-06	Excelente_120%	\N	f	f	f	f	f	f	\N
58	2025-05-24 09:49:47.359735+00	\N	8	\N	BALEARES	HRP30000009404	LLARIO GARCIA AINOHA	AINOA_BNG@HOTMAIL.COM	\N	Iberostar Selection Albufera	BR	2º JEFE/A BR	1993-06-08	\N	Supera_110%	\N	f	f	f	f	f	f	\N
59	2025-05-24 09:49:47.359735+00	\N	42	\N	BALEARES	HRP30000003884	LORENTE LORENTE SERGIO	LORENTESERGIO2@GMAIL.COM	\N	Iberostar Selection Albufera	BR	2º JEFE/A BR	1982-08-05	2011-02-08	Supera_110%	\N	f	f	f	f	f	f	\N
60	2025-05-24 09:49:47.359735+00	\N	42	\N	BALEARES	HRP30000004249	NAVARRO CAÑUETO SERGIO	SNCAPOLO@GMAIL.COM	\N	Iberostar Selection Albufera	SSTT	2º JEFE/A SSTT	\N	\N	Supera_110%	\N	f	f	f	f	f	f	\N
61	2025-05-24 09:49:47.359735+00	\N	40	\N	BALEARES	HRP30000008439	FLORIANO MESTRE MARIA	MARIA.FLORIANO.MESTRE@GMAIL.COM	\N	Iberostar Selection Albufera	Cocina	2º JEFE/A COCINA	1985-05-03	2017-03-04	Supera_110%	\N	f	f	f	f	f	f	\N
62	2025-05-24 09:49:47.359735+00	\N	40	\N	BALEARES	HRP30000002295	GIOVANNETTI MAURIZIO	MAURIZIO.GIOVANNETTI88@GMAIL.COM	\N	Iberostar Selection Albufera	Cocina	2º JEFE/A COCINA	1988-10-11	\N	Excelente_120%	\N	f	f	f	f	f	f	\N
63	2025-05-24 09:49:47.359735+00	\N	42	\N	BALEARES	HRP30000004974	MARTINEZ VICO MARIA JOSE	MAJOMAVI69@GMAIL.COM	\N	Iberostar Waves Alcudia Park	BR	2º JEFE/A BR	\N	\N	Supera_110%	\N	f	f	f	f	f	f	\N
64	2025-05-24 09:49:47.359735+00	\N	8	\N	BALEARES	HRP30000090088	HERNANDEZ GIANCARLO	GIANCARLOHERNANDEZMONTICONE89@GMAIL.COM	\N	Iberostar Waves Playa de Muro	Cocina	2º JEFE/A COCINA	\N	2024-11-03	Supera_110%	\N	f	f	f	f	f	f	\N
65	2025-05-24 09:49:47.359735+00	\N	8	\N	BALEARES	HRP30000003747	ORTEGA GARCIA MARGARITA	MARGA-0000@HOTMAIL.ES	\N	Iberostar Waves Playa de Muro	PISOS	2º JEFE/A PISOS	\N	\N	Supera_110%	\N	f	f	f	f	f	f	\N
66	2025-05-24 09:49:47.359735+00	\N	42	\N	BALEARES	HRP30000003514	JIMENEZ QUINTANILLA RAFAEL	RAJIMQUINTA@HOTMAIL.COM	\N	Iberostar Waves Playa de Muro	BR	2º JEFE/A BR	\N	2004-02-02	Supera_110%	\N	f	f	f	f	f	f	\N
67	2025-05-24 09:49:47.359735+00	\N	8	\N	BALEARES	HRP30000003768	DE LA BARRERA MORALES ANDRES	ANDRESDELABARRERAMORALES@GMAIL.COM	\N	Iberostar Playa de Muro Village	BR	2º JEFE/A BR	\N	\N	Supera_110%	\N	f	f	f	f	f	f	\N
68	2025-05-24 09:49:47.359735+00	\N	40	\N	BALEARES	HRP30000005451	SANTAMARTA MORAL ANTONIA	ANTONIASANTAMARTA1@GMAIL.COM	\N	Iberostar Waves Ciudad Blanca	BR	2º JEFE/A BR	\N	2002-02-04	Excelente_120%	\N	f	f	f	f	f	f	\N
52	2025-05-24 09:40:53.927532+00	\N	40	\N	BALEARES	HRP30000005730	SCHETTINI LUCAS EZEQUIEL	SCHETTINI2JT@GMAIL.COM	\N	Iberostar Waves Ciudad Blanca	SSTT	2º JEFE/A SSTT	1988-07-30	\N	Supera_110%	\N	f	f	f	f	f	f	\N
70	2025-05-24 09:49:47.359735+00	\N	40	\N	BALEARES	HRP30000058524	ORTEGA TORO MARTA	MOT2MOT3@GMAIL.COM	\N	Iberostar Playa de Muro Village	Recepción	2º JEFE/A RECEPCIÓN	\N	\N	Supera_110%	\N	f	f	f	f	f	f	\N
71	2025-05-24 09:49:47.359735+00	\N	42	\N	BALEARES	HRP30000009488	COSME MASA ANGEL	ANGELCOSME89@ICLOUD.COM	\N	Iberostar Waves Alcudia Park	Cocina	2º JEFE/A COCINA	\N	\N	Supera_110%	\N	f	f	f	f	f	f	\N
75	2025-05-24 09:50:30.790995+00	\N	8	\N	Baleares	HRP30000040243	PONS ALARCON ANTONIO	PONSFONSI34@GMAIL.COM	\N	Iberostar Waves Club Cala Barc	SSTT	2º JEFE/A SSTT	1989-03-28	2019-11-03	Supera_110%	\N	f	f	f	f	f	f	\N
76	2025-05-24 09:50:30.790995+00	\N	42	\N	Baleares	HRP30000004012	PALLARES ROBLES MARIA PURIFICACION	M.PALLARES@LIVE.COM	\N	Iberostar Waves Club Cala Barc	PISOS	2º JEFE/A PISOS	1972-07-30	\N	Supera_110%	\N	f	f	f	f	f	f	\N
77	2025-05-24 09:50:30.790995+00	\N	8	\N	Baleares	HRP30000008326	GARCIA GAMEZ TANIA	GARCIATANIA1979@GMAIL.COM	\N	Iberostar Waves Club Cala Barc	PISOS	2º JEFE/A PISOS	1979-01-20	2002-11-04	Supera_110%	\N	f	f	f	f	f	f	\N
78	2025-05-24 09:50:30.790995+00	\N	40	\N	Baleares	HRP30000003374	AGUILAR RODRIGUEZ FRANCISCO	AGUILARRODRIGUEZ1902@GMAIL.COM	\N	Iberostar Waves Club Cala Barc	BR	2º JEFE/A BR	1969-02-19	\N	Supera_110%	\N	f	f	f	f	f	f	\N
79	2025-05-24 09:50:30.790995+00	\N	40	\N	Baleares	HRP30000004608	VALLE CHAVES JONATAN	JONI21CORIPE@GMAIL.COM	\N	Iberostar Waves Club Cala Barc	BR	2º JEFE/A BR	1991-02-14	\N	Supera_110%	\N	f	f	f	f	f	f	\N
80	2025-05-24 09:50:30.790995+00	\N	8	\N	Baleares	HRP30000042966	NIETO MORENO JUAN CARLOS	JUANNIETO1976@HOTMAIL.COM	\N	Iberostar Waves Cala Domingos	BR	2º JEFE/A BR	1976-10-12	2024-04-11	Supera_110%	\N	f	f	f	f	f	f	\N
82	2025-05-24 09:50:30.790995+00	\N	40	\N	Baleares	HRP30000008282	SANTAELLA MARTIN JOSE	JOYALB@HOTMAIL.COM	\N	Iberostar Waves Cala Millor	SSTT	2º JEFE/A SSTT	1973-12-31	\N	Supera_110%	\N	f	f	f	f	f	f	\N
84	2025-05-24 09:50:30.790995+00	\N	8	\N	Baleares	HRP30000020576	VAZQUEZ VAZQUEZ IAGO	VAZQUEZVAZQUEZYAGO94@GMAIL.COM	\N	Iberostar Waves Pinos Park	Cocina	2º JEFE/A COCINA	1994-07-05	\N	Supera_110%	\N	f	f	f	f	f	f	\N
85	2025-05-24 09:50:30.790995+00	\N	42	\N	Baleares	HRP30000006330	LOPEZ ALVAREZ RAUL	PIKILLO24242424@GMAIL.COM	\N	Iberostar Waves Pinos Park	Recepción	2º JEFE/A RECEPCIÓN	1982-06-03	2024-11-11	Supera_110%	\N	f	f	f	f	f	f	\N
86	2025-05-24 09:50:30.790995+00	\N	42	\N	Baleares	HRP30000005756	RIQUELME BEDOYA LUIS MARIA	KUMBA1234@HOTMAIL.COM	\N	Iberostar Selection Es Trenc	Cocina	2º JEFE/A COCINA	1987-03-16	\N	Excelente_120%	\N	f	f	f	f	f	f	\N
81	2025-05-24 09:50:30.790995+00	\N	45	\N	Baleares	HRP30000008948	GALLARDO MARIN MIGUEL ANGEL	GALLAR.2@LIVE.COM	\N	Iberostar Waves Cala Domingos	Cocina	2º JEFE/A COCINA	1982-03-17	\N	Excelente_120%	\N	f	f	f	f	f	f	\N
88	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000000068	MORA NAVARRO, ALEXIS JESUS	ALICOCI_03@HOTMAIL.COM	\N	Iberostar Bouganville Playa	Cocina	2º JEFE/A COCINA	1974-07-26	2006-12-10	Supera_110%	\N	f	f	f	f	f	f	\N
89	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000002789	PALMERO PALMERO, JENNIFER	JENNI_PALMERO@HOTMAIL.COM	\N	Iberostar Heritage Grand Mencey	Cocina	2º JEFE/A COCINA	1982-03-30	2007-09-07	Supera_110%	\N	f	f	f	f	f	f	\N
90	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000091605	PEREZ SIMON, KIM SARAI	KIMSARAI1985@GMAIL.COM	\N	Iberostar Heritage Grand Mencey	Pisos	2º JEFE/A PISOS	1985-07-17	2023-08-05	Supera_110%	\N	f	f	f	f	f	f	\N
91	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000001160	PRADO COMPANIONI, MAIRELIS	PRADOMAIRELIS@YAHOO.ES	\N	Iberostar Las Dalias	Pisos	2º JEFE/A PISOS	1985-08-24	2024-01-07	Excelente_120%	\N	f	f	f	f	f	f	\N
92	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000076871	RAMIREZ PEREZ, YUDISLEIDY	YUMAIRAMIREZ656@GMAIL.COM	\N	Olé Tropical Tenerife	Recepción	2º JEFE/A RECEPCIÓN	1981-12-05	\N	Supera_110%	\N	f	f	f	f	f	f	\N
93	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000002302	RIGOTTI, STEFANO	RIGOSX@GMAIL.COM	\N	Iberostar Las Dalias	Recepción	2º JEFE/A RECEPCIÓN	1989-04-30	\N	Supera_110%	\N	f	f	f	f	f	f	\N
94	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000087194	RIOL MORENO, JAVIER IGNACIO	JAVIRIOL@HOTMAIL.COM	\N	Iberostar Heritage Grand Mencey	Cocina	2º JEFE/A COCINA	1983-01-27	\N	Supera_110%	\N	f	f	f	f	f	f	\N
95	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000054074	RODRIGUEZ RODRIGUEZ OMAR ENRIQUE	YOMARDGUEZ@GMAIL.COM	\N	Iberostar Las Dalias	Servicio Técnic	2º JEFE/A SSTT	1975-04-06	2019-02-12	Cumple_100%	\N	f	f	f	f	f	f	\N
96	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000001914	SANCHEZ FERNANDEZ, PATRICIA	PATRISHAES@HOTMAIL.COM	\N	Iberostar Las Dalias	Recepción	2º JEFE/A RECEPCIÓN	1980-09-19	2018-01-11	Supera_110%	\N	f	f	f	f	f	f	\N
97	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000082048	SANCHEZ HERNANDEZ, GORKA	GORKA_83@HOTMAIL.COM	\N	Iberostar Selection Sábila	Cocina	2º JEFE/A COCINA	1992-11-20	2022-01-08	Excelente_120%	\N	f	f	f	f	f	f	\N
98	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000000185	SANCHEZ LUIS, RENE	CHICHARRERO91@HOTMAIL.COM	\N	Iberostar Selection Sábila	Servicio Técnic	2º JEFE/A SSTT	1991-03-11	2015-07-12	Supera_110%	\N	f	f	f	f	f	f	\N
99	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000065960	SIMON MORERA, ANA IVIS	ANAIVISIMONMORERA@GMAIL.COM	\N	Iberostar Bouganville Playa	Pisos	2º JEFE/A PISOS	1994-02-02	2024-09-07	Supera_110%	\N	f	f	f	f	f	f	\N
101	2025-05-24 09:51:21.926432+00	\N	\N	\N	\N	HRP30000002566	ZAREMBA MACIEJEWSKA ANNA KATARZYNA	ANULKA5555@HOTMAIL.COM	\N	Iberostar Bouganville Playa	Recepción	2º JEFE/A RECEPCIÓN	1975-02-05	2024-08-04	Cumple_100%	\N	f	f	f	f	f	f	\N
102	2025-05-24 09:52:24.442197+00	\N	\N	\N	Canarias	HRP30000001204	ABAD SUAREZ, JOSE ANTONIO	JAAS_7_17@HOTMAIL.COM	\N	Iberostar Heritage Grand Mencey	Servicio Técnic	2º JEFE/A SSTT	1988-05-17	2015-01-04	Supera_110%	\N	f	f	f	f	f	f	España
103	2025-05-24 09:52:24.442197+00	\N	\N	\N	Canarias	HRP30000002155	ALONSO ESPINOSA, LUIS	LALONSOE@GMAIL.COM	\N	Iberostar Heritage Grand Mencey	Recepción	2º JEFE/A RECEPCIÓN	1985-10-16	2014-02-11	Excelente_120%	\N	f	f	f	f	f	f	España
105	2025-05-24 09:52:24.442197+00	\N	\N	\N	Canarias	HRP30000005755	BATTILORO, MICHELE	AXEL.LAMB74@GMAIL.COM	\N	Iberostar Bouganville Playa	Cocina	2º JEFE/A COCINA	1974-08-07	2016-09-11	Supera_110%	\N	f	f	f	f	f	f	España
106	2025-05-24 09:52:24.442197+00	\N	\N	\N	Canarias	HRP30000012338	CASTILLO GUTIERREZ, FRANCISCO ANTONIO	ARCHY_97@HOTMAIL.COM	\N	Iberostar Bouganville Playa	Bar	2º JEFE/A BR	1977-06-26	\N	Supera_110%	\N	f	f	f	f	f	f	España
107	2025-05-24 09:52:24.442197+00	\N	\N	\N	Canarias	HRP30000001100	CORBO AREA, KARINA NOEL	ROKAYBRU@HOTMAIL.COM	\N	Iberostar Grand El Mirador	Pisos	2º JEFE/A PISOS	1970-04-22	\N	Supera_110%	\N	f	f	f	f	f	f	España
109	2025-05-24 09:52:24.442197+00	\N	\N	\N	Canarias	HRP30000010939	DIAZ PAEZ YASMINA	YAZMINADIPA87@GMAIL.COM	\N	Iberostar Selection Sábila	Pisos	\N	\N	2019-02-07	\N	\N	f	f	f	f	f	f	\N
111	2025-05-24 09:52:24.442197+00	\N	\N	\N	Canarias	HRP30000111400	GONZALEZ GOMEZ, AUREA ESTHER	AUREAESTHERGLEZGOMEZ@GMAIL.COM	\N	Iberostar Heritage Grand Mencey	Pisos	2º JEFE/A PISOS	1985-03-26	\N	Supera_110%	\N	f	f	f	f	f	f	España
112	2025-05-24 09:52:24.442197+00	\N	\N	\N	Canarias	HRP30000008354	MAGALLANES SILVA, LINDA MARIA	LINDAMARIA668@GMAIL.COM	\N	Iberostar Las Dalias	Bar	COORDINADOR/A BR	1980-03-02	2018-06-04	Excelente_120%	\N	f	f	f	f	f	f	España
113	2025-05-24 09:52:24.442197+00	\N	\N	\N	Canarias	HRP30000001075	MARTIN ESTEBAN, JENNIFER	JENNI3_LPB@HOTMAIL.COM	\N	Iberostar Selection Anthelia	Bar	2º JEFE/A BR	1993-03-31	\N	Supera_110%	\N	f	f	f	f	f	f	España
115	2025-05-24 09:52:24.442197+00	\N	\N	\N	Canarias	HRP30000000451	MESA SANCHEZ, DANNUBI NATALY	DANNUBI82@GMAIL.COM	\N	Iberostar Grand El Mirador	Cocina	2º JEFE/A COCINA	1982-12-20	\N	Supera_110%	\N	f	f	f	f	f	f	España
25	2025-05-23 17:16:51.595507+00	\N	8	\N	BALEARES	HRP30000004906	RODRIGUEZ APARICIO CRISTINA	CRISTINA2112M@GMAIL.COM	\N	Iberostar Selection Llaut Palm	Cocina	Jefe de Partida	1992-11-07	2022-01-25	Excelente_120%	\N	f	f	f	f	f	f	\N
116	2025-05-24 09:52:24.442197+00	\N	3	\N	Canarias	HRP30000042916	MOLINA CARDONA, MARIA ANTONIA	MARIA.ANTONIA.MOLINA@LIVE.COM	\N	Iberostar Las Dalias	Bar	2º JEFE/A BR	1999-02-25	\N	Supera_110%	\N	f	f	f	f	f	f	España
87	2025-05-24 09:50:30.790995+00	\N	42	\N	Baleares	HRP30000002568	RANZENBERGER FAYE RONJA MONTANA	FAYERONJA27@GMAIL.COM	\N	Iberostar Selection Es Trenc	Recepción	2º JEFE/A RECEPCIÓN	1992-10-27	\N	Supera_110%	\N	f	f	f	f	f	f	\N
83	2025-05-24 09:50:30.790995+00	\N	1	\N	Baleares	HRP30000106142	COMAS LOZANO MERCEDES	MCOMASLOZANO@GMAIL.COM	\N	Iberostar Waves Pinos Park	Cocina	2º JEFE/A COCINA	1977-09-13	2025-03-04	Excelente_120%	\N	f	f	f	f	f	f	\N
48	2025-05-24 09:40:53.927532+00	\N	1	\N	BALEARES	HRP30000010298	SUAREZ MOYA, CHRISTIAN	CHRISTIANSUAREZMOYA@HOTMAIL.COM	\N	Iberostar Albufera Park	Cocina	2º JEFE/A COCINA	1992-09-14	\N	Excelente_120%	\N	f	f	f	f	f	f	\N
114	2025-05-24 09:52:24.442197+00	\N	1	\N	Canarias	HRP30000002848	MARTIN RODRIGUEZ, MARIA TERESA	MAITECARACAS2@GMAIL.COM	\N	Iberostar Las Dalias	Pisos	2º JEFE/A PISOS	1975-03-07	2015-06-08	Excelente_120%	\N	f	f	f	f	f	f	España
\.


--
-- Data for Name: idiomaNivel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."idiomaNivel" ("id", "created_at", "nombre", "lang") FROM stdin;
1	2025-05-13 11:14:45.540117+00	Básico	es
2	2025-05-13 11:14:53.963684+00	Intermedio	es
3	2025-05-13 11:15:02.765754+00	Avanzado	es
4	2025-05-13 11:15:07.466024+00	Nativo	es
5	2025-05-13 11:16:13.57863+00	Basic	en
6	2025-05-13 11:16:20.918742+00	Intermediate	en
7	2025-05-13 11:16:31.825359+00	Advanced	en
8	2025-05-13 11:16:39.390101+00	Native	en
9	2025-05-13 11:16:49.385374+00	Básico	pt
10	2025-05-13 11:16:56.206144+00	Intermediário	pt
11	2025-05-13 11:17:02.838364+00	Avançado	pt
12	2025-05-13 11:17:09.367265+00	Nativo	pt
\.


--
-- Data for Name: informeTipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."informeTipo" ("id", "created_at", "tipoInforme") FROM stdin;
1	2025-05-16 14:15:48.05754+00	Feedback
2	2025-05-16 14:15:57.543696+00	Potencial
3	2025-05-16 14:16:02.602065+00	Competencias
\.


--
-- Data for Name: informe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."informe" ("id", "created_at", "evaluadoId", "consultoraId", "formacionAcademica", "experienciaProfesional", "updated_date", "capacidadPotencialActual", "capacidadPotencialFutura", "recomendaciones", "propuestasDesarrollo", "conclusiones", "potencial", "cpa5", "cpa10", "modo", "disponibilidad", "breveDescripcionDisponibilidad", "disponibilidadComment", "tipoInformeId", "balanceNivel", "balanceDescripcion") FROM stdin;
43	2025-06-17 06:52:43.007315+00	12	44	Es auxiliar Electrónico, egresado del IES Málaga de donde es oriundo. Realizó algunos cursos y formaciones en trabajo en altura y electricidad. 	Empezó su carrera laboral en el 2002 como constructor para la obra del Hotel - Torrox Costa Málaga - en el cual se desempeña actualmente, y posteriormente recibió la oferta de quedarse trabajando como Técnico.\nHasta el 2023 ocupó el rol de técnico de mantenimiento para el Hotel, y en el 2024 lo han ascendido a Jefe segundo del equipo.	17/06/2025			No se recomienda su promoción.	Participar en un programa de mentoría o sesiones de coaching enfocadas en el desarrollo de habilidades de delegación, comunicación asertiva, establecimiento de pautas claras e influencia sobre el equipo.\nRealizar talleres o capacitaciones específicas en técnicas de organización, priorización de tareas y gestión eficiente de recursos, con foco en el desarrollo de la autonomía operativa.\n	Se destaca por su fuerte compromiso, responsabilidad y dedicación en el cumplimiento de los objetivos que se le asignan. Posee un estilo de colaboración altamente desarrollado, caracterizado por su cercanía, amabilidad y capacidad de generar vínculos de confianza dentro del equipo. Su comunicación es clara y concreta, lo que facilita el trabajo conjunto y contribuye a un clima laboral positivo. Además, muestra una fuerte alineación con los lineamientos de la organización y una gran disposición para ayudar y escuchar las necesidades de los demás.\nDesde el punto de vista de la gestión y la eficiencia operativa, muestra un buen desempeño en la ejecución de planes operativos y en la resolución de problemas de corto plazo, con capacidad para reaccionar con rapidez ante imprevistos. Sin embargo, requiere de acompañamiento para organizar sus prioridades, planificar de forma más estratégica y gestionar los recursos de manera eficiente, aspectos que le permitirían ganar mayor autonomía y efectividad.\nEn el ámbito del liderazgo, aún se encuentra en proceso de consolidación de un estilo propio. Le cuesta delegar y establecer pautas con firmeza, lo que puede limitar el desarrollo de los colaboradores a su cargo. Asimismo, tiene oportunidades de mejora en su capacidad de influencia, persuasión y anticipación de dinámicas, habilidades que fortalecerían su desempeño en la gestión de personas y toma de decisiones.\nEn relación a su orientación al cliente, si bien su contacto directo con el cliente externo es limitado, demuestra una clara vocación de servicio y una buena capacidad para comprender y atender requerimientos técnicos. No obstante, en su afán por colaborar, puede sobrecargarse de tareas al tener dificultades para establecer límites, lo que impacta en su eficiencia operativa.\nFinalmente, es una persona que respeta los lineamientos de sostenibilidad y buenas prácticas cuando estos están definidos, aunque le sería beneficioso desarrollar una mirada más proactiva y autónoma en este aspecto, proponiendo alternativas y aportes propios.\n	Bajo				Nula		No está interesado en reubicarse en otro Hotel por el momento.	3		
37	2025-06-09 09:42:11.041435+00	14	44	Estudió para Técnico superior en Cocina y Gastronomía, y posteriormente complementó su titulo con una tecnicatura en dirección de Cocina, ambos estudios en el IES.	Al finalizar la Tecnicatura, inició su carrera laboral. Entre 2006 y 2007 trabajó en el Restaurante Las Pirámides del Gourmet (Granada), desempeñándose como cocinero. Posteriormente, entre 2010 y 2014, formó parte del equipo del Restaurante El Coto (Almargen, Málaga), donde continuó desarrollando su experiencia en cocina. En 2014, trabajó como cocinero en el Hotel Catalonia Reina Victoria (Ronda, Málaga), y en 2015 asumió el rol de jefe de cocina en el Hotel La Fuente del Sol. Desde 2016 hasta la actualidad, se desempeña como segundo jefe de cocina en Iberostar Waves Málaga Playa (Torrox, Málaga).\n	10/06/2025			Antes de asumir un salto en su desarrollo profesional es recomendable que consolide las competencias de liderazgo, y de la gestión eficiente de los recursos y tiempos.	Participar en espacios de formación o coaching orientados a la conducción de equipos, manejo de conflictos y toma de decisiones, con foco en el desarrollo de una postura más proactiva y con mayor impacto sobre sus compañeros. También se sugiere asumir progresivamente pequeñas responsabilidades de coordinación dentro de la cocina para ejercitar ese rol.\n\n	Alejandro demuestra un perfil con una fuerte orientación al servicio y al trabajo colaborativo, aspectos que lo posicionan como un miembro valioso dentro del equipo operativo. Su compromiso con la calidad, especialmente en lo relacionado con la cocina, refleja una vocación genuina por brindar una experiencia satisfactoria al cliente. Además, su actitud autocrítica y su interés por superarse marcan una base sólida para el desarrollo profesional a futuro.\nSin embargo, su estilo de comunicación, si bien claro y directo, puede beneficiarse de una mayor elaboración y cuidado en lo gestual y expresivo, sobre todo al interactuar con clientes. Del mismo modo, se identifican oportunidades de mejora en términos de liderazgo y eficiencia, áreas en las que podría fortalecerse para asumir mayores responsabilidades o liderar equipos con mayor impacto y dirección.\nDesde lo motivacional, Alejandro expresa el deseo de asumir nuevos desafíos fuera de su contexto actual, buscando roles que le ofrezcan mayor dinamismo, variedad y crecimiento. Su proyección se vincula a la posibilidad de ocupar posiciones de referencia dentro del ámbito gastronómico, inspirándose en figuras reconocidas por su trayectoria. Este anhelo, junto a su disposición al aprendizaje y mejora continua, configuran un potencial de desarrollo que, con el acompañamiento adecuado, podría traducirse en una evolución significativa tanto en el plano técnico como en el interpersonal.\n	Medio				Parcial		Podría trasladarse a un Hotel en una Ciudad cercana a la actual, si bien no demuestra una fuerte motivación por reubicarse en otro lugar geofráfico.	3		
46	2025-06-18 10:48:24.78775+00	10	44	Completó inicialmente el Bachillerato en el IES Miraya del Mar, donde adquirió una sólida base académica. Posteriormente, realizó varios cursos formativos relacionados con la hotelería y la restauración. Estos cursos le permitieron consolidar su conocimiento en áreas clave como la atención al cliente, protocolo, gestión de sala y habilidades de liderazgo, complementando así tanto su formación académica como su experiencia práctica en establecimientos de prestigio.	Desde sus inicios en 1996 como camarero en Marisquería La Bodega, ha demostrado una vocación clara por la hostelería y el servicio al cliente. A lo largo de su trayectoria, ha consolidado su experiencia en distintos establecimientos de renombre como el Asador Los Tizos, el Hotel Byblos Andaluz, el Parador de Nerja y el Hotel Riu Ferrara, donde trabajó durante ocho años, desarrollando una sólida base operativa en sala.\nEn 2011 se incorpora al Hotel Iberostar Málaga Playa, donde inicia un período de crecimiento profesional sostenido. A lo largo de los años, no solo se afianza en su puesto, sino que también asume roles de mayor responsabilidad, hasta convertirse en jefe de sector y 2° Maître en 2022. Además, ha sido convocado como 2° Maître en funciones en otros hoteles del grupo Iberostar, tanto en el Algarve (Portugal) como en Andalucía, lo que demuestra la confianza depositada en su liderazgo y capacidad de adaptación a distintos entornos operativos.\nActualmente, con una trayectoria de casi 30 años en el sector, aspira a continuar desarrollándose dentro de mandos intermedios o posiciones de Maître, enfocado en la mejora continua del servicio, la gestión de equipos y la excelencia en la atención al cliente. Su objetivo profesional es seguir creciendo dentro de la cadena Iberostar, aportando experiencia, compromiso y un enfoque orientado a resultados.\n	18/06/2025			En el mediano plazo, podrá asumir un cargo jerárquico superior, en la medida que consolide sus habilidades de liderazgo.	Participar en formaciones o talleres sobre liderazgo motivacional. Esto le permitirá incorporar herramientas prácticas para inspirar a su equipo, aumentar su capacidad para generar compromiso y fortalecer su mirada global del negocio, facilitando una mejor priorización y coordinación de objetivos comunes.\n\nInvolucrarse activamente en iniciativas que impliquen trabajar con distintas áreas o adaptarse a nuevas formas de trabajo puede ayudarle a ganar agilidad frente al cambio, ejercitar la toma de decisiones autónoma y reforzar su flexibilidad operativa y mental.		Medio				Parcial		Está abierto a recibir y valorar oportunidades en otras ciudades o países. Ya ha tenido experiencias laborales fuera de su lugar de residencia y no descarta volver a hacerlo si el desafío profesional resulta interesante y compatible con su situación personal. De todos modos, debe evaluar el lugar y la propuesta.	3		
39	2025-06-09 19:05:04.836859+00	83	1	actualiz uno q ya existe comas		19/06/2025					xzcx	Medio	IB	IB	I	Parcial			3	🟠 Si	
44	2025-06-17 16:32:42.150706+00	22	45	Mamadou tiene 50 años de edad, oriundo de Guinea, África. Ingresó como estudiante a Europa, momento en el que emprendió la carrera de Ingeniería Civil, de la cual cursó un año y debió abandonar por la imposibilidad de sostener económicamente sus estudios. Se mudó a Alemania y visitó Fuerteventura de vacaciones, donde se quedó a vivir debido a que conoció a su actual esposa. \n\nSobre su formación agrega que realiza continuamente los cursos que ofrece la compañía mediante StarTeam, dado que son formaciones cortas. Le gustaría capacitarse en temas compatibles con su desempeño laboral, aunque no encuentra el tiempo para ello. \n	Acerca de su recorrido laboral comparte que trabajó durante 1 año en Robinson Club, 8 meses en Magic Live y desde hace 15 años trabaja en Iberostar. Empezó en la compañía como Lavaplatos, luego asumió el rol de Ayudante de Camarero. Avanzó al puesto de Camarero, y tiempo después como Jefe de sector. Desde hace 4 años es 2° Jefe de Bares y Restaurantes. 	19/06/2025			- Atreverse al cuestionamiento de lo establecido, mediante formaciones o generando el espacio, orientados a crear en pos de la mejora continua.	- Habilitar el tiempo para que logre aumentar su destreza en el uso de herramientas digitales, debido a que reconoce una carencia respecto al conocimiento sobre informática, para lo que necesita contar con acompañamiento y disponibilidad para la formación.\n- Exponer a negociaciones desafiantes, en las que Mamadou pueda entrenar la persuasión y la influencia, al posicionarse con dominancia en función de lo que pretende concretar. \n\n	Mamadou es un talento comprometido con la compañía, que disfruta de trabajar con y para personas. Si bien se encuentra abierto a lo que la empresa disponga, se visualiza con prioridad protagonizando oportunidades de crecimiento dentro del Departamento al que pertenece en la actualidad. Destaca por su sencillez y su interés por las personas; necesitará trabajar en su firmeza y determinación al tomar decisiones.	Alto				Total		Mamadou expone sobre su apertura para protagonizar cambios de residencia. Se siente a gusto en Canarias, por lo que preferiría permanecer allí, aunque en el caso de que se le proponga un cambio le gustaría conocer una cultura completamente diferente, para nutrirse de la misma. 	3		
45	2025-06-17 17:09:09.760862+00	15	45			17/06/2025						Alto				Parcial			3		
40	2025-06-12 11:02:31.041446+00	7	44	Ha finalizado la Educación General Básica en Granada, y no ha realizado otras formaciones académicas.	Vanessa inició su experiencia laboral en el año 2000 en el sector hotelero, desempeñándose como camarera de guardia en el Hotel Cala Verde en Ibiza. Al año siguiente, continuó su carrera como camarera de pisos en el Hotel Augusta, también en Ibiza, donde afianzó sus primeras habilidades en limpieza, mantenimiento de estándares de calidad y atención al detalle.\n\nEn 2002, asumió el cargo de gerente en el Restaurante Es Riu, donde amplió sus responsabilidades gestionando la supervisión de limpieza, el control de stock, la gestión de lencería y amenities, así como la planificación de turnos y horarios del personal. Durante este período, desarrolló importantes competencias en comunicación, resolución de conflictos y organización, manteniéndose en el puesto durante trece años hasta 2015.\n\nPosteriormente, se incorporó al Hotel Iberostar Santa Eulalia en el puesto de camarera de pisos, función que desempeñó durante siete años, consolidando su conocimiento y experiencia en el área operativa hotelera.\n\nDesde julio de 2022 y hasta la actualidad, Vanessa ejerce el rol de subgobernanta en el Hotel Iberostar Santa Eulalia, donde coordina equipos de trabajo, asegura el cumplimiento de los estándares de calidad y continúa perfeccionando sus habilidades de supervisión, liderazgo, adaptación y aprendizaje continuo dentro del sector hotelero.	14/06/2025			No se recomienda su promoción.	Incorporar espacios regulares de retroalimentación que le permitan trabajar la escucha activa y la gestión emocional, ayudándola a equilibrar su impulso con una comunicación más empática y efectiva. Además, fomentar la práctica de delegación gradual para que pueda soltar el control y potenciar la autonomía del equipo.\n\nProveerle herramientas y metodologías para organizar y priorizar tareas con visión más amplia. Complementar con acompañamiento de referentes para que pueda internalizar estos hábitos y mantener la calidad bajo presión.	Se trata de una persona con un alto nivel de energía, entusiasmo y compromiso con las tareas, que muestra un estilo de acción orientado a resultados concretos y soluciones prácticas. Su actitud proactiva y su voluntad de involucrarse activamente la convierten en un perfil valioso en contextos donde se requiere ejecución operativa, empuje y reacción rápida frente a imprevistos.\nSin embargo, este enfoque centrado en la acción también le trae algunas limitaciones: su impulsividad y su tendencia a priorizar lo inmediato por sobre lo estratégico pueden comprometer tanto la calidad como la planificación de sus tareas, especialmente en contextos de presión. Si bien tiene la capacidad de enfocarse y sostener el ritmo de trabajo, aún necesita apoyarse en otros para organizarse, priorizar y mantener una visión global que trascienda su área o tarea.\nEn su relación con los demás, tiende a colaborar en entornos donde existe cercanía o afinidad, mostrando una buena predisposición cuando se siente cómoda. Fuera de ese entorno, puede mostrarse reactiva o poco flexible, especialmente frente a opiniones divergentes o situaciones que la incomodan. Esto puede afectar el clima de trabajo y limitar la cooperación. Su comunicación suele ser directa y clara, pero informal o poco cuidada, lo que en ciertos casos puede generar roces o malentendidos.\nSi bien logra adaptarse frente al cliente, cuidando su actitud con más conciencia en esos contextos, todavía está en proceso de desarrollar una empatía más sostenida y una mayor vocación de servicio. Algo similar ocurre con su vínculo hacia la sostenibilidad: si bien comprende su importancia y acompaña las iniciativas existentes, aún no integra activamente esta perspectiva en sus decisiones o propuestas.\n	Bajo				Nula		No posee disposición para trasladarse a ningún otro destino.	3		
41	2025-06-14 07:56:36.91779+00	8	44	Rafael es Ingeniero Electrónico Industrial graduado de la Escuela Politécnica de Córdoba.	Si bien es Ingeniero de profesión, a raíz de una crisis económica ha comenzado a trabajar en el Hotel Cartago del Grupo Oasis como Conserje nocturno, desde el 2010 hasta el 2014.\nMotivado por esta experiencia decide continuar dentro de la Industria, y en el 2016 ingresa al Ibersotar	14/06/2025			No se recomienda su promoción dado que no posee mayores expectativas de crecimiento.	Su fuerte vocación colaborativa y disposición constante a ayudar pueden derivar en una sobrecarga personal. Trabajar en la capacidad de establecer límites saludables y delegar responsabilidades de forma efectiva no solo favorecerá su bienestar, sino que también permitirá un desarrollo más autónomo de los miembros del equipo, promoviendo su crecimiento y compromiso.\n	se destaca por un liderazgo basado en el compromiso, la responsabilidad y la coherencia en el hacer, más que en la búsqueda activa de roles formales. Su influencia se ejerce a través del ejemplo, promoviendo un ambiente participativo y confiable, aunque con un enfoque operativo y reactivo que limita su proyección estratégica y su capacidad de anticipación. A pesar de ello, representa un pilar estable y funcional dentro del equipo, aportando soluciones prácticas y sosteniendo procesos cotidianos con eficacia.\nSu fuerte vocación colaborativa y disposición para ayudar a los demás contribuyen a crear un clima laboral positivo y de confianza, donde la transparencia y la empatía son moneda corriente. Sin embargo, esta dedicación puede llevarlo a sobrecargarse, lo que impacta en su bienestar y puede reflejarse en su comunicación cuando está bajo presión. Trabajar en la gestión de límites y la delegación será clave para mantener su aporte sostenible en el tiempo.\nEn cuanto a la eficiencia, cumple con sus responsabilidades con profesionalismo y prudencia, mostrando capacidad para resolver problemas concretos aunque con un estilo mayormente reactivo. Prefiere objetivos y tiempos definidos por otros, con una mirada orientada al corto y mediano plazo, lo que puede restringir su impacto a nivel estratégico. La mejora en la anticipación, priorización y autonomía en la toma de decisiones abrirá espacios para que su desempeño alcance nuevos niveles.\nSe identifica además con los valores de sostenibilidad organizacional, actuando como embajador de las políticas ambientales y promoviendo su implementación con compromiso genuino. Su sensibilidad hacia el cuidado del medio ambiente y su disposición para colaborar lo posicionan como un aliado importante en la cultura de sustentabilidad, aún cuando pueda requerir apoyo externo en situaciones complejas.\nFinalmente, su enfoque en la excelencia con el cliente se manifiesta en una atención cálida, empática y transparente, buscando siempre responder ágilmente a las demandas para asegurar la satisfacción y fortalecer la confianza a largo plazo. Este equilibrio entre compromiso interno y orientación externa lo convierte en un recurso valioso para la organización, con un potencial significativo para seguir creciendo mediante el desarrollo de una visión más estratégica y habilidades de liderazgo consciente.\n\n	Medio				Nula		No siente un impulso fuerte por reubicarse ni por iniciar nuevas experiencias profesionales en lugares diferentes. Su prioridad es mantenerse en un entorno estable donde pueda aportar su experiencia y continuar desarrollándose con tranquilidad.	3		
21	2025-06-02 15:29:47.192213+00	28	8	FP Medio en Gastronomía / Máster en Gastronomía en Basque Culinary	Ayudante y cocinero en restaurantes con estrella Michelin, 2do Jefe de Partida en Meliá en Mellia, pero vivió situaciones complicadas con su jefe y decidió renunciar. Luego se encargó de llevar a cabo la reestructuración de una cocina de un en restaurante independiente, que no cumplió con sus palabras y terminó renunciando al cabo de los 3 meses. En Iberostar trabaja 	02/06/2025			Jaime actualmente se muestra desmotivado en su posición como Jefe de Partida en Iberostar, mencionando que las tareas asignadas le resultan insuficientes y poco retadoras, completándolas rápidamente y anticipando trabajo del día siguiente.\nNo tiene un plan de carrera claro y aunque está dispuesto a escuchar propuestas, manifiesta que las condiciones actuales de Iberostar no le resultan atractivas. Es crítico con los recursos y condiciones del entorno laboral, manifestando su insatisfacción con el nivel de conocimientos que poseen los Jefes de Departamento, la calidad de los productos que son suministrados por  los proveedores y con la estructura de contratación de la empresa.\n\nJaime considera que le gustaría trabajar en los restaurantes cinco estrellas de la cadena, valorando la posibilidad de un entorno más desafiante y profesional. Sin embargo, no tiene una visión a largo plazo consolidada dentro de Iberostar, ya que planea trasladarse a Madrid en un plazo aproximado de 1,5 años junto a su pareja, con la intención de desarrollar allí su vida profesional.\n\nAdemás, tiene dos emprendimientos personales en marcha, a los cuales planea dedicarse a largo plazo. Estos proyectos reflejan su inclinación hacia la gestión y la independencia, aunque todavía no tiene definida una estrategia clara de continuidad.			Bajo				Nula	No presenta interés	A Jaime no le interesa trasladarse a otras regiones, está cómodo en la isla y tiene previsto en el mediano plazo mudarse con su pareja a Madrid. 	3		
17	2025-06-02 10:29:56.280127+00	39	42	Su formación incluye estudios de graduado escolar y un postgrado específico en gobernanta, lo que refuerza su orientación al desarrollo profesional dentro del área.	Nerea cuenta con una sólida trayectoria en el área de Pisos dentro de la compañía, con más de 12 años de experiencia en Iberostar, de los cuales los últimos 3 los ha desempeñado como Subgobernanta, rol en el que ha demostrado compromiso, liderazgo y conocimiento operativo. \n	03/06/2025			Reforzar espacios de formación o mentoría orientados al desarrollo de habilidades estratégicas, como la planificación, análisis de datos de gestión y visión global del negocio hotelero.\nEstimular su participación en reuniones o proyectos interáreas, que le permitan entender mejor cómo se articula el área de pisos con el resto del hotel para salir de lo operativo y técnico.\nAcompañar su transición hacia roles de liderazgo más amplios con feedback frecuente, dándole espacio para probar, equivocarse y aprender.	Poder ampliar el conocimiento y el impacto que tienen los siguientes puntos en su gestión diaria:\nKPIs del área de pisos.\nAuditorías internas.\nControl de presupuesto y propuestas de inversión.\nSeguridad laboral y normativa vigente.\n\nParticipación en reuniones de estrategia del área, con espacio para observar y luego compartir aprendizajes, favoreciendo así una mayor exposición y comprensión del impacto de su rol en el negocio.\n\n	Nerea tiene un perfil operativo muy sólido, con destacadas habilidades en organización, compromiso y orientación al cliente. Su predisposición a colaborar y su energía positiva impactan de manera directa en el clima del equipo, siendo un ejemplo diario desde la acción.\n\nManifiesta con claridad su motivación por crecer hacia el rol de Gobernanta, y cuenta con una base valiosa para hacerlo. No obstante, aún tiene camino por recorrer para consolidar una mirada más estratégica del área. Para dar ese salto, será clave que profundice su manejo de herramientas de gestión como el uso de indicadores, el análisis presupuestario, la planificación preventiva y el conocimiento de procesos de control y auditoría.	Medio				Nula	-	-	3		
25	2025-06-03 13:30:01.0409+00	37	42	Bachillerato \nIdioma Rumano	Hace 8 anos que trabaja como 2do Jefe de Bar y Restaurante	03/06/2025				Mentoría inversa participar como mentor de perfiles nuevos de roles de lideres para poner en valor su experiencia y reforzar su autoconfianza como referente.\nEspacios de participación en proyectos interáreas o comités de mejora para comenzar a influir fuera del ámbito puramente operativo.\nIncorporar criterios de sostenibilidad de forma más concreta en su gestión diaria como un indicador clave para gestionar su equipo y el área. Ver la sostenibilidad como estrategia del negocio.	Steffan es un perfil experimentado, reflexivo, con fuertes habilidades técnicas y una mirada madura del negocio. Su estilo de liderazgo es empático y colaborativo, aunque con cierta resistencia a asumir posiciones de poder formal. Tiene interés en asumir un rol de asesor, donde pueda poner al servicio de otros su capacidad de análisis, su experiencia y su sensibilidad operativa. Es algo que lo motiva en su desarrollo profesional.\nEl principal reto para su desarrollo es fortalecer su rol estratégico y de indicadores a un nivel más macro, ya que en la parte operativa, técnica, equipo se siente con herramientas para hacerlo bien. \nAl contar con el manejo de diversidad de idiomas se siente cómodo y es flexible para poder generar buenas experiencias en los clientes y es algo que le facilitará su desempeño en caso de seguir creciendo en la empresa.\nEl rol de Jefe de Departamento no es un rol que le motive por las condiciones que presenta la posición. Donde está hoy como 2do menciona que se siente cómodo y puede equilibrar perfectamente su vida personal con la laboral, algo que ve comprometido de avanzar a la siguiente posición. \n	Medio				Total		siempre que pueda trasladar y consensuar con la familia	3		
19	2025-06-02 14:34:21.628825+00	27	40	FP - Grado Medio Auxiliar de Enfermería 	Durante su trayectoria trabajó como Cocinera en diferentes servicios de catering y eventos. Luego ingresó a IBS y actualmente se encuentra como jefa de partida. 	02/06/2025						Alto				Parcial			3		
20	2025-06-02 15:14:41.486312+00	32	8			04/06/2025						Alto				Parcial			3		
30	2025-06-04 09:47:36.062156+00	44	42		Comenzó en Iberostar a los 16 años como  lava platos y hoy hace 4 años que se desempeña como 2do Jefe de B&R. Anteriormente se desempeñó como Jefe de Sector y como camarero. En Iberostar hace 19 años que está.	04/06/2025			Para que Carlos pueda continuar creciendo y avanzar en un rol con mayor impacto, podría:\nAsumir más activamente su liderazgo, posicionándose como referente que impulsa mejoras y toma decisiones estratégicas.\nIncorporar herramientas de gestión y datos que lo ayuden a ordenar, medir y optimizar su área más allá de la operación diaria.\nDesarrollar una mirada más estratégica y sostenible, alineando su experiencia y compromiso con los objetivos globales de la organización.\n	Acciones de Desarrollo para Carlos: Fortalecer habilidades de liderazgo estratégico: Si bien Mario tiene una gran capacidad de gestión operativa y humana, sería positivo acompañarlo en el desarrollo de una mirada más estratégica y proactiva en la toma de decisiones organizacionales, incluyendo el uso de indicadores, presupuestos y visión de negocio.\nParticipación en proyectos transversales o interdepartamentales: Invitarlo a participar en iniciativas que impliquen colaboración con otros departamentos puede ampliar su visión global del negocio y reforzar su impacto en áreas más allá de lo operativo.\nEmpezar a acompañar procesos presupuestarios y de planificación con el Maitre actual o con Dirección.\nIncluir objetivos de sostenibilidad o calidad como parte de sus responsabilidades semanales para sumar otro indicador clave para el negocio y que pueda incorporarlo como parte importante de sus datos para gestionar al equipo.\nComenzar con el Maitre a revisar KPIs, encuestas y planificación del área. No solo para operar, sino para observar tendencias, necesidades o puntos a mejorar.\n	Carlos es un referente muy valioso en el equipo, tanto por su experiencia como por su compromiso diario. Tiene una marcada vocación por el servicio y un estilo de liderazgo cercano, empático y respetuoso, que genera confianza en su entorno. Su enfoque operativo, sumado a su capacidad de trabajo y actitud positiva, lo convierten en un pilar clave en el día a día del área, resolviendo con agilidad y manteniendo un alto estándar de calidad.\n\nDesde ese lugar, aporta estabilidad, conocimiento técnico y una fuerte presencia en el terreno, siendo un soporte constante para su equipo y para el funcionamiento general del restaurante. Su implicación y disponibilidad lo posicionan como un líder muy valorado por sus compañeros.\n\nDe cara a un próximo paso profesional, el desafío para Carlos está en complementar esta gran base operativa con una mirada más estratégica: salir del corto plazo para observar tendencias, anticiparse a necesidades, impulsar mejoras y participar activamente en decisiones que impacten en el negocio. Desarrollar habilidades vinculadas a la planificación, la gestión presupuestaria y el análisis de indicadores le permitirá fortalecer aún más su liderazgo y abrir nuevas posibilidades dentro del hotel.	Medio				Nula	-	-	3		
54	2025-06-19 06:53:51.726048+00	13	44	Realizó un diplomado en Turismo en la Escuela Superior de Turismo Costa del Sol de Málaga durante el 2001 y 2004.	se desempeñó como Recepcionista en el Hotel Riu Ferrara de Torrox Costa (Málaga) desde 2003 hasta 2011. Durante ese período, brindó atención personalizada a clientes nacionales e internacionales, gestionó procesos de check-in y check-out, coordinó con otros departamentos y colaboró en la resolución de incidencias y organización de actividades.\n\nDesde 2011, ocupa el cargo de Segunda Jefa de Recepción en el Hotel Iberostar Waves Málaga Playa, también en Torrox Costa. En su rol actual, está a cargo de las reservas individuales y de grupos, la asignación diaria de habitaciones y la organización del personal de recepción. Supervisa las tareas del equipo y el uso del sistema Booking, atiende y resuelve quejas y peticiones de clientes, controla ingresos bancarios y gestiona el buzón del jefe de recepción en su ausencia. Además, elabora inventarios del departamento, demostrando una gestión integral y comprometida con la excelencia en el servicio.	19/06/2025			No se recomienda su promoción a otro puesto.	Participar en talleres o cursos de comunicación asertiva y liderazgo emocional: Esto ayudará a fortalecer la capacidad para escuchar activamente, expresar ideas con mayor empatía y manejar mejor las emociones propias y ajenas, facilitando así una conexión más cercana y motivadora con el equipo.	En su recorrido profesional ha consolidado una identidad marcada por el compromiso operativo, la resolución concreta y la capacidad de sostener el funcionamiento diario con seguridad y constancia. Dentro de su ámbito de acción, asume responsabilidades con determinación y cumple con eficacia los objetivos, aunque aún requiere del marco global provisto por sus lideres.\nSu estilo de liderazgo se apoya en el ejemplo y en la entrega personal, generando un motor interno de trabajo. No obstante, puede mostrar rigidez o escasa sensibilidad en su forma de comunicar, lo que a veces limita su capacidad de inspirar o generar conexiones genuinas dentro del equipo. Tiene potencial para fortalecer su impacto como referente si incorpora habilidades de comunicación emocional, escucha activa y empatía, integrando otras perspectivas al momento de tomar decisiones.\nEn entornos colaborativos, su predisposición a ayudar y participar es constante. Mantiene un trato respetuoso y práctico, favoreciendo la cooperación, aunque puede mostrarse más receptivo/a cuando las ideas coinciden con sus propios criterios. Tiene margen para profundizar en el desarrollo de una escucha más empática, así como en la gestión de situaciones de tensión o desacuerdo con mayor apertura y búsqueda de consenso.\nEn cuanto a su forma de operar, se destaca por su orientación a resultados, el orden y el cumplimiento de tareas, especialmente en contextos claros y definidos. Para ampliar su contribución, sería valioso que fortalezca su capacidad de anticiparse, identificar mejoras sistémicas y adoptar una actitud más proactiva frente al aprendizaje continuo.\nPor último, su compromiso con la sostenibilidad es un aspecto positivo y consistente. Sin ocupar un rol formal de liderazgo en esta dimensión, actúa con coherencia frente a los valores de la organización, promoviendo comportamientos responsables y sensibles al impacto social y ambiental. Esta mirada, aunque aún informal, constituye una base sólida sobre la cual puede seguir construyendo influencia dentro del equipo.\n	Medio				Nula		Su compromiso con la familia le lleva a descartar por ahora la posibilidad de reubicarse en otra ciudad o localidad, ya que valora la estabilidad y el entorno cercano para su hija. Sin embargo, mantiene una apertura prudente respecto a su desarrollo profesional a largo plazo, una vez que su hija haya superado esta etapa, momento en el que estaría dispuesta a considerar nuevos desafíos y oportunidades laborales.	3		
\.


--
-- Data for Name: informeAreaDesarrollo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."informeAreaDesarrollo" ("id", "created_at", "nombre", "comment", "informeId", "evaluadoId") FROM stdin;
69	2025-06-17 06:58:27.346066+00	Liderazgo	Requiere desarrollar mayor firmeza para delegar, establecer pautas claras y acompañar el desarrollo de los demás. Potenciar su capacidad de influencia y persuasión le permitirá consolidar un estilo de liderazgo más efectivo.	43	12
70	2025-06-17 06:58:27.524137+00	Eficiencia y eficacia 	Requiere desarrollar mayor firmeza para delegar, establecer pautas claras y acompañar el desarrollo de los demás. Potenciar su capacidad de influencia y persuasión le permitirá consolidar un estilo de liderazgo más efectivo.	43	12
90	2025-06-18 13:12:21.931369+00	Liderazgo	Podría incorporar herramientas para aumentar su energía como líder y fomentar más activamente la participación y desarrollo del equipo, además de fortalecer su visión estratégica para priorizar y coordinar objetivos colectivos.\n	46	10
91	2025-06-18 13:12:22.10675+00	Eficiencia y eficacia 	Aunque acepta los cambios de forma progresiva, le sería beneficioso desarrollar mayor rapidez en su adaptación. También podría mejorar su autonomía al priorizar tareas sin depender tanto de guías externas.\n	46	10
100	2025-06-19 07:07:07.903892+00	Liderazgo	Puede mejorar su capacidad para conectar emocionalmente con el equipo, gestionando la comunicación con mayor sensibilidad y práctica de la escucha activa para fortalecer la motivación y el compromiso colectivo.	54	13
101	2025-06-19 07:07:08.082828+00	Sostenibilidad	Puede mejorar la proactividad para generar mejoras o nuevas ideas en la implementación de estas políticas.	54	13
35	2025-06-03 13:45:00.167111+00	Sostenibilidad	Sostenibilidad: Fortalecer su rol como referente integrando criterios sostenibles de forma más estructurada y estratégica en la toma de decisiones.	25	37
36	2025-06-03 14:09:25.585075+00	Eficiencia y eficacia 	Desarrollar una mirada más amplia y estratégica del área. \nAmpliar su conocimiento sobre indicadores clave de gestión (más allá de la satisfacción del cliente).\nParticipar o formarse en temas de auditoría, presupuestos, seguridad del personal y propuestas de inversión.\nComprender el rol del área en la rentabilidad del hotel y en la eficiencia operativa.	17	39
37	2025-06-03 14:09:25.79273+00	Liderazgo	Desarrollar una visión más estratégica del área y del impacto que tiene en el negocio la gestión del equipo\nAumentar la autonomía en temas de planificación y toma de decisiones más macro.	17	39
106	2025-06-19 18:09:41.718507+00	Sostenibilidad	Podría ser más proactivo y disruptivo al proponer, para lo que necesitará cuestionar lo funcional para identificar posibles mejoras. Fomenta el cuidado de los recursos, mostrando sensibilidad hacia el impacto ambiental, aunque no cuestiona las prácticas que podrían cambiarse, conformándose con lo establecido y conocido.	44	22
107	2025-06-19 18:09:41.883988+00	Liderazgo	Necesita ser más firme al comunicar y seguro al decidir, debido a que su estilo empático y accesible puede vincularse a la extrema flexibilidad y docilidad. Reconoce su complemento con perfiles más directos, que informan y asignan sin rodeos.  	44	22
46	2025-06-04 10:07:59.936802+00	Liderazgo	Eficiencia y Eficacia y Liderazgo: Carlos cuenta con una gran experiencia operativa y una visión muy clara del día a día del área, pero aún puede potenciar su impacto desde una mirada más estratégica y orientada al negocio.	30	44
47	2025-06-04 10:08:00.097716+00	Eficiencia y eficacia 	Carlos desde la operativa,  ritmo del área y capacidades de sus equipos, organiza el área, pero para ver el área desde un lugar más estratégico sería útil pensar el área con una mirada más global, conectando las decisiones diarias con los objetivos del hotel. Esto implica leer KPIs, analizar encuestas, identificar oportunidades de mejora y anticiparse a necesidades futuras. Es clave que gane espacio para planificar, proponer mejoras al director, liderar acciones que impacten en la rentabilidad o la experiencia del cliente.	30	44
48	2025-06-10 03:45:54.702799+00	Liderazgo	Puede seguir desarrollando su capacidad para influir positivamente en otros, asumir un rol más activo en la conducción de tareas y generar impacto desde el ejemplo.	37	14
49	2025-06-10 03:45:54.862137+00	Eficiencia y eficacia 	Se recomienda fortalecer su organización y planificación para optimizar tiempos, priorizar mejor las tareas y lograr resultados de forma más ágil y sostenida.	37	14
53	2025-06-14 07:16:44.308304+00	Liderazgo	Necesita desarrollar habilidades de escucha activa, delegación y manejo del protagonismo para consolidar su influencia positiva en el equipo.	40	7
54	2025-06-14 07:16:44.477061+00	Eficiencia y eficacia 	Requiere fortalecer su capacidad de planificación estratégica y gestión autónoma, evitando que la impulsividad y la presión afecten la calidad y consistencia de sus resultados.	40	7
55	2025-06-14 07:16:44.649321+00	Colaboración	Es importante que aprenda a moderar sus emociones y mantener una disposición abierta y reflexiva aún en instancias de presión o conflicto interpersonal.	40	7
67	2025-06-14 08:21:35.786619+00	Liderazgo	Tiende a desempeñar un rol de liderazgo más reservado, prefiriendo actuar dentro de un marco definido por otros.	41	8
68	2025-06-14 08:21:35.957047+00	Eficiencia y eficacia 	Aunque es responsable y comprometido, la tendencia a asumir una sobrecarga de tareas sin una adecuada priorización puede afectar su eficiencia operativa. 	41	8
\.


--
-- Data for Name: informeAspiraciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."informeAspiraciones" ("id", "created_at", "aspiracionesId", "comment", "informeId", "evaluadoId", "breveDescripcion") FROM stdin;
60	2025-06-17 06:58:28.178992+00	34	Respecto a sus expectativas, refiere que se siente satisfecho con la posición que ocupa actualmente y no aspira a un crecimiento concreto. Se muestra interesado en realizar cursos y formaciones que le permitan seguir incrementando su expertise y fortaleciendo su perfil técnico.	43	12	
43	2025-06-03 13:45:00.517008+00	36	Steffan se encuentra en un momento de madurez profesional en el que desea canalizar su experiencia hacia un rol que le permita observar, acompañar y proponer mejoras con una mirada estratégica. Aunque ha recibido propuestas para asumir el rol de jefe, no lo motiva la carga operativa ni la responsabilidad respecto al reconocimiento. Lo que sí lo entusiasma es la posibilidad de desempeñarse como asesor, ya que siente que desde ese lugar puede aportar valor genuino a los equipos y procesos, sin perder cercanía con la operación ni con las personas.\nSu interés está vinculado con su estilo observador, reflexivo y de propósito: disfruta analizar cómo se trabaja, detectar oportunidades y compartir buenas prácticas. Se siente cómodo y comprometido ayudando al equipo a crecer, compartiendo información útil y buscando formas creativas y realistas de alcanzar los objetivos. Reconoce que para desempeñarse como asesor le gustaría seguir desarrollándose, especialmente en herramientas informáticas y en habilidades más estratégicas.\n	25	37	Le motiva un rol de Asesor para poder agregar valor desde su experiencia y desde su capacidad de Observador y foco en el cliente
44	2025-06-03 14:09:26.173633+00	28	Nerea muestra una fuerte motivación por seguir creciendo profesionalmente dentro del área de pisos, con el objetivo claro de convertirse en Gobernanta. Su interés está ligado no solo al desarrollo técnico, sino también al crecimiento como referente para su equipo. \nTiene una gran vocación por el aprendizaje y disfruta compartir la información que recibe en reuniones o formaciones con sus compañeras, lo que evidencia su compromiso con el trabajo colaborativo. Este espíritu de aprendizaje constante y de “hacer equipo y generar buen clima” aparece como uno de sus motores principales. Le interesan especialmente los temas relacionados con la calidad de servicio que impactan en el cliente, la organización del trabajo y el detalle en la ejecución, desde donde se siente segura y con capacidad para aportar valor.\n\n	17	39	Gobernanta
50	2025-06-04 10:08:00.440007+00	28	Carlos muestra una clara identificación con la empresa, a la que reconoce como un pilar en su crecimiento tanto profesional como personal durante sus 19 años de trayectoria. Se percibe altamente comprometido y con fuerte sentido de pertenencia hacia Iberostar, lo que se refleja en su forma de hablar sobre su recorrido y su rol actual.\nActualmente se siente cómodo y satisfecho en su posición como segundo Maitre, disfrutando tanto del vínculo directo con el equipo como con los clientes. Manifiesta interés por seguir creciendo dentro de la organización, pero no tiene una ambición urgente de ascender, ya que valora mucho el contacto diario con las personas y teme que un rol más jerárquico lo aleje de esa dinámica que tanto disfruta.\nEncuentra motivación en el trabajo en equipo, en enseñar, transmitir buenas prácticas y en generar un ambiente positivo. El aspecto humano del liderazgo es lo que más lo moviliza: busca generar confianza, empatía y cercanía desde un lugar horizontal, más como compañero que como figura de autoridad. Los desafíos del día a día vinculados al equipo lo estimulan y lo comprometen, sobre todo en contextos de rotación alta, donde ve una oportunidad para reorganizar, formar y acompañar.\nSu estilo de liderazgo es tranquilo, observador y cercano, lo que también forma parte de sus motivaciones: ser un referente positivo para su equipo, acompañar desde la contención y el ejemplo.\n	30	44	De momento disfruta mucho su rol ya que lo mantiene cerca del equipo y del cliente que es algo que disfruta
52	2025-06-10 03:45:55.193954+00	28	Alejandro manifiesta interés en seguir desarrollándose dentro del ámbito gastronómico, valorando la posibilidad de asumir nuevas responsabilidades o roles que impliquen un mayor dinamismo. Si bien reconoce que su puesto actual tiene aspectos positivos, también lo percibe como algo monótono, por lo que le gustaría explorar otras experiencias laborales, incluso como segundo de cocina, en contextos diferentes al que se encuentra actualmente. Tiene como referentes a cocineros reconocidos por su trayectoria, como Ferran Adrià, y expresa el deseo de que, en algún momento, su propio recorrido profesional le permita destacarse o ser tenido en cuenta para propuestas más desafiantes.	37	14	
54	2025-06-14 07:16:44.97724+00	34	Se encuentra satisfecha con lo que realiza en el Hotel y con su performance. Disfruta de lo que hace, e impresiona estar fuertemente afiliada a la cultura Organizacional.	40	7	
59	2025-06-14 08:21:36.295309+00	34	Rafael es una persona que valora profundamente el contacto humano y las relaciones positivas con sus compañeros, aspectos que considera clave en su experiencia laboral y en la cultura de la empresa donde se encuentra. En cuanto a sus expectativas profesionales, se muestra satisfecho con su situación actual y prefiere mantener la estabilidad antes que embarcarse en cambios o aventuras laborales que impliquen riesgos o incertidumbre.\nCon 52 años, se siente con la fuerza y capacidad para seguir trabajando, pero prioriza la seguridad y la previsibilidad por sobre la búsqueda de crecimiento acelerado o cambios radicales.\n	41	8	
88	2025-06-19 07:07:08.411109+00	35	Actualmente, sus expectativas profesionales están fuertemente influenciadas por su prioridad familiar, especialmente el acompañamiento y cuidado de su hija de 13 años, en una etapa clave de su desarrollo personal y educativo. Aunque ocupa el cargo de segunda jefa de recepción, no ambiciona en este momento asumir un rol de mayor responsabilidad, ya que su foco principal es estar presente y disponible para apoyar a su hija durante esta etapa de preadolescencia, que considera fundamental para su formación y futuro.\nEn resumen, sus expectativas actuales están centradas en el equilibrio entre su vida personal y laboral, priorizando la atención y acompañamiento familiar, y dejando abiertas las puertas para un crecimiento profesional más adelante, cuando las circunstancias personales lo permitan.\n	54	13	
90	2025-06-19 18:09:42.221264+00	28	Mamadou espera crecer con el paso del tiempo, asumiendo mayores responsabilidades, dentro del Departamento de Bares y Restaurantes. Expone que ha recibido la propuesta de trabajar como Guest Service pero que a él le apasiona su rol actual, y el sector al que pertenece. No se encuentra preparado para realizar un cambio hacia otro departamento. Considera que Bares y Restaurantes tiene un gran impacto en la estrategia del negocio, debido a que, desde su perspectiva, el 80% de los huéspedes visitan los bares. \nLe gustaría ocupar la posición de Jefe de departamento, para tener un mayor alcance en las decisiones, aunque comparte que aun existen aspectos que desconoce, por lo que quizás sus propuestas o intenciones no se encuentran completamente alineada a los objetivos e intereses de la compañía, por lo que necesitaría, implicarse más con todos los temas correspondientes a un rol de mayor responsabilidad. En el caso de protagonizar un crecimiento le gustaría contar con el acompañamiento necesario durante el proceso de aprendizaje, debido a que, no duda sobre su capacidad, aunque necesitará tiempo. Otro sector que le despierta curiosidad es Recepción, departamento con el que se encuentra continuamente en relación, y que le atrae por el vinculo directo y constante con el cliente.\nSe proyecta en Iberostar, destacando el disfrute que siente con el trabajo que realiza, como así también el clima laboral de la compañía. Expone que, para él, lo que marcó la diferencia de Iberostar en relación a otras compañías, fue la cercanía y el interés autentico por cada integrante del equipo, como persona, más allá de considerarlo un trabajador. Define a Iberostar como la mejor empresa de España, por lo que, continuamente reafirma su elección de formar parte de la misma. \n	44	22	
\.


--
-- Data for Name: informeFortalezas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."informeFortalezas" ("id", "created_at", "nombre", "comment", "informeId", "evaluadoId") FROM stdin;
128	2025-06-19 07:07:07.3833+00	Eficiencia y eficacia 	Se destaca por su capacidad para organizar y cumplir con las tareas asignadas dentro de su ámbito de acción, manteniendo calidad y eficiencia incluso bajo presión. Su orientación práctica le permite resolver problemas concretos de manera efectiva y cumplir con los objetivos diarios.	54	13
129	2025-06-19 07:07:07.575751+00	Excelencia con el cliente	Actitud colaborativa y respeto por la diversidad: Mantiene una comunicación clara y directa, muestra disposición para ayudar y trabajar en equipo, y respeta las distintas opiniones y estilos de sus compañeros, favoreciendo un ambiente de cooperación y confianza.	54	13
134	2025-06-19 18:09:41.191087+00	Colaboración	Disfruta del intercambio con otras personas, mostrándose a disposición de lo que pueda brindar desde su lugar. Respeta la diversidad, con la intención genuina de aprender del intercambio. Su humildad le permite ser accesible a todas las personas, generando confianza en los demás. 	44	22
135	2025-06-19 18:09:41.364836+00	Excelencia con el cliente	Perfil respetuoso, servicial, accesible y disponible ante cada necesidad o solicitud. Dimensiona el impacto en el cliente previo a tomar alguna decisión. Busca adecuarse a cada huésped, mediante una escucha activa de sus intereses. No es una persona reactiva, por lo que no personalizará lo que no se encuentre dirigido intencionalmente hacia su persona, y fomentará la conciliación inclusive con perfiles hostiles o agresivos. 	44	22
71	2025-06-03 13:44:59.64444+00	Eficiencia y eficacia 	Eficiencia y Eficacia: Análisis estratégico de los indicadores del área, capacidad de reacción de acuerdo a la lectura de los indicadore sy objetivos, sensibilidad hacia el equipo, uso eficiente de los datos y recursos. Considera las capacidades de su equipo para organizarlo para brindar una excelente experiencia al cliente.	25	37
72	2025-06-03 13:44:59.816884+00	Excelencia con el cliente	Excelencia en el cliente: Proactividad, mirada estratégica de la experiencia, sensibilidad hacia la mejora constante. Steffan es muy observador y esta muy atento a realizar la lectura de los indicadores y objetivos para mejorar la experiencia del cliente. Tiene muy presente los indicadores de NPS o comentarios  de los huéspedes para tomar acciones en el equipo cuando sea necesario o reconocer al equipo por buenas practicas.	25	37
73	2025-06-03 14:09:25.060935+00	Colaboración	Comparte conocimiento e impulsa el trabajo en equipo. Disposición para escuchar y aprender de los demás. Aprecia y promueve la diversidad de perspectivas.	17	39
74	2025-06-03 14:09:25.2327+00	Excelencia con el cliente	Cuidado por los detalles y estándares de calidad. Proactividad frente a feedback del cliente. Transmisión de estándares al equipo para mejorar la experiencia del cliente.	17	39
82	2025-06-04 10:07:59.603427+00	Colaboración	Colaboración: Carlos se destaca por su estilo de liderazgo cercano y colaborativo. Se involucra con el equipo, genera confianza y promueve un buen clima de trabajo. Tiene vocación por ayudar, compartir buenas prácticas y trabajar en equipo. Esta forma de liderar lo convierte en un pilar clave para el área, sobre todo en momentos de cambio o rotación.	30	44
83	2025-06-10 03:45:53.939915+00	Excelencia con el cliente	Muestra un claro compromiso con la satisfacción del cliente, enfocándose en brindar un servicio de calidad y atendiendo con cercanía y dedicación.	37	14
84	2025-06-10 03:45:54.367145+00	Colaboración	Se integra con facilidad al trabajo en equipo, manteniendo una actitud cooperativa y predispuesta a apoyar a sus compañeros cuando se lo requiere.	37	14
86	2025-06-14 07:16:43.943086+00	Excelencia con el cliente	Demuestra una buena orientación al servicio, especialmente en la atención directa al cliente, con voluntad de mejorar y adaptarse para superar expectativas.	40	7
92	2025-06-14 08:21:35.272811+00	Colaboración	Demuestra una sólida actitud cooperativa que facilita la colaboración fluida dentro del equipo. Su disposición para brindar apoyo y compartir información contribuye a un ambiente de trabajo armonioso y efectivo, donde se valoran las diferentes perspectivas y se promueven soluciones conjuntas.\n	41	8
93	2025-06-14 08:21:35.447793+00	Excelencia con el cliente	Prioriza de manera consistente la experiencia del cliente, tomando decisiones alineadas con su satisfacción. Actúa con empatía y agilidad, escuchando activamente las necesidades y respondiendo con claridad y calidez. Su comunicación transparente y cordial fortalece la confianza y la relación a largo plazo con los clientes.	41	8
94	2025-06-17 06:58:27.005488+00	Colaboración	Se caracteriza por su cercanía, amabilidad y accesibilidad, generando vínculos de confianza con el equipo. Su comunicación simple y concreta facilita el trabajo en conjunto y contribuye a un buen clima laboral.	43	12
118	2025-06-18 13:12:21.400557+00	Excelencia con el cliente	Integra principios de sostenibilidad en su día a día y posee una buena orientación al cliente, destacándose por su vocación de servicio y su búsqueda constante de mejorar la experiencia del usuario.	46	10
119	2025-06-18 13:12:21.581394+00	Colaboración	Demuestra una medianamente actitud abierta, escucha activa y respeto por la diversidad, lo que le permite generar un clima de confianza y cooperación en su entorno laboral.\n	46	10
\.


--
-- Data for Name: informeIdiomaNiveles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."informeIdiomaNiveles" ("id", "created_at", "idiomaId", "evaluadoId", "nivelId", "informeId") FROM stdin;
265	2025-06-02 15:39:38.383566+00	1	28	4	21
266	2025-06-02 15:39:38.564144+00	4	28	2	21
267	2025-06-02 15:39:38.750684+00	13	28	3	21
326	2025-06-03 14:09:23.435619+00	1	39	4	17
327	2025-06-03 14:09:23.628093+00	4	39	2	17
362	2025-06-04 10:07:55.897813+00	1	44	4	30
363	2025-06-04 10:07:56.334083+00	4	44	2	30
364	2025-06-04 10:07:56.766553+00	12	44	2	30
365	2025-06-04 10:07:56.939947+00	10	44	1	30
366	2025-06-04 10:07:57.110715+00	5	44	1	30
367	2025-06-04 10:07:57.639966+00	11	44	1	30
446	2025-06-19 07:07:05.636486+00	1	13	4	54
447	2025-06-19 07:07:05.841064+00	4	13	3	54
372	2025-06-10 03:45:52.427826+00	1	14	4	37
373	2025-06-10 03:45:52.593428+00	4	14	2	37
448	2025-06-19 07:07:06.006807+00	12	13	3	54
449	2025-06-19 07:07:06.173173+00	11	13	2	54
260	2025-06-02 15:34:35.476648+00	1	27	4	19
261	2025-06-02 15:34:35.675861+00	4	27	1	19
378	2025-06-14 07:16:42.132691+00	1	7	4	40
379	2025-06-14 07:16:42.314691+00	4	7	1	40
454	2025-06-19 18:09:39.3236+00	1	22	3	44
320	2025-06-03 13:44:56.918978+00	1	37	4	25
321	2025-06-03 13:44:57.097626+00	4	37	3	25
322	2025-06-03 13:44:57.270432+00	10	37	3	25
323	2025-06-03 13:44:57.456281+00	12	37	2	25
324	2025-06-03 13:44:57.718744+00	11	37	2	25
325	2025-06-03 13:44:57.894218+00	5	37	1	25
455	2025-06-19 18:09:39.496882+00	4	22	3	44
456	2025-06-19 18:09:39.664441+00	11	22	3	44
457	2025-06-19 18:09:39.833901+00	12	22	3	44
391	2025-06-14 08:21:33.534416+00	1	8	4	41
392	2025-06-14 08:21:33.708059+00	4	8	3	41
393	2025-06-14 08:21:33.875254+00	12	8	2	41
397	2025-06-17 06:58:25.140926+00	1	12	4	43
\.


--
-- Data for Name: nivelesCompetencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."nivelesCompetencias" ("id", "created_at", "nombre", "lang", "order", "colorId", "ponderacion") FROM stdin;
6	2025-05-09 09:20:56.016801+00	Development Need	en	1	\N	\N
7	2025-05-09 09:21:05.211997+00	Development Opportunity	en	2	\N	\N
8	2025-05-09 09:21:11.900353+00	Competent	en	3	\N	\N
9	2025-05-09 09:21:17.725833+00	Strength	en	4	\N	\N
10	2025-05-09 09:21:27.013844+00	Role Model	en	5	\N	\N
11	2025-05-09 09:21:53.863597+00	Necessidade de desenvolvimento	pt	1	\N	\N
12	2025-05-09 09:22:03.152656+00	Oportunidade de desenvolvimento	pt	2	\N	\N
13	2025-05-09 09:22:11.222288+00	Competente	pt	3	\N	\N
14	2025-05-09 09:22:20.20891+00	Ponto forte	pt	4	\N	\N
15	2025-05-09 09:22:28.935882+00	Modelo a ser seguido	pt	5	\N	\N
1	2025-05-09 09:19:00.058169+00	Necesidad de desarrollo	es	1	3	1
2	2025-05-09 09:19:10.578465+00	Oportunidad de Desarrollo	es	2	2	2
3	2025-05-09 09:19:32.949199+00	Competente	es	3	1	3
4	2025-05-09 09:19:40.639119+00	Punto Fuerte 	es	4	1	4
5	2025-05-09 09:19:49.550314+00	Modelo a seguir	es	5	1	5
16	2025-06-19 14:32:30.113748+00	N/A	es	6	\N	0
\.


--
-- Data for Name: informeValoracionCompetencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."informeValoracionCompetencia" ("id", "created_at", "texto", "evaluadoId", "competenciaNombre", "nivelId", "informeId", "anio") FROM stdin;
234	2025-06-03 14:09:24.15668+00	Valora profundamente la comunicación clara y la posibilidad de compartir información útil. En la entrevista expresó cuánto aprecia poder asistir a reuniones interáreas para luego trasladar lo aprendido a su equipo, entendiendo que “las cosas se hacen en equipo” y que compartir es clave para la mejora continua.\nDurante la jornada de assessment, valoró especialmente haber conocido a personas de otros hoteles y poder entender distintas maneras de pensar y resolver situaciones. Respeta la diversidad de opiniones y estilos, y aprecia espacios donde pueda intercambiar experiencias. Estimula un clima de confianza y cooperación, mostrando motivación por hacer cuando tiene dominio de la situación.\nEn la dinámica grupal del invento, tomó la iniciativa de dibujar la propuesta del equipo y apoyar la presentación desde un segundo plano, aunque no asumió el liderazgo ni defendió activamente el proyecto. Esto muestra una actitud participativa, aunque algo más cómoda en roles de acompañamiento que de conducción.\nA veces, le cuesta concentrarse o involucrarse con la misma seguridad cuando el entorno está fuera de su rutina habitual, lo que puede afectar su participación en contextos menos estructurados o conocidos.\n	39	Colaboración	3	17	2025
236	2025-06-03 14:09:24.524163+00	Demuestra una gran orientación a resultados operativos del área, con especial foco en el cumplimiento de estándares de calidad y la satisfacción del cliente. Es detallista y organizada, y trabaja con una clara priorización de tareas que le permite ordenar su jornada y dar respuesta a las exigencias del área.\nNo se anticipa de forma sistemática a las necesidades del equipo, pero sí muestra orden y compromiso para reorganizarse frente a lo urgente, pidiendo apoyo o ajustando turnos cuando es necesario. Su gestión de los imprevistos es más bien reactiva: recurre a la comunicación con el equipo para resolverlos en conjunto, aunque no tiene aún una estructura definida para abordarlos de manera autónoma o planificada.\nSi bien tiene muy presente el indicador de satisfacción del cliente —al que da seguimiento leyendo comentarios y generando acciones junto a su equipo—, no tiene aún incorporados otros indicadores clave para organizar y evaluar su gestión. Sería valioso que pueda involucrarse más activamente en el uso y análisis de métricas como auditorías internas, control presupuestario, seguridad laboral y posibles propuestas de inversión. Esto le permitirá integrar una visión más estratégica y contribuir al negocio desde una mirada más completa, además de la operativa que ya domina con solidez.\n\n	39	Eficiencia y eficacia 	3	17	2025
499	2025-06-19 18:09:40.166591+00	Escucha activamente los aportes del grupo, considerando que cada integrante del equipo brinda valiosa información, acorde a su experiencia y perspectiva. Se muestra dispuesto a cooperar en todo lo que esté a su alcance, sin inconvenientes para abordar lo necesario para asegurarse el avance de los temas. Considera que los objetivos se alcanzan de manera conjunta, mediante la cohesión de equipo. Es una persona respetuosa de la diversidad de opiniones y de los diferentes estilos de personalidad. Busca generar confianza en los integrantes del equipo, evitando una imagen autoritaria, independientemente de jerarquías o roles. Desde su lugar promueve acuerdos, evitando conflictos que generen mal clima de trabajo o que desenfoquen a los talentos del cumplimiento de objetivos. Escucha a todos, sin distinción, fomentando la cooperación. Considera como clave una comunicación fluida y respetuosa con todos los integrantes del equipo para lograr un trabajo efectivo. 	22	Colaboración	4	44	2025
500	2025-06-19 18:09:40.335757+00	Muestra sensibilidad respecto el impacto ambiental y social, como así también defiende los valores de World of Change. Se considera que la oportunidad de desarrollo se relaciona con cuestionar prácticas poco sostenibles y proponer alternativas, para influir con un mayor alcance en relación a la sostenibilidad, mediante propuestas o decisiones alineadas. Considera que, en relación a sostenibilidad, está todo dado, lo que lo posiciona con flexibilidad ante lo existente, y al mismo tiempo, cierta pasividad frente la posibilidad de promover y proponer continuamente en pos del uso responsable de los recursos disponibles. Podría mostrar mayor disrupción ante el desafío de sostenibilidad. 	22	Sostenibilidad	2	44	2025
285	2025-06-10 03:45:53.274341+00	La persona evaluada muestra compromiso con su trabajo y una clara disposición a cumplir con los tiempos establecidos sin comprometer la calidad de los entregables. También se evidencia una actitud responsable frente a los errores, tanto propios como ajenos, asumiendo un rol activo en su corrección y aprendizaje.\nSin embargo, se observan oportunidades de mejora en aspectos vinculados a la organización y planificación estratégica. En ocasiones, puede priorizar tareas desde una lógica operativa, sin considerar del todo el impacto o la secuencia óptima en función de los objetivos más amplios. Esto puede generar esfuerzos aislados que no siempre están alineados con una mirada global o de largo plazo.\nAsimismo, se detecta cierta tendencia a dispersarse frente a múltiples demandas, lo que afecta la eficacia en el logro de resultados concretos. Si bien resuelve tareas puntuales, aún puede fortalecer su capacidad para sostener el foco y la dirección en contextos de presión o cambio constante.\nEn relación con la detección de oportunidades de mejora durante la actividad, su reacción suele estar más ligada a la ejecución que a la anticipación. Se recomienda trabajar en una mayor proactividad para identificar posibles optimizaciones en tiempo real y actuar sobre ellas con rapidez y criterio.\nPor último, si bien se muestra cuidadoso con los recursos en términos generales, aún puede afinar el uso estratégico de su energía y la del grupo, especialmente en lo que refiere a la distribución del esfuerzo y la asignación de prioridades.\n	14	Eficiencia y eficacia 	2	37	2025
286	2025-06-10 03:45:53.440952+00	Conoce las políticas de sostenibukidad y está de acuerdo con las mismas, respetándolas, e identificando algunas oportunidades de mejora sobre ello. Aún debe ganar capacidad para proponer alterrnativas mas viables, y cuestar con visión de negocio las prácticas actuales.\nIntenta transmitir a su equipo la importancia de respetar estas polpitias y acciones, evidenciando una conciencia media sobre la relevancia del impacto ambiental y social.\n	14	Sostenibilidad	2	37	2025
287	2025-06-10 03:45:53.607487+00	Demuestra un fuerte compromiso con la calidad del servicio que brinda, manteniendo una actitud relativamente crítica sobre su propio desempeño y buscando oportunidades de mejora. Su enfoque es principalmente operativo, centrado en la experiencia concreta del cliente, especialmente en lo relacionado con la cocina, que considera —y transmite— como el eje principal de la satisfacción general. Esta mirada le permite atender con eficacia aspectos clave del servicio, aunque aún puede fortalecer su perspectiva estratégica, integrando otras variables relevantes para una experiencia más integral del cliente.\nEn sus interacciones, se comunica de manera espontánea, simple y directa, lo que puede resultar cercano en ciertos contextos, pero también limitar el impacto profesional de su presencia. Para lograr una mayor consistencia con los estándares del rol y potenciar su imagen frente a los clientes, se sugiere trabajar en su semblante, impronta y forma de comunicar, desarrollando un estilo más alineado con los valores de la organización y con las expectativas del entorno. Esto no solo favorecería su relación con los clientes, sino que también contribuiría a posicionarlo como un referente más completo dentro del equipo.\n	14	Excelencia con el cliente	3	37	2025
501	2025-06-19 18:09:40.502648+00	El entrevistado es una persona sencilla, humilde y cercana, que se posiciona como ejemplo a seguir al orientar a otras personas, motivando al grupo mediante el positivismo y la disponibilidad. Promueve la participación y el desarrollo de los talentos, habilitando un intercambio fluido con cada integrante del equipo, en el cual se valora la realización de propuestas, destacando el conocimiento obtenido mediante la práctica de cada colaborador. Demuestra una visión global del equipo, considerando los logros y los desvíos como responsabilidad del colectivo. Intenta motivar al equipo con las herramientas que están a su alcance, destacando de cada talento la iniciativa y el compromiso por el trabajo, mostrándose dispuesto a acompañar los procesos de aprendizaje. Reconoce los logros y agradece, aun ante fallas, el esfuerzo, de manera explícita, manteniendo un enfoque positivo. Su oportunidad de desarrollo se relaciona con tomar decisiones con mayor firmeza y seguridad, debido a que, por su intención de evitar el malestar que pudiera generarle a alguien más, abusa de docilidad, necesitando de un estilo más directo y frontal para las circunstancias que así lo requieran. Por su sencillez y humildad, se ubica como un integrante más del equipo, lo que se valora por su accesibilidad, aunque en algunos eventos, en los que se quiere asimetría, distancia y dominancia, no logra alcanzar lo esperado con total autonomía o con inmediatez. 	22	Liderazgo	2	44	2025
273	2025-06-04 10:07:58.332493+00	Carlos se muestra sumamente empático y atento a las necesidades del equipo. Busca entender a cada persona, acompaña desde el diálogo y genera vínculos de confianza.\nComparte información, escucha con atención y valora el aporte de su jefe y de sus colegas, con quienes organiza en conjunto el trabajo diario.\nTiene una actitud colaborativa incluso en contextos difíciles como la rotación constante de personal, buscando sostener al equipo desde la contención y la cercanía.\nEn dinámicas grupales tiende a actuar de forma más individual, aportando en lo que puede pero sin asumir un rol de facilitador o promotor de la interacción del grupo.\nEn la entrevista mencionó que desde su lugar diseñó un programa en excel para organizar el equipo de los 5 restaurantes que manejas y lo compartió con sus compañeros para mejorar la organización del área teniendo en cuenta los perfiles del equipo. Este aporte le gusta y se siente bien cuando lo que hizo lo usan y sirve. \n\n	44	Colaboración	3	30	2025
275	2025-06-04 10:07:58.934229+00	Carlos tiene amplia experiencia operativa y domina la gestión del día a día en su área, lo que le da una base sólida para organizar y resolver con rapidez.\nHa desarrollado una herramienta en Excel para coordinar los equipos de los 5 restaurantes, lo cual muestra iniciativa para ordenar y sistematizar la operación.\nA pesar de los desafíos con el personal, intenta reacomodar roles según desempeño, lo que denota capacidad de análisis y pragmatismo.\nSu enfoque está muy centrado en lo operativo y no incorpora aún una mirada estratégica basada en indicadores, métricas de gestión o datos relevantes para mejorar su área.\nNo identifica ni utiliza indicadores de sostenibilidad, eficiencia o rentabilidad, y no se proyecta en términos de resultados más allá del cumplimiento funcional.	44	Eficiencia y eficacia 	2	30	2025
277	2025-06-04 10:07:59.268129+00	Carlos lidera desde la cercanía y el respeto, generando un buen clima laboral y siendo valorado por su equipo por su actitud tranquila, empática y colaborativa.\nTiene una fuerte vocación por enseñar, compartir buenas prácticas y observar para entender las dinámicas del equipo, lo cual refuerza su liderazgo desde el ejemplo y el acompañamiento.\nReconoce los desafíos en la gestión del personal y hace un esfuerzo consciente por contener al equipo, manejar la presión con calma y evitar transmitir tensiones.\nAunque tiene un rol de liderazgo, tiende a ubicarse más como “compañero” que como figura de referencia, lo que puede limitar su capacidad para tomar decisiones difíciles o liderar procesos de cambio desde una posición clara.\n	44	Liderazgo	2	30	2025
283	2025-06-10 03:45:52.934093+00	Asume compromisos con responsabilidad y muestra seguridad al tomar decisiones, incluso en contextos de presión o incertidumbre, en la medida que forme parte de su área de expertise y sean decisiones operativas. Si bien se percibe compromiso individual, se espera un mayor nivel de iniciativa para contagiar energía positiva, involucrar al equipo y generar impacto desde el ejemplo diario.\nTambién será importante que adquiera herramientas que le permitan interiorizarse más con el desarrollo motivacional de las personas.\nMuestra una actitud positiva por crecer y desarrollarse, si bien no destaca por generar ideas disruptivas, o en línea con la visión del Negocio, ya que aún tiene una mirada muy recortada del mismo.\nDemuestra flexibilidad y capacidad de respuesta ante cambios, adaptándose con rapidez y manteniendo el foco en los objetivos.\n	14	Liderazgo	2	37	2025
228	2025-06-03 13:44:58.256387+00	Disfruta estar en el front junto a su equipo, se siente parte y le gusta estar disponible para ayudar, tanto en la operación como en la toma de decisiones para resolver imprevistos o mejorar los objetivos. Le gusta siempre trabajar en equipo para eso. Se comunica con claridad y sabe explicar tanto la lógica de su trabajo como los desafíos que enfrenta, lo que facilita la comprensión mutua y la alineación de objetivos.\nComparte buenas prácticas y comentarios de clientes para que todos puedan crecer, y actúa como un facilitador de información clave que permite avanzar hacia las metas. Cuando es necesario organizar al equipo, lo hace con criterio, priorizando el equilibrio y asegurando que cada persona pueda dar lo mejor de sí.\nEn las dinámicas Steffan se identificó en un rol más de colaborador que de líder, rol en el que se siente más cómodo para acompañar al equipo, aportando donde hace falta y donde puede.\n	37	Colaboración	3	25	2025
230	2025-06-03 13:44:58.910407+00	Steffan demuestra una fuerte orientación hacia la mejora continua y la generación de experiencias memorables para el cliente. Disfruta genuinamente de estar presente en el front, donde observa de cerca tanto al cliente como al equipo, buscando activamente oportunidades para optimizar el servicio. Esta presencia le permite ajustar sobre la marcha y actuar con agilidad.\nGestiona su equipo teniendo en cuenta indicadores como el NPS, el ReviewPro y los comentarios de los huéspedes. Utiliza esta información para tomar decisiones que eleven la experiencia, como compartir buenas prácticas con el equipo o analizar si existe margen en el presupuesto para sorprender al cliente (por ejemplo, obsequiando una copa de cava cuando es viable).\nCuida los detalles, está comprometido con superar las expectativas de los clientes y tiene una mirada estratégica del impacto de cada acción en el huesped. 	37	Excelencia con el cliente	3	25	2025
232	2025-06-03 13:44:59.278953+00	Steffan demuestra sensibilidad hacia el impacto ambiental y social en su entorno laboral. Si bien no se posiciona como un referente o impulsor estratégico del valor, sí promueve en su equipo el uso responsable de los recursos disponibles. Está atento a buenas prácticas como el orden y cuidado en los procesos de lavado, el ahorro energético (por ejemplo, luces encendidas innecesarias), y se mantiene al tanto de las acciones de reciclaje que se realizan en el área.\nSu enfoque es práctico y cotidiano, lo que contribuye a una cultura de sostenibilidad desde la operación diaria, aunque no se identifique explícitamente con iniciativas más amplias como World of Change. Su interés genuino por el bienestar del equipo también refuerza una gestión con mirada humana y sostenible.\nSi se puede observar que este punto no está dentro de sus objetivos ni indicadores para gestionar el área y al equipo.\n	37	Sostenibilidad	2	25	2025
274	2025-06-04 10:07:58.770358+00	Calrlos muestra sensibilidad humana en su forma de liderar y vincularse, lo que se alinea con los  términos de bienestar social y buen trato. Además es consciente de cuestiones de sostenibilidad en su área, buenas prácticas que se aplican y las tiene en cuenta en su día a día. No fue algo que remarcó como parte estratégica para gestionar a su equipo y lograr objetivos del área.	44	Sostenibilidad	2	30	2025
276	2025-06-04 10:07:59.097116+00	Carlos demuestra vocación de servicio y disfruta del contacto directo con los huéspedes, lo que es una de sus principales motivaciones en su rol actual.\nSe muestra empático, atento y cercano, lo que contribuye a una experiencia positiva del cliente.\nCuida el trato y el ambiente del equipo, lo que también impacta indirectamente en la calidad del servicio ofrecido.\nAporta ideas creativas para solucionar problemas en la satisfacción del cliente, al tener 5 restaurantes la organización y el orden que sumó con su herramienta hace que tenga impacto en la experiencia del cliente ya que logran distribuir al equipo de acuerdo a sus capacidades con los demás 2dos.\n	44	Excelencia con el cliente	3	30	2025
284	2025-06-10 03:45:53.103636+00	Asume compromisos con responsabilidad y muestra seguridad al tomar decisiones, incluso en contextos de presión o incertidumbre, en la medida que forme parte de su área de expertise y sean decisiones operativas. Si bien se percibe compromiso individual, se espera un mayor nivel de iniciativa para contagiar energía positiva, involucrar al equipo y generar impacto desde el ejemplo diario.\nTambién será importante que adquiera herramientas que le permitan interiorizarse más con el desarrollo motivacional de las personas.\nSe caracteriza por asumir la responsabilidad de sus tareas y tomar decisiones con seguridad. Trabaja con independencia y suele mostrarse confiado al momento de actuar, especialmente cuando tiene claridad sobre el entorno o el objetivo. Se relaciona de manera cercana con su equipo directo, aunque suele mantenerse al margen de establecer vínculos por fuera de ese núcleo. En situaciones en las que no percibe colaboración de otros, puede reaccionar de forma impulsiva o intempestiva, lo que afecta su capacidad de mantener una actitud motivadora y positiva frente al grupo.\nEn cuanto a su rol como referente, tiende a adoptar una postura más pasiva y distante cuando las personas no muestran avances sostenidos en el tiempo. Si el conflicto no lo involucra directamente, puede intervenir desde una mirada reflexiva, aunque con cierta reserva emocional. Esto puede limitar su impacto en la promoción del desarrollo de los demás o en la generación de un entorno colaborativo más amplio.\nSe comunica con claridad, aunque su estilo suele ser escueto y simple. Si bien logra transmitir lo esencial, es recomendable que promueva más espacios de intercambio y escucha activa, especialmente para alentar la participación y fortalecer el sentido colectivo del equipo. También se sugiere trabajar en una mayor apertura a otras miradas y propuestas, adoptando una actitud más proactiva frente a los cambios y fomentando una visión más amplia del propósito compartido.\n	14	Colaboración	3	37	2025
229	2025-06-03 13:44:58.730504+00	Steffan ejerce un liderazgo principalmente basado en la observación, la experiencia y la empatía. Es un referente técnico dentro del equipo y reemplazo natural del Jefe, aunque no termina de proyectarse con seguridad hacia un rol formal de mayor jerarquía. Le cuesta asumir el liderazgo más proactivo en dinámicas grupales nuevas (como en el Assessment), y suele posicionarse como mediador o punto de equilibrio entre posiciones, sin imponerse naturalmente.\nCuando el contexto es conocido y tiene herramientas, muestra capacidad para organizar, tomar decisiones y acompañar con criterio. No le resulta fácil llevar adelante acciones difíciles como desvinculaciones, aunque reconoce la necesidad. Tiende a liderar desde la cercanía y la presencia operativa ya que es algo que disfruta mucho. Estar cerca del equipo y del cliente para poder ver el impacto de algunas decisiones que tome para alcanzar los objetivos del área.\nCuestiona las formas de hacer las cosas, proponiendo mejoras.\nMantiene una visión global del objetivo del equipo, priorizando lo colectivo. En su rol actual tiende a estar atento no solo a la satisfacción del cliente, sino también a otros indicadores como ventas para organizar a su equipo y liderarlo marcando acciones en el equipo para mejorar la satisfacción del cliente de ser necesario. 	37	Liderazgo	3	25	2025
502	2025-06-19 18:09:40.675899+00	Organiza su trabajo en función de las prioridades del negocio, mostrando la flexibilidad necesaria ante inconvenientes o imprevistos. Brinda soluciones con practicidad y sencillez, en búsqueda de agilidad, sin que ello implique impulsividad. Cuida los recursos de la compañía como si fuesen propios, con gran responsabilidad por los mismos. Es capaz de detectar errores u oportunidades de mejora y accionar sobre ellas, con apertura al cambio. Por su estilo de personalidad, precavido y cauto, probablemente las propuestas no surjan de su parte, pero escucha las ideas de los demás, y las aplica, sin atribuirse el merito de los cambios. Podría asumir un rol más protagónico al realizar propuestas, si se atreviera a tomar mayores riesgos. También, necesitará aun mayor determinación para asegurarse el cumplimiento de objetivos en los tiempos propuestos, sin perder calidad. Reconoce que necesita ser más claro al comunicar la dirección a tomar para generar enfoque en consonancia a los propósitos. Podría necesitar acompañamiento ante planificaciones que resulten más ambiciosas respecto a los plazos de tiempo que implican, debido a que su gestión se asocia a proyectos operativos sencillos, de corto plazo, en los que la ambigüedad y por ende el planeamiento, resultan acotados. 	22	Eficiencia y eficacia 	3	44	2025
231	2025-06-03 13:44:59.092388+00	Steffan organiza y prioriza tareas con una mirada estratégica, apoyándose en datos concretos y múltiples indicadores como el Review Pro, los objetivos de venta, la satisfacción del cliente y herramientas como Power BI. Esta capacidad de integrar información le permite tomar decisiones acertadas tanto en la operación diaria como en el ajuste de procesos cuando los resultados no son los esperados.\nPropone soluciones prácticas para alcanzar los objetivos del área: si detecta que las ventas están por debajo de lo esperado, activa con su equipo planes de mejora específicos; si encuentra oportunidades de mejora en la experiencia del cliente, revisa los márgenes presupuestarios para ver si puede reinvertir en beneficio del huésped. Su enfoque combina eficacia operativa con visión de impacto.\nObserva con atención el clima laboral, y busca organizar al equipo de manera que se sientan cómodos y reconocidos en sus funciones, convencido de que un equipo bien gestionado es clave para el rendimiento.\nSu presencia activa en el front le permite captar rápidamente el impacto de sus decisiones, detectar oportunidades de mejora en tiempo real y actuar de forma inmediata. Se destaca por su experiencia, capacidad de observación y habilidad para ajustar sobre la marcha sin perder de vista los objetivos.	37	Eficiencia y eficacia 	3	25	2025
503	2025-06-19 18:09:40.845158+00	Es una persona servicial, atenta a los detalles, que busca superar las expectativas, priorizando la experiencia del cliente en toda acción y decisión. Es capaz de empatizar con los clientes, para anticipar necesidades y para responder a pedidos de manera ágil y satisfactoria. Su comunicación es cordial, clara, formal y cercana al mismo tiempo. Trabajar con y para personas resulta lo más satisfactorio para Mamadou. Busca adaptar el servicio en todo lo que esté a su alcance, sin descuidar los lineamientos e intereses de la compañía. Intenta que el cliente se sienta importante, y forme parte, durante de su estadía, de la compañía, sin que sus intereses sean desatendidos. Es proactivo ante la posibilidad de brindar una experiencia satisfactoria en los demás, aunque, se infiere, podría ser aun más creativo en sus propuestas, aumentando su mirada critica para identificar oportunidades y elevando el ingenio en las ideas para solucionas problemas o realizar propuestas. 	22	Excelencia con el cliente	4	44	2025
233	2025-06-03 14:09:23.982369+00	Muestra un liderazgo más orientado a lo vincular y motivacional que al estratégico o directivo. Destaca por su capacidad para generar un clima positivo en el equipo, gracias a su actitud entusiasta, su energía y su empatía. Su estilo de liderazgo es cercano, humano y colaborativo, lo cual es valorado y puede ser efectivo en la gestión operativa diaria.\nEn su rol actual como Subgobernanta lidera equipos operativos con soltura, detallismo y seguimiento constante. Identifica personas clave dentro del equipo para apoyarse, reconoce distintos niveles de experiencia y asigna tareas de forma criteriosa. Todo esto refleja una gestión del día a día muy consolidada y consciente del impacto del servicio en el cliente.\nSin embargo, en las dinámicas grupales no asumió un rol de liderazgo visible, ni mostró iniciativa clara en la toma de decisiones o en la organización del grupo. Ella misma reconoce que su lugar fue más de apoyo emocional que de conducción. Aunque en su rol actual lidera equipos y se percibe con “todo bajo control”, aún muestra cierta dependencia de la figura del superior, especialmente en temas de planificación y gestión más macro del área o conflictos.\nLas mejoras que ha propuesto para el área son en su mayoría de orden técnico y orientadas al cliente, sin una mirada estructurada o estratégica sobre el negocio en general.	39	Liderazgo	2	17	2025
235	2025-06-03 14:09:24.349005+00	Demuestra una clara vocación por el servicio y una fuerte orientación al cliente. Es altamente detallista, lo cual considera clave para que el trabajo esté bien hecho y alineado con las expectativas del huésped. Cuida los detalles y busca superar las expectativas, tanto en lo operativo como en el impacto visual y sensorial de las habitaciones. También transmite esta exigencia al equipo, promoviendo estándares de orden, higiene y presencia personal.\nAnaliza reseñas y comentarios de clientes, y cuando identifica una queja, revisa lo ocurrido con la camarera para evitar que se repita. Aporta ideas de mejora enfocadas principalmente en el confort del huésped, lo que revela una actitud proactiva desde lo técnico y operativo.\nEn las dinámicas del assessment mostró su vocación de servicio también en entornos grupales, prestando ayuda a quienes lideraban la actividad. Su comunicación es cordial, clara y empática, aunque en algunos momentos su energía alta e inquietud interfirieron en el logro fluido del objetivo grupal.\n	39	Excelencia con el cliente	3	17	2025
237	2025-06-03 14:09:24.717901+00	Nerea demuestra sensibilidad hacia el impacto ambiental y conocimiento sobre las prácticas sostenibles que promueve Iberostar. Reconoce y aplica medidas como el lavado con agua fría, y es consciente de la existencia del departamento de 3R, integrando algunas de sus recomendaciones dentro del área. Se asegura de que su equipo también colabore y siga estas pautas, mostrando un compromiso operativo con los objetivos sostenibles de la compañía.\nDurante una de las dinámicas del assessment, propuso un invento relacionado con el ahorro de agua, lo que refleja una intención de aportar desde su rol ideas que contribuyan al cuidado del medioambiente, aunque su propuesta no fue la seleccionada. Este gesto indica que, si bien no lidera iniciativas sostenibles, tiene predisposición a participar con ideas alineadas al propósito de la empresa.\nNo obstante, su enfoque general sigue siendo más de cumplimiento que de cuestionamiento o innovación en temas de sostenibilidad. Su mirada está más orientada al cliente, donde se siente más cómoda y activa proponiendo mejoras.\n\n\n	39	Sostenibilidad	2	17	2025
293	2025-06-14 07:16:42.916692+00	Es una persona enérgica y comprometida, que muestra un fuerte empuje para asumir desafíos y hacerse cargo de tareas con entusiasmo. Aunque a veces actúa de manera impulsiva, lo hace con buenas intenciones y una clara voluntad de aportar. Tiende a tomar decisiones con seguridad dentro de tareas operativas y de su expertise, aunque aún está desarrollando la capacidad de evaluar todas las variables antes de actuar.\nBusca inspirar al grupo desde la acción, mostrando predisposición y entrega. Si bien todavía está encontrando su estilo de liderazgo, su actitud positiva y trabajadora suele motivar a quienes lo rodean. Debe aprender a equilibrar su protagonismo con la escucha activa y la delegación efectiva.\nNecesita  apoyo para ordenar sus prioridades en entornos dinámicos, y asimilar los cambios de manera ágil. Si bien suele enfocarse en la acción inmediata, muestra disposición para aprender, aunque se espera que lo realicé siempre de manera segmentada, limitando su visión periférica.	7	Liderazgo	2	40	2025
295	2025-06-14 07:16:43.266711+00	Tiene dificultades para mantener una visión global: su enfoque tiende a ser operativo o puntual, priorizando la acción antes que la reflexión o el objetivo común. Aún está construyendo su capacidad para pensar en función del equipo y no solo desde lo individual.\nEs una persona que trabaja con orientación a los resultados y que se destaca por su practicidad al momento de resolver. Propone soluciones concretas ante los problemas  conocidos y actúa con rapidez frente a errores, tanto propios como ajenos, corrigiéndolos con una mirada centrada en lo inmediato. Tiende a asumir la responsabilidad por lo que sucede bajo su tarea, mostrando compromiso en la ejecución.\nSi bien se enfoca en cumplir con los tiempos asignados sin perder calidad, bajo presión esta efectividad puede verse afectada, comprometiendo la consistencia en los resultados. Necesita apoyarse en referentes o estructuras externas para organizar y planificar su trabajo, ya que por sí solo no logra aún una gestión autónoma ni estratégica de las actividades.\nEs capaz de detectar oportunidades de mejora durante la marcha, y en esos casos actúa con agilidad, priorizando siempre la acción.\n\n	7	Eficiencia y eficacia 	2	40	2025
297	2025-06-14 07:16:43.608531+00	La persona demuestra una actitud de servicio adecuada cuando interactúa directamente con clientes, mostrando cierta capacidad para adaptarse y mejorar su comunicación en esos contextos. Sin embargo, en la dinámica cotidiana, le cuesta mantener una postura empática y cuidar su forma de vincularse con los demás. Aún está desarrollando la habilidad de ponerse en el lugar del otro para anticipar necesidades o entender perspectivas diferentes a la propia.\nSu comunicación suele ser clara, pero tiende a ser poco formal o impulsiva, lo que puede afectar la percepción del interlocutor y limitar la calidad de sus vínculos laborales. Este estilo se refleja tanto en lo verbal como en lo escrito, y requiere atención para adaptarse según el contexto y el tipo de audiencia.\nSi bien muestra iniciativa y voluntad de hacer, su impulso por resolver puede jugarle en contra cuando no logra sostener una actitud paciente o atenta a los detalles. Necesita reforzar el cuidado de los aspectos formales y la vocación de servicio como parte de una mejora continua, tanto en lo relacional como en la calidad de lo que entrega.\n\n\n	7	Excelencia con el cliente	3	40	2025
294	2025-06-14 07:16:43.091216+00	Muestra disposición a colaborar cuando se siente cómoda o cuando existe afinidad con los demás. En contextos donde percibe cercanía o familiaridad, se involucra con mayor fluidez, comparte información y contribuye a los objetivos comunes. Sin embargo, en entornos menos afines o con opiniones divergentes, le cuesta mantener una actitud abierta, y puede mostrarse reactiva o poco receptiva frente a los aportes del grupo.\nSi bien logra enfocarse en los resultados, su bienestar emocional está muy ligado a un clima ameno y contenedor. Cuando este entorno se ve alterado, o si se siente presionada o contrariada, puede responder de forma poco cordial, generando tensión en la dinámica. Esto afecta la cooperación fluida y limita su capacidad para construir consensos o promover un buen clima grupal de manera constante.\nEscucha, pero no siempre de forma activa ni empática, sobre todo cuando las ideas de otros se contraponen a las propias. Tiene aún por delante el desafío de valorar la diversidad de opiniones sin tomar una postura defensiva o reactiva.\n	7	Colaboración	2	40	2025
296	2025-06-14 07:16:43.431183+00	Está informada sobre las políticas y valores relacionados con la sostenibilidad, y demuestra una sensibilidad general hacia el impacto ambiental y social. Reconoce la importancia del uso responsable de los recursos y, en ocasiones, cuida ciertos aspectos operativos en función de ello. Sin embargo, esta conciencia no se traduce aún en una integración activa y productiva de criterios sostenibles en sus decisiones o propuestas.\nSi bien no contradice los valores y los aplica, no se posiciona de forma proactiva al respecto, Su postura tiende a ser pasiva: acompaña las iniciativas cuando ya están definidas por otros, pero rara vez las impulsa por cuenta propia.\nTampoco suele cuestionar prácticas poco sostenibles ni plantear alternativas, incluso si detecta oportunidades de mejora. Falta consolidar una mirada crítica y propositiva que incorpore activamente el enfoque sostenible en su accionar cotidiano y en la interacción con su equipo.\n\n\n	7	Sostenibilidad	2	40	2025
458	2025-06-18 13:12:20.062768+00	Es una persona tranquila y responsable, que mantiene un buen control emocional incluso en situaciones de presión. Asume la responsabilidad y toma decisiones con seguridad, y puede señalar aspectos de mejora de manera positiva.  Debe incorporar algunas herramientas para ser más motivador con su equipo, ganando energía y empuje para fomentar la participación y el desarrollo de los demás. \nTampoco resulta muy ágil para asimilar los cambios, pero los acepta y los va implementando de forma progresiva.\nAún debe trabajar para desarrollar una visión más global, lo que fortalecerá su capacidad para priorizar y coordinar objetivos colectivos.\n	10	Liderazgo	1	46	2025
459	2025-06-18 13:12:20.518119+00	Tiene un perfil más operacional que estratégico, enfocándose en la ejecución y el cumplimiento de las tareas diarias. Se organiza adecuadamente para gestionar sus responsabilidades, aunque aún necesita un marco externo claro y guía por parte de sus líderes para priorizar y enfocar su trabajo.\n Propone soluciones prácticas y concretas, cuida el uso de los recursos disponibles y cumple con los tiempos asignados sin perder calidad. Además, detecta errores y ajenos, asumiendo la responsabilidad de corregirlos, y actúa sobre las oportunidades de mejora que identifica durante el desarrollo de sus actividades.\nSi bien puede trabajar en sus áreas de mejora, es probable que precise que estos señalamientos provengan de señalamientos externos para identificarlos con mayor precisión.\nSuele mantener el enfoque aún en situaciones de presión.\n	10	Eficiencia y eficacia 	2	46	2025
460	2025-06-18 13:12:20.69881+00	Posee una sólida orientación al cliente, teniendo siempre en cuenta la experiencia del usuario en la toma de decisiones. Se esfuerza por ponerse en el lugar del otro para anticipar sus necesidades, aunque esta capacidad de anticipación puede ser un área a fortalecer. \nDemuestra una actitud positiva y un compromiso constante con la mejora continua, cuidando los detalles y buscando superar las expectativas en cada interacción. Se comunica de manera cordial, clara y empática, reflejando una genuina vocación por el servicio en toda la dinámica laboral, lo que contribuye a generar relaciones de confianza y satisfacción con los clientes.\nDisfruta de interactuar con los clientes, por lo que se mostrará amable, atento y muy receptivo. \n\n	10	Excelencia con el cliente	3	46	2025
461	2025-06-18 13:12:20.870099+00	Es una persona empática que escucha activamente y considera atentamente los aportes de su equipo. Siempre muestra una excelente disposición de servicio, estando dispuesta a ayudar y a construir en conjunto. Respeta y valora la diversidad de opiniones y estilos, fomentando un ambiente inclusivo. Se comunica con claridad y comparte información útil para facilitar el trabajo colectivo. \nGracias a su actitud abierta y respetuosa, estimula un clima de confianza y cooperación, promoviendo acuerdos y buscando el consenso ante cualquier conflicto que pueda surgir.\n\n	10	Colaboración	3	46	2025
462	2025-06-18 13:12:21.041496+00	Conoce y respeta las políticas establecidas, adoptando una actitud principalmente receptiva hacia ellas. Integra criterios de sostenibilidad en sus propuestas y decisiones, mostrando sensibilidad hacia el impacto ambiental y social de su trabajo. Promueve el uso responsable de los recursos disponibles y defiende los valores de World of Change (WOC) en su día a día. Aunque tiende a asumir una postura más receptiva, es capaz de cuestionar prácticas poco sostenibles cuando es necesario, si bien precisa de ayuda para proponer alternativas viables. Actúa como un ejemplo dentro de su equipo, fomentando la conciencia y el compromiso con la sostenibilidad.\n	10	Sostenibilidad	3	46	2025
318	2025-06-14 08:21:34.211268+00	Se trata de una persona que, aunque no busca activamente ocupar un rol de liderazgo formal, puede convertirse en un referente positivo dentro del equipo por su compromiso, sentido de la responsabilidad y capacidad para generar un entorno participativo. Su liderazgo se manifiesta más desde el hacer que desde el decir, inspirando a otros con el ejemplo y generando confianza desde su coherencia y disponibilidad.\nPromueve la participación de forma natural, escucha a sus compañeros y propone soluciones simples y prácticas cuando se presentan los problemas. Su enfoque tiende a ser más reactivo que proactivo, lo que le permite actuar con claridad dentro del alcance que maneja, aunque puede requerir más tiempo para adaptarse a cambios y asumir desafíos que impliquen una visión más estratégica o anticipatoria.\nTiene una mirada enfocada en lo operativo y concreto, con menor inclinación hacia una perspectiva global o de largo plazo. Sin embargo, su capacidad para mantener la estabilidad, sostener procesos y contribuir con ideas funcionales en el día a día, lo convierten en un pilar importante para la dinámica del equipo.\nCon el acompañamiento adecuado, podría seguir desarrollando habilidades de planificación, visión transversal y liderazgo más consciente, potenciando aún más su impacto en el equipo.\n\n	8	Liderazgo	3	41	2025
319	2025-06-14 08:21:34.388455+00	Tiene una marcada disposición al trabajo colaborativo. Es abierta al intercambio, accesible y siempre dispuesta a brindar soporte a quienes lo necesitan. Su actitud solidaria y su capacidad de escucha la convierten en un pilar importante dentro del equipo, fomentando un clima laboral positivo basado en la confianza y la colaboración.\nComparte la información con transparencia, contribuye al flujo de trabajo y busca mediar en situaciones de conflicto, priorizando el bienestar colectivo. Tiene un genuino interés por generar un buen ambiente laboral, actuando con empatía y responsabilidad.\nEn su afán por ayudar y dar respuesta a las necesidades del equipo, en ocasiones asume más tareas de las que le corresponden, lo que puede llevarla a sobrecargarse. Aunque mantiene una actitud positiva, cuando se encuentra superada por la demanda o el estrés, esto suele manifestarse en su forma de comunicar o relacionarse.\nFortalecer habilidades de gestión de límites, priorización y delegación puede ayudarla a mantener su nivel de compromiso sin afectar su bienestar, potenciando así su impacto positivo en el equipo de forma más sostenible.\n	8	Colaboración	4	41	2025
321	2025-06-14 08:21:34.739561+00	Demuestra un fuerte alineamiento con las políticas de sostenibilidad de la organización, a las que adhiere con convicción y promueve activamente dentro de su equipo. Se esfuerza por implementarlas con responsabilidad y coherencia, actuando como un verdadero embajador de estas iniciativas. Muestra sensibilidad y compromiso genuino hacia el cuidado del medio ambiente, y suele proponer mejoras que aportan valor desde lo operativo. Si bien ante situaciones de mayor complejidad puede necesitar orientación externa para identificar problemas o definir acciones, su disposición para aprender y colaborar lo convierten en un aliado clave para sostener una cultura organizacional orientada a la sustentabilidad.	8	Sostenibilidad	3	41	2025
320	2025-06-14 08:21:34.558426+00	Es una persona que desempeña su rol de manera consciente, profesional y prudente, ajustándose con responsabilidad a las expectativas que se le asignan. Su estilo de trabajo es analítico, orientado a cumplir con los objetivos establecidos dentro del marco definido por otros, tanto en lo que respecta a metas como a plazos.\nSe destaca por su capacidad para proponer soluciones concretas ante los problemas que se presentan, aunque su abordaje tiende a ser más reactivo que preventivo. Esto, en ocasiones, puede dificultar la anticipación de situaciones complejas o la planificación a largo plazo.\nPrefiere trabajar con una mirada centrada en el corto y mediano plazo, y cuando comete errores, tiene la capacidad y la actitud para corregirlos. Su compromiso y disposición a involucrarse muchas veces lo llevan a asumir una carga excesiva de tareas, lo que puede derivar en una disminución de su rendimiento o en una mayor probabilidad de errores.\nFortalecer su capacidad de priorización, anticipación y autonomía en la toma de decisiones estratégicas podría permitirle ampliar su impacto y aportar con mayor previsión y proactividad al equipo.\n\n	8	Eficiencia y eficacia 	2	41	2025
322	2025-06-14 08:21:34.908697+00	Tiene una marcada orientación a la experiencia del cliente, priorizando su satisfacción al momento de tomar decisiones y definir acciones. Actúa con agilidad para responder a las demandas, mostrando empatía, escucha activa y una actitud proactiva para resolver necesidades. Cuida los detalles en cada interacción y se comunica de manera cordial, cálida y amena, manteniendo siempre la transparencia y el profesionalismo. Su enfoque contribuye a generar relaciones de confianza y a fortalecer el vínculo con los clientes, incluso en situaciones desafiantes.	8	Excelencia con el cliente	4	41	2025
323	2025-06-17 06:58:25.749462+00	Se trata de una persona comprometida y responsable, que cumple con los objetivos que se le asignan y demuestra un genuino interés por el bienestar del equipo. Tiene una actitud colaborativa, trabajando codo a codo con sus colegas, lo que genera un buen clima laboral. Es alguien que se involucra y muestra entusiasmo por aprender y superarse.\nSin embargo, aún no ha consolidado un estilo de liderazgo claro ni directivo. Le cuesta delegar tareas o establecer pautas con firmeza, lo que puede limitar el desarrollo de quienes trabajan con ella. Si bien tiene buenas intenciones, necesita incorporar herramientas que le permitan acompañar y potenciar el crecimiento de otros.\nSe adapta a los cambios con cierta lentitud, aunque lo hace con disposición. Su enfoque suele estar centrado en el corto plazo, por lo que sería valioso que trabaje en desarrollar una mirada más estratégica, que contemple el mediano y largo plazo. Con acompañamiento y espacios de desarrollo, tiene potencial para fortalecer su liderazgo.\n	12	Liderazgo	1	43	2025
324	2025-06-17 06:58:25.921232+00	Es una persona con un estilo de colaboración altamente desarrollado. Se muestra siempre cercano, amigable y accesible, generando vínculos de confianza tanto con sus compañeros como con otros equipos. Su forma de comunicarse es simple, concreta y clara, lo que facilita la comprensión y la fluidez en el trabajo diario. Además, tiene una gran capacidad de escucha, prestando atención a las necesidades de los demás y mostrando disposición para brindar ayuda cuando se lo requiere.\nTiene una fuerte identificación con su líder y con los objetivos y necesidades del Hotel, lo que lo hace un miembro comprometido y alineado con la organización. Aunque naturalmente puede no ser alguien extremadamente abierto en determinadas situaciones, siempre mantiene una actitud de respeto frente a opiniones o visiones diferentes.\nComo oportunidad de desarrollo, sería valioso que trabaje en fortalecer su capacidad de influencia y persuasión, de modo de generar acuerdos y consensos con mayor autonomía y asertividad. También podría potenciar su nivel de perspicacia para anticipar dinámicas o necesidades, lo que le permitirá manejar conversaciones y negociaciones con mayor soltura.\n\n	12	Colaboración	3	43	2025
325	2025-06-17 06:58:26.083917+00	Es una persona fuertemente orientada a la acción y al cumplimiento de los planes operativos que se le asignan. Responde bien a los objetivos definidos y cumple con los tiempos establecidos, mostrando agilidad para corregir desvíos y resolver problemas en el corto plazo. Tiene un enfoque concreto y práctico, lo que le permite reaccionar con rapidez ante los imprevistos.\nSin embargo, aún requiere de una guía externa para organizar sus prioridades, definir planes de trabajo y gestionar de manera más eficiente los recursos disponibles. Le sería beneficioso fortalecer sus habilidades de planificación y organización para optimizar los procesos y anticiparse a potenciales dificultades, logrando mayor autonomía en su gestión.\nSu aprendizaje se potencia especialmente cuando recibe feedback directo de personas a quienes valora y reconoce como referentes. Este tipo de retroalimentación le permite incorporar con rapidez los ajustes necesarios y evolucionar en su desempeño.\n	12	Eficiencia y eficacia 	2	43	2025
326	2025-06-17 06:58:26.244198+00	Es una persona que respeta y sigue los lineamientos y políticas que se le establecen, incluyendo aquellas vinculadas a sostenibilidad y buenas prácticas organizacionales. Su nivel de cumplimiento es sólido cuando cuenta con directrices claras y definidas previamente.\nSin embargo, no se destaca por generar propuestas o iniciativas propias en esta materia. Su capacidad de aportar alternativas de resolución depende en gran medida del acompañamiento y de la orientación que reciba por parte de sus líderes o de políticas externas que le sirvan de marco de referencia. En este sentido, su productividad y aporte en temas transversales, como sostenibilidad, podrían potenciarse si desarrolla mayor autonomía, capacidad de análisis y proactividad para identificar oportunidades de mejora más allá de los lineamientos preestablecidos.\n	12	Sostenibilidad	2	43	2025
327	2025-06-17 06:58:26.408809+00	Aunque su contacto con el cliente externo no es frecuente, demuestra una marcada orientación al servicio y a la resolución de problemas técnicos. Es una persona dedicada, con buena disposición para comprender los requerimientos de otros, adaptándose a las necesidades que se le presentan y trabajando para ofrecer soluciones efectivas.\nSin embargo, en ocasiones tiende a sobrecargarse de tareas, ya que le resulta desafiante establecer límites o priorizar en función de la demanda. Este rasgo, si bien refleja compromiso, puede generar dificultades en la gestión de su carga de trabajo y afectar la eficiencia. Desarrollar la habilidad de priorizar y poner límites de manera asertiva le permitirá sostener su nivel de servicio sin comprometer la calidad ni su propio desempeño.\n	12	Excelencia con el cliente	3	43	2025
483	2025-06-19 07:07:06.52133+00	Es responsable y toma decisiones con seguridad dentro de su scope, generalmente con determinación, aunque en ocasiones sin contemplar plenamente los matices o impactos en el equipo. Tiene la capacidad de actuar con seguridad en contextos de presión, pero necesita fortalecer su capacidad de análisis conjunto y el ejercicio de la escucha activa para enriquecer sus decisiones con distintas perspectivas.\nMuestra voluntad de liderar con el ejemplo, aportando energía y compromiso, aunque su estilo puede resultar frontal o poco sensible en la forma de comunicar, lo que a veces afecta su habilidad para motivar e influir positivamente en los demás. Si bien intenta generar impulso en los equipos, aún está en proceso de desarrollar herramientas emocionales que le permitan conectar mejor con las personas y construir vínculos de confianza.\nse beneficiaría de trabajar en habilidades interpersonales como la empatía, la comunicación asertiva y la gestión emocional, para poder liderar con mayor cercanía, contención y apertura. Así, podrá no solo impulsar los resultados, sino también fomentar el crecimiento integral de su equipo en un ambiente más participativo y cohesionado.\n\n	13	Liderazgo	2	54	2025
484	2025-06-19 07:07:06.699646+00	En general tiene una comunicación clara y efectiva con su entorno, mostrando disposición al diálogo y a la colaboración. Escucha activamente a sus interlocutores y suele considerar los aportes del grupo, especialmente cuando estos están alineados con los objetivos que persigue. Puede ser mas resistente a incorporar ideas diferentes a las propias cuando no provienen de alguien que valore.\nSe muestra dispuesta a ayudar a otros y trabajar en conjunto, siendo accesible y participativa en dinámicas de equipo. Respeta la diversidad de opiniones y estilos, y aunque puede no profundizar demasiado en el entendimiento del otro, evita imponer sus puntos de vista y se maneja con un trato respetuoso. \nComparte información útil y se comunica con claridad, especialmente en temas operativos o concretos. Es directa y funcional en sus intercambios, aunque puede mejorar la sensibilidad en contextos emocionales o cuando se requiere contención. \nEn términos de desarrollo, se beneficiaría de profundizar su empatía conversacional, el uso del feedback constructivo y la capacidad de facilitar acuerdos más complejos en contextos de tensión o desacuerdo. \n\n\n	13	Colaboración	3	54	2025
485	2025-06-19 07:07:06.877011+00	Se desempeña con efectividad en entornos operativos, mostrando una buena capacidad para organizar y ejecutar tareas dentro de su ámbito de acción. Sabe priorizar actividades de corto plazo y se muestra orientado/a a cumplir con los objetivos establecidos, cumpliendo con los tiempos asignados sin comprometer la calidad del resultado. Su enfoque está centrado en la acción concreta y la solución práctica de los problemas que se le presentan.\nPropone alternativas resolutivas en el día a día, especialmente cuando las situaciones son claras y acotadas, aunque le cuesta proyectarse más allá de lo inmediato o integrar una mirada estratégica que anticipe posibles obstáculos o necesidades futuras. El uso de los recursos suele ser responsable, aunque no siempre consciente desde una lógica de optimización general del equipo o de los procesos.\nMantiene el foco en los resultados, sin distraerse con cuestiones secundarias, y muestra compromiso con la tarea asignada. Sin embargo, le resulta desafiante detectar oportunidades de mejora más allá de lo evidente, o identificar fallas sistémicas que requieran ajustes estructurales. En cuanto a los errores, puede asumir su responsabilidad cuando estos son claros, pero necesita seguir desarrollando una actitud más proactiva frente al aprendizaje y la mejora continua.\n\n	13	Eficiencia y eficacia 	3	54	2025
486	2025-06-19 07:07:07.043335+00	Muestra una conciencia clara respecto a la importancia de integrar criterios de sostenibilidad en su trabajo cotidiano. Tiende a considerar el impacto ambiental y social en sus decisiones y propuestas dentro de su ámbito de acción, buscando un equilibrio entre la eficiencia operativa y el uso responsable de los recursos. Si bien su enfoque no es necesariamente técnico o especializado, demuestra una sensibilidad genuina por estos temas y actúa con coherencia frente a los principios que promueve la organización.\nSi bien aún no ejerce un rol de liderazgo explícito en la materia, su influencia es visible en los pequeños gestos y en la forma en que encarna los valores institucionales con autenticidad.\n\n	13	Sostenibilidad	2	54	2025
487	2025-06-19 08:43:27.948483+00	5asdasdadasdasdsa	83	Excelencia con el cliente	5	39	2025
488	2025-06-19 08:43:28.119046+00	4asdsadasdasdsad	83	Liderazgo	4	39	2025
489	2025-06-19 08:43:28.288645+00	3	83	Colaboración	3	39	2025
490	2025-06-19 08:43:28.467259+00	2	83	Eficiencia y eficacia 	2	39	2025
491	2025-06-19 08:43:28.650047+00	1	83	Sostenibilidad	1	39	2025
\.


--
-- Data for Name: project_phases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."project_phases" ("id", "created_at", "etapa", "days_duration", "days_from_last", "order", "type", "colour") FROM stdin;
2	2025-05-06 06:46:41.396679+00	Primer Reunión estratégica	3	3	2	\N	#002855
3	2025-05-06 06:47:41.074179+00	Segunda Reunión estratégica	15	4	3	\N	#FF6B35
1	2025-05-06 06:46:20.519289+00	Contratacion	10	0	1	\N	#FECA1D
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") FROM stdin;
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads" ("id", "in_progress_size", "upload_signature", "bucket_id", "key", "version", "owner_id", "created_at", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads_parts" ("id", "upload_id", "size", "part_number", "bucket_id", "key", "etag", "owner_id", "version", "created_at") FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: areaDesarrollo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."areaDesarrollo_id_seq"', 107, true);


--
-- Name: aspiraciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."aspiraciones_id_seq"', 54, true);


--
-- Name: colores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."colores_id_seq"', 3, true);


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."company_id_seq"', 4, true);


--
-- Name: competenciaCompany_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."competenciaCompany_id_seq"', 51, true);


--
-- Name: competencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."competencias_id_seq"', 16, true);


--
-- Name: competencias_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."competencias_id_seq1"', 13, true);


--
-- Name: etapas_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."etapas_proyecto_id_seq"', 3, true);


--
-- Name: evaluado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."evaluado_id_seq"', 116, true);


--
-- Name: idiomaNivel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."idiomaNivel_id_seq"', 12, true);


--
-- Name: idiomaNiveles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."idiomaNiveles_id_seq"', 457, true);


--
-- Name: idiomas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."idiomas_id_seq"', 27, true);


--
-- Name: informeAspiraciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."informeAspiraciones_id_seq"', 90, true);


--
-- Name: informeFortalezas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."informeFortalezas_id_seq"', 135, true);


--
-- Name: informeTipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."informeTipo_id_seq"', 3, true);


--
-- Name: informeValoracionCompetencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."informeValoracionCompetencia_id_seq"', 503, true);


--
-- Name: informe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."informe_id_seq"', 55, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."roles_id_seq"', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."users_id_seq"', 48, true);


--
-- PostgreSQL database dump complete
--

RESET ALL;

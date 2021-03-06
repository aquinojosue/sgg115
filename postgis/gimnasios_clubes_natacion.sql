DROP TABLE IF EXISTS "clubes_natacion_sv";
DROP SEQUENCE IF EXISTS clubes_natacion_sv_fid_seq;
CREATE SEQUENCE clubes_natacion_sv_fid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."clubes_natacion_sv" (
    "fid" integer DEFAULT nextval('clubes_natacion_sv_fid_seq') NOT NULL,
    "cat" integer,
    "nombre_natacion" text,
    "depto" text,
    "telefono_natacion" text,
    "geom" geometry(Point,4326),
    CONSTRAINT "clubes_natacion_sv_pkey" PRIMARY KEY ("fid")
) WITH (oids = false);

CREATE INDEX "clubes_natacion_sv_cat_idx" ON "public"."clubes_natacion_sv" USING btree ("cat");

CREATE INDEX "clubes_natacion_sv_geom_idx" ON "public"."clubes_natacion_sv" USING btree ("geom");

INSERT INTO "clubes_natacion_sv" ("fid", "cat", "nombre_natacion", "depto", "telefono_natacion", "geom") VALUES
(1,	1,	'Club de Natación Flor Blanca',	'SAN SALVADOR',	'+503 2502 4220',	'0101000020E61000000B8D710FD34D56C0720F536C16652B40'),
(2,	2,	'Aqua Center',	'SAN SALVADOR',	'+503 2263 8797',	'0101000020E6100000F3C011EE5F4F56C0A085A9D2BB652B40'),
(3,	3,	'Club de Natación Zeus.',	'SAN SALVADOR',	'+503 7649 0591',	'0101000020E6100000940A7437994D56C0B484C65DCE722B40'),
(4,	4,	'Splash KIDS',	'SAN SALVADOR',	'+503 2564 2913',	'0101000020E61000001BEB2CC4B44F56C083F0B270A3662B40'),
(5,	5,	'Piscina Olímpica, Estadio Mágico González',	'SAN SALVADOR',	'+503 2512 6748',	'0101000020E61000004C906C09D44D56C040D2F1E20E652B40'),
(6,	6,	'COLPROCE',	'SAN SALVADOR',	'+503 2273 4105',	'0101000020E6100000E08096AEE04E56C0C4904193695D2B40'),
(7,	7,	'Circulo Deportivo Internacional',	'SAN SALVADOR',	'+503 2528 3700',	'0101000020E61000002FE065868D4E56C040A4DFBE0E642B40'),
(8,	8,	'Clases de natación y futbol',	'SAN SALVADOR',	'+503 7880 4527',	'0101000020E6100000F8B9EBB6D54E56C0C8C738903F6A2B40'),
(9,	9,	'Hidronasia',	'SAN SALVADOR',	'+503 2284 1239',	'0101000020E610000094D0A79F814E56C09048803FA1732B40'),
(10,	10,	'Instituto Técnico Ricaldone',	'SAN SALVADOR',	'+503 2234 6000',	'0101000020E610000009B99C5C1D4D56C0870B8A308F722B40'),
(11,	11,	'Colegio Cristobal Colon',	'SAN SALVADOR',	'+503 2225 2320',	'0101000020E610000021CCED5E6E4D56C02796A5E7276E2B40'),
(12,	12,	'Parque Colonia Ciudad Satelite',	'SAN SALVADOR',	'+503 2511 6000 ext. 1378',	'0101000020E61000008D62B9A5D54D56C066C5CB2E73712B40'),
(13,	13,	'Centro Cultural FUSALMO',	'SAN SALVADOR',	'+503 2259 2038',	'0101000020E6100000311BAE1FAC4956C0E3EF28DF7D6F2B40'),
(14,	14,	'Polideportivo Jardines de San Marcos',	'SAN SALVADOR',	'-',	'0101000020E61000008B040940124C56C01A7739DB92532B40'),
(15,	15,	'Polideportivo Nejapa Vitoria Gasteiz',	'SAN SALVADOR',	'+503 2201 0178',	'0101000020E61000009E8F7C6F9D4E56C031D8689489A22B40'),
(16,	16,	'Polideportivo Don Bosco',	'SAN SALVADOR',	'+503 2259 2000',	'0101000020E61000000285D5B3FB4856C03AF768BB536F2B40'),
(17,	17,	'Polideportivo De Tonacatepeque',	'SAN SALVADOR',	'-',	'0101000020E61000003CC09316AE4756C01173A48EE9902B40'),
(18,	18,	'Apulo piscina',	'SAN SALVADOR',	'-',	'0101000020E6100000E88E5951DE4456C0AD4F39268B672B40'),
(19,	19,	'Club Salvadoreño Corinto',	'SAN SALVADOR',	'+503 2304 0195',	'0101000020E6100000EB4A15D6574356C0BE874B8E3B692B40'),
(20,	20,	'Club Círculo Militar, El Salvador',	'SAN SALVADOR',	'+503 2555 5000',	'0101000020E61000007771D17FC54E56C0F629221EE4602B40'),
(21,	21,	'Piscinas Municipales De Santa Elena',	'USULUTÁN',	'-',	'0101000020E610000047167A0E761A56C0B40EFDC9CEC12A40'),
(22,	22,	'J.E.J Deportes',	'USULUTÁN',	'+503 2624 9224',	'0101000020E6100000200E6D5BEF1B56C0DE24613A08B12A40'),
(23,	23,	'Injuve Usulutan',	'USULUTÁN',	'+503 7470 4796',	'0101000020E6100000B10F5773251C56C01672005878AA2A40'),
(24,	24,	'Club Costa Del Sol Circulo Militar El Salvador',	'USULUTÁN',	'+503 2338 0323',	'0101000020E6100000315B57714F3956C09F6DDA311A962A40'),
(25,	25,	'Club Marina del Sol',	'USULUTÁN',	'-',	'0101000020E6100000DAAD65321C3B56C0700F9DF9309E2A40'),
(26,	26,	'Club Joya Del Pacifico, Costa del Sol-EL Salvador',	'USULUTÁN',	'+503 2223 0077',	'0101000020E6100000329F628B133C56C00C2C369CE8A12A40'),
(27,	27,	'Piscinas Publicas de Mercedes Umaña',	'USULUTÁN',	'-',	'0101000020E610000067FE87AA4E1F56C04552C19778222B40'),
(28,	28,	'Complejo Deportivo Germany',	'AHUACHAPAN',	'--',	'0101000020E6100000FDF301245E7656C02562C6EEBDE92B40'),
(29,	29,	'SWIM AMERICA EL SALVADOR',	'LA LIBERTAD',	'2312-8251',	'0101000020E61000003296A83C195156C0E4CFE3914E502B40'),
(30,	30,	'Polideportivo Ciudad Merliot',	'LA LIBERTAD',	'2278-8316',	'0101000020E6100000053CAB05BA5056C0BC74DA7ACB622B40'),
(31,	31,	'INJUVE San Miguel',	'SAN MIGUEL',	'2660-3724',	'0101000020E610000036F14391460B56C06118B14E15FD2A40'),
(32,	32,	'Club Deportivo Santaneco',	'SANTA ANA',	'2247-9950',	'0101000020E610000049B65F589F6256C0AC9F2AF188ED2B40'),
(33,	33,	'APAC Santa Ana',	'SANTA ANA',	'2565-1500',	'0101000020E6100000450C60E82B6456C0768BB4FA94EF2B40'),
(34,	34,	'FUSALMO Santa Ana',	'SANTA ANA',	'2259-2034',	'0101000020E6100000A5658A07356356C04053466B2CF52B40'),
(35,	35,	'INDES – Finca Modelo',	'SANTA ANA',	'2247-0049',	'0101000020E61000004156F071396456C05DBB796E99FF2B40'),
(36,	36,	'Centro Recrerativo ACACESPSA',	'SANTA ANA',	'2487-2883',	'0101000020E61000004C8D3411AD6256C046CC9A4B8FED2B40'),
(37,	37,	'Piscinas El Mangal',	'CUSCATLAN',	'7256-0128',	'0101000020E6100000D9293CCB254156C0D891C43E26E42B40'),
(38,	38,	'Balneario Los Encantos del Duende',	'CUSCATLAN',	'--',	'0101000020E6100000451BC6C3443B56C004F63F31E25F2B40'),
(39,	39,	'Mundo Acuático',	'MORAZÁN',	'--',	'0101000020E610000059A31FA3690A56C0C5C9440F9F9D2B40'),
(40,	40,	'Piscinas Maranata',	'MORAZÁN',	'--',	'0101000020E6100000AC452103F31156C0B0240D9C548A2B40'),
(41,	41,	'Estadio José Gregorio Matrtínez',	'CHALATENANGO',	'--',	'0101000020E6100000BDAC073D043E56C0F86985DDF41B2C40'),
(42,	42,	'Estadio Jiboa',	'SAN VICENTE',	'--',	'0101000020E610000032E736C9543256C01B4B3BB42A532B40'),
(43,	43,	'Cancha El Tablón',	'SAN VICENTE',	'--',	'0101000020E6100000AEC36EE4C43756C004FFEA0DE5572B40'),
(44,	44,	'Cancha El Carmen',	'SAN VICENTE',	'--',	'0101000020E6100000646F8822543856C0225C6A55DC582B40'),
(45,	45,	'Polideportivo Las Marias',	'LA UNION',	'--',	'0101000020E610000062239AC249FE55C0D5AC71F030412B40'),
(46,	46,	'Cancha Club Deportivo Rayos de Plata',	'LA UNION',	'--',	'0101000020E61000001F4D4177770156C0E6EFDF85CA242B40'),
(47,	47,	'Club Deportivo Femenino',	'LA UNION',	'--',	'0101000020E6100000313C722635F955C021ECEA2732B92A40'),
(48,	48,	'Cancha de Beisbol',	'LA UNION',	'--',	'0101000020E6100000C9740FF27FF655C002F7812069B02A40'),
(49,	49,	'Polideportivo Municipal de San Rafael Obrajuelo',	'LA PAZ',	'7971-7961',	'0101000020E6100000D8E94712793B56C09EDDFEBEAC002B40'),
(50,	50,	'Parque Acuático Ichanmichen',	'LA PAZ',	'--',	'0101000020E6100000E0606F0B2C3856C09CD0345F6AFD2A40'),
(51,	51,	'Manantiales de Jiboa',	'LA PAZ',	'--',	'0101000020E6100000F4EF63E57A4056C0434F6E7C43FE2A40'),
(52,	52,	'Polideportivo 27 de Septiembre',	'LA PAZ',	'--',	'0101000020E6100000CA1772ABB93756C0517705D2B2082B40'),
(53,	53,	'Piscina de Agua Salada',	'SONSONATE',	'',	'0101000020E61000007EFB07BC477456C0D45364E2E60F2B40'),
(54,	54,	'La Piscina de Tobal',	'SONSONATE',	'--',	'0101000020E610000019858283EE6356C036472FFA20582B40'),
(55,	55,	'Piscina familiar Atecozol',	'SONSONATE',	'--',	'0101000020E61000003E702A8FDE6A56C051FE1078777D2B40'),
(56,	56,	'Peñas del Coban',	'SONSONATE',	'--',	'0101000020E6100000B0A53FDE656F56C01D813D2F60722B40');

DROP TABLE IF EXISTS "gimnasios_sv";
DROP SEQUENCE IF EXISTS gimnasios_script_fid_seq;
CREATE SEQUENCE gimnasios_script_fid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."gimnasios_sv" (
    "fid" integer DEFAULT nextval('gimnasios_script_fid_seq') NOT NULL,
    "cat" integer,
    "nombre_gym" text,
    "depto" text,
    "telefono_gym" text,
    "geom" geometry(Point,4326),
    CONSTRAINT "gimnasios_script_pkey" PRIMARY KEY ("fid")
) WITH (oids = false);

CREATE INDEX "gimnasios_script_cat_idx" ON "public"."gimnasios_sv" USING btree ("cat");

CREATE INDEX "gimnasios_script_geom_idx" ON "public"."gimnasios_sv" USING btree ("geom");

INSERT INTO "gimnasios_sv" ("fid", "cat", "nombre_gym", "depto", "telefono_gym", "geom") VALUES
(1,	1,	'Abrego Gym',	'CHALATENANGO',	'--',	'0101000020E6100000E8A69301244156C037556EDE934F2C40'),
(2,	2,	'Energym',	'CHALATENANGO',	'--',	'0101000020E61000002DDEC8F12F3D56C07D4543F74B2E2C40'),
(3,	3,	'Gimnasio Monge',	'CHALATENANGO',	'--',	'0101000020E6100000B5E7EC06673E56C0B25AECECB5282C40'),
(4,	4,	'Asociación comunal Tamarindo',	'CHALATENANGO',	'--',	'0101000020E6100000A44690CD913856C01F344078C10D2C40'),
(5,	5,	'Gimnasio y Polideportivo De San Antionio Los Ranchos',	'CHALATENANGO',	'--',	'0101000020E610000050F41774563956C006D19829F0072C40'),
(6,	6,	'Smartfitness',	'CHALATENANGO',	'--',	'0101000020E6100000EFA52EF4F23B56C053A3BB992E162C40'),
(7,	7,	'Fitness Center',	'CHALATENANGO',	'--',	'0101000020E610000053D583363E3C56C05AF9B18362162C40'),
(8,	8,	'Bros Gym',	'CHALATENANGO',	'--',	'0101000020E61000002AC95FABD03B56C02C1904D39F152C40'),
(9,	9,	'Black Scorpion Chalatenango',	'CHALATENANGO',	'--',	'0101000020E610000044A48F6DEB3B56C07C7A42022B152C40'),
(10,	10,	'Fibra Gym',	'CHALATENANGO',	'--',	'0101000020E6100000489C0EE9163C56C01CBE878424152C40'),
(11,	11,	'Cancha El Chilamate',	'CHALATENANGO',	'--',	'0101000020E6100000AE1304D4234056C0A3E4EAE10D3A2C40'),
(12,	12,	'Cancha de Futbol San Fernando Viejo',	'CHALATENANGO',	'--',	'0101000020E6100000FDB4B84E7F4156C03F2EBC9D6CA12C40'),
(13,	13,	'Cancha de Futbol Cantón Las Granadillas',	'CHALATENANGO',	'--',	'0101000020E61000002D1E4FC5574556C07F60359E3FBA2C40'),
(14,	14,	'Cancha de Futbol El Trapichito',	'CHALATENANGO',	'--',	'0101000020E61000005308C5B021F555C083C6E98DD08E2B40'),
(15,	15,	'Strong Gym',	'LA UNION',	'--',	'0101000020E610000093FA29AF9FF855C034A644EC13482B40'),
(16,	16,	'PowerGym',	'LA UNION',	'--',	'0101000020E6100000A50A21016DF555C0F71A7B93E2302B40'),
(17,	17,	'Cancha Los Morenos',	'LA UNION',	'--',	'0101000020E6100000BA99967C59FB55C0E7CB28B120222B40'),
(18,	18,	'Cancha CD Atlas',	'LA UNION',	'--',	'0101000020E61000004BE9DDF4A2FD55C008FF86A4E0DF2A40'),
(19,	19,	'Campo El Milán',	'LA UNION',	'--',	'0101000020E6100000DB607620F7FB55C019AAC9B14DD92A40'),
(20,	20,	'Estadio Agua Fría',	'LA UNION',	'--',	'0101000020E61000008B1D9E624EFC55C0C145D527CBD32A40'),
(21,	21,	'GyM Luce Roca Benitez',	'LA UNION',	'--',	'0101000020E61000007C8F8AF95E0156C00ACF9AE0DCC72A40'),
(22,	22,	'Campo El Jicaro',	'LA UNION',	'--',	'0101000020E61000009D0EDA0B45FC55C021EB91A893B12A40'),
(23,	23,	'Parque INDES',	'LA UNION',	'--',	'0101000020E6100000B4CC2118EFF555C0749DED7604AF2A40'),
(24,	24,	'Bull Gym',	'LA UNION',	'--',	'0101000020E610000047A430682DF655C04C97C018D7AF2A40'),
(25,	25,	'Gimnasio Municipal El Rápido',	'LA UNION',	'--',	'0101000020E6100000CE533A0201F655C0A9BE9B3399AC2A40'),
(26,	26,	'Cancha Municipal Borromeo',	'LA UNION',	'--',	'0101000020E61000003D35FD8FA8F755C00B068C9999962A40'),
(27,	27,	'Cancha de Fútbol La Billal',	'LA UNION',	'--',	'0101000020E610000086F3773353FF55C03AD0F058B2712A40'),
(28,	28,	'Body Power Gym',	'SAN VICENTE',	'--',	'0101000020E6100000255D4BC2DC3356C07313F0A46D752B40'),
(29,	29,	'Cancha de San José Cerro Grande',	'SAN VICENTE',	'--',	'0101000020E61000007A1462D3823356C03A74BEE22C582B40'),
(30,	30,	'Cancha Sintética',	'SAN VICENTE',	'--',	'0101000020E6100000DC7BDFC6103156C0A981189B105C2B40'),
(31,	31,	'Titanic Gym',	'SAN VICENTE',	'--',	'0101000020E6100000A5217EDE163256C04B415D9BAA4B2B40'),
(32,	32,	'Indes',	'SAN VICENTE',	'--',	'0101000020E61000005EB5DF5DCC3156C08EB73959B24A2B40'),
(33,	33,	'Crossfit Elite SV',	'SAN VICENTE',	'--',	'0101000020E6100000F41F7D572D3256C0AC4F9CE40C4A2B40'),
(34,	34,	'Titanic Gym 2',	'SAN VICENTE',	'--',	'0101000020E61000004DA77BB9493256C098A1C36195492B40'),
(35,	35,	'Gym Maya',	'SAN VICENTE',	'--',	'0101000020E6100000F5B69043673256C0C4A553615C482B40'),
(36,	36,	'Unidad Médica Física y de rehabilitación ISSS',	'SAN VICENTE',	'--',	'0101000020E61000006C1BEE36703256C0BF4E077E92482B40'),
(37,	37,	'Cancha de Fútbol Sala',	'SAN VICENTE',	'--',	'0101000020E61000009EF19133183256C05C4E50B596282B40'),
(38,	38,	'Cancha de Fútbol de Las Lajas',	'SAN VICENTE',	'--',	'0101000020E6100000D58FB30E0A2456C07D2012AAFB522B40'),
(39,	39,	'Gym Las Brisas',	'AHUACHAPAN',	'--',	'0101000020E6100000238FCB54017756C0FC9E4E9B7EE32B40'),
(40,	40,	'Wally Sport Fitness Gym',	'AHUACHAPAN',	'--',	'0101000020E6100000F29CD621627656C02F01F4BB0EDA2B40'),
(41,	41,	'Viva Bike Ahuachapan',	'AHUACHAPAN',	'--',	'0101000020E610000037E37444447656C06D59AD7C4DD92B40'),
(42,	42,	'Train Hard Gym',	'AHUACHAPAN',	'--',	'0101000020E6100000F3B238492F7656C0234A65D2CED82B40'),
(43,	43,	'Sculpture Gym',	'AHUACHAPAN',	'--',	'0101000020E6100000750C7CA64B7656C00E36F18DFFD52B40'),
(44,	44,	'Ata''s Gym',	'AHUACHAPAN',	'7057-3543',	'0101000020E610000037F0934D007356C0573EF09753B92B40'),
(45,	45,	'Life Gym',	'AHUACHAPAN',	'7245-8572',	'0101000020E61000006B164C61CB6C56C0E121836719F32B40'),
(46,	46,	'Ufc Gym United for Christ',	'AHUACHAPAN',	'--',	'0101000020E61000007952248DB07056C0385130E163F22B40'),
(47,	47,	'Roca Gym',	'AHUACHAPAN',	'--',	'0101000020E6100000CF28639E6E7056C0E6F1FB7250F32B40'),
(48,	48,	'JyJ FITNESS GYM',	'AHUACHAPAN',	'--',	'0101000020E6100000EE602DAC317056C0A95F361CCBF22B40'),
(49,	49,	'Home Gym',	'SONSONATE',	'--',	'0101000020E6100000BCD0E7CD267556C0AF04FC25D92D2B40'),
(50,	50,	'Ironman Gym',	'SONSONATE',	'--',	'0101000020E6100000290567E3877456C030298ABD14312B40'),
(51,	51,	'Domo Deportivo Sonsonateco',	'SONSONATE',	'--',	'0101000020E61000008AC7B4911B6F56C06D5E36F14E602B40'),
(52,	52,	'JV Fitness Center',	'SONSONATE',	'--',	'0101000020E6100000D4A2A1EF026E56C0E3C8E5DE2F6B2B40'),
(53,	53,	'Gimnasio Brizuela',	'SONSONATE',	'--',	'0101000020E6100000219B7E97256F56C001189665E4702B40'),
(54,	54,	'Sport City',	'SONSONATE',	'--',	'0101000020E61000002EE315EF1F6E56C041E654D359712B40'),
(55,	55,	'Yolis Gym',	'SONSONATE',	'--',	'0101000020E6100000A7AB9B22756E56C0DD16243476712B40'),
(56,	56,	'Gimnasio Municipal De Sonsonate',	'SONSONATE',	'--',	'0101000020E61000008C358E5B5A6E56C036F0913515752B40'),
(57,	57,	'GET FIT GYM',	'SONSONATE',	'--',	'0101000020E61000001B2CD705EC6D56C00418739A6F732B40'),
(58,	58,	'train hard gym',	'SONSONATE',	'--',	'0101000020E61000005DF42E0BC26D56C05D09481C7A742B40'),
(59,	59,	'Gimnasio Municipal De Sonzacate',	'SONSONATE',	'--',	'0101000020E6100000ADCB0196AF6D56C074B7C69378792B40'),
(60,	60,	'INJUVE (Circulo Estudiantil de Sonsonate)',	'SONSONATE',	'--',	'0101000020E610000083D5DCE4C56E56C059333EB899762B40'),
(61,	61,	'Hollywood Gym',	'SONSONATE',	'--',	'0101000020E610000067B67675A66A56C06179F74AD2802B40'),
(62,	62,	'Train Hard Gym Juayua',	'SONSONATE',	'--',	'0101000020E6100000DBE751F08A6F56C0C1E0071B69AF2B40'),
(63,	63,	'Palometos GYM',	'LA LIBERTAD',	'--',	'0101000020E6100000AE347FBE695256C06D1875F974FD2A40'),
(64,	64,	'LEONIDAS GYM',	'LA LIBERTAD',	'--',	'0101000020E610000078192B1E725C56C0F502A717E9AF2B40'),
(65,	65,	'Personal Gym',	'LA LIBERTAD',	'--',	'0101000020E61000000D63285B115A56C0F812F93B7EB32B40'),
(66,	66,	'Gimnasio Sitio Del Niño',	'LA LIBERTAD',	'7854-9753',	'0101000020E610000099B1BD3F595656C0A1246BDBB0952B40'),
(67,	67,	'Olympus Gym',	'LA LIBERTAD',	'--',	'0101000020E61000009628E59F305256C0A1E8CA2E965C2B40'),
(68,	68,	'Body Impact Merliot',	'LA LIBERTAD',	'2266-2888',	'0101000020E6100000899D00F05C5156C01ADE3E60205B2B40'),
(69,	69,	'HIIT EL SALVADOR',	'LA LIBERTAD',	'2229-4085',	'0101000020E6100000C36EB13E275056C09CDF45EFED5C2B40'),
(70,	70,	'Be Fit  La Gran Via',	'LA LIBERTAD',	'2278-5858',	'0101000020E61000000A56FCED2F5056C0E9414BA44D5B2B40'),
(71,	71,	'Fit Life GyM',	'LA LIBERTAD',	'2249-0044',	'0101000020E61000003A927584C55156C048AB335789512B40'),
(72,	72,	'World Gym El Salvador',	'LA LIBERTAD',	'2243-4142',	'0101000020E6100000FB873723185156C00240E9AB53542B40'),
(73,	73,	'Body Impact',	'LA LIBERTAD',	'2564-2694',	'0101000020E61000000D263DAA095056C0D7C05B86DA552B40'),
(74,	74,	'Gimnasio "Silver Gym"',	'SAN MIGUEL',	'2646-1185',	'0101000020E610000084891668880A56C08BDED645ECEA2A40'),
(75,	75,	'Planet Fitness Gym',	'SAN MIGUEL',	'2697-0290',	'0101000020E61000005326C5E4020B56C082BDC39DD7EE2A40'),
(76,	76,	'Gimnasio Gladiador',	'SAN MIGUEL',	'--',	'0101000020E6100000D676F7F9040B56C0645234ED21F32A40'),
(77,	77,	'Nautiluss Gym San Miguel',	'SAN MIGUEL',	'2639-0803',	'0101000020E6100000C546DEC5B90B56C0C2594575BDF22A40'),
(78,	78,	'Muros gym',	'SAN MIGUEL',	'--',	'0101000020E61000009408A654580B56C0E7E56D07D4F32A40'),
(79,	79,	'Gimnasio Santa Sofia',	'SAN MIGUEL',	'--',	'0101000020E61000002B0ED1DA760B56C094F0033BC1F52A40'),
(80,	80,	'Gimnasio Femenino Paola',	'SAN MIGUEL',	'--',	'0101000020E61000003E4B12BA970B56C0B2D26ACBD7F62A40'),
(81,	81,	'LIONS GYM',	'SAN MIGUEL',	'7570-3547',	'0101000020E6100000466C4BB5A40A56C010A5474FA9F92A40'),
(82,	82,	'Adlery Gym',	'SAN MIGUEL',	'--',	'0101000020E61000006CE6CD73E60A56C0EC7EAD81FBF92A40'),
(83,	83,	'Iron Gym',	'SAN MIGUEL',	'--',	'0101000020E6100000E280FEC7250C56C0EC5A6524C0F92A40'),
(84,	84,	'Blij''s Gym',	'SAN MIGUEL',	'7581-5786',	'0101000020E6100000014431F40C0B56C09933AD331BFE2A40'),
(85,	85,	'Coliseo Gym',	'CABAÑAS',	'+503 2315 2987',	'0101000020E6100000E92395CE2C2856C0FC9EA234E5C02B40'),
(86,	86,	'The Brother''s Gym',	'CABAÑAS',	'-',	'0101000020E61000004F84C3C1942856C0BAADE3AE14C02B40'),
(87,	87,	'Alfaro Gym',	'CABAÑAS',	'-',	'0101000020E6100000A7DE6465452856C0F517D57D5BBF2B40'),
(88,	88,	'Complejo Polideportivo de Sensuntepeque',	'CABAÑAS',	'-',	'0101000020E6100000E55BC41CA92756C0DB8D999F76BF2B40'),
(89,	89,	'Estadio Polideportivo',	'CABAÑAS',	'-',	'0101000020E610000024E8D43A962756C02BD9B11188BF2B40'),
(90,	90,	'Body Power Ilobasco',	'CABAÑAS',	'-',	'0101000020E6100000212BAEE06D3656C00C9C22765CAF2B40'),
(91,	91,	'Gimnasio Nueva Figura',	'CABAÑAS',	'-',	'0101000020E61000006FB724076C3656C0FF266FDB52AE2B40'),
(92,	92,	'Fitclub',	'CABAÑAS',	'-',	'0101000020E6100000FC5580EF363656C058C6866EF6AF2B40'),
(93,	93,	'GIMNASIO CHAMPION',	'CABAÑAS',	'-',	'0101000020E6100000BB4CA83BAA3B56C0F426D0717F6F2B40'),
(94,	94,	'Zona Gym Cojutepeque',	'CABAÑAS',	'-',	'0101000020E61000004CC1BFADE03C56C01101E20918742B40'),
(95,	95,	'ZONE FITNESS GYM',	'SAN SALVADOR',	'+503 2279 1119',	'0101000020E6100000E28B9BBFAE4E56C08AB6195D94632B40'),
(96,	96,	'Coach Gym',	'SAN SALVADOR',	'+503 7867 4261',	'0101000020E6100000E92400A4DB4D56C03D6D437BAB702B40'),
(97,	97,	'Nautiluss Gym Escalón',	'SAN SALVADOR',	'+503 2262 2077',	'0101000020E61000004C3448C1D34E56C01530CBE8916C2B40'),
(98,	98,	'City Gym',	'SAN SALVADOR',	'-',	'0101000020E61000009242B4B1ED4B56C0C9A18F430E6F2B40'),
(99,	99,	'CrossAdvanced Gym',	'SAN SALVADOR',	'-',	'0101000020E610000065671BC9AF4E56C09B0C7D66FF5E2B40'),
(100,	100,	'Nautilus Gym Terrazas.',	'SAN SALVADOR',	'+503 7925 6948',	'0101000020E6100000BD344580D34B56C0D0B9DBF5D26C2B40'),
(101,	101,	'Gimnasio Magaña',	'SAN SALVADOR',	'-',	'0101000020E6100000E2314D228C4C56C053D4F434BB6D2B40'),
(102,	102,	'Body Impact San Benito',	'SAN SALVADOR',	'+503 2252 6046',	'0101000020E6100000B97B6FC2734F56C0C7606AF063652B40'),
(103,	103,	'Gimnasio V-five',	'SAN SALVADOR',	'-',	'0101000020E6100000CC1E0D4C134956C0216CC207C06D2B40'),
(104,	104,	'Optimus Gym',	'SAN SALVADOR',	'-',	'0101000020E610000067A08DB7F04856C0EEEA5564746C2B40'),
(105,	105,	'La base gym',	'SAN SALVADOR',	'-',	'0101000020E61000002F9B4A500D4956C0962AACAF096C2B40'),
(106,	106,	'Be Fit Plaza Mundo',	'SAN SALVADOR',	'+503 2277 4218',	'0101000020E610000007B06DF6AC4956C04B5F63F261652B40'),
(107,	107,	'Gimnasio Troyano',	'SAN SALVADOR',	'+503 7020 3040',	'0101000020E6100000AE56DC6EB84C56C08679EAECBF752B40'),
(108,	108,	'Coach Gym Soyapango',	'SAN SALVADOR',	'+503 7867 4261',	'0101000020E61000008D0C7217E14956C0C8A06EFB79662B40'),
(109,	109,	'Gimnasio Figura Belleza Femenino',	'SAN SALVADOR',	'+503 2205 8471',	'0101000020E61000000C4BF212D24956C04F99F628B7682B40'),
(110,	110,	'Master GYM',	'SAN SALVADOR',	'-',	'0101000020E6100000F7E2303D064956C064C0A3D7B0702B40'),
(111,	111,	'Gimnasio Real Fighter',	'SAN SALVADOR',	'-',	'0101000020E6100000EF1010DD7D4956C0C8F37409E2672B40'),
(112,	112,	'GYM LAS MARGARITAS',	'SAN SALVADOR',	'-',	'0101000020E61000009232F32E284956C0032BE2CF4B742B40'),
(113,	113,	'La Roca Gym Mejicanos',	'SAN SALVADOR',	'-',	'0101000020E610000098F738D3044C56C0822F963325732B40'),
(114,	114,	'Coach Gym',	'SAN SALVADOR',	'-',	'0101000020E6100000F2ADB4319B4D56C0C20B6CDFED772B40'),
(115,	115,	'Charly Gym',	'SAN SALVADOR',	'-',	'0101000020E61000009E08E23C1C4C56C0D936D60FFB822B40'),
(116,	116,	'Complejo deportivo Santa Lucía',	'SAN SALVADOR',	'-',	'0101000020E61000008C101E6D9C4B56C009EEF60FD8732B40'),
(117,	117,	'Gimnasio Municipal de Ciudad Delgado',	'SAN SALVADOR',	'-',	'0101000020E6100000A0BA5E3FE94A56C0624D6551D8712B40'),
(118,	118,	'Cancha Polideportiva El Mapa',	'SAN SALVADOR',	'-',	'0101000020E6100000EAA16C80884A56C0BD84549B49712B40'),
(119,	119,	'Nautiluss Gym',	'SAN SALVADOR',	'-',	'0101000020E6100000845671F4424956C0DEB53AEFB56E2B40'),
(120,	120,	'POWER GYM',	'SAN SALVADOR',	'-',	'0101000020E6100000F8A8BF5EE14A56C07728AF3A176F2B40'),
(121,	121,	'GYM MILLENIUM',	'SAN SALVADOR',	'+503 7868 7151',	'0101000020E610000004F3469C844B56C00D9DE8047E9A2B40'),
(122,	122,	'AeroDance(GYM), Esta sobre la panaderia San Judas',	'SAN SALVADOR',	'+503 7180 5101',	'0101000020E61000002DD967846D4B56C04D49D6E1E89A2B40'),
(123,	123,	'Coach Gym',	'SAN SALVADOR',	'-',	'0101000020E6100000AF1B00BB644B56C0CC988235CE9A2B40'),
(124,	124,	'VIDA FIT APOPA',	'SAN SALVADOR',	'-',	'0101000020E61000002DF98ED0854B56C0F1965066289B2B40'),
(125,	125,	'AeroFit',	'SAN SALVADOR',	'-',	'0101000020E6100000C4C1EFF0684B56C07675221C0E9A2B40'),
(126,	126,	'ADVASOL',	'SAN SALVADOR',	'+503 7585 4973',	'0101000020E6100000A07FCC18304C56C00007488F3AA52B40'),
(127,	127,	'Anthony''s Ladies Gym',	'SAN SALVADOR',	'+503 6158 3038',	'0101000020E61000009D0C33D9644B56C0B5920CEF28982B40'),
(128,	128,	'THE LIVE GYM',	'SAN SALVADOR',	'-',	'0101000020E6100000B68E60996D4B56C0A5C7A5E0DF9A2B40'),
(129,	129,	'Polideportivo Apopa',	'SAN SALVADOR',	'-',	'0101000020E6100000246420CFAE4B56C098248568639B2B40'),
(130,	130,	'FIT BODY GYM',	'SAN SALVADOR',	'-',	'0101000020E610000042CD902A0A4C56C029159EE117582B40'),
(131,	131,	'IRON MUSCLES GYM',	'SAN SALVADOR',	'-',	'0101000020E6100000BF7A81FEE74B56C09ADD49FA6A552B40'),
(132,	132,	'Gimnasio Municipal "Enrique Samour"',	'SAN SALVADOR',	'-',	'0101000020E610000069AA27F30F4C56C0D4C3865DCA532B40'),
(133,	133,	'Polideportivo Jardines de San Marcos',	'SAN SALVADOR',	'-',	'0101000020E61000008B040940124C56C01A7739DB92532B40'),
(134,	134,	'Coach gym',	'SAN SALVADOR',	'+503 2563 2415',	'0101000020E61000003AFF1B203D4C56C00D8EED105A5E2B40'),
(135,	135,	'American Gym',	'SAN SALVADOR',	'+503 7899 6112',	'0101000020E610000040F67AF7C74B56C04D8578245E4E2B40'),
(136,	136,	'WAKE UP Fitness El Salvador',	'SAN SALVADOR',	'+503 2207 4269',	'0101000020E61000006BC9F495D14956C0B57867A3294D2B40'),
(137,	137,	'Gold gym',	'SAN SALVADOR',	'-',	'0101000020E6100000F53F0AE84F4C56C079628CFE86572B40'),
(138,	138,	'Coach Gym San Miguelito',	'SAN SALVADOR',	'-',	'0101000020E610000068F228F0294C56C0A2FABD03F26B2B40'),
(139,	139,	'Gym las gorilas',	'SAN SALVADOR',	'-',	'0101000020E6100000178964236B4656C025581CCEFC6E2B40'),
(140,	140,	'CovidGym',	'SAN SALVADOR',	'-',	'0101000020E6100000DAF85D22A84656C0CEF9CED490652B40'),
(141,	141,	'Star Gym',	'SAN SALVADOR',	'-',	'0101000020E6100000A80991C2AB4656C0CC33E5F9C26A2B40'),
(142,	142,	'Gimnasio Esparta',	'SAN SALVADOR',	'-',	'0101000020E6100000C082EAD5B64856C0B583B641925E2B40'),
(143,	143,	'Gimnasio Escorpion',	'SAN SALVADOR',	'-',	'0101000020E6100000B3C986DA5B4656C00C248337FF6E2B40'),
(144,	144,	'E&E gym',	'SAN SALVADOR',	'-',	'0101000020E6100000E1EEACDDF64756C0889FFF1EBC5E2B40'),
(145,	145,	'No Limits Fitness Gym',	'SAN SALVADOR',	'-',	'0101000020E61000007FE25BB3704756C02FAEA70CD28E2B40'),
(146,	146,	'La Bawer',	'SAN SALVADOR',	'-',	'0101000020E6100000D51F065F3D4856C04FDC3BB4D9922B40'),
(147,	147,	'Gorilas Gym',	'SAN SALVADOR',	'-',	'0101000020E61000000C193499164956C0F27C06D49B6D2B40'),
(148,	148,	'Nautilus GYM Mall San Gabriel',	'SAN SALVADOR',	'+503 2351 0583',	'0101000020E6100000E947C329734E56C0E2AE5E4546972B40'),
(149,	149,	'MOUNTAIN GYM FITNESS',	'SAN SALVADOR',	'+503 7253 6633',	'0101000020E6100000D0FFBCBAF44B56C0D1274DDE5B482B40'),
(150,	150,	'Nautilus Gym La Cima',	'SAN SALVADOR',	'-',	'0101000020E61000003BC5AA41184E56C033B8F7BA56582B40'),
(151,	151,	'New Kratos Gym',	'LA PAZ',	'+503 2369 0850',	'0101000020E6100000D419CEEB3E3C56C01D0B653CA5062B40'),
(152,	152,	'Gimnasio Axel',	'LA PAZ',	'-',	'0101000020E61000009DBCC804FC3756C04E452A8C2D042B40'),
(153,	153,	'Galaxy Gym',	'LA PAZ',	'+503 7347 3942',	'0101000020E610000006FC7502753956C0F992D79475012B40'),
(154,	154,	'Polideportivo Santa Maria Ostuma',	'LA PAZ',	'-',	'0101000020E610000097DCCDF8E33A56C0949E8E6C533D2B40'),
(155,	155,	'Kratos GYM',	'LA PAZ',	'-',	'0101000020E6100000A0DDC60B0E3C56C0497E69F6E5052B40'),
(156,	156,	'Monster Gym',	'LA PAZ',	'+503 7641 2179',	'0101000020E610000028CB5A54D53756C06A09432E82042B40'),
(157,	157,	'SPARTAN GYM',	'LA PAZ',	'-',	'0101000020E61000006749DB53CD4456C05F7935E5AFFD2A40'),
(158,	158,	'Silver Gym Usulután',	'USULUTÁN',	'-',	'0101000020E6100000A0DE8C9A2F1C56C0296A7A9ADDB02A40'),
(159,	159,	'Shulton Park',	'USULUTÁN',	'-',	'0101000020E6100000FF78AF5A991B56C00D1B65FD66B22A40'),
(160,	160,	'INDES',	'USULUTÁN',	'-',	'0101000020E6100000ABEAE5779A1B56C0B68883DFE1B12A40'),
(161,	161,	'Fitness Girls Gym',	'USULUTÁN',	'+503 2618 2401',	'0101000020E6100000E8757A94001C56C08ED36B0E6BB12A40'),
(162,	162,	'Maximus Gym',	'USULUTÁN',	'-',	'0101000020E6100000779E78CE161C56C0BCFEC98404B12A40'),
(163,	163,	'Alfa Gym',	'USULUTÁN',	'-',	'0101000020E61000008C97B89F1D1C56C00105CD9D4FAF2A40'),
(164,	164,	'Fitness Girls Gym',	'USULUTÁN',	'+503 7964 2244',	'0101000020E6100000A635BC0F761B56C032E94A5F63B22A40'),
(165,	165,	'Hulk Gym',	'USULUTÁN',	'-',	'0101000020E61000008C7D6E0D912456C094BDA59C2FA62A40'),
(166,	166,	'La Disco Gym',	'USULUTÁN',	'-',	'0101000020E610000002CB5BBFAA1A56C0E2F5AADF96B12A40'),
(167,	167,	'ALFA GYM (fitness & aerobic)',	'USULUTÁN',	'-',	'0101000020E6100000CBBF96572E1C56C09F573CF548AF2A40'),
(168,	168,	'Apolo GYM',	'USULUTÁN',	'-',	'0101000020E6100000CFEFA07EBC1D56C053A1702CDEF62A40'),
(169,	169,	'Body Gym',	'USULUTÁN',	'-',	'0101000020E6100000F63C2421B61856C0CAE7CBC122092B40'),
(170,	170,	'Gimnasio Colato',	'USULUTÁN',	'-',	'0101000020E6100000F6076FB4881856C0B2A5A20CB0062B40'),
(171,	171,	'Silver Gym',	'USULUTÁN',	'-',	'0101000020E61000009200DAFB791856C0FDB671D586082B40'),
(172,	172,	'PLATINUM GYM',	'USULUTÁN',	'+503 7959 4611',	'0101000020E61000001F14EF5B881856C020BEA7CD93062B40'),
(173,	173,	'ELIZ GYM',	'USULUTÁN',	'-',	'0101000020E6100000B79BE09BA61B56C034CF5B86491E2B40'),
(174,	174,	'Gimnasio SuperFitness IVU',	'SANTA ANA',	'2414-7289',	'0101000020E610000011CFBFC5966356C036339000FDFF2B40'),
(175,	175,	'Gimnasio “Los pinos”',	'SANTA ANA',	'--',	'0101000020E6100000447620D12E6356C0C8B058575AFF2B40'),
(176,	176,	'Super Fitness Gym',	'SANTA ANA',	'7700-7700',	'0101000020E610000087768159AD6356C064ABCEAD81FE2B40'),
(177,	177,	'Iron Body Gym',	'SANTA ANA',	'--',	'0101000020E61000006CCA8269536356C074629C75B7FD2B40'),
(178,	178,	'Gimnasio Golden',	'SANTA ANA',	'7559-7044',	'0101000020E6100000B6B160C8786356C01CB0CB2E1CFD2B40'),
(179,	179,	'Crosstraining Gym',	'SANTA ANA',	'7722-2246',	'0101000020E6100000DA059A9A2F6456C0E6391F2AD5FC2B40'),
(180,	180,	'Gimnasio David Vega',	'SANTA ANA',	'--',	'0101000020E6100000B03CA4E7E16256C0625FCBAEF7FB2B40'),
(181,	181,	'VIP FITNESS',	'SANTA ANA',	'2441-3727',	'0101000020E6100000EF6D0DDB8B6356C02FBCF8C954FA2B40'),
(182,	182,	'Dynamic Strength Gym',	'SANTA ANA',	'--',	'0101000020E6100000119EF858726356C080C4CA2A0DFA2B40'),
(183,	183,	'Body Flex Gym',	'SANTA ANA',	'--',	'0101000020E610000070502C9AC86356C05D9114F183F92B40'),
(184,	184,	'Gimnasio de Santa Ana',	'SANTA ANA',	'--',	'0101000020E6100000FB731CDF306356C0B3ED18DECFF52B40'),
(185,	185,	'Life Fitness Gym',	'SANTA ANA',	'--',	'0101000020E610000016BE9D85AA6356C062C62C35C4F52B40'),
(186,	186,	'Gym Romano',	'SANTA ANA',	'--',	'0101000020E610000086309BAB216456C0749F7385D8F72B40'),
(187,	187,	'Gimnasio Palace',	'SANTA ANA',	'2124-0562',	'0101000020E61000009138B230406456C0D02E5B056DF62B40'),
(188,	188,	'Gimnasio Fit Girls',	'SANTA ANA',	'--',	'0101000020E61000007242BE71F96356C0A045F3361DF52B40'),
(189,	189,	'Body Evolution Gym',	'SANTA ANA',	'7819-6865',	'0101000020E61000005348BEEDF56356C0355C98C117F52B40'),
(190,	190,	'Be Fit Metrocentro Santa Ana',	'SANTA ANA',	'2278-5858',	'0101000020E610000099D88BB2026456C0F85922E4A2F42B40'),
(191,	191,	'Smart Fit Metrocentro Santa Ana',	'SANTA ANA',	'--',	'0101000020E610000054E78BE8F96356C05EF099A340F42B40'),
(192,	192,	'Crossfit El Yunque Santa Ana',	'SANTA ANA',	'--',	'0101000020E6100000A5C6193D196456C0805EE138E4F02B40'),
(193,	193,	'Los Altos Olympus Gym',	'SANTA ANA',	'--',	'0101000020E61000007DBE1817B76456C0DE9FA374BDEF2B40'),
(194,	194,	'Total Gym',	'SANTA ANA',	'--',	'0101000020E61000000C62195B556456C06D2A2377EDED2B40'),
(195,	195,	'Cristhian Coach Gym',	'CUSCATLÁN',	'--',	'0101000020E610000075618745CB4156C0D9C5662E2EDF2B40'),
(196,	196,	'Optimus Gym – Suchitoto',	'CUSCATLÁN',	'7668-2458',	'0101000020E6100000A61E87F4C34156C0B35FEE4E56DE2B40'),
(197,	197,	'Iron Gym',	'CUSCATLÁN',	'--',	'0101000020E6100000197C5C34214656C05B2A77556AAD2B40'),
(198,	198,	'Campo de Fútbol Junior & atlético Juniors',	'CUSCATLÁN',	'--',	'0101000020E61000002DE6BB39C84256C0093316789F982B40'),
(199,	199,	'Zona Gym Cojutepeque',	'CUSCATLÁN',	'--',	'0101000020E610000064194372E03C56C0A9288F1A1E742B40'),
(200,	200,	'Studio Fitness',	'CUSCATLÁN',	'--',	'0101000020E6100000C7B47999EE3B56C033570AFEBD712B40'),
(201,	201,	'Gimnasio Feetness',	'CUSCATLÁN',	'--',	'0101000020E61000008D8BF842BA3B56C06C9912AAB8722B40'),
(202,	202,	'Gimnasio Champion',	'CUSCATLÁN',	'--',	'0101000020E6100000D59C4270AA3B56C0F618D6C66E6F2B40'),
(203,	203,	'C.D. Boillat',	'MORAZÁN',	'--',	'0101000020E61000002E567A143D0E56C03619177CCDA92B40'),
(204,	204,	'Bejucal Sociedad Morazán',	'MORAZÁN',	'7636-6245',	'0101000020E610000062E9D79EBCFD55C018CAF37ABB502B40'),
(205,	205,	'Centro Pastoral de Sociedad',	'MORAZÁN',	'--',	'0101000020E610000096CC6007760056C0A791773866662B40'),
(206,	206,	'Caseros plan de la cruz',	'MORAZÁN',	'--',	'0101000020E6100000C2E860ECDA0356C010F18B19367C2B40'),
(207,	207,	'Gym Sport Center',	'MORAZÁN',	'--',	'0101000020E6100000C2B0A3A4B40656C0370DD1EAB8682B40'),
(208,	208,	'Hard Body Gym',	'MORAZÁN',	'--',	'0101000020E6100000F617931A850656C0EC97FA3B82642B40'),
(209,	209,	'Cancha C.D. “Brisa Juvenil”',	'MORAZÁN',	'7864-7669',	'0101000020E6100000455A8B58EE0856C04320441838582B40');

-- 2021-05-13 22:25:42.931559+00

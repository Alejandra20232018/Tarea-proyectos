CREATE TABLE agente_aduanero(
id_agente INT PRIMARY KEY,
Nombre VARCHAR(15) UNIQUE
);
CREATE TABLE poliza_aduanera(
id_poliza INT PRIMARY KEY,
peso_declaracion VARCHAR(20),
selectivo VARCHAR(20),
fecha_aceptacion DATE,
identificacion VARCHAR(200),
id_agente INT,
CONSTRAINT fk_agente_aduanero
FOREIGN KEY (id_agente)
REFERENCES agente_aduanero(id_agente)
);
CREATE TABLE fraccion_arancelaria(
id_fraccion_arancelaria INT PRIMARY KEY,
descripcion_fraccion VARCHAR(50) UNIQUE,
cantidad VARCHAR (50) UNIQUE,
unidad_de_medida VARCHAR (50) UNIQUE,
tasa_DAI VARCHAR (50) UNIQUE,
valor_CIF VARCHAR(50) UNIQUE
);
CREATE TABLE pais_destino(
id_pais INT PRIMARY KEY,
nombre_pais VARCHAR(200) UNIQUE
);
CREATE TABLE consignarario(
id_NIT INT PRIMARY KEY,
nombre_consignatario VARCHAR(200) UNIQUE
);
CREATE TABLE regimen_aduanero(
id_regimen INT PRIMARY KEY,
nombre_regimen VARCHAR(200) UNIQUE
);
CREATE TABLE aduana(
id_aduana INT PRIMARY KEY,
nombre_aduana VARCHAR(200) UNIQUE
);
CREATE TABLE fact_table(
id_NIT INT PRIMARY KEY,
id_aduana INT,
id_regimen INT,
id_pais INT,
id_fraccion_arancelaria INT,
id_poliza INT,
CONSTRAINT fk_poliza_aduanera_fact_table
FOREIGN KEY (id_poliza)
REFERENCES poliza_arancelaria(id_poliza),
CONSTRAINT fk_aduana_fact_table
FOREIGN KEY (id_aduana)
REFERENCES aduana(id_aduana),
CONSTRAINT fk_fraccion_arancelaria_fact_table
FOREIGN KEY (id_fraccion_arancelaria)
REFERENCES fraccion_arancelaria (id_fraccion_arancelaria),
CONSTRAINT fk_pais_destino_fact_table
FOREIGN KEY (id_pais)
REFERENCES pais_destino(id_pais),
CONSTRAINT fk_consignatario_fact_table
FOREIGN KEY (id_NIT)
REFERENCES consignatario(id_NIT),
CONSTRAINT fk_regimen_aduanero_fact_table
FOREIGN KEY (id_regimen)
REFERENCES regimen_aduanero(id_regimen)
);
SELECT * FROM fact_table;

CREATE TABLE "Usuario" (
  "id_usuario" int GENERATED AS IDENTITY PRIMARY KEY,
  "nombre" varchar(100) NOT NULL,
  "email" varchar(100) UNIQUE NOT NULL,
  "telefono" varchar(20),
  "fecha_registro" date DEFAULT CURRENT_DATE
);

CREATE TABLE "Equipo" (
  "id_equipo" int GENERATED AS IDENTITY PRIMARY KEY,
  "nombre" varchar(100) UNIQUE NOT NULL,
  "id_capitan" int NOT NULL,
  "fecha_creacion" date DEFAULT CURRENT_DATE
);

CREATE TABLE "JugadorEquipo" (
  "id_equipo" int,
  "id_usuario" int,
  "fecha_ingreso" date DEFAULT CURRENT_DATE,
  PRIMARY KEY ("id_equipo", "id_usuario")
);

CREATE TABLE "Cancha" (
  "id_cancha" int GENERATED AS IDENTITY PRIMARY KEY,
  "nombre" varchar(100) NOT NULL,
  "direccion" varchar(200),
  "capacidad" int,
  "disponible" boolean DEFAULT true
);

CREATE TABLE "Partido" (
  "id_partido" int GENERATED AS IDENTITY PRIMARY KEY,
  "id_equipo_creador" int NOT NULL,
  "id_capitan_creador" int NOT NULL,
  "id_cancha" int NOT NULL,
  "fecha_partido" datetime NOT NULL,
  "estado" varchar(20) DEFAULT 'pendiente'
);

CREATE TABLE "ParticipacionPartido" (
  "id_partido" int,
  "id_equipo" int,
  "es_creador" boolean DEFAULT false,
  PRIMARY KEY ("id_partido", "id_equipo")
);

CREATE TABLE "Invitacion" (
  "id_invitacion" int GENERATED AS IDENTITY PRIMARY KEY,
  "id_capitan" int NOT NULL,
  "id_usuario" int NOT NULL,
  "id_equipo" int NOT NULL,
  "estado" varchar(20) DEFAULT 'pendiente',
  "fecha" datetime DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "Equipo" ADD FOREIGN KEY ("id_capitan") REFERENCES "Usuario" ("id_usuario");

ALTER TABLE "JugadorEquipo" ADD FOREIGN KEY ("id_equipo") REFERENCES "Equipo" ("id_equipo");

ALTER TABLE "JugadorEquipo" ADD FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id_usuario");

ALTER TABLE "Partido" ADD FOREIGN KEY ("id_equipo_creador") REFERENCES "Equipo" ("id_equipo");

ALTER TABLE "Partido" ADD FOREIGN KEY ("id_capitan_creador") REFERENCES "Usuario" ("id_usuario");

ALTER TABLE "Partido" ADD FOREIGN KEY ("id_cancha") REFERENCES "Cancha" ("id_cancha");

ALTER TABLE "ParticipacionPartido" ADD FOREIGN KEY ("id_partido") REFERENCES "Partido" ("id_partido");

ALTER TABLE "ParticipacionPartido" ADD FOREIGN KEY ("id_equipo") REFERENCES "Equipo" ("id_equipo");

ALTER TABLE "Invitacion" ADD FOREIGN KEY ("id_capitan") REFERENCES "Usuario" ("id_usuario");

ALTER TABLE "Invitacion" ADD FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id_usuario");

ALTER TABLE "Invitacion" ADD FOREIGN KEY ("id_equipo") REFERENCES "Equipo" ("id_equipo");

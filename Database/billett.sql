drop table kunde,sted,billett,bestilling cascade;


CREATE TABLE "kunde" (
  "brukernavn" text PRIMARY KEY,
  "fornavn" text NOT NULL,
  "etternavn" text NOT NULL,
  "adresse" text,
  "epost" text,
  "tlf" text,
  "kjonn" text
);

CREATE TABLE "sted" (
  "stedid" SERIAL PRIMARY KEY,
  "navn" text NOT NULL,
  "adresse" text
);

CREATE TABLE "billett" (
  "kplass" text PRIMARY KEY,
  "stedid" int,
  "dato" date NOT NULL,
  "type" text,
  "antallbilletter" text
);

CREATE TABLE "bestilling" (
  "bestillingid" SERIAL PRIMARY KEY,
  "kplass" text not null,
  "brukernavn" text not null,
  "bdato" date
);

ALTER TABLE "billett" ADD FOREIGN KEY ("stedid") REFERENCES "sted" ("stedid");

ALTER TABLE "bestilling" ADD FOREIGN KEY ("kplass") REFERENCES "billett" ("kplass");

ALTER TABLE "bestilling" ADD FOREIGN KEY ("brukernavn") REFERENCES "kunde" ("brukernavn");
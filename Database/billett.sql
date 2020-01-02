CREATE TABLE "kunde" (
  "kundeid" SERIAL PRIMARY KEY,
  "fornavn" text NOT NULL,
  "etternavn" text NOT NULL,
  "adresse" text,
  "epost" text,
  "tlf" text,
  "kjønn" text
);

CREATE TABLE "sted" (
  "stedid" SERIAL PRIMARY KEY,
  "navn" text NOT NULL,
  "adresse" text
);

CREATE TABLE "billett" (
  "billettid" SERIAL PRIMARY KEY,
  "stedid" int,
  "dato" date NOT NULL,
  "type" text default 'basic' check (
    innlevert = 'basic'
    or innlevert = 'VIP'
    ),
  "antallbilletter" text
);

CREATE TABLE "eksemplar" (
  "eksemplarid" SERIAL PRIMARY KEY,
  "billettid" int
);

CREATE TABLE "bestilling" (
  "bestillingid" SERIAL PRIMARY KEY,
  "eksemplarid" int,
  "kundeid" int,
  "bdato" date
);

ALTER TABLE "billett" ADD FOREIGN KEY ("stedid") REFERENCES "sted" ("stedid");

ALTER TABLE "eksemplar" ADD FOREIGN KEY ("billettid") REFERENCES "billett" ("billettid");

ALTER TABLE "bestilling" ADD FOREIGN KEY ("kundeid") REFERENCES "kunde" ("kundeid");

ALTER TABLE "bestilling" ADD FOREIGN KEY ("eksemplarid") REFERENCES "eksemplar" ("eksemplarid");

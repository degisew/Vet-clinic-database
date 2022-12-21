/* CREATE DATABASE */
CREATE DATABASE clinic;
/* CREATE TABLES */
CREATE TABLE IF NOT EXISTS invoice_items
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    unit_price numeric,
    quantity integer,
    total_price numeric,
    invoice_id integer,
    treatment_id integer,
    CONSTRAINT invoice_items_pkey PRIMARY KEY (id),
    CONSTRAINT fk_invoice FOREIGN KEY (invoice_id)
    REFERENCES invoices (id),
    CONSTRAINT fk_treatments FOREIGN KEY (treatment_id)
    REFERENCES treatments (id)
);

CREATE TABLE IF NOT EXISTS invoices
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    total_amount numeric,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id integer,
    CONSTRAINT invoices_pkey PRIMARY KEY (id),
    CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id),
    UNIQUE(medical_history_id)
);

CREATE TABLE IF NOT EXISTS medical_histories
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp ,
    patient_id integer,
    status character varying(100),
    CONSTRAINT medical_histories_pkey PRIMARY KEY (id),
    CONSTRAINT fk_patients FOREIGN KEY (patient_id)
    REFERENCES patients (id)
);

/* JOIN-TABLE called medical_treatments to implement many-to-many relationship */

CREATE TABLE IF NOT EXISTS medical_treatments
(
    medical_id integer NOT NULL,
    treatment_id integer NOT NULL,
    CONSTRAINT medical_treatments_pkey PRIMARY KEY (medical_id, treatment_id),
    CONSTRAINT medical_treatments_medical_id_fkey FOREIGN KEY (medical_id)
    REFERENCES medical_histories (id),
    CONSTRAINT medical_treatments_treatment_id_fkey FOREIGN KEY (treatment_id)
    REFERENCES treatments (id)
);

CREATE TABLE IF NOT EXISTS patients
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying(200),
    date_of_birth date,
    CONSTRAINT patients_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS treatments
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    type character varying(50),
    name character varying(100),
    CONSTRAINT treatments_pkey PRIMARY KEY (id)
);



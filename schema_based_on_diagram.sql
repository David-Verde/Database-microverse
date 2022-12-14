CREATE TABLE patients(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(255),
    name VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE histories_treatment(
    id INT GENERATED ALWAYS AS IDENTITY,
    treatment_id INT,
    medical_history_id INT,
    PRIMARY KEY(medical_history_id, treatment_id)
);

ALTER TABLE
    invoice_items
ADD
    CONSTRAINT fk_invoice_items_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id);

ALTER TABLE
    invoices
ADD
    CONSTRAINT fk_invoices_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);

ALTER TABLE
    treatments
ADD
    CONSTRAINT fk_treatments_medical_histories FOREIGN KEY (id) REFERENCES medical_histories(id);

ALTER TABLE
    medical_histories
ADD
    CONSTRAINT fk_patients_medical_histories FOREIGN KEY (patient_id) REFERENCES patients(id);

ALTER TABLE
    invoice_items
ADD
    CONSTRAINT fk_invoices_invoice_items FOREIGN KEY (invoice_id) REFERENCES invoices(id);

ALTER TABLE
    histories_treatment
ADD
    CONSTRAINT fk_treatment_id FOREIGN KEY (treatment_id) REFERENCES treatments(id);

ALTER TABLE
    histories_treatment
ADD
    CONSTRAINT fk_medical_histories FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id);
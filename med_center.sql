DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    height INTEGER NOT NULL,
    weight INTEGER NOT NULL
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    visit_date DATE,
    doctor_id INTEGER REFERENCES doctors (id),
    patient_id INTEGER REFERENCES patients (id),
    diagnosis_id INTEGER REFERENCES diagnoses (id)
);


--These are just example values

INSERT INTO patients
    (name, age, height, weight)
VALUES
    ('David Martinez', 23, 70, 156),
    ('Mary Webber', 41, 64, 124),
    ('Nicholas Grant', 10, 50, 85);


INSERT INTO doctors
    (name, type)
VALUES
    ('Stephen Williams', 'cardiologist'),
    ('Amy Redding', 'pediatrician');


INSERT INTO diagnoses
    (name)
VALUES
    ('Heart Failure'),
    ('Cardiomyopathy'),
    ('Pericardial Disease'),
    ('Bone Fracture'),
    ('Minor Traumatic Brain Injury');


INSERT INTO visits
    (visit_date, doctor_id, patient_id, diagnosis_id)
VALUES
    ('10-21-2020',1,1,2),
    ('10-22-2020',1,1,3),
    ('4-3-2021',1,2,1),
    ('4-3-2021',1,2,2),
    ('7-16-2017',2,3,4),
    ('7-16-2017'2,3,5);




INSERT INTO patient
VALUES ('P101', 'Rahul', 52, 'Male', '9876543210', 'Vellore');

INSERT INTO doctor
VALUES ('D101', 'Dr. Kumar', 'General Medicine', '9876501234', 'kumar@hospital.com');

INSERT INTO symptoms (patient_id, symptom_name, severity, duration)
VALUES ('P101', 'Frequent thirst', 'High', '2 months');

INSERT INTO symptoms (patient_id, symptom_name, severity, duration)
VALUES ('P101', 'Frequent urination', 'High', '2 months');

INSERT INTO medical_history
(patient_id, condition, diagnosis_date, description)
VALUES ('P101', 'Family history of diabetes', DATE '2020-06-15', 'Mother has diabetes');

INSERT INTO laboratory_results
(patient_id, glucose, blood_pressure, bmi, cholesterol, heart_rate, test_date)
VALUES ('P101', 185, '150/95', 29.5, 220, 82, SYSDATE);

INSERT INTO diagnosis
(patient_id, doctor_id, disease, diagnosis_date, remarks)
VALUES ('P101', 'D101', 'Diabetes Risk', SYSDATE, 'High risk based on clinical indicators');

INSERT INTO treatment
(patient_id, doctor_id, treatment_name, treatment_date, description)
VALUES ('P101', 'D101', 'Lifestyle modification', SYSDATE, 'Diet control and regular exercise');

INSERT INTO medication
(medicine_name, category, standard_dosage)
VALUES ('Metformin', 'Antidiabetic', '500 mg');

INSERT INTO medication
(medicine_name, category, standard_dosage)
VALUES ('Aspirin', 'Antiplatelet', '75 mg');

INSERT INTO patient_medication
(patient_id, medication_id, dosage, start_date)
SELECT 'P101', medication_id, '500 mg', SYSDATE
FROM medication
WHERE medicine_name = 'Metformin';

INSERT INTO drug_interaction
(medication_id_1, medication_id_2, severity, description)
SELECT m1.medication_id, m2.medication_id, 'Moderate',
       'Example interaction record for demonstration'
FROM medication m1, medication m2
WHERE m1.medicine_name = 'Metformin'
AND m2.medicine_name = 'Aspirin';

INSERT INTO allergy
(patient_id, allergen, severity, description)
VALUES ('P101', 'Penicillin', 'High', 'Known allergy');

INSERT INTO prediction
(patient_id, disease, risk_score, risk_level, model_name)
VALUES ('P101', 'Diabetes', 87.50, 'High', 'Random Forest');

COMMIT;

-- View 1: Clinical Dashboard for Doctors (Combines Vitals & Predictions)
CREATE OR REPLACE VIEW v_patient_clinical_summary AS
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.age,
    l.glucose,
    l.blood_pressure,
    l.bmi,
    l.cholesterol,
    pr.disease AS predicted_disease,
    pr.risk_score,
    pr.risk_level
FROM patient p
LEFT JOIN laboratory_results l ON p.patient_id = l.patient_id
LEFT JOIN prediction pr ON p.patient_id = pr.patient_id;

-- View 2: ML Pipeline Feature Extraction View
CREATE OR REPLACE VIEW v_ml_feature_set AS
SELECT 
    p.patient_id,
    p.age,
    p.gender,
    l.glucose,
    l.bmi,
    l.cholesterol,
    l.heart_rate
FROM patient p
JOIN laboratory_results l ON p.patient_id = l.patient_id;
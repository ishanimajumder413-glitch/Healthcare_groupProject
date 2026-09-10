-- Procedure 1: Log Machine Learning Predictions into DB
CREATE OR REPLACE PROCEDURE sp_record_prediction (
    p_patient_id IN VARCHAR2,
    p_disease    IN VARCHAR2,
    p_score      IN NUMBER,
    p_level      IN VARCHAR2,
    p_model      IN VARCHAR2
) AS
BEGIN
    INSERT INTO prediction (patient_id, disease, risk_score, risk_level, model_name, prediction_date)
    VALUES (p_patient_id, p_disease, p_score, p_level, p_model, SYSDATE);
    COMMIT;
END;
/
-- Trigger 1: Automatic Drug-to-Drug Interaction Prevention
CREATE OR REPLACE TRIGGER trg_check_drug_interaction
BEFORE INSERT ON patient_medication
FOR EACH ROW
DECLARE
    v_conflict_count NUMBER := 0;
    v_conflicting_drug VARCHAR2(100);
BEGIN
    SELECT COUNT(*), MAX(m.medicine_name)
    INTO v_conflict_count, v_conflicting_drug
    FROM patient_medication pm
    JOIN drug_interaction di 
      ON (di.medication_id_1 = :NEW.medication_id AND di.medication_id_2 = pm.medication_id)
      OR (di.medication_id_2 = :NEW.medication_id AND di.medication_id_1 = pm.medication_id)
    JOIN medication m ON m.medication_id = pm.medication_id
    WHERE pm.patient_id = :NEW.patient_id;

    IF v_conflict_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'CLINICAL ALERT: Prescribed drug clashes with existing active medication: ' || v_conflicting_drug);
    END IF;
END;
/
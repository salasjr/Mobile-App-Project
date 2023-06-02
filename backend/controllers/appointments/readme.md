//! patient sends an appointment request to a doctor with case

//!doctor requests for appointment list of his own via his id

//! patient requests for appointment list of his own via his id

//! doctor accepts or rejects the appointment request with a message

/*
?????????????????????????
- appointment_id (INT, PRIMARY KEY, AUTO_INCREMENT): This column will serve as the unique identifier for each appointment.
- patient_id (INT, NOT NULL): This column will store the ID of the patient who set the appointment.
- doctor_id (INT, NOT NULL): This column will store the ID of the doctor who the appointment is with.
- case_description (VARCHAR(255), NOT NULL): This column will store the description of the patient's case for the appointment.
- status (ENUM('accepted', 'rejected', 'pending'), NOT NULL): This column will store the status of the appointment, which can be either accepted, rejected, or pending.
- message (VARCHAR(255)): This column will store the message that the doctor writes when accepting or rejecting the appointment.

- rating


*/

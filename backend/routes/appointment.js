const express = require("express");
const appointmentRouter = express.Router();
const {
  getAppointmentsByDoctor,
  getAppointmentsByPatient,
  updateAppointmentStatus,
  createAppointment,
  markAppointmentDoneUnDone,
  cancelAppointment,
  rateAppointment,
} = require("../controllers/appointments/Appointment_exporter");

appointmentRouter.post("/createappointment", createAppointment);

appointmentRouter.get("/patient/:patientId", getAppointmentsByPatient);

appointmentRouter.get(
  "/doctor/:doctorId",
  getAppointmentsByDoctor
);

appointmentRouter.put("/update/:appointmentId", updateAppointmentStatus);
appointmentRouter.put("/mark/:appointmentId", markAppointmentDoneUnDone);
appointmentRouter.put("/rate/:appointmentId", rateAppointment);

appointmentRouter.delete("/cancel/:appointmentId", cancelAppointment);

module.exports = appointmentRouter;

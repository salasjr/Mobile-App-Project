const { createAppointment } = require("./createAppointment");
const { getAppointmentsByDoctor } = require("./getAppointmentByDoctor");
const { getAppointmentsByPatient } = require("./getAppointmentByPatient");
const { updateAppointmentStatus } = require("./updateAppointment");
const { markAppointmentDoneUnDone } = require("./markAppointment");
const { cancelAppointment } = require("./deleteAppointment");
const { rateAppointment } = require("./rateAppointment");

module.exports = {
  createAppointment,
  getAppointmentsByDoctor,
  getAppointmentsByPatient,
  updateAppointmentStatus,
  markAppointmentDoneUnDone,
  cancelAppointment,
  rateAppointment,
};

const { updateProfile } = require("./updateProfile");
const { deleteAccount } = require("./deleteProfile");
const { changePassword } = require("./changePassword");
const {forgetPassword}= require('./forgetPassword')

module.exports = { updateProfile, deleteAccount, changePassword , forgetPassword};
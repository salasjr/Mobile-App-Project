const express = require("express");
const profileRouter = express.Router();
const {
  updateProfile,
  deleteAccount,
  changePassword,
} = require("../controllers/profile/profileExporter");

profileRouter.put("/update", updateProfile);

profileRouter.put("/update/changepassword:profileId", changePassword);

profileRouter.delete("/delete/:profileId", deleteAccount);

module.exports = profileRouter;

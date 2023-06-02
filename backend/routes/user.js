const express = require("express");
const userRouter = express.Router();
const {
  getUserData,
  getAllDoctors,
} = require("../controllers/user/userExporter");

// get user data
userRouter.get("/getUserData", getUserData);
userRouter.get("/getAllDoctors", getAllDoctors);

module.exports = userRouter;

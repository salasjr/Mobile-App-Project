const express = require("express");
const authRouter = express.Router();
const { signIn, signUp, signUpInputValidate } = require("../controllers/auth");
const { getUserData } = require("../controllers/user/getuserdata");
const { authorized } = require("../middleware/auth");
const upload = require("../utils/multer");
//! const { tokenValidator } = require("../middleware/tokenValidator");

// user signup
authRouter.post("/signup", upload.single("image"), signUp);

// user signin
authRouter.post("/signin", signIn);

//! token validator
// authRouter.post("/tokenIsValid", tokenValidator);

//! signUpInput validator
authRouter.post("/signupInputValidate", signUpInputValidate);

module.exports = authRouter;

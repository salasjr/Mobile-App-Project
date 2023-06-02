const multer = require("multer");

// configure multer to handle file uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },
  filename: (req, file, cb) => {
    const time = Date.now();
    cb(null, `${file.fieldname}-${time}.${file.originalname.split(".").pop()}`);
  },
});
const upload = multer({ storage: storage });

module.exports = upload;

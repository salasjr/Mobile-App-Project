
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phoneNumber` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `account` (`id`, `phoneNumber`, `password`, `question`, `answer`, `role`) VALUES
(37, '911752678', '$2a$08$a3nY1bAZ1une19A7n8Vbs.CgYueXHE9qof74eo.1zp5g0in1DVcZS', 'What is your father\'s name?', 'Kidane', 'patient'),
(36, '949387908', '$2a$08$KFKuopcdhQi2MslaeU.2qOV5w1Z.9/5EriQ13EA7X4iubD1lKnKvm', 'What is your mother\'s name?', 'momy', 'patient'),
(35, '999999999', '$2a$08$NfGCPy7kxEDEVLtaDYY6peWyvVExGF5yLfB0VawBWFMC6nNJskpsW', 'What is your mother\'s name?', 'momy', 'doctor');

-- !--------------------------------------




CREATE TABLE IF NOT EXISTS `doctor` (
  `id` int NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `businessName` varchar(255) NOT NULL,
  `businessId` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `profilePicture` varchar(2555) NOT NULL,
  `verified` tinyint  NOT NULL DEFAULT '0',
`rating` float NOT NULL DEFAULT '0',
`rating_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
)

-- INSERT INTO `doctor` (`id`, `fullname`, `businessName`, `businessId`, `address`, `phoneNumber`, `profilePicture`, `verified`,`rating`,`rating_count`) VALUES
-- (35, 'hakim', 'hakim', 'hakim', 'addis', '999999999', 'profilePicture', 0,0,0);



-- !----------------------


CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `profilePicture` varchar(2555) NOT NULL,
  PRIMARY KEY (`id`)
)


INSERT INTO `patient` (`id`, `fullname`, `phoneNumber`, `address`, `profilePicture`) VALUES
(36, 'betsi', '949387908', 'addis', 'profilePicture'),
(37, 'Betselot Kidane', '911752678', 'Addis Ababa, 4 kilo', 'profilePicture');

-- ! -----------------------------------
CREATE TABLE IF NOT EXISTS appointments (
  appointment_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  case_description VARCHAR(255) NOT NULL,
  status ENUM('accepted', 'rejected', 'pending', 'done') NOT NULL,
  message VARCHAR(255),
  rating INT,
  rating_count INT
);


COMMIT;
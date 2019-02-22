CREATE TABLE `Course` (
  `C_num` int(11) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Textbook` varchar(45) DEFAULT NULL,
  `Units` int(11) DEFAULT NULL,
  `Depart_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`C_num`),
  KEY `depart_num_idx` (`Depart_num`),
  CONSTRAINT `depart_num` FOREIGN KEY (`Depart_num`) REFERENCES 
    `Department` (`D_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `Department` (
  `D_num` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `Office_location` varchar(45) DEFAULT NULL,
  `Chair_SSN` int(11) DEFAULT NULL,
  PRIMARY KEY (`D_num`),
  KEY `SSN_idx` (`Chair_SSN`),
  CONSTRAINT `Prof_SSN` FOREIGN KEY (`Chair_SSN`) REFERENCES 
    `Professor` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `Enrollment` (
  `Student` int(11) NOT NULL,
  `Course` int(11) NOT NULL,
  `Section` int(11) NOT NULL,
  `Grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Student`,`Course`,`Section`),
  KEY `section_idx` (`Course`,`Section`),
  CONSTRAINT `student` FOREIGN KEY (`Student`) REFERENCES 
    `Student` (`CWID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `section_num1` FOREIGN KEY (`Course`, `Section`) REFERENCES 
    `Section` (`C_num`, `Sec_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `Minor` (
  `Student` int(11) NOT NULL DEFAULT '0',
  `Department` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Student`,`Department`),
  KEY `Department_no_idx` (`Department`),
  CONSTRAINT `Student_id` FOREIGN KEY (`Student`) REFERENCES 
    `Student` (`CWID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Department_no` FOREIGN KEY (`Department`) REFERENCES 
    `Department` (`D_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `Prerequisite` (
  `Course_no` int(11) NOT NULL,
  `Prereq_no` int(11) NOT NULL,
  PRIMARY KEY (`Prereq_no`,`Course_no`),
  KEY `course_idx` (`Course_no`),
  CONSTRAINT `course1` FOREIGN KEY (`Course_no`) REFERENCES 
    `Course` (`C_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prereq1` FOREIGN KEY (`Prereq_no`) REFERENCES 
    `Course` (`C_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `Prof_degrees` (
  `Prof_SSN` int(11) NOT NULL DEFAULT '0',
  `Degree` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Prof_SSN`,`Degree`),
  CONSTRAINT `SSN` FOREIGN KEY (`Prof_SSN`) REFERENCES 
    `Professor` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `Professor` (
  `SSN` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  `Area_code` int(11) DEFAULT NULL,
  `Phone_number` int(11) DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `Section` (
  `C_num` int(11) NOT NULL,
  `Sec_num` int(11) NOT NULL,
  `Classroom` varchar(45) DEFAULT NULL,
  `Meeting_days` varchar(45) DEFAULT NULL,
  `Start_time` time DEFAULT NULL,
  `End_time` time DEFAULT NULL,
  `Num_of_seats` int(11) DEFAULT NULL,
  `Instructor` int(11) DEFAULT NULL,
  PRIMARY KEY (`C_num`,`Sec_num`),
  KEY `Instructor_SSN_idx` (`Instructor`),
  CONSTRAINT `Instructor_SSN` FOREIGN KEY (`Instructor`) REFERENCES
     `Professor` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Course` FOREIGN KEY (`C_num`) REFERENCES 
    `Course` (`C_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `Student` (
  `CWID` int(11) NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `Address` mediumtext,
  `Phone` int(11) DEFAULT NULL,
  `Major_D_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`CWID`),
  KEY `major_num_idx` (`Major_D_num`),
  CONSTRAINT `major_num` FOREIGN KEY (`Major_D_num`) REFERENCES 
    `Department` (`D_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1

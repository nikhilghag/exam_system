CREATE TABLE User (
   userid INTEGER PRIMARY KEY AUTOINCREMENT,
   username TEXT UNIQUE,
   password TEXT,
   role TEXT
);

CREATE TABLE Student (
   studentid INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT,
   userid INTEGER,
   FOREIGN KEY (userid) REFERENCES User(userid)
);

CREATE TABLE TestScore (
   studentid INTEGER,
   tid INTEGER,
   score INTEGER,
   FOREIGN KEY (studentid) REFERENCES Student(studentid),
   FOREIGN KEY (tid) REFERENCES Test(tid)
);

CREATE TABLE Question (
   qid INTEGER PRIMARY KEY AUTOINCREMENT,
   question TEXT,
   option1 TEXT,
   option2 TEXT,
   option3 TEXT,
   option4 TEXT,
   answer TEXT,
   topicid INTEGER,
   FOREIGN KEY (topicid) REFERENCES Topic(topicid)
);

CREATE TABLE Test (
   tid INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT,
   created TEXT,
   teacherid INTEGER,
   batchid INTEGER,
   FOREIGN KEY (teacherid) REFERENCES Teacher(teacherid),
   FOREIGN KEY (batchid) REFERENCES Batch(batchid)
);

CREATE TABLE TestPaper (
   tid INTEGER,
   qid INTEGER,
   FOREIGN KEY (tid) REFERENCES Test(tid),
   FOREIGN KEY (qid) REFERENCES Question(qid)
);

CREATE TABLE Topic (
   topicid INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT,
   parenttopic INTEGER,
   FOREIGN KEY (parenttopic) REFERENCES Topic(topicid)
);

CREATE TABLE Course (
   courseid INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT
);

CREATE TABLE CourseContent (
   courseid INTEGER,
   topicid INTEGER,
   FOREIGN KEY (courseid) REFERENCES Course(courseid),
   FOREIGN KEY (topicid) REFERENCES Topic(topicid)
);

CREATE TABLE Teacher (
   teacherid INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT,
   userid INTEGER,
   FOREIGN KEY (userid) REFERENCES User(userid)
);

CREATE TABLE Lecture (
   lectureid INTEGER PRIMARY KEY AUTOINCREMENT,
   date TEXT
);

CREATE TABLE Batch (
   batchid INTEGER PRIMARY KEY AUTOINCREMENT,
   courseid INTEGER,
   FOREIGN KEY (courseid) REFERENCES Course(courseid)
);

CREATE TABLE StudentBatch (
   studentid INTEGER,
   batchid INTEGER,
   FOREIGN KEY (studentid) REFERENCES Student(studentid),
   FOREIGN KEY (batchid) REFERENCES Batch(batchid)
);

CREATE TABLE BatchLecture (
   batchid INTEGER,
   lectureid INTEGER,
   FOREIGN KEY (batchid) REFERENCES Batch(batchid),
   FOREIGN KEY (lectureid) REFERENCES Lecture(lectureid)
);

CREATE TABLE LectureCompletion (
   studentid INTEGER,
   lectureid INTEGER,
   completed BOOLEAN,
   FOREIGN KEY (studentid) REFERENCES Student(studentid),
   FOREIGN KEY (lectureid) REFERENCES Lecture(lectureid)
);

CREATE TABLE LectureTopics (
   lectureid INTEGER,
   topicid INTEGER,
   FOREIGN KEY (lectureid) REFERENCES Lecture(lectureid),
   FOREIGN KEY (topicid) REFERENCES Topic(topicid)
);
INSERT INTO User (username, password, role)
VALUES ('tom', 'jerry', 'student');
INSERT INTO User (username, password, role)
VALUES ('harry', 'potter', 'student');
INSERT INTO User (username, password, role)
VALUES ('jack', 'sparrow', 'teacher');

INSERT INTO Student(name, userid)
VALUES ('Tom', 1);
INSERT INTO Student(name, userid)
VALUES ('Harry', 2);

INSERT INTO Teacher(name, userid)
VALUES ('Jack', 3);

INSERT INTO Topic(name, parenttopic)
VALUES ('Parent Topic1', null);
INSERT INTO Topic(name, parenttopic)
VALUES ('Topic1', 1);
INSERT INTO Topic(name, parenttopic)
VALUES ('Topic2', 1);
INSERT INTO Topic(name, parenttopic)
VALUES ('Topic3', 1);

INSERT INTO Question(question, option1, option2, option3, option4, answer, topicid)
VALUES ('Dummy Question 1', 'Opt1', 'Opt2', 'Opt3', 'Opt4', 'Opt1', 4);
INSERT INTO Question(question, option1, option2, option3, option4, answer, topicid)
VALUES ('Dummy Question 2', 'Opt1', 'Opt2', 'Opt3', 'Opt4', 'Opt2', 4);
INSERT INTO Question(question, option1, option2, option3, option4, answer, topicid)
VALUES ('Dummy Question 3', 'Opt1', 'Opt2', 'Opt3', 'Opt4', 'Opt4', 2);
INSERT INTO Question(question, option1, option2, option3, option4, answer, topicid)
VALUES ('Dummy Question 4', 'Opt1', 'Opt2', 'Opt3', 'Opt4', 'Opt5', 2);
INSERT INTO Question(question, option1, option2, option3, option4, answer, topicid)
VALUES ('Dummy Question 5', 'Opt1', 'Opt2', 'Opt3', 'Opt4', 'Opt3', 3);

INSERT INTO Course(name)
VALUES('Course 1');

INSERT INTO CourseContent(courseid, topicid)
VALUES(1, 2);
INSERT INTO CourseContent(courseid, topicid)
VALUES(1, 3);
INSERT INTO CourseContent(courseid, topicid)
VALUES(1, 4);


INSERT INTO Batch(batchname, courseid)
VALUES('batch1', 1);

INSERT INTO StudentBatch(studentid, batchid)
VALUES(1,1);
INSERT INTO StudentBatch(studentid, batchid)
VALUES(2,1);

INSERT INTO Test(name, created, teacherid, batchid)
VALUES('Test 1', '26th May 2025', 1, 1);

INSERT INTO TestPaper
VALUES (1, 1);
INSERT INTO TestPaper
VALUES (1, 2);
INSERT INTO TestPaper
VALUES (1, 3);
INSERT INTO TestPaper
VALUES (1, 4);
INSERT INTO TestPaper
VALUES (1, 5);

INSERT INTO Lecture(date) VALUES('17-May-2025');
INSERT INTO Lecture(date) VALUES('18-May-2025');
INSERT INTO Lecture(date) VALUES('24-May-2025');
INSERT INTO Lecture(date) VALUES('25-May-2025');

INSERT INTO BatchLecture(batchid, lectureid)
VALUES(1,1);
INSERT INTO BatchLecture(batchid, lectureid)
VALUES(1,2);
INSERT INTO BatchLecture(batchid, lectureid)
VALUES(1,3);

INSERT INTO LectureTopics(lectureid, topicid)
VALUES(1,2);
INSERT INTO LectureTopics(lectureid, topicid)
VALUES(2,3);
INSERT INTO LectureTopics(lectureid, topicid)
VALUES(3,4);
-- /batches
select c.name, b.batchname, pt.name, t.name, lt.lectureid, l.date, lc.completed from Batch b inner join StudentBatch s on s.batchid = b.batchid inner join Course c on c.courseid = b.courseid inner join BatchLecture bl on b.batchid = bl.batchid inner join Lecture l on bl.lectureid = l.lectureid inner join LectureTopics lt on bl.lectureid = lt.lectureid inner join Topic t on lt.topicid = t.topicid inner join Topic pt on t.parenttopic = pt.topicid left join LectureCompletion lc on bl.lectureid = lc.lectureid where s.studentid = ?;


-- /tests/ 
select b.batchid, b.batchname, tid, name from Test t inner join Batch b on t.batchid = b.batchid inner join StudentBatch sb on sb.batchid = b.batchid inner join Student s on sb.studentid = s.studentid where s.userid = (?)


-- /tests/1
select t.name, q.qid, question, option1, option2, option3, option4 from Question q inner join TestPaper tp on q.qid = tp.qid inner join Test t on tp.tid = t.id where t.id = ?;
GET_USERS = "select userid,username, password from User where username = (?)"

GET_TESTS = "select b.batchid, b.batchname, tid, t.name from Test t inner join Batch b on t.batchid = b.batchid inner join StudentBatch sb on sb.batchid = b.batchid inner join Student s on sb.studentid = s.studentid where s.userid = (?)"

GET_QUESTIONS = "select t.name, q.qid, question, option1, option2, option3, option4 from Question q inner join TestPaper tp on q.qid = tp.qid inner join Test t on tp.tid = t.tid where t.tid = (?)"

CHECK_TEST_PAPER_ANSWERS = "select q.qid, answer from Question q inner join TestPaper tp on q.qid = tp.qid inner join Test t on tp.tid = t.tid where t.tid = (?)"
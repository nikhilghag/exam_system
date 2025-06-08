from db.queries import GET_TESTS, GET_QUESTIONS, CHECK_TEST_PAPER_ANSWERS

def get_batch_tests(db, userid):
    cur = db.cursor()
    result = cur.execute(GET_TESTS, (userid,)).fetchall()

    batch_dict = {}
    for batchid, batchname, tid, name in result:
        if batchid not in batch_dict:
            batch_dict[batchid] = {
                "batchid": batchid,
                "batchname": batchname,
                "tests": []
            }
    batch_dict[batchid]["tests"].append({"tid": tid, "name": name})      

    print(batch_dict)

    return list(batch_dict.values())

def get_test_question(db, testid):
    cur = db.cursor()
    result = cur.execute(GET_QUESTIONS, (testid,)).fetchall()

    test_question_dict = {}
    question_list = []

    for name, qid, question, option1, option2, option3, option4 in result:

        if "test_name" not in test_question_dict:
            test_question_dict["test_name"] = name

        question_list.append({
            "qid": qid,
            "question": question,
            "option1": option1,
            "option2": option2,
            "option3": option3,
            "option4": option4,
        })
    test_question_dict["questions"] = question_list

    return test_question_dict

def get_test_answers(db, testid):
    cur = db.cursor()
    result = cur.execute(CHECK_TEST_PAPER_ANSWERS, (testid,)).fetchall()

    answer_dict = {}
    for qid, answer in result:
        answer_dict[str(qid)] = answer

    return answer_dict

def evaluate_test(actual_answers, user_answers):
    score = 0

    for user_qid, user_answer in user_answers:
        print(f"{user_qid} : {user_answer}") #TODO Store User Answers in DB
        if user_qid in actual_answers and actual_answers[user_qid] == user_answer:
            score = score + 1
    return score
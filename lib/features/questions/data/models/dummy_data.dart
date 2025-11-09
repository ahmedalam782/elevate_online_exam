import 'package:elevate_online_exam/features/questions/data/models/answer_dto/answer_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/exam/exam.dart';
import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';

class DummyData {
  static List<QuestionDto> getDummyData = [
    QuestionDto(
      answers: [
        AnswerDto(answer: "Hyperlinks and Text Markup Language", key: "A1"),
        AnswerDto(answer: "Hyper Text Markup Language", key: "A2"),
        AnswerDto(answer: "Home Tool Markup Language", key: "A3"),
      ],
      question: "What does HTML stand for?",
      correct: "A2",

      exam: Exam(
        id: "670070a830a3c3c1944a9c63",
        title: "HTML Quiz",
        duration: 25,
        subject: "670037f6728c92b7fdf434fc",
        numberOfQuestions: 40,
        active: true,
        createdAt: "2024-10-04T22:48:08.842Z",
      ),
    ),
    QuestionDto(
      answers: [
        AnswerDto(answer: "Microsoft", key: "A1"),
        AnswerDto(answer: "Google", key: "A2"),
        AnswerDto(answer: "Mozilla", key: "A3"),
        AnswerDto(answer: "The World Wide Web Consortium", key: "A4"),
      ],
      question: "Who is making the Web standards?",
      correct: "A4",
      exam: Exam(
        id: "670070a830a3c3c1944a9c63",
        title: "HTML Quiz",
        duration: 25,
        subject: "670037f6728c92b7fdf434fc",
        numberOfQuestions: 40,
        active: true,
        createdAt: "2024-10-04T22:48:08.842Z",
      ),
    ),
    QuestionDto(
      answers: [
        AnswerDto(answer: "<head>", key: "A1"),
        AnswerDto(answer: "<heading>", key: "A2"),
        AnswerDto(answer: "<h1>", key: "A3"),
        AnswerDto(answer: "<h6>", key: "A4"),
      ],
      question: "Choose the correct HTML element for the largest heading",
      correct: "A3",
      exam: Exam(
        id: "670070a830a3c3c1944a9c63",
        title: "HTML Quiz",
        duration: 25,
        subject: "670037f6728c92b7fdf434fc",
        numberOfQuestions: 40,
        active: true,
        createdAt: "2024-10-04T22:48:08.842Z",
      ),
    ),
    QuestionDto(
      answers: [
        AnswerDto(answer: "<br>", key: "A1"),
        AnswerDto(answer: "<lb>", key: "A2"),
        AnswerDto(answer: "<break>", key: "A3"),
        AnswerDto(answer: "<pre>", key: "A4"),
      ],
      question: "What is the correct HTML element for inserting a line break?",
      correct: "A1",
      exam: Exam(
        id: "670070a830a3c3c1944a9c63",
        title: "HTML Quiz",
        duration: 25,
        subject: "670037f6728c92b7fdf434fc",
        numberOfQuestions: 40,
        active: true,
        createdAt: "2024-10-04T22:48:08.842Z",
      ),
    ),
    QuestionDto(
      answers: [
        AnswerDto(answer: "<body style='background-color:yellow;'>", key: "A1"),
        AnswerDto(answer: "<body bg='yellow'>", key: "A2"),
        AnswerDto(answer: "<background>yellow</background>", key: "A3"),
        AnswerDto(answer: "<yellow>yellow</yellow>", key: "A4"),
      ],
      question: "What is the correct HTML for adding a background color?",
      correct: "A1",
      exam: Exam(
        id: "670070a830a3c3c1944a9c63",
        title: "HTML Quiz",
        duration: 25,
        subject: "670037f6728c92b7fdf434fc",
        numberOfQuestions: 40,
        active: true,
        createdAt: "2024-10-04T22:48:08.842Z",
      ),
    ),
    QuestionDto(
      answers: [
        AnswerDto(answer: "<important>", key: "A1"),
        AnswerDto(answer: "<i>", key: "A2"),
        AnswerDto(answer: "<b>", key: "A3"),
        AnswerDto(answer: "<strong>", key: "A4"),
      ],
      question: "Choose the correct HTML element to define important text",
      correct: "A4",
      exam: Exam(
        id: "670070a830a3c3c1944a9c63",
        title: "HTML Quiz",
        duration: 25,
        subject: "670037f6728c92b7fdf434fc",
        numberOfQuestions: 40,
        active: true,
        createdAt: "2024-10-04T22:48:08.842Z",
      ),
    ),
    QuestionDto(
      answers: [
        AnswerDto(answer: "<em>", key: "A1"),
        AnswerDto(answer: "<italic>", key: "A2"),
        AnswerDto(answer: "<i>", key: "A3"),
        AnswerDto(answer: "<strong>", key: "A4"),
      ],
      question: "Choose the correct HTML element to define emphasized text",
      correct: "A1",
      exam: Exam(
        id: "670070a830a3c3c1944a9c63",
        title: "HTML Quiz",
        duration: 25,
        subject: "670037f6728c92b7fdf434fc",
        numberOfQuestions: 40,
        active: true,
        createdAt: "2024-10-04T22:48:08.842Z",
      ),
    ),
    QuestionDto(
      answers: [
        AnswerDto(
          answer: "<a href='http://www.w3schools.com'>W3Schools</a>",
          key: "A1",
        ),
        AnswerDto(answer: "<a>http://www.w3schools.com</a>", key: "A2"),
        AnswerDto(
          answer: "<a url='http://www.w3schools.com'>W3Schools.com</a>",
          key: "A3",
        ),
        AnswerDto(
          answer: "<a name='http://www.w3schools.com'>W3Schools.com</a>",
          key: "A4",
        ),
      ],
      question: "What is the correct HTML for creating a hyperlink?",
      correct: "A1",
      exam: Exam(
        id: "670070a830a3c3c1944a9c63",
        title: "HTML Quiz",
        duration: 25,
        subject: "670037f6728c92b7fdf434fc",
        numberOfQuestions: 40,
        active: true,
        createdAt: "2024-10-04T22:48:08.842Z",
      ),
    ),
    QuestionDto(
      answers: [
        AnswerDto(answer: "/", key: "A1"),
        AnswerDto(answer: "*", key: "A2"),
        AnswerDto(answer: "<", key: "A3"),
        AnswerDto(answer: "~", key: "A4"),
      ],
      question: "Which character is used to indicate an end tag?",
      correct: "A1",
      exam: Exam(
        id: "670070a830a3c3c1944a9c63",
        title: "HTML Quiz",
        duration: 25,
        subject: "670037f6728c92b7fdf434fc",
        numberOfQuestions: 40,
        active: true,
        createdAt: "2024-10-04T22:48:08.842Z",
      ),
    ),
    QuestionDto(
      answers: [
        AnswerDto(answer: "<a href='url' target='_blank'>", key: "A1"),
        AnswerDto(answer: "<a href='url' target='new'>", key: "A2"),
        AnswerDto(answer: "<a href='url' new>", key: "A3"),
      ],
      question: "How can you open a link in a new tab/browser window?",
      correct: "A1",
      exam: Exam(
        id: "670070a830a3c3c1944a9c63",
        title: "HTML Quiz",
        duration: 25,
        subject: "670037f6728c92b7fdf434fc",
        numberOfQuestions: 40,
        active: true,
        createdAt: "2024-10-04T22:48:08.842Z",
      ),
    ),
  ];
}

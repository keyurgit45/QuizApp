class QuizModel {
  late String type;
  late String question;
  late String correctAnswer;
  late List<String> incorrectAnswers;
  late String difficulty;

  QuizModel(
      {required this.type,
      required this.difficulty,
      required this.question,
      required this.correctAnswer,
      required this.incorrectAnswers});
}

Iterable<QuizModel> questions = [
  QuizModel(
      type: "boolean",
      difficulty: "medium",
      question: "The HTML5 standard was published in 2014.",
      correctAnswer: "True",
      incorrectAnswers: ["False"]),
  QuizModel(
      type: "multiple",
      difficulty: "easy",
      question:
          "In any programming language, what is the most common way to iterate through an array?",
      correctAnswer: "For loops",
      incorrectAnswers: ["If Statements", "Do-while loops", "While loops"]),
  QuizModel(
      type: "multiple",
      difficulty: "easy",
      question:
          "When Gmail first launched, how much storage did it provide for your email?",
      correctAnswer: "1GB",
      incorrectAnswers: ["512MB", "5GB", "Unlimited"]),
  QuizModel(
      type: "multiple",
      difficulty: "easy",
      question:
          "What is the code name for the mobile operating system Android 7.0?",
      correctAnswer: "Nougat",
      incorrectAnswers: ["Ice Cream Sandwich", "Jelly Bean", "Marshmallow"]),
  QuizModel(
      type: "boolean",
      difficulty: "hard",
      question: "DHCP stands for Dynamic Host Configuration Port.",
      correctAnswer: "False",
      incorrectAnswers: ["True"]),
  QuizModel(
      type: "multiple",
      difficulty: "medium",
      question:
          "In programming, the ternary operator is mostly defined with what symbolQuizModel(s)?",
      correctAnswer: "?:",
      incorrectAnswers: ["??", "if then", "?"]),
  QuizModel(
      type: "multiple",
      difficulty: "medium",
      question: "What does the term GPU stand for?",
      correctAnswer: "Graphics Processing Unit",
      incorrectAnswers: [
        "Gaming Processor Unit",
        "Graphite Producing Unit",
        "Graphical Proprietary Unit"
      ]),
  QuizModel(
      type: "boolean",
      difficulty: "easy",
      question: "Linux was first created as an alternative to Windows XP.",
      correctAnswer: "False",
      incorrectAnswers: ["True"]),
  QuizModel(
      type: "multiple",
      difficulty: "medium",
      question: "When did the online streaming service Mixer launch?",
      correctAnswer: "2016",
      incorrectAnswers: ["2013", "2009", "2011"]),
  QuizModel(
      type: "multiple",
      difficulty: "hard",
      question: "What was the first company to use the term Golden Master?",
      correctAnswer: "Apple",
      incorrectAnswers: ["IBM", "Microsoft", "Google"]),
  QuizModel(
      type: "multiple",
      difficulty: "easy",
      question:
          "Which company was established on April 1st, 1976 by Steve Jobs, Steve Wozniak and Ronald Wayne?",
      correctAnswer: "Apple",
      incorrectAnswers: ["Microsoft", "Atari", "Commodore"]),
  QuizModel(
      type: "multiple",
      difficulty: "easy",
      question:
          "According to the International System of Units, how many bytes are in a kilobyte of RAM?",
      correctAnswer: "1000",
      incorrectAnswers: ["512", "1024", "500"]),
  QuizModel(
      type: "multiple",
      difficulty: "easy",
      question: "How many kilobytes in one gigabyte QuizModel(in decimal)?",
      correctAnswer: "1000000",
      incorrectAnswers: ["1024", "1000", "1048576"]),
  QuizModel(
      type: "boolean",
      difficulty: "hard",
      question: "DHCP stands for Dynamic Host Configuration Port.",
      correctAnswer: "False",
      incorrectAnswers: ["True"]),
];

class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> shuffledAnswers() {
    final newList = List.of(answers);
    newList.shuffle();
    return newList;
  }
}

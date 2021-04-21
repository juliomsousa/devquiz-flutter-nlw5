import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';

class AnswerModel {
  final String title;
  final bool isRight;

  AnswerModel({
    required this.title,
    this.isRight = false,
  });
}

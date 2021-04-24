import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          ...widget.question.answers.map((e) {
            int idx = widget.question.answers.indexOf(e);
            return AnswerWidget(
              answer: e,
              isSelected: selectedIndex == idx,
              disabled: selectedIndex != -1,
              onTap: (value) {
                selectedIndex = idx;
                setState(() {});
                Future.delayed(Duration(seconds: 3))
                    .then((_) => widget.onSelected(value));
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}

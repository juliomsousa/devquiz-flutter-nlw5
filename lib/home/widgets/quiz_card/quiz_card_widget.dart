import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int questionsAnsweredAmount;
  final int questionsTotal;
  final VoidCallback onTap;

  QuizCardWidget({
    Key? key,
    required this.title,
    required this.questionsAnsweredAmount,
    required this.questionsTotal,
    required this.onTap,
  });

  get answeredPercentage =>
      (questionsAnsweredAmount / questionsTotal).toDouble();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '$questionsAnsweredAmount de $questionsTotal',
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: ProgressIndicatorWidget(
                      value: answeredPercentage,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

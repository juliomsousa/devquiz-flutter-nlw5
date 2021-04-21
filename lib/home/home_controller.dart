import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = UserModel(
      name: 'Julio Martins',
      photoUrl: 'https://avatars.githubusercontent.com/u/22116665?v=4',
    );
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = [
      QuizModel(
        image: AppImages.blocks,
        level: Level.facil,
        title: 'NLW 5 Flutter',
        questionsAnswered: 1,
        questions: [
          QuestionModel(
            title: 'Está curtindo o Flutter?',
            answers: [
              AnswerModel(title: 'Estou curtindo'),
              AnswerModel(title: 'Amandooo'),
              AnswerModel(title: 'Show de bola', isRight: true),
              AnswerModel(title: 'Muito louco'),
            ],
          ),
          QuestionModel(
            title: 'E o React Native',
            answers: [
              AnswerModel(title: 'Estou curtindo', isRight: true),
              AnswerModel(title: 'Amandooo'),
              AnswerModel(title: 'Show de bola'),
              AnswerModel(title: 'Muito louco'),
            ],
          ),
        ],
      )
    ];

    state = HomeState.success;
  }
}

import 'package:blue_gorizon_bank_app/consts/app_text_styles/quiz_text_style.dart';
import 'package:blue_gorizon_bank_app/consts/app_text_styles/settings_text_style.dart';
import 'package:blue_gorizon_bank_app/data/models/quiz_model.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../consts/app_colors.dart';
import 'dialogue_screen.dart';

class QuizScreen extends StatelessWidget {
  final List<QuizModel> quizzes;

  QuizScreen({Key? key, required this.quizzes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themes = quizzes.map((quiz) => quiz.theme).toSet().toList();
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: AppColors.blueColor,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        backgroundColor: AppColors.lightGreyColor,
        title: const Text(
          'Back',
          style: SettingsTextStyle.back,
        ),
      ),
      body: Container(
        color: AppColors.lightGreyColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Quiz',
                style: QuizTextStyle.title,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                '2 themes',
                style: QuizTextStyle.theme,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: themes.length,
                itemBuilder: (context, index) {
                  String theme = themes[index];
                  return GestureDetector(
                    onTap: () {
                      List<QuizModel> themeQuizzes =
                          quizzes.where((quiz) => quiz.theme == theme).toList();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              DialogueScreen(quizzes: themeQuizzes),
                        ),
                      );
                    },
                    child: themeContainer(
                      theme: theme,
                      date: '19 february 2024',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget themeContainer({required String theme, required String date}) {
    List<String> avatarPaths =
        List.generate(5, (index) => 'assets/images/avatar${index + 1}.png');
    avatarPaths.shuffle(Random());

    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            theme,
            textAlign: TextAlign.start,
            style: QuizTextStyle.theme,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 35,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      for (int i = 0; i < avatarPaths.length; i++)
                        Positioned(
                          left: i * 25.0,
                          child: Image.asset(avatarPaths[i], width: 35),
                        ),
                    ],
                  ),
                ),
              ),
              Text(
                date,
                style: QuizTextStyle.date,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

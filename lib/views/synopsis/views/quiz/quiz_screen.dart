import 'package:blue_gorizon_bank_app/data/models/quiz_model.dart';
import 'package:blue_gorizon_bank_app/views/synopsis/widgets/quiz_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_text_styles/synopsis_text_style.dart';
import 'dialogue_screen.dart';

class QuizScreen extends StatelessWidget {
  final List<QuizModel> quizzes;

  QuizScreen({Key? key, required this.quizzes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Find all distinct themes from the quizzes list
    final themes = quizzes.map((quiz) => quiz.theme).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Theme'),
      ),
      body: ListView.builder(
        itemCount: themes.length,
        itemBuilder: (context, index) {
          String theme = themes[index];
          return GestureDetector(
            onTap: () {
              List<QuizModel> themeQuizzes =
                  quizzes.where((quiz) => quiz.theme == theme).toList();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DialogueScreen(quizzes: themeQuizzes),
                ),
              );
            },
            child: ThemeContainer(
                theme: theme), // No need to pass context or quizzes
          );
        },
      ),
    );
  }

  Widget ThemeContainer({required String theme}) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          theme,
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}

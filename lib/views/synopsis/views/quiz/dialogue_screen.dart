import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../consts/app_colors.dart';
import '../../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../../../data/models/quiz_model.dart';
import '../../../../data/models/quiz_model.dart';
import '../../../../data/models/quiz_model.dart';
import '../../widgets/speech_bubble.dart';

class DialogueScreen extends StatefulWidget {
  final List<QuizModel> quizzes;

  const DialogueScreen({Key? key, required this.quizzes}) : super(key: key);

  @override
  State<DialogueScreen> createState() => _DialogueScreenState();
}

class _DialogueScreenState extends State<DialogueScreen> {
  int? expandedQuizIndex;

  void toggleAnswers(int index) {
    setState(() {
      if (expandedQuizIndex == index) {
        expandedQuizIndex = null;
      } else {
        expandedQuizIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());
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
          style: SynopsisTextStyle.appbar,
        ),
      ),
      body: Container(
        color: AppColors.lightGreyColor,
        child: ListView.builder(
          itemCount: widget.quizzes.length,
          itemBuilder: (BuildContext context, int index) {
            QuizModel quiz = widget.quizzes[index];
            bool isExpanded = index == expandedQuizIndex;
            return Card(
              color: AppColors.lightGreyColor,
              margin: EdgeInsets.all(8.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              elevation: 0, // Remove card shadow/elevation
              child: Column(
                children: [
                  SpeechBubble(
                    text: quiz.question,
                    isQuestion: true,
                    answerCount: 3,
                    date: dateString,
                    onOptionsTap: () => toggleAnswers(index),
                    onTap: () => toggleAnswers(index),
                  ),
                  if (isExpanded) ...[
                    SpeechBubble(text: quiz.answerOne, isQuestion: false),
                    SpeechBubble(text: quiz.answerTwo, isQuestion: false),
                    SpeechBubble(text: quiz.answerThree, isQuestion: false),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

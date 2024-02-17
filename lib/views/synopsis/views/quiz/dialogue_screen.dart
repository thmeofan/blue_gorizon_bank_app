import 'package:flutter/material.dart';

import '../../../../data/models/quiz_model.dart';
import '../../widgets/speech_bubble.dart';

class DialogueScreen extends StatelessWidget {
  final List<QuizModel> quizzes;

  DialogueScreen({Key? key, required this.quizzes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Dialogue'),
      ),
      body: ListView.builder(
        itemCount: quizzes.length,
        itemBuilder: (BuildContext context, int index) {
          return buildQuizDialogue(quizzes[index]);
        },
      ),
    );
  }

  Widget buildQuizDialogue(QuizModel quiz) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: SpeechBubble(text: quiz.question, isQuestion: true),
        children: [
          SpeechBubble(text: quiz.answerOne, isQuestion: false),
          SpeechBubble(text: quiz.answerTwo, isQuestion: false),
          SpeechBubble(text: quiz.answerThree, isQuestion: false),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';



class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function ( String answer) onSelectedAnswer; 
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
    int currentQuestionIndex = 0; 

    answerQuestion(String selectedAnswers){
      widget.onSelectedAnswer(selectedAnswers); 
      setState(() {
        currentQuestionIndex ++;
      });
      }

    @override
    Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex]; 

    return Center(
      widthFactor: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment. stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton((){answerQuestion(answer);}, answer);
            })
          ],
        ),
      ),
    );
  }
}

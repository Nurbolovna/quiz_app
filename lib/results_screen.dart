import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});
  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: TextStyle(
                  color: Color.fromARGB(199, 245, 246, 248),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              'You answered $correctQuestions out of $totalQuestions questions correctly',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(254, 255, 255, 255),), 
                child: Text('Restart Quiz!'),
              ),
            //TextButton(onPressed:(){Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => StartScreen(startQuiz)),);} , child: Text(style: TextStyle(color:const Color.fromARGB(254, 255, 255, 255) ), 'Restart Quiz!'), ),
          ],
        ),
      ),
    );
  }
}

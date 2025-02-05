import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState(); 
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
    },);
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer); 
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

    void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen); 
    if(activeScreen == 'question-screen'){
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer); 
    }

    if(activeScreen == 'result-screen'){
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers,);
    }

    return    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
  }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData,
      {super.key}); //difference QuestionsSummary( {super.key, this.summaryData})

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String,
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 5),
                      Text(data['user_answer'] as String,
                          style: TextStyle(color: Colors.white)),
                      Text(data['correct_answer'] as String,
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

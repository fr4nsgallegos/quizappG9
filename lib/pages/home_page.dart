import 'package:flutter/material.dart';
import 'package:quizappg9/quiz_brain.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain quizBrain = QuizBrain();
  List<Widget> score = [];

  void checkAnswer(bool userAnswer, String numberQuestion) {
    // if (quizBrain.isFinished() == true) {
    //   print("EL FORMULARIO HA FINALIZADO");
    // } else {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    if (correctAnswer == userAnswer) {
      print("La respuesta es correcta");
      score.add(itemScore(numberQuestion, true));
    } else {
      print("INCORRECTO!!!");
      score.add(itemScore(numberQuestion, false));
    }
    if (quizBrain.isFinished()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Alerta"),
              content: Text("Has llegado al final del formulario"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    score.clear();
                    quizBrain.restartQuizz();
                    setState(() {});
                  },
                  child: Text("OK"),
                ),
              ],
            );
          });
    } else {
      quizBrain.nextQuestion();
    }
    setState(() {});
    // }
  }

  Widget itemScore(String numberQuestion, bool isCorrect) {
    return Row(
      children: [
        Text(
          numberQuestion,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.redAccent,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B2E42),
      appBar: AppBar(
        backgroundColor: Color(0xff2B2E42),
        elevation: 10,
        centerTitle: true,
        title: Text(
          "Quizz App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.greenAccent,
                  minWidth: double.infinity,
                  onPressed: () {
                    checkAnswer(true, quizBrain.getNumberQuestion());
                  },
                  child: Text("Verdadero"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.redAccent,
                  minWidth: double.infinity,
                  onPressed: () {
                    checkAnswer(false, quizBrain.getNumberQuestion());
                  },
                  child: Text("false"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: score,
            )
          ],
        ),
      ),
    );
  }
}

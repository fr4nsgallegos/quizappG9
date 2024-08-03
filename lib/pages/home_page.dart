import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
                  "¿Has almorzado hoy?",
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
                  onPressed: () {},
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
                  onPressed: () {},
                  child: Text("false"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizzz/main.dart';

class ResultPage extends StatefulWidget {
  const ResultPage(this.score, {super.key});
  final int score;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Color mainColor = const Color(0xff252c4a);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Congratulations!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "your score is :",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 25),
              Text(
                "$score",
                style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 38),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.green),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreenPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Try again',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

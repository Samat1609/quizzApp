import 'package:flutter/material.dart';
import 'package:quizzz/data/question_list.dart';
import 'package:quizzz/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenPage(),
    );
  }
}

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

int score = 0;

class _HomeScreenPageState extends State<HomeScreenPage> {
  PageController controller = PageController(initialPage: 0);
  Color mainColor = const Color(0xff252c4a);
  Color secondColor = const Color(0xff117eeb);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isFalse = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView.builder(
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          controller: controller,
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Question ${index + 1}/${questions.length}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Divider(
                  height: 8,
                  thickness: 2,
                  color: Colors.white,
                ),
                const SizedBox(height: 25),
                Text(
                  questions[index].question!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 25),
                for (int i = 0; i < questions[index].answer!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: MaterialButton(
                      height: 65,
                      shape: const StadiumBorder(),
                      color: isPressed
                          ? questions[index]
                                      .answer!
                                      .entries
                                      .toList()[i]
                                      .value ==
                                  true
                              ? isTrue
                              : isFalse
                          : secondColor,
                      onPressed: () {
                        setState(() {
                          isPressed = true;
                        });
                        if (questions[index]
                                .answer!
                                .entries
                                .toList()[i]
                                .value ==
                            true) {
                          score += 10;
                        } else {
                          null;
                        }
                      },
                      child: Text(
                        questions[index].answer!.keys.toList()[i],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(color: Colors.red),
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        if (index + 1 == questions.length) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(score),
                            ),
                          );
                        } else {
                          controller.nextPage(
                              duration: const Duration(microseconds: 750),
                              curve: Curves.bounceOut);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          index + 1 == questions.length
                              ? "See result"
                              : "Next Sakebay",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

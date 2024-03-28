
import 'package:flutter/material.dart';

class SmallQuizGame extends StatefulWidget {
  const SmallQuizGame({super.key});

  @override
  State<SmallQuizGame> createState() => _SmallQuizGameState();
}

class _SmallQuizGameState extends State<SmallQuizGame> {
  int currentIndex = 0;
  Question? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("mini Quizz"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: questions
                .map<Widget>(
                  (q) => IgnorePointer(
                    ignoring: selected != null,
                    child: Draggable(
                      data: q,
                      feedback: Material(
                          color: Colors.transparent,
                          child: Image.asset(
                            q.img,
                            // width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          )),
                      child: Image.asset(
                        q.img,
                        // width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 50),
          Text(
            questions[currentIndex].question,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 50),
          DragTarget<Question>(
            onAccept: (data) {
              setState(() {
                selected = data;
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 10,
                    color: Colors.deepOrange,
                  ),
                ),
                child: selected == null
                    ? null
                    : Image.asset(
                        selected!.img,
                        // width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
              );
            },
          ),
          const SizedBox(height: 50),
          if (selected != null)
            Column(
              children: [
                if (selected!.answer == questions[currentIndex].answer)
                  Column(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 50,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selected = null;
                            currentIndex = currentIndex == questions.length - 1
                                ? 0
                                : currentIndex + 1;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.green,
                        ),
                        child: Text(
                          currentIndex == questions.length - 1
                              ? "Restart"
                              : "Next",
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selected = null;
                          });
                        },
                        child: const Text("De nuevo"),
                      ),
                      const Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                        size: 50,
                      ),
                    ],
                  )
              ],
            )
        ],
      ),
    );
  }
}
class Question {
  String img;
  String question;
  String answer;

  Question({
    required this.img,
    required this.question,
    required this.answer,
  });
}

List<Question> questions = [
  Question(
    img: 'assets/quiz/ball.jpeg',
    question: 'cual es un objeto que se usa en un juego?',
    answer: 'ball',
  ),
  Question(
    img: 'assets/quiz/dog.jpeg',
    question: 'Cual es un animal?',
    answer: 'dog',
  ),
  Question(
    img: 'assets/quiz/plane.jpeg',
    question: 'Cual vuela?',
    answer: 'plane',
  ),
];

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ans = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Image.asset(
                          "assets/feed/shark.jpeg",
                          width: 200,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '      Pinguino',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange.shade100,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: DragTarget<String>(
                                onAccept: (char) {
                                  setState(() {
                                    ans = char;
                                  });
                                },
                                builder:
                                    (context, candidateData, rejectedData) {
                                  return Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black38,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      ans,
                                      style: const TextStyle(
                                        fontSize: 35,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children:
                          ["r", "p", "s"].map<Widget>(buildAnswer).toList(),
                    )
                  ],
                ),
                if (ans.isNotEmpty)
                  Positioned(
                    top: 10,
                    right: 0,
                    left: 0,
                    child: ans == "p"
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 300,
                          )
                        : const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 300,
                          ),
                  ),
              ],
            ),
            if (ans.isNotEmpty)
              TextButton(
                onPressed: () {
                  setState(() {
                    ans = "";
                  });
                },
                style: TextButton.styleFrom(foregroundColor: Colors.grey),
                child: const Text("Replay"),
              ),
           
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildAnswer(String answer) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade100,
          border: Border.all(
            width: 1,
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(20),
        child: Draggable(
          data: answer,
          feedback: Material(
            color: Colors.transparent,
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          child: Text(
            answer,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
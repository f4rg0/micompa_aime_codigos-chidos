import 'package:flutter/material.dart';

class LettersDragPagePapa extends StatefulWidget {
  const LettersDragPagePapa({super.key});

  @override
  State<LettersDragPagePapa> createState() => _LettersDragPageState();
}

class _LettersDragPageState extends State<LettersDragPagePapa> {
  String word = "papa";

  Map<int, String> selected = {};
  Map<int, String> clear = {};

  bool? isCorrect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 200),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: word
                    .split('')
                    .asMap()
                    .map(
                      (key, char) => MapEntry(
                        key,
                        DragTarget<Map<int, String>>(
                          onAccept: (data) {
                            try {
                              setState(() {
                                selected[key] = data.values.first;
                                clear[data.keys.first] = data.values.first;
                              });
                              if (selected.length == word.length) {
                                List<String> ans = [];
                                for (int i = 0; i < selected.keys.length; i++) {
                                  ans.add(selected[i] ?? "");
                                }
                                setState(() {
                                  isCorrect = ans.join('') == word;
                                });
                              }
                            } catch (e) {
                              // print("Something went wrong!");
                            }
                          },
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              child: Text(
                                selected[key] ?? "",
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: word
                    .split('')
                    .asMap()
                    .map(
                      (key, char) => MapEntry(
                        key,
                        IgnorePointer(
                          ignoring: clear[key] == null ? false : true,
                          child: Draggable<Map<int, String>>(
                            data: {key: char},
                            childWhenDragging: const SizedBox(
                              height: 50,
                              width: 50,
                            ),
                            feedback: Material(
                              color: Colors.transparent,
                              child: Text(
                                char,
                                style: const TextStyle(
                                  fontSize: 130,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              child: Text(
                                clear[key] == null ? char : "",
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
              const SizedBox(height: 50),
              if (isCorrect == true)
                Column(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 120,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selected.clear();
                          clear.clear();
                          isCorrect = null;
                        });
                      },
                      child: const Text("Replay"),
                    ),
                  ],
                ),
              if (isCorrect == false)
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 48,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selected.clear();
                          clear.clear();
                          isCorrect = null;
                        });
                      },
                      child: const Text("Replay"),
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

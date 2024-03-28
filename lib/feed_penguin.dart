
import 'package:fedd_animals/feed.dart';
import 'package:flutter/material.dart';

class CountAndFeedPage extends StatefulWidget {
  const CountAndFeedPage({super.key});

  @override
  State<CountAndFeedPage> createState() => _CountAndFeedPageState();
}

class _CountAndFeedPageState extends State<CountAndFeedPage> {
  List<Feed> feeded = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count and Feed"),
      ),
      // backgroundColor: Colors.grey.shade600,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Count and Feed",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  for (int i = 0; i < 4; i++)
                    IgnorePointer(
                      ignoring: feeded.contains(feeds[i]),
                      child: Draggable<Feed>(
                        data: feeds[i],
                        feedback: Material(
                          child: Image.asset(
                            feeds[i].img,
                            width: 60,
                            height: 80,
                          ),
                        ),
                        child: SizedBox(
                          width: 60,
                          height: 80,
                          child: feeded.contains(feeds[i])
                              ? null
                              : Image.asset(
                                  feeds[i].img,
                                ),
                        ),
                      ),
                    ),
                ],
              ),
              Column(
                children: [
                  DragTarget<Feed>(
                    onAccept: (data) {
                      setState(() {
                        feeded.add(data);
                      });
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Image.asset(
                        "assets/feed/shark.jpeg",
                        height: 220,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      for (int i = 8; i < 10; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IgnorePointer(
                            ignoring: feeded.contains(feeds[i]),
                            child: Draggable<Feed>(
                              data: feeds[i],
                              feedback: Material(
                                child: Image.asset(
                                  feeds[i].img,
                                  width: 60,
                                  height: 80,
                                ),
                              ),
                              child: SizedBox(
                                width: 60,
                                height: 80,
                                child: feeded.contains(feeds[i])
                                    ? null
                                    : Image.asset(
                                        feeds[i].img,
                                      ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  for (int i = 4; i < 8; i++)
                    IgnorePointer(
                      ignoring: feeded.contains(feeds[i]),
                      child: Draggable<Feed>(
                        data: feeds[i],
                        feedback: Material(
                          child: Image.asset(
                            feeds[i].img,
                            width: 60,
                            height: 80,
                          ),
                        ),
                        child: SizedBox(
                          width: 60,
                          height: 80,
                          child: feeded.contains(feeds[i])
                              ? null
                              : Image.asset(
                                  feeds[i].img,
                                ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 12,
                color: Colors.red.shade700,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              feeded.isEmpty ? "" : feeded.length.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.purple.shade800,
              ),
            ),
          ),
          const SizedBox(height: 40),
          if (feeded.length == feeds.length)
            TextButton(
              onPressed: () {
                setState(() {
                  feeded.clear();
                });
              },
              child: const Text("Replay"),
            )
        ],
      ),
    );
  }
}
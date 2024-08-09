import 'package:flutter/material.dart';
import 'package:flashcard_quizzapp/flashcard.dart';
import 'package:flashcard_quizzapp/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Flashcard> _flashcards = [
    Flashcard(
      question: "What is a Data Structure?",
      answer:
          "A data structure is a storage format that defines the way data is stored, organized, and manipulated.Some popular data structures are Arrays, Trees, and Graphs.",
    ),
    Flashcard(
      question: "What language does flutter uses?",
      answer: "Dart",
    ),
    Flashcard(question: "What language does React uses?", answer: "JavaScript"),
    Flashcard(
        question: "What language does Angular uses?", answer: "JavaScript"),
    Flashcard(
        question: "What language does Electron uses?", answer: "JavaScript"),
    Flashcard(
        question: "What language does React Native uses?",
        answer: "JavaScript"),
    Flashcard(
        question: "What is an Array?",
        answer:
            "An array is commonly referred to as a collection of items stored at contiguous memory locations.Items stored are of the same type.It organizes data so that a related set of values can be easily sorted or searched."),
  ];
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flashcard Quiz App"),
          backgroundColor: Colors.tealAccent,
        ),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: FlipCard(
                    front:
                        FlashCardView(text: _flashcards[_currIndex].question),
                    back: FlashCardView(text: _flashcards[_currIndex].answer),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: previousCard,
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          const BorderSide(
                              color: Colors.tealAccent,
                              width: 1.0,
                              style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: const Text('Prev'),
                    ),
                    OutlinedButton(
                      onPressed: nextCard,
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          const BorderSide(
                              color: Colors.tealAccent,
                              width: 1.0,
                              style: BorderStyle.solid
                          ),
                        ),
                      ),
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void nextCard() {
    setState(() {
      _currIndex = (_currIndex + 1 < _flashcards.length) ? _currIndex + 1 : 0;
    });
  }

  void previousCard() {
    setState(() {
      _currIndex =
          (_currIndex - 1 >= 0) ? _currIndex - 1 : _flashcards.length - 1;
    });
  }
}

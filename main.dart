
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(WolfsApp());
}

class WolfsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holden Wolfs DZ',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> roles = [
    "ذئب",
    "مواطن",
    "طبيب",
    "عراف",
    "صياد"
  ];

  List<String> remaining = [];
  String result = "اضغط لبدء القرعة";

  @override
  void initState() {
    super.initState();
    remaining = List.from(roles);
  }

  void pickRole() {
    if (remaining.isEmpty) {
      setState(() {
        result = "انتهت القرعة 🐺";
      });
      return;
    }

    final random = Random();
    int index = random.nextInt(remaining.length);

    setState(() {
      result = remaining[index];
      remaining.removeAt(index);
    });
  }

  void reset() {
    setState(() {
      remaining = List.from(roles);
      result = "تم إعادة التهيئة";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: pickRole,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Holden Wolfs DZ",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 50),
              Text(
                result,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: reset,
                child: Text("إعادة القرعة"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

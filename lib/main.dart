import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanberapp66/config/theme/theme_data.dart';
import 'package:sanberapp66/pages/auth/getstarted/get_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: GetStartedPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print('Direbuild Ulang');

    return Scaffold(
        appBar: AppBar(
          title: Text('Counter Page'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    counter--;
                    setState(() {});
                  },
                  child: Icon(Icons.remove)),
              SizedBox(width: 10),
              Text('Nilai Counter $counter'),
              SizedBox(width: 10),
              InkWell(
                  onTap: () {
                    counter++;
                    setState(() {});
                  },
                  child: Icon(Icons.add)),
            ],
          ),
        ));
  }
}

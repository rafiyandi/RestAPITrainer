import 'package:flutter/material.dart';
import 'package:sanberapp66/pages/navigation/page_dua.dart';

//Get Started => Login => News Page
class PageEmpat extends StatelessWidget {
  const PageEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Empat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('<==== Back Page')),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PageDua(),
                  //   ),
                  //   (route) => false,
                  // );
                },
                child: Text('Reset =====>>'))
          ],
        ),
      ),
    );
  }
}

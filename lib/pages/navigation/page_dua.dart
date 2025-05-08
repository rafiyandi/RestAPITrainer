import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page_tiga.dart';

class PageDua extends StatelessWidget {
  const PageDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Dua'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('<==== Back Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageTiga(),
                      ));
                },
                child: Text('Next Counter =====>>'))
          ],
        ),
      ),
    );
  }
}

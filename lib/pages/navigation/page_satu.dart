import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberapp66/main.dart';
import 'package:sanberapp66/pages/navigation/page_dua.dart';

//Counter=>Page Satu => PageDua => PageTiga => PageEmpat
class PageSatu extends StatelessWidget {
  const PageSatu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Satu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => CounterPage(),
                  //     ));
                  Get.to(() => CounterPage());
                },
                child: Text('Counter ==>')),
            // SizedBox(height: 60),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => PageDua(),
            //           ));
            //     },
            //     child: Text('USer ==>'))
          ],
        ),
      ),
    );
  }
}

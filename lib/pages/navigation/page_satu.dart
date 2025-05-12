import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberapp66/main.dart';
import 'package:sanberapp66/pages/navigation/page_dua.dart';
import 'package:sanberapp66/routes/app_routes_named.dart';

import '../../controller/counter_controller.dart';

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
                  Get.toNamed(AppRoutesNamed.pageUsers);
                },
                child: Text('User ==>')),
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

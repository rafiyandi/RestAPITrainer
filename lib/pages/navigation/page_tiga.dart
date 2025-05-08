import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sanberapp66/controller/counter_controller.dart';

import 'page_empat.dart';

class PageTiga extends StatelessWidget {
  const PageTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Tiga'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(builder: (controller) {
              return Text('Nilai Counter ${controller.counter}');
            }),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('<==== Back Page')),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => PageEmpat(),
            //           ));
            //     },
            //     child: Text('Next Page Empat =====>>'))
          ],
        ),
      ),
    );
  }
}

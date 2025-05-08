import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanberapp66/config/navigation/navigation_service.dart';
import 'package:sanberapp66/config/theme/theme_data.dart';
import 'package:sanberapp66/controller/counter_controller.dart';
import 'package:sanberapp66/firebase_options.dart';
import 'package:sanberapp66/pages/auth/getstarted/get_started_page.dart';
import 'package:sanberapp66/pages/cart/cart_page.dart';
import 'package:sanberapp66/pages/navigation/page_dua.dart';
import 'package:sanberapp66/pages/navigation/page_satu.dart';
import 'package:sanberapp66/pages/profile/user_profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      theme: themeData,
      home: CartPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counterC = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      counterC.decrement();
                    },
                    child: Icon(Icons.remove)),
                SizedBox(width: 10),
                // Obx(() {
                //   print('Counter Pertama');
                //   return Text('Nilai Counter ${counterC.counter.value}');
                // }),
                GetBuilder(
                  id: 'countersatu',
                  init: counterC,
                  builder: (_) {
                    print('Counter Pertama');
                    return Text('Nilai Counter Pertama ${counterC.counter}');
                  },
                ),
                SizedBox(width: 10),
                InkWell(
                    onTap: () {
                      counterC.increment();
                    },
                    child: Icon(Icons.add)),
              ],
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      counterC.decrementKedua();
                    },
                    child: Icon(Icons.remove)),
                SizedBox(width: 10),
                // Obx(() {
                //   print('Counter Kedua');
                //   return Text('Nilai Counter ${counterC.counter.value}');
                // }),
                GetBuilder(
                  id: 'counterkedua',
                  init: counterC,
                  builder: (_) {
                    print('Counter Kedua');
                    return Text('Nilai Counter Kedua ${counterC.counter}');
                  },
                ),
                SizedBox(width: 10),
                InkWell(
                    onTap: () {
                      counterC.incrementKedua();
                    },
                    child: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageDua(),
              ));
        },
        child: Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}

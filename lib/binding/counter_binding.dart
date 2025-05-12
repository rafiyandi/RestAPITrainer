import 'package:get/get.dart';
import 'package:sanberapp66/controller/counter_controller.dart';

class CounterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
  }
}

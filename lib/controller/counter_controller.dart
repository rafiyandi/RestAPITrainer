import 'package:get/get.dart';

class CounterController extends GetxController {
  // var counter = 0.obs;

  // void increment() => counter.value++;
  // void decrement() => counter.value--;

  // void incrementKedua() => counter.value++;
  // void decrementKedua() => counter.value--;

  var counter = 0;
  void increment() {
    counter++;
    update(['countersatu']);
  }

  void decrement() {
    counter--;
    update(['countersatu']);
  }

  void incrementKedua() {
    counter++;
    update(['counterkedua']);
  }

  void decrementKedua() {
    counter--;
    update(['counterkedua']);
  }
}

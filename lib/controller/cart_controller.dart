import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/cart_model.dart';

class CartController extends GetxController {
  List<CartModel> carts = [
    CartModel(
        urlImage:
            'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/MTA-143071668/indomie_indomie_goreng_special_mie_instan_85_g_full03_l27r5qre.png',
        name: 'Indomie',
        price: 2500,
        qty: 1),
    CartModel(
        urlImage:
            'https://mcgrocer.com/cdn/shop/files/fanta-orange-2l-41391296839918.jpg?v=1740122203',
        name: 'Fanta',
        price: 5000,
        qty: 1),
    CartModel(
        urlImage:
            'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//105/MTA-11798960/fox-s_fox-s_fruits_permen_rejuvenate_-90_g-_bag-_full01_eoltiiap.jpg',
        name: 'Fox',
        price: 9000,
        qty: 1),
    CartModel(
        urlImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs4RJXut9k4jzGYH4Qi75irdmXuREzdEn0aQ&s',
        name: 'Kapal Api',
        price: 6000,
        qty: 1),
  ];

  int totalPayment = 0;
  void increment(int index) {
    carts[index].qty++;
    calculateTotalPayment();
    update();
  }

  void decrement(int index) {
    carts[index].qty--;
    calculateTotalPayment();

    update();
  }

  calculateTotalPayment() {
    for (var element in carts) {
      totalPayment += element.price * element.qty;
    }
  }
}

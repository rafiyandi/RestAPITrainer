import 'package:get/get.dart';
import 'package:sanberapp66/binding/counter_binding.dart';
import 'package:sanberapp66/binding/users_binding.dart';
import 'package:sanberapp66/main.dart';
import 'package:sanberapp66/pages/navigation/page_dua.dart';
import 'package:sanberapp66/pages/navigation/page_satu.dart';
import 'package:sanberapp66/pages/profile/user_profile_page.dart';
import 'package:sanberapp66/routes/app_routes_named.dart';

class AppPages {
  static final appRoutes = [
    GetPage(name: AppRoutesNamed.initialPage, page: () => PageSatu()),
    GetPage(
        name: AppRoutesNamed.counter,
        page: () => CounterPage(),
        bindings: [CounterBinding()]),
    GetPage(name: AppRoutesNamed.pageDua, page: () => PageDua()),
    GetPage(
        name: AppRoutesNamed.pageUsers,
        page: () => UserProfilePage(),
        binding: UsersBinding()),
  ];
}

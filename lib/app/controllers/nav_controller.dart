import 'package:get/get.dart';
import '../routes/app_pages.dart';

class NavController extends GetxController {
  var currentRoute = AppPages.home.obs;

  void navigateTo(String routeName) {
    if (currentRoute.value == routeName) return; // avoid reload same page
    currentRoute.value = routeName;
    // Use named routing but replace the current route to avoid stacking many pages
    // when navigating via bottom navigation or drawer.
    // Get.offNamed will remove the previous route and push the new one.
    Get.offNamed(routeName);
  }
}

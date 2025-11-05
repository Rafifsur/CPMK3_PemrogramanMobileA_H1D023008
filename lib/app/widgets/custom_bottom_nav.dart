import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';
import '../routes/app_pages.dart';

class CustomBottomNav extends StatelessWidget {
  final NavController navController = Get.find<NavController>();
  CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex:
            _getCurrentIndex(navController.currentRoute.value),
        onTap: (index) {
          final route = _getRouteFromIndex(index);
          navController.navigateTo(route);
        },
        elevation: 8,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'Widget Dasar'),
          BottomNavigationBarItem(icon: Icon(Icons.sync_alt), label: 'State Management'),
          BottomNavigationBarItem(icon: Icon(Icons.navigation), label: 'Routing'),
          BottomNavigationBarItem(icon: Icon(Icons.get_app), label: 'Tentang GetX'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: 'Contact'),
        ],
      );
    });
  }

  // Fungsi bantu untuk menandai menu aktif berdasarkan route
  int _getCurrentIndex(String route) {
    switch (route) {
      case AppPages.widgetBasic:
        return 1;
      case AppPages.stateManagement:
        return 2;
      case AppPages.routingNavigation:
        return 3;
      case AppPages.aboutGetX:
        return 4;
      case AppPages.contact:
        return 5;
      default:
        return 0;
    }
  }

  // Map index to route
  String _getRouteFromIndex(int index) {
    switch (index) {
      case 1:
        return AppPages.widgetBasic;
      case 2:
        return AppPages.stateManagement;
      case 3:
        return AppPages.routingNavigation;
      case 4:
        return AppPages.aboutGetX;
      case 5:
        return AppPages.contact;
      default:
        return AppPages.home;
    }
  }
}

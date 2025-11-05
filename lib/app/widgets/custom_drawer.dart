import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';
import '../routes/app_pages.dart';
import 'app_logo.dart';

class CustomDrawer extends StatelessWidget {
  final NavController navController = Get.find<NavController>();
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blueAccent, Colors.lightBlueAccent]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white24,
                  child: ClipOval(
                    child: SizedBox(width: 32, height: 32, child: AppLogo(size: 32)),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Tutorial Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('Panduan singkat + GetX', style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ), // DrawerHeader
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              navController.navigateTo(AppPages.home);
              Get.back(); // close drawer
            },
          ), // ListTile
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Widget Dasar'),
            onTap: () {
              navController.navigateTo(AppPages.widgetBasic);
              Get.back();
            },
          ), // ListTile
          ListTile(
            leading: const Icon(Icons.sync_alt),
            title: const Text('State Management'),
            onTap: () {
              navController.navigateTo(AppPages.stateManagement);
              Get.back();
            },
          ), // ListTile
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Routing & Navigasi'),
            onTap: () {
              navController.navigateTo(AppPages.routingNavigation);
              Get.back();
            },
          ), // ListTile
          ListTile(
            leading: const Icon(Icons.get_app),
            title: const Text('Tentang GetX'),
            onTap: () {
              navController.navigateTo(AppPages.aboutGetX);
              Get.back();
            },
          ), // ListTile
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Contact'),
            onTap: () {
              navController.navigateTo(AppPages.contact);
              Get.back();
            },
          ), // ListTile
        ],
      ), // ListView
    ); // Drawer
  }
}

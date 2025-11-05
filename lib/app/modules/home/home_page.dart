import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/banner_image.dart';
import '../../widgets/module_header.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/feature_grid.dart';
import '../../controllers/nav_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.find<NavController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial Flutter Dasar'),
        backgroundColor: Colors.blueAccent,
      ),
  drawer: CustomDrawer(),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          // Standardized module header
          ModuleHeader(
            title: 'Tutorial Flutter + GetX',
            subtitle: 'Panduan praktis Paket 8: widget, state, dan routing',
            leading: const AppLogo(size: 36),
          ),

          const SizedBox(height: 12),

          // Hero / featured photo (developer + workflow illustration)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BannerImage(
              url: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=1200&auto=format&fit=crop&q=80',
              height: 160,
              semanticLabel: 'Ilustrasi pengembangan aplikasi dan workflow',
              title: 'Tutorial Flutter + GetX',
            ),
          ),

          const SizedBox(height: 14),

          // Ringkasan detail
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Apa yang akan kamu pelajari?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Di dalam paket ini kamu akan mempelajari konsep-konsep inti untuk membuat aplikasi Flutter sederhana dan mengelola state serta navigasi menggunakan GetX.'),
                    SizedBox(height: 6),
                    Text('Tujuan pembelajaran:', style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 6),
                    Text('''• Mengerti widget dasar Flutter
• Memahami perbedaan Stateful vs Stateless
• Mengimplementasikan state sederhana (setState) dan reaktif dengan GetX
• Menyusun routing & navigasi menggunakan Get.toNamed
• Memahami fitur utama GetX: state, routing, dependency injection
• Membangun UI sederhana dan project mini sebagai latihan'''),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Materi (ListTile navigation)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.widgets, color: Colors.blueAccent),
                    title: const Text('Widget Dasar'),
                    subtitle: const Text('Text, Row, Column, Container, Image, Icon'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => navController.navigateTo(AppPages.widgetBasic),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.sync_alt, color: Colors.blueAccent),
                    title: const Text('State Management'),
                    subtitle: const Text('setState, pendekatan reaktif & GetX'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => navController.navigateTo(AppPages.stateManagement),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.navigation, color: Colors.blueAccent),
                    title: const Text('Routing & Navigasi'),
                    subtitle: const Text('Get.to / Get.toNamed / struktur route'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => navController.navigateTo(AppPages.routingNavigation),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.get_app, color: Colors.blueAccent),
                    title: const Text('Tentang GetX'),
                    subtitle: const Text('Fitur utama: state, routing, dependency injection'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => navController.navigateTo(AppPages.aboutGetX),
                  ),
                  // 'Praktik' entry removed as requested
                ],
              ),
            ),
          ),

          const SizedBox(height: 6),

          // Galeri singkat dari topik utama
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Galeri Topik', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                FeatureGrid(items: [
                  FeatureItem(icon: Icons.widgets, label: 'Widget Dasar', color: Color(0xFFffe082)),
                  FeatureItem(icon: Icons.sync_alt, label: 'State Management', color: Color(0xFFb3e5fc)),
                  FeatureItem(icon: Icons.navigation, label: 'Routing', color: Color(0xFFc8e6c9)),
                  FeatureItem(icon: Icons.get_app, label: 'Tentang GetX', color: Color(0xFFffccbc)),
                  FeatureItem(icon: Icons.contact_mail, label: 'Contact', color: Color(0xFFf0f4c3)),
                ]),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => navController.navigateTo(AppPages.contact),
                  icon: const Icon(Icons.contact_mail),
                  label: const Text('Hubungi Pengembang'),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ],
      ),
  bottomNavigationBar: CustomBottomNav(),
    );
  }
}

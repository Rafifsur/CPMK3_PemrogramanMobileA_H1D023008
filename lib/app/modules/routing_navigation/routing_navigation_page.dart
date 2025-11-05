import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/banner_image.dart';
import '../../widgets/module_header.dart';
import '../../widgets/feature_grid.dart';
import '../../routes/app_pages.dart';

class RoutingNavigationPage extends StatelessWidget {
  const RoutingNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing & Navigasi'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: CustomDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          ModuleHeader(
            title: 'Routing & Navigasi',
            subtitle: 'Get.to, Get.toNamed, dan struktur route yang rapi',
            icon: Icons.navigation,
          ),
          // Illustrative banner for Routing & Navigasi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BannerImage(
              url: 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200&auto=format&fit=crop&q=80',
              height: 150,
              semanticLabel: 'Ilustrasi navigasi dan routing',
              title: 'Routing & Navigasi',
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Navigasi dasar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 8),
                Text('Untuk berpindah halaman menggunakan GetX, Anda bisa menggunakan Get.to(NextPage()) untuk navigasi langsung atau Get.toNamed("/routeName") untuk menggunakan nama route.', style: TextStyle(fontSize: 14)),
                SizedBox(height: 12),
                Text('Contoh Get.toNamed', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 8),
                Text('''
Get.toNamed('/widget-basic');
Get.back();
''', style: TextStyle(fontFamily: 'monospace')),
                SizedBox(height: 12),
                Text('Coba Navigasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 8),
                // The following button demonstrates navigation using named routes
                _NavExampleCard(),
                const SizedBox(height: 16),
                const Text('Galeri Topik', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                FeatureGrid(items: [
                  FeatureItem(icon: Icons.call_made, label: 'Get.to', color: Color(0xFFffe082)),
                  FeatureItem(icon: Icons.link, label: 'Named', color: Color(0xFFb3e5fc)),
                  FeatureItem(icon: Icons.arrow_back, label: 'Back', color: Color(0xFFc8e6c9)),
                  FeatureItem(icon: Icons.message, label: 'Arguments', color: Color(0xFFffccbc)),
                  FeatureItem(icon: Icons.folder, label: 'Organize', color: Color(0xFFd1c4e9)),
                  FeatureItem(icon: Icons.security, label: 'Middleware', color: Color(0xFFf0f4c3)),
                ]),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

class _NavExampleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(child: Text('Tekan tombol untuk berpindah ke halaman Widget Dasar menggunakan Get.toNamed.')),
            ElevatedButton(
              onPressed: () => Get.toNamed(AppPages.widgetBasic),
              child: const Text('Coba'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/banner_image.dart';
import '../../widgets/module_header.dart';
import '../../widgets/feature_grid.dart';

class AboutGetXPage extends StatelessWidget {
  const AboutGetXPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang GetX'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: CustomDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
        ModuleHeader(
          title: 'Tentang GetX',
          subtitle: 'State, routing, dan dependency injection yang ringkas',
          icon: Icons.get_app,
        ),
          // Illustrative banner for About GetX
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BannerImage(
              url: 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=1200&auto=format&fit=crop&q=80',
              height: 150,
              semanticLabel: 'Ilustrasi coding dan GetX',
              title: 'Tentang GetX',
            ),
          ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text('Mengapa memilih GetX?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 8),
                Text('• Ringan dan mudah dipelajari\n• Reactive programming mudah dengan obs & Obx\n• Routing sederhana tanpa boilerplate\n• Dependency management built-in (Get.put/Get.find)', style: TextStyle(fontSize: 14)),
                SizedBox(height: 12),
                Text('Contoh singkat (Rx)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 8),
                Text('''
final count = 0.obs;
void increment() => count.value++;
Obx(() => Text('\${count.value}'));
''', style: TextStyle(fontFamily: 'monospace')),
              SizedBox(height: 12),
              const Text('Galeri Topik', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              FeatureGrid(items: [
                FeatureItem(icon: Icons.sports_martial_arts, label: 'State', color: Color(0xFFffe082)),
                FeatureItem(icon: Icons.route, label: 'Routing', color: Color(0xFFb3e5fc)),
                FeatureItem(icon: Icons.inbox, label: 'Dependency', color: Color(0xFFc8e6c9)),
                FeatureItem(icon: Icons.lock, label: 'Bindings', color: Color(0xFFffccbc)),
                FeatureItem(icon: Icons.rule, label: 'Structure', color: Color(0xFFd1c4e9)),
                FeatureItem(icon: Icons.thumb_up, label: 'Best Practices', color: Color(0xFFf0f4c3)),
              ]),
                SizedBox(height: 12),
                Text('Best practices singkat', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 8),
                Text('• Pisahkan logic ke Controller\n• Gunakan obs untuk state yang sering berubah\n• Hindari penggunaan global yang berlebihan\n• Gunakan route names untuk organisasi', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

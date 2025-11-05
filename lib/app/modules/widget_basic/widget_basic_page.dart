import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/banner_image.dart';
import '../../routes/app_pages.dart';

class WidgetBasicPage extends StatelessWidget {
  const WidgetBasicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Dasar'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: CustomDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue.shade600, Colors.blueAccent.shade700]),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0,2))],
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.widgets, size: 36, color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Widget Dasar', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                const Text('Pelajari widget-widget fundamental Flutter dan cara menyusunnya untuk membuat UI yang rapi dan responsif.', style: TextStyle(fontSize: 14, color: Colors.white70)),
              ],
            ),
          ),

          // Illustrative banner for Widget Dasar (UI mockups / components)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BannerImage(
              url: 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=1200&auto=format&fit=crop&q=80',
              height: 160,
              semanticLabel: 'Ilustrasi komponen UI dan mockup',
              title: 'Widget Dasar',
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Galeri Widget', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(child: _FeatureCard(icon: Icons.text_fields, label: 'Text', color: Color(0xFFffe082))),
                    SizedBox(width: 8),
                    Expanded(child: _FeatureCard(icon: Icons.view_column, label: 'Row/Column', color: Color(0xFFb3e5fc))),
                    SizedBox(width: 8),
                    Expanded(child: _FeatureCard(icon: Icons.crop_square, label: 'Container', color: Color(0xFFc8e6c9))),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Expanded(child: _FeatureCard(icon: Icons.image, label: 'Image', color: Color(0xFFffccbc))),
                    SizedBox(width: 8),
                    Expanded(child: _FeatureCard(icon: Icons.image_not_supported, label: 'Icon', color: Color(0xFFd1c4e9))),
                    SizedBox(width: 8),
                    Expanded(child: _FeatureCard(icon: Icons.layers, label: 'Stack', color: Color(0xFFf0f4c3))),
                  ],
                ),

                const SizedBox(height: 18),
                const Text('Contoh singkat', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                const Text('''
Container(
  padding: EdgeInsets.all(12),
  child: Row(
    children: [
      Icon(Icons.star, color: Colors.orange),
      SizedBox(width: 8),
      Text('Row dengan Icon dan Text'),
    ],
  ),
)
''', style: TextStyle(fontFamily: 'monospace')),

                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed(AppPages.widgetBasic),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Coba Buat Layout Sederhana'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  const _FeatureCard({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final bg = color ?? Colors.blueAccent.shade100;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
              child: Icon(icon, size: 22, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

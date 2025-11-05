import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/banner_image.dart';
import '../../widgets/module_header.dart';
import '../../widgets/feature_grid.dart';

// Simple GetX controller for demo
class CountController extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;
  void reset() => count.value = 0;
}

class StateManagementPage extends StatelessWidget {
  const StateManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: CustomDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          ModuleHeader(
            title: 'State Management',
            subtitle: 'setState, reaktif dengan GetX, dan praktik terbaik',
            icon: Icons.sync_alt,
          ),
          // Illustrative banner for State Management
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BannerImage(
              url: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=1200&auto=format&fit=crop&q=80',
              height: 150,
              semanticLabel: 'Ilustrasi state management',
              title: 'State Management',
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Stateless vs Stateful', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                const Text('StatelessWidget tidak menyimpan state yang berubah, sedangkan StatefulWidget menyimpan state di State<> yang dapat diperbarui dengan setState().', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 12),
                const Text('Contoh setState (Demo Interaktif)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                const Text('Di bawah ini contoh singkat Counter menggunakan setState. Coba tekan tombol + untuk melihat perubahan.', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 10),
                const CounterSetState(),
                const SizedBox(height: 16),
                const Text('Pengantar GetX (Demo Reaktif)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                const Text('GetX menyediakan pendekatan reaktif menggunakan Rx types dan controller. Contoh: CountController dengan Obx akan otomatis memperbarui UI saat data berubah.', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 10),
                _GetXCounterDemo(),
                const SizedBox(height: 18),
                const Text('Galeri Topik', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                FeatureGrid(items: [
                  FeatureItem(icon: Icons.flash_on, label: 'setState', color: Color(0xFFffe082)),
                  FeatureItem(icon: Icons.autorenew, label: 'Reactive (obs)', color: Color(0xFFb3e5fc)),
                  FeatureItem(icon: Icons.account_tree, label: 'Architecture', color: Color(0xFFc8e6c9)),
                  FeatureItem(icon: Icons.sync, label: 'Bindings', color: Color(0xFFffccbc)),
                  FeatureItem(icon: Icons.widgets, label: 'Praktik', color: Color(0xFFd1c4e9)),
                  FeatureItem(icon: Icons.check_circle, label: 'Testing', color: Color(0xFFf0f4c3)),
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

// Small stateful counter using setState
class CounterSetState extends StatefulWidget {
  const CounterSetState({super.key});
  @override
  State<CounterSetState> createState() => _CounterSetStateState();
}

class _CounterSetStateState extends State<CounterSetState> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('setState Counter: $_count', style: const TextStyle(fontSize: 16)),
            Row(
              children: [
                IconButton(icon: const Icon(Icons.remove), onPressed: () => setState(() => _count = (_count > 0 ? _count - 1 : 0))),
                IconButton(icon: const Icon(Icons.add), onPressed: () => setState(() => _count++)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Small GetX reactive demo
class _GetXCounterDemo extends StatelessWidget {
  const _GetXCounterDemo();
  @override
  Widget build(BuildContext context) {
    final CountController c = Get.put(CountController());
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text('GetX Counter: ${c.count.value}', style: const TextStyle(fontSize: 16))),
            Row(
              children: [
                IconButton(icon: const Icon(Icons.refresh), onPressed: c.reset),
                IconButton(icon: const Icon(Icons.add), onPressed: c.increment),
              ],
            )
          ],
        ),
      ),
    );
  }
}

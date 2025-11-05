import 'package:flutter/material.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_bottom_nav.dart';

class AboutPage extends StatelessWidget {
	const AboutPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Tentang Aplikasi'),
				backgroundColor: Colors.blueAccent,
			),
			drawer: CustomDrawer(),
			body: Padding(
				padding: const EdgeInsets.all(20.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: const [
						Center(
							child: Icon(Icons.info_outline, size: 96, color: Colors.blueAccent),
						),
						SizedBox(height: 16),
						Text(
							'Tentang Aplikasi',
							style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
						),
						SizedBox(height: 8),
						Text(
							'Aplikasi ini dibuat sebagai materi praktek menggunakan Flutter dan GetX. Berisi modul pengantar, widget dasar, manajemen state, dan routing.',
							style: TextStyle(fontSize: 16),
						),
						SizedBox(height: 12),
						Text(
							'Dibuat oleh: Rafif Surya Murtadha\nNIM: H1D023008',
							style: TextStyle(fontSize: 14),
						),
					],
				),
			),
			bottomNavigationBar: CustomBottomNav(),
		);
	}
}

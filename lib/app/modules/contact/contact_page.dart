import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/banner_image.dart';
import '../../widgets/module_header.dart';

class ContactPage extends StatelessWidget {
	const ContactPage({super.key});

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				appBar: AppBar(
					title: const Text('Contact'),
					backgroundColor: Colors.blueAccent,
				),
				drawer: CustomDrawer(),
				body: ListView(
					padding: const EdgeInsets.symmetric(vertical: 12),
					children: [
						ModuleHeader(
							title: 'Kontak & Kontribusi',
							subtitle: 'Hubungi jika ingin bertanya',
							icon: Icons.contact_mail,
						),
						Padding(
							padding: const EdgeInsets.symmetric(horizontal: 16.0),
							child: BannerImage(
								url: 'https://images.unsplash.com/photo-1543269865-cbf427effbad?w=1200&auto=format&fit=crop&q=80',
								height: 120,
								semanticLabel: 'Ilustrasi kontak dan komunikasi',
								title: 'Kontak & Kontribusi',
							),
						),
						const SizedBox(height: 16),
						Padding(
							padding: const EdgeInsets.symmetric(horizontal: 16.0),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									const Text('Hubungi', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
									const SizedBox(height: 8),
									const Text('Email: rafifsuryamurtadha99@gmail.com', style: TextStyle(fontSize: 16)),
									const SizedBox(height: 6),
									const Text('Telepon: +62 821-3591-2367', style: TextStyle(fontSize: 16)),
									const SizedBox(height: 16),
									Row(
										children: [
											ElevatedButton.icon(
												onPressed: () async {
													await Clipboard.setData(const ClipboardData(text: 'rafifsuryamurtadha99@gmail.com'));
													Get.snackbar('Sukses', 'Email disalin ke clipboard');
												},
												icon: const Icon(Icons.copy),
												label: const Text('Salin Email'),
											),
											const SizedBox(width: 12),
											ElevatedButton.icon(
												onPressed: () async {
													await Clipboard.setData(const ClipboardData(text: '+6282135912367'));
													Get.snackbar('Sukses', 'Nomor telepon disalin ke clipboard');
												},
												icon: const Icon(Icons.phone),
												label: const Text('Salin Telepon'),
											),
										],
									),
									
								],
							),
						),
					],
				),
				bottomNavigationBar: CustomBottomNav(),
			);
	}
}

import 'package:flutter/material.dart';

class FeatureItem {
  final IconData icon;
  final String label;
  final Color color;

  FeatureItem({required this.icon, required this.label, required this.color});
}

class FeatureGrid extends StatelessWidget {
  final List<FeatureItem> items;

  const FeatureGrid({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 2.4,
      children: items.map((it) {
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
                  decoration: BoxDecoration(color: it.color, shape: BoxShape.circle),
                  child: Icon(it.icon, size: 22, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(it.label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

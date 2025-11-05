import 'package:flutter/material.dart';

class BannerImage extends StatefulWidget {
  final String url;
  final double height;
  final String? semanticLabel;
  final String? title;
  const BannerImage({required this.url, this.height = 150, this.semanticLabel, this.title, super.key});

  @override
  State<BannerImage> createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  int _reload = 0;

  void _retry() {
    setState(() {
      _reload++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageKey = ValueKey('${widget.url}#$_reload');
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          // Image with fade-in and loading placeholder
          Image.network(
            widget.url,
            key: imageKey,
            height: widget.height,
            width: double.infinity,
            fit: BoxFit.cover,
            frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: child,
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: widget.height,
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              );
            },
            errorBuilder: (ctx, err, stack) => Container(
              height: widget.height,
              color: Colors.grey[200],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                    const SizedBox(height: 8),
                    const Text('Gambar tidak tersedia', style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 8),
                    TextButton(onPressed: _retry, child: const Text('Coba lagi')),
                  ],
                ),
              ),
            ),
            semanticLabel: widget.semanticLabel,
          ),

          // Gradient overlay + optional title
          if (widget.title != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.45)]),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                alignment: Alignment.bottomLeft,
                child: Text(widget.title!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
        ],
      ),
    );
  }
}

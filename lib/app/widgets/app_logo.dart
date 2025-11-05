import 'package:flutter/material.dart';

/// AppLogo tries to load a local asset `assets/images/flutter_logo.png` first.
/// If the asset is missing or fails to load, it falls back to the official
/// Flutter logo hosted online.
class AppLogo extends StatelessWidget {
  final double size;
  final String assetPath;
  final String fallbackUrl;

  const AppLogo({Key? key, this.size = 32, this.assetPath = 'assets/images/flutter_logo.png', this.fallbackUrl = 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        // fallback to network image if asset not available
        return Image.network(
          fallbackUrl,
          width: size,
          height: size,
          fit: BoxFit.contain,
          // show simple placeholder if network fails
          errorBuilder: (c, e, s) => Icon(Icons.flutter_dash, size: size, color: Colors.white),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hafiz_app/core/utils/image_assets.dart';

class NoInternectConnectionView extends StatelessWidget {
  const NoInternectConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(ImageAssets.noWifi),
    );
  }
}

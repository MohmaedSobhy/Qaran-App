import 'package:flutter/material.dart';
import 'package:hafiz_app/Feature/home/presentation/views/sura_screen_view_body.dart';

class SuraScreen extends StatelessWidget {
  final int suraId;
  const SuraScreen({super.key, required this.suraId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SuraScreenViewBody(
          suraId: suraId,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hafiz_app/Feature/home/presentation/views/app_bar_icon_button.dart';
import 'package:hafiz_app/core/extensions/context_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loaclization().appName),
        actions: const [
          AppBarIconButton(),
        ],
      ),
    );
  }
}

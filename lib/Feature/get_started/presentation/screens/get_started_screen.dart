import 'package:flutter/material.dart';
import 'package:hafiz_app/Feature/get_started/presentation/views/get_started_view_body.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.darkGreen,
        body: GetStartedViewBody(),
      ),
    );
  }
}

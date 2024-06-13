import 'package:flutter/material.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';
import 'package:hafiz_app/core/styles/color/app_text_style.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomeButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTextStyle.text18Black,
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.arrow_forward,
              color: AppColor.greenForest,
            )
          ],
        ),
      ),
    );
  }
}

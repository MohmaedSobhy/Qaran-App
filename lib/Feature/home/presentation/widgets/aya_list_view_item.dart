import 'package:flutter/material.dart';

class AyaListViewItem extends StatelessWidget {
  final String ayaText;
  const AyaListViewItem({super.key, required this.ayaText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, right: 10, left: 10),
      child: Text(
        ayaText,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              wordSpacing: 3,
            ),
      ),
    );
  }
}

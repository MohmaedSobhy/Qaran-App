import 'package:flutter/material.dart';

class PlayButtonIcon extends StatelessWidget {
  final VoidCallback onTap;
  const PlayButtonIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.play_circle,
        size: 30,
        color: Colors.green,
      ),
    );
  }
}

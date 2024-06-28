import 'package:flutter/material.dart';

class PauseButtonIcon extends StatelessWidget {
  final VoidCallback onTap;
  const PauseButtonIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.pause_circle,
        size: 30,
        color: Colors.green,
      ),
    );
    ;
  }
}

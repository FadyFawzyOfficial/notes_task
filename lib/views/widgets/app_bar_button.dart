import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  const AppBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: icon,
        ),
      ),
    );
  }
}

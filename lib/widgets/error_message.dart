import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Un error ha ocurrido."),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text("Recargar"),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomViewAllServicesButton extends StatelessWidget {
  final textButton;
  const CustomViewAllServicesButton({Key? key, required this.textButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF8CC63F), // Light green background color
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: const Color(0xFF5840ba), // Purple background color
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward, // Arrow icon
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            textButton,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

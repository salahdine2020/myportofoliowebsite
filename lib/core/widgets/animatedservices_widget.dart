import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedServiceText extends StatelessWidget {
  final List<String> services = [
    "Web Design",
    "App Design",
    "Dashboard",
    "Wireframe",
    "User Research",
  ];

  AnimatedServiceText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Services: ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: services.map((service) {
              return FadeAnimatedText(
                service,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
                duration: const Duration(seconds: 2),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onPortfolioPressed;
  final VoidCallback onHireMePressed;

  // Constructor to receive the callbacks
  ActionButtons({
    required this.onPortfolioPressed,
    required this.onHireMePressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonPadding = constraints.maxWidth > 600 ? 40 : 20;
        double iconSize = constraints.maxWidth > 600 ? 16 : 12;
        double textFontSize = constraints.maxWidth > 600 ? 18 : 16;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPortfolioButton(buttonPadding, iconSize, textFontSize),
            const SizedBox(width: 10),
            _buildHireMeButton(buttonPadding, textFontSize),
          ],
        );
      },
    );
  }

  Widget _buildPortfolioButton(double buttonPadding, double iconSize, double textFontSize) {
    return ElevatedButton(
      onPressed: onPortfolioPressed, // Use the callback here
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.symmetric(horizontal: buttonPadding, vertical: 18),
      ),
      child: Row(
        children: [
          Text(
            "Portfolio",
            style: TextStyle(
              color: Colors.white,
              fontSize: textFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.lightGreen,
            ),
            padding: const EdgeInsets.all(4),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHireMeButton(double buttonPadding, double textFontSize) {
    return OutlinedButton(
      onPressed: onHireMePressed, // Use the callback here
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        side: const BorderSide(color: Colors.black54, width: 2),
        padding: EdgeInsets.symmetric(horizontal: buttonPadding, vertical: 18),
      ),
      child: Text(
        "Hire Me",
        style: TextStyle(
          color: Colors.black54,
          fontSize: textFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

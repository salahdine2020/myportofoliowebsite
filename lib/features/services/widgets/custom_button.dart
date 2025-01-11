import 'package:flutter/material.dart';
// If you want to open PDF in browser or external app, include:
import 'package:url_launcher/url_launcher.dart';

class CustomViewAllServicesButton extends StatelessWidget {
  final String textButton;
  final String buttonType;         // e.g., "downloadcv"
  final VoidCallback? onTap;       // additional onTap actions
  // Adjust this to point to your PDF file or remote link:
  final String pdfUrl = 'https://drive.google.com/file/d/12Y3cjKhlKqQH4Ndje5j3CWHASq7A7NEZ/view?usp=drive_link';

  const CustomViewAllServicesButton({
    Key? key,
    required this.textButton,
    required this.buttonType,
    this.onTap,
  }) : super(key: key);

  Future<void> _launchPDF() async {
    // Example uses url_launcher to open the PDF in a browser or external PDF viewer:
    final uri = Uri.parse(pdfUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $pdfUrl';
    }
  }

  void _handleButtonTap() {
    // If there is an onTap callback, call it:
    onTap?.call();

    // If button type is "downloadcv", then launch PDF or handle your custom download flow:
    if (buttonType == "downloadcv") {
      _launchPDF();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleButtonTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF8CC63F),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFF5840ba),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward,
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
      ),
    );
  }
}

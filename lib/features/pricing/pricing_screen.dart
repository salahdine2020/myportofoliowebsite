import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';

import '../../core/utils/icons.dart';
import '../../core/widgets/backgroundtext.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key});

  get screenWidth => null;

  @override
  Widget build(BuildContext context) {
    // Get screen size info
    final width = MediaQuery.of(context).size.width;

    // Define breakpoints for responsiveness
    // You can adjust these based on your needs
    final bool isDesktop = width > 1100;
    final bool isTablet = width > 700 && width <= 1100;
    final bool isMobile = width <= 700;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          LargeBackgroundText(
            text: 'My Plans',
            top: 0,
            left: 0,
            fontSize: width * 0.1,
            color: Colors.black54,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final containerWidth = constraints.maxWidth;

              // Adjust font sizes and spacing based on container width
              final headingFontSize =
                  containerWidth * 0.04 > 32 ? 32 : containerWidth * 0.04;
              final subHeadingFontSize =
                  containerWidth * 0.02 > 16 ? 16 : containerWidth * 0.02;
              final cardPadding =
                  containerWidth * 0.02 > 20 ? 20.0 : containerWidth * 0.02;

              // Decide how many columns of cards to show
              // Desktop: 3 columns, Tablet: 2 columns, Mobile: 1 column
              int cardsPerRow = 3;
              if (isTablet) {
                cardsPerRow = 2;
              } else if (isMobile) {
                cardsPerRow = 1;
              }

              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    SizedBox(height: screenHeight * 0.1),
                    _buildSectionHeader(headingFontSize.toDouble(),
                        subHeadingFontSize.toDouble()),
                    SizedBox(height: screenHeight * 0.02),
                    // Pricing Cards
                    _buildResponsiveCardLayout(
                      cardPadding: cardPadding,
                      cardsPerRow: cardsPerRow,
                    ),
                    SizedBox(height: screenHeight * 0.24),
                    isMobile
                        ? const SizedBox()
                        : _buildFullWidthMarquee(context),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFullWidthMarquee(BuildContext context) {
    // Just ensure this container can take full width
    return Container(
      width: double.infinity, // ensures full width usage
      color: Colors.lightGreenAccent,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 30,
        child: Marquee(
          text:
              '    Web Design    ✦    App Design    ✦    Dashboard    ✦    Wireframe    ✦    User Research    ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          scrollAxis: Axis.horizontal,
          blankSpace: 50.0,
          velocity: 50.0,
          pauseAfterRound: const Duration(seconds: 1),
          startPadding: 10.0,
          accelerationDuration: const Duration(seconds: 1),
          decelerationDuration: const Duration(milliseconds: 500),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
      double headingFontSize, double subHeadingFontSize) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '— Pricing Table',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: subHeadingFontSize.clamp(14, 20),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'My ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: headingFontSize.clamp(28, 40),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Pricing Model',
                style: TextStyle(
                  color: const Color(0xFF6A1B9A),
                  fontSize: headingFontSize.clamp(28, 40),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveCardLayout({
    required double cardPadding,
    required int cardsPerRow,
  }) {
    // Create the cards
    final cards = [
      _buildCustomPlanCard(cardPadding),
      _buildHourlyPlanCard(cardPadding),
      _buildMonthlyPlanCard(cardPadding),
    ];

    // If only one card per row (mobile), just return a Column
    if (cardsPerRow == 1) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            cards[0],
            const SizedBox(height: 20),
            cards[1],
            const SizedBox(height: 20),
            cards[2],
          ],
        ),
      );
    }

    // If two cards per row (tablet), we can do a Wrap
    if (cardsPerRow == 2) {
      return Wrap(
        spacing: 20,
        runSpacing: 20,
        children:
            cards.map((card) => SizedBox(width: 400, child: card)).toList(),
      );
    }

    // If three cards per row (desktop), do a Row
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: cards[0]),
          const SizedBox(width: 20),
          Expanded(child: cards[1]),
          const SizedBox(width: 20),
          Expanded(child: cards[2]),
        ],
      ),
    );
  }

  Widget _buildCustomPlanCard(double padding) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hey! Need a Custom Plans?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            label: const Text(
              'Get Started',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyPlanCard(double padding) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: const Color(0xFF6A1B9A), // Purple background
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hourly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.string(
                  IconSvgs.upArrow,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$80',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '/ Hour',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildFeatureItem(
            'Lorem ipsum dolor sit amet',
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
          _buildFeatureItem(
            'Sed ut perspiciatis',
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
          _buildFeatureItem(
            'At vero eos et accusamus',
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
          _buildFeatureItem(
            'Beatae vitae dicta sunt',
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
          _buildFeatureItem(
            'Nemo enim ipsam voluptatem',
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyPlanCard(double padding) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Monthly',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                child: SvgPicture.string(
                  IconSvgs.upArrow,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$9600',
                style: TextStyle(
                  color: const Color(0xFF6A1B9A),
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '/ Month',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildFeatureItem(
            'Lorem ipsum dolor sit amet',
            textColor: Colors.black87,
            iconColor: Colors.black87,
          ),
          _buildFeatureItem(
            'Sed ut perspiciatis',
            textColor: Colors.black87,
            iconColor: Colors.black87,
          ),
          _buildFeatureItem(
            'At vero eos et accusamus',
            textColor: Colors.black87,
            iconColor: Colors.black87,
          ),
          _buildFeatureItem(
            'Vitae dicta sunt explicabo',
            textColor: Colors.black87,
            iconColor: Colors.black87,
          ),
          _buildFeatureItem(
            'Veritatis at quasi architecto',
            textColor: Colors.black87,
            iconColor: Colors.black87,
          ),
          _buildFeatureItem(
            'Beatae vitae dicta sunt',
            textColor: Colors.black87,
            iconColor: Colors.black87,
          ),
          _buildFeatureItem(
            'Explicabo. Nemo enim',
            textColor: Colors.black87,
            iconColor: Colors.black87,
          ),
          _buildFeatureItem(
            'Nemo enim ipsam voluptatem',
            textColor: Colors.black87,
            iconColor: Colors.black87,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text, {Color? textColor, Color? iconColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, size: 18, color: iconColor),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

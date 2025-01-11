import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';

import '../../core/utils/icons.dart';
import '../../core/widgets/backgroundtext.dart';

class PricingScreen extends StatelessWidget {
  final VoidCallback onGetStarted;
  PricingScreen({super.key, required this.onGetStarted});

  get screenWidth => null;

  // Helper method to calculate adaptive font size
  double getAdaptiveFontSize(BuildContext context, double baseFontSize) {
    final width = MediaQuery.of(context).size.width;
    if (width <= 700) {  // Mobile
      return baseFontSize * 0.8;  // Reduce font size by 20% on mobile
    } else if (width <= 1100) {  // Tablet
      return baseFontSize * 0.9;  // Reduce font size by 10% on tablet
    }
    return baseFontSize;  // Desktop stays the same
  }

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
                      context: context,
                    ),
                    SizedBox(height: screenHeight * 0.26),
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


  // Updated card building methods with better text scaling
  Widget _buildCustomPlanCard(double padding, BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width <= 700;
    final double baseFontSize = isMobile ? 14.0 : 16.0;

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
          Text(
            'Looking for a Custom Plan?',
            style: TextStyle(
              fontSize: getAdaptiveFontSize(context, baseFontSize * 1.5),
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            " Tailor your plan to suit your specific needs. Whether it's a unique feature, custom integration, or specialized support, we've got you covered! ",
            style: TextStyle(
              color: Colors.black54,
              fontSize: getAdaptiveFontSize(context, baseFontSize),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: onGetStarted,
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            label: Text(
              'Get Started',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getAdaptiveFontSize(context, baseFontSize)
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyPlanCard(double padding, BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width <= 700;
    final double baseFontSize = isMobile ? 14.0 : 16.0;

    return InkWell(
      onTap: onGetStarted,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: const Color(0xFF6A1B9A),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hourly Work',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getAdaptiveFontSize(context, baseFontSize * 1.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.access_time, color: Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$20',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getAdaptiveFontSize(context, baseFontSize * 2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '/ Hour',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: getAdaptiveFontSize(context, baseFontSize * 1.2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildFeatureItem(
              'Pay for the time you need',
              textColor: Colors.white,
              iconColor: Colors.white,
              context: context,
            ),
            _buildFeatureItem(
              'Flexible scheduling',
              textColor: Colors.white,
              iconColor: Colors.white,
              context: context,
            ),
            _buildFeatureItem(
              'Perfect for small tasks',
              textColor: Colors.white,
              iconColor: Colors.white,
              context: context,
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildMonthlyPlanCard(double padding, BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width <= 700;
    final double baseFontSize = isMobile ? 14.0 : 16.0;

    return InkWell(
      onTap: onGetStarted,
      child: Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Monthly Plan',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: getAdaptiveFontSize(context, baseFontSize * 1.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.calendar_today, color: Colors.deepPurpleAccent),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$1500',
                  style: TextStyle(
                    color: const Color(0xFF6A1B9A),
                    fontSize: getAdaptiveFontSize(context, baseFontSize * 2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '/ Month',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: getAdaptiveFontSize(context, baseFontSize * 1.2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildFeaturesList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesList(BuildContext context) {
    final features = [
      'Unlimited revisions',
      'Dedicated support',
      'Ideal for ongoing projects',
      'Priority delivery',
      'Includes advanced features',
    ];

    return Column(
      children: features.map((feature) => _buildFeatureItem(
        feature,
        textColor: Colors.black87,
        iconColor: Colors.black87,
        context: context,
      )).toList(),
    );
  }

  Widget _buildFeatureItem(
      String text, {
        Color? textColor,
        Color? iconColor,
        required BuildContext context,
      }) {
    final bool isMobile = MediaQuery.of(context).size.width <= 700;
    final double baseFontSize = isMobile ? 12.0 : 14.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.check_circle,
              size: isMobile ? 16 : 18,
              color: iconColor
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: getAdaptiveFontSize(context, baseFontSize),
                height: 1.4,
              ),
            ),
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
          text: '    Flutter Development    ✦    Cross-Platform Apps    ✦    UI/UX Design    ✦    State Management    ✦    Firebase Integration    ',
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

  Widget _buildSectionHeader(double headingFontSize, double subHeadingFontSize) {
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
    required BuildContext context,
  }) {
    // Create the cards
    final cards = [
      _buildCustomPlanCard(cardPadding, context),
      _buildHourlyPlanCard(cardPadding, context),
      _buildMonthlyPlanCard(cardPadding, context),
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
        children: cards.map((card) => SizedBox(width: 400, child: card)).toList(),
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

}

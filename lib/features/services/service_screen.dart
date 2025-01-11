import 'package:flutter/material.dart';
import '../../core/widgets/backgroundtext.dart';
import 'widgets/custom_button.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  int selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Define breakpoints
    final bool isDesktop = width > 1100;
    final bool isTablet = width > 700 && width <= 1100;
    final bool isMobile = width <= 700;

    // Adjust font sizes and paddings dynamically
    final headingFontSize = (width * 0.04).clamp(24.0, 36.0);
    final subHeadingFontSize = (width * 0.016).clamp(14.0, 16.0);
    final verticalPadding = isMobile ? height * 0.1 : height * 0.15;
    final horizontalPadding = isMobile ? width * 0.05 : width * 0.1;

    // Determine how many cards per row
    int columns;
    if (isDesktop) {
      columns = 3;
    } else if (isTablet) {
      columns = 2;
    } else {
      columns = 1;
    }

    // Compute card dimensions
    // On large screens: card ~ 400 width, on mobile smaller
    final cardWidth = (width / (columns * 1.5)).clamp(250.0, 400.0);
    final cardHeight = (height * 0.5).clamp(300.0, 500.0);

    return Scaffold(
      backgroundColor: const Color(0xFF5840ba), // Dark purple background color
      body: Stack(
        children: [
          // Large Background Text
          LargeBackgroundText(
            text: 'SERVICES',
            top: 100,
            left: 0,
            fontSize: (width * 0.1).clamp(40.0, 150.0),
            color: Colors.white.withOpacity(0.1),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Text(
                  '— Services',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: subHeadingFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'My ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: headingFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Services',
                      style: TextStyle(
                        color: const Color(0xFFa3db71),
                        fontSize: headingFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    CustomViewAllServicesButton(
                      textButton: "View All Services",
                      buttonType: "viewsllservices",
                      onTap: () {
                        // Any additional behavior before/after launching PDF
                        print("Button tapped!");
                      },
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 30 : 50),
                // Service Cards
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: List.generate(3, (index) {
                          IconData icon;
                          String title;
                          switch (index) {
                            case 0:
                              icon = Icons.design_services;
                              title = 'UI/UX Design';
                              break;
                            case 1:
                              icon = Icons.phone_iphone;
                              title = 'App Design';
                              break;
                            default:
                              icon = Icons.web;
                              title = 'Web Design';
                          }

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCardIndex = index;
                              });
                            },
                            child: _buildServiceCard(
                              isSelected: selectedCardIndex == index,
                              icon: icon,
                              title: title,
                              description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                              backgroundColor: const Color(0xFF705bc4),
                              iconColor: Colors.white,
                              textColor: Colors.white,
                              cardWidth: cardWidth,
                              cardHeight: cardHeight,
                              isMobile: isMobile,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required bool isSelected,
    required IconData icon,
    required String title,
    required String description,
    required Color backgroundColor,
    required Color iconColor,
    required Color textColor,
    required double cardWidth,
    required double cardHeight,
    required bool isMobile,
  }) {
    final baseIconSize = isMobile ? 60.0 : 100.0;
    final baseTitleSize = isMobile ? 22.0 : 28.0;
    final baseDescSize = isMobile ? 16.0 : 20.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: cardWidth,
      height: cardHeight,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : backgroundColor,
        borderRadius: BorderRadius.circular(400),
        boxShadow: [
          if (isSelected)
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: (isSelected ? Colors.grey : iconColor).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: baseIconSize, color: isSelected ? Colors.black : iconColor),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: baseTitleSize,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : textColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: baseDescSize,
              color: isSelected
                  ? Colors.black.withOpacity(0.7)
                  : textColor.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Learn more row
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Learn more',
                    style: TextStyle(
                      color: isSelected ? Colors.black : textColor,
                      fontSize: isMobile ? 14 : 18,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward,
                    size: isMobile ? 14 : 16,
                    color: isSelected ? Colors.black : textColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

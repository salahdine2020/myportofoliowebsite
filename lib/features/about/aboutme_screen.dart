import 'package:flutter/material.dart';

import '../../core/widgets/backgroundtext.dart';
import '../services/widgets/custom_button.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isSmallScreen ? AppBar(
        title: Text('About Me', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ) : null,
      body: Stack(
        children: [
          if (!isSmallScreen)
            LargeBackgroundText(
              text: 'About Me',
              top: 20,
              right: 0,
              fontSize: screenWidth * 0.1,
              color: Colors.black54,
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? screenWidth * 0.05 : screenWidth * 0.05,
              vertical: isSmallScreen ? screenHeight * 0.02 : screenHeight * 0.05,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIntroSection(context, screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.05),
                  if (!isSmallScreen)
                    _buildEducationWorkSection(screenWidth),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context, double screenWidth, double screenHeight) {
    final isSmallScreen = screenWidth < 600;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    if (isSmallScreen || isPortrait) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Experience Panel for small/portrait screens
          Center(
            child: Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                color: const Color(0xFF5840ba),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  // Large Number in the center
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "5",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Vertical Text on the left side
                  Positioned(
                    top: 10,
                    left: 10,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "MOHAMMED SALAH",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Text at the bottom center
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Years of Experience",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          // Introduction Text and Stats
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader('About Me', screenWidth),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Who is ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Mohammed Salah?',
                        style: TextStyle(
                          color: const Color(0xFF5840ba),
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                // Wrap stats for small screens
                Wrap(
                  spacing: screenWidth * 0.05,
                  runSpacing: screenWidth * 0.03,
                  children: [
                    _buildStatItem('12+', 'Projects Completed', screenWidth),
                    _buildStatItem('4+', 'Industries Covered', screenWidth),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                // Adjust button and text for small screens
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: screenWidth * 0.02,
                  children: [
                    CustomViewAllServicesButton(
                      textButton: "Download CV",
                      buttonType: "downloadcv",
                      onTap: () {
                        // Any additional behavior before/after launching PDF
                        print("Button tapped!");
                      },
                    ),

                    Text(
                      'Mohammed Salah',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    // Desktop/Landscape layout
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Experience Panel
        Container(
          width: screenWidth * 0.3,
          height: screenHeight * 0.6,
          decoration: BoxDecoration(
            color: const Color(0xFF5840ba),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "5",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 40,
                left: 0,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    "MOHAMMED SALAH",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  child: Text(
                    "Years of Experience",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.02,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        // Introduction Text and Stats
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('About Me', screenWidth),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Who is ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Mohammed Salah?',
                      style: TextStyle(
                        color: const Color(0xFF5840ba),
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiususmod tempor incididunt ut labore et dolore magna aliqua...",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: screenWidth * 0.01,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  _buildStatItem('12+', 'Projects Completed', screenWidth),
                  SizedBox(width: screenWidth * 0.05),
                  _buildStatItem('4+', 'Industries Covered', screenWidth),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  CustomViewAllServicesButton(
                    textButton: "Download CV",
                    buttonType: "downloadcv",
                    onTap: () {
                      // Any additional behavior before/after launching PDF
                      print("Button tapped!");
                    },
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    'Mohammed Salah',
                    style: TextStyle(
                      fontSize: screenWidth * 0.01,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Rest of the methods remain the same as in the original code,
  // with minor adjustments for font sizing and responsiveness
  // (The _buildSectionHeader, _buildStatItem, _buildEducationWorkSection,
  // _buildEducationCard, _buildWorkExperienceCard, _buildInfoCard,
  // _buildCardHeader, and _buildInfoItem methods would be similar to the original)

  Widget _buildSectionHeader(String title, double screenWidth) {
    final isSmallScreen = screenWidth < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '— $title',
          style: TextStyle(
            color: Colors.grey,
            fontSize: isSmallScreen ? screenWidth * 0.04 : screenWidth * 0.01,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
      ],
    );
  }

// Similar modifications can be made to other methods to improve responsiveness

  // Add this method for building the Education & Work section
  Widget _buildEducationWorkSection(double screenWidth) {
    final isSmallScreen = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSectionHeader("Education & Work", screenWidth),
        SizedBox(height: screenWidth * 0.02),
        isSmallScreen
            ? Column(
          children: [
            _buildEducationCard(screenWidth),
            SizedBox(height: screenWidth * 0.05),
            _buildWorkExperienceCard(screenWidth),
          ],
        )
            : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildEducationCard(screenWidth)),
            SizedBox(width: screenWidth * 0.05),
            Expanded(child: _buildWorkExperienceCard(screenWidth)),
          ],
        ),
      ],
    );
  }

  // Modify _buildStatItem to be more responsive
  Widget _buildStatItem(String value, String label, double screenWidth) {
    final isSmallScreen = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: isSmallScreen ? screenWidth * 0.06 : screenWidth * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.black54,
            fontSize: isSmallScreen ? screenWidth * 0.04 : screenWidth * 0.015,
          ),
        ),
      ],
    );
  }

  // Add the _buildEducationCard method
  Widget _buildEducationCard(double screenWidth) {
    return _buildInfoCard(
      title: 'Education',
      icon: Icons.school,
      items: [
        _buildInfoItem(
          title: 'Harmony Institute',
          subtitle: 'Master in Visual Arts',
          years: '2012 - 2014',
        ),
        _buildInfoItem(
          title: 'Aurora Academy',
          subtitle: 'Bachelor in Visual Arts',
          years: '2008 - 2012',
        ),
        _buildInfoItem(
          title: 'Crystalbrook',
          subtitle: 'High School',
          years: '1996 - 2008',
        ),
      ],
      screenWidth: screenWidth,
    );
  }

  // Add the _buildWorkExperienceCard method
  Widget _buildWorkExperienceCard(double screenWidth) {
    return _buildInfoCard(
      title: 'Work Experience',
      icon: Icons.work,
      items: [
        _buildInfoItem(
          title: 'Insightlancer',
          subtitle: 'Senior Product Designer',
          years: '2018 - 2024',
        ),
        _buildInfoItem(
          title: 'Self-Employed',
          subtitle: 'Visual Artist',
          years: '2016 - 2018',
        ),
        _buildInfoItem(
          title: 'KG Graphics Studio',
          subtitle: 'Web Designer',
          years: '2014 - 2016',
        ),
      ],
      screenWidth: screenWidth,
    );
  }

  // Add the _buildInfoCard method
  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required List<Widget> items,
    required double screenWidth,
  }) {
    final isSmallScreen = screenWidth < 600;

    return Container(
      padding: EdgeInsets.all(isSmallScreen ? screenWidth * 0.05 : screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeader(title, icon, screenWidth),
          SizedBox(height: screenWidth * 0.04),
          Column(children: items),
        ],
      ),
    );
  }

  // Add the _buildCardHeader method
  Widget _buildCardHeader(String title, IconData icon, double screenWidth) {
    final isSmallScreen = screenWidth < 600;

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xFF5840ba),
          child: Icon(icon, color: Colors.white,
              size: isSmallScreen ? screenWidth * 0.06 : null),
        ),
        SizedBox(width: screenWidth * 0.02),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF5840ba),
            fontSize: isSmallScreen ? screenWidth * 0.05 : screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Add the _buildInfoItem method
  Widget _buildInfoItem({
    required String title,
    required String subtitle,
    required String years,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Text(
            years,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
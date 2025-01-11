import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/widgets/backgroundtext.dart';
import '../services/widgets/custom_button.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints
    final bool isDesktop = screenWidth > 1100;
    final bool isTablet = screenWidth > 700 && screenWidth <= 1100;
    final bool isMobile = screenWidth <= 700;

    // Adjust horizontal padding based on screen size
    double horizontalPadding = isDesktop
        ? 200.0
        : isTablet
            ? 60.0
            : 20.0;
    double verticalPadding = isMobile ? 20.0 : 40.0;

    return Scaffold(
      backgroundColor: const Color(0xFF5840ba),
      body: Stack(
        children: [
          // Background Text
          LayoutBuilder(
            builder: (context, constraints) {
              // Scale the background text size relative to screen width
              double backgroundFontSize = (constraints.maxWidth * 0.1).clamp(40.0, 150.0);
              return Text(
                'Latest Projects',
                style: TextStyle(
                  fontSize: backgroundFontSize,
                  color: Colors.white.withOpacity(0.1),
                ),
              );
              return LargeBackgroundText(
                text: 'Latest Projects',
                top: 0,
                left: 0,
                fontSize: backgroundFontSize,
                color: Colors.white.withOpacity(0.1),
              );
            },
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: ListView(
              children: [
                _buildSectionHeader(isDesktop, isTablet, isMobile),
                const SizedBox(height: 30),
                _buildProjectCard(
                  context,
                  imagePath: 'assets/images/project5.png',
                  title:
                  'E-umma Islamia',
                  description:
                  'A comprehensive mobile application designed for Islamic practices, education, and spiritual guidance. '
                      'The app features an intuitive interface for daily prayer times, a searchable guide to supplications, religious audio lessons, '
                      'and interactive quizzes for Islamic learning. Users can also access an Islamic calendar, view important events, and track their spiritual progress. '
                      'This user-friendly design enhances engagement and accessibility for a holistic spiritual experience.',
                  tags: [
                    'Mobile App Design',
                    'UI/UX Design',
                    'Religious App',
                    'Islamic Education',
                    'Spiritual Guidance',
                    'Prayer Times',
                    'Interactive Learning',
                    'Faith-Based Tech'
                  ],
                  isImageLeft: true,
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                  isMobile: isMobile,
                  playStoreLink: "https://play.google.com/store/apps/details?id=com.eummahislamia.eummahislamiaapp&hl=ar",
                  appStoreLink: "https://apps.apple.com/fr/app/e-umma-islamia/id6503656498",
                ),
                const SizedBox(height: 20),
                _buildProjectCard(
                  context,
                  imagePath: 'assets/images/project1.png',
                  title: 'Podcast - Podcast Mobile App Solution',
                  description:
                  """This project showcases a set of highly polished mobile applications built using Flutter. Each app features an exceptional UI/UX design, ensuring a seamless and engaging user experience. Key functionalities include user management, file organization, messaging, scheduling, and sports/team management. The apps integrate Firebase for real-time database and authentication, Google Maps for geolocation services, and advanced AI features for data-driven functionalities. Native code is utilized for enhanced performance and deeper device integration.""",
                  tags: [
                    'Flutter',
                    'Firebase',
                    'Google Maps',
                    'AI Integration'
                  ],
                  isImageLeft: false,
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                  isMobile: isMobile,
                ),
                const SizedBox(height: 20),
                _buildProjectCard(
                  context,
                  imagePath: 'assets/images/project2.png',
                  title: 'Futsal Management App',
                  description: """This app is a complete sports management solution tailored for futsal enthusiasts. Built using Flutter, the app offers features like match scheduling, venue reservations, live updates, and an integrated e-commerce platform for purchasing sports gear. With an intuitive UI/UX design, it provides a smooth user experience. Firebase ensures real-time data synchronization, and Google Maps integration allows users to locate venues effortlessly.""",
                  tags: [
                    'Flutter',
                    'Firebase',
                    'Google Maps',
                    'E-commerce'
                  ],
                  apkStoreLink: "https://drive.google.com/file/d/1LVuRR2iBkNbdPVoVtvKw8M5kKhJpIGeN/view",
                  isImageLeft: true,
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                  isMobile: isMobile,
                ),
                const SizedBox(height: 20),
                _buildProjectCard(
                  context,
                  imagePath: 'assets/images/project3.png',
                  title: 'Food Delivery & Restaurant Management App',
                  description:
                  """This app is a modern food delivery and restaurant management platform designed to enhance the dining experience. Built using Flutter, the app allows users to browse menus, place orders, and track deliveries in real-time. Restaurants can manage orders efficiently with features for table bookings and delivery tracking. Firebase provides secure authentication and real-time updates, while Google Maps facilitates navigation and restaurant discovery. The app's streamlined UI/UX ensures an effortless experience for both customers and businesses.""",
                  tags: [
                    'Flutter',
                    'Firebase',
                    'Google Maps',
                    'Food Delivery'
                  ],
                  isImageLeft: false,
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                  isMobile: isMobile,
                  githubStoreLink: "https://github.com/salahdine2020/grup/tree/develop",
                ),
                const SizedBox(height: 20),
                _buildProjectCard(
                  context,
                  imagePath: 'assets/images/project4.png',
                  title: 'Mobile Wallet Application - User Flow Design',
                  description:
                  'A sleek and secure mobile wallet application designed for seamless onboarding, account setup, and cryptocurrency transactions. '
                      'The user flow includes intuitive screens for PIN creation, password setup, secure wallet recovery, and transaction processes. '
                      'The interface focuses on user experience, ensuring clarity and usability while guiding users through essential wallet security and payment functionalities.',
                  tags: [
                    'Mobile App Design',
                    'UI/UX Design',
                    'Cryptocurrency Wallet',
                    'User Onboarding',
                    'Digital Security',
                    'FinTech',
                    'Mobile Experience',
                    'Secure Transactions'
                  ],
                  playStoreLink: "https://play.google.com/store/apps/details?id=com.tectone23.portofoli.ltd&pli=1",
                  isImageLeft: true,
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                  isMobile: isMobile,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(bool isDesktop, bool isTablet, bool isMobile) {
    double titleFontSize = isMobile ? 24 : 32;
    double subTitleFontSize = isMobile ? 14 : 16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '— Projects',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: subTitleFontSize,
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
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Latest Projects',
              style: TextStyle(
                color: const Color(0xFFaeef6a),
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            // On smaller screens, let the button move below if needed
            CustomViewAllServicesButton(
              textButton: "View All Projects",
              buttonType: "viewallprojects",
              onTap: () {
                // Any additional behavior before/after launching PDF
                print("Button tapped!");
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProjectCard(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String description,
    required List<String> tags,
    required bool isImageLeft,
    required bool isDesktop,
    required bool isTablet,
    required bool isMobile,
    String playStoreLink = "",
    appStoreLink = "",
    apkStoreLink= "",
    githubStoreLink= "",

  }) {
    double cardPadding = isMobile ? 10 : 20;
    double titleFontSize = isMobile ? 20 : 28;
    double descFontSize = isMobile ? 12 : 14;

    // Adjust image sizes based on screen width
    final screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = isDesktop ? 650 : (isTablet ? 400 : screenWidth * 0.9);
    double imageHeight = isDesktop ? 400 : (isTablet ? 300 : 200);

    Widget imageSection =
        _buildImageSection(imagePath, imageWidth, imageHeight);
    Widget textSection = _buildTextSection(
      title,
      description,
      tags,
      titleFontSize,
      descFontSize,
      isMobile,
      playStoreLink: playStoreLink,
      appStoreLink: appStoreLink,
      apkStoreLink: apkStoreLink,
      githubStoreLink: githubStoreLink,
    );

    // For mobile or very narrow screens, consider stacking vertically for better layout
    if (isMobile) {
      return Container(
        padding: EdgeInsets.all(cardPadding),
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: isMobile
            ? Column(children: [
                imageSection,
                const SizedBox(height: 20),
                textSection,
              ])
            : Column(
                children: isImageLeft
                    ? [
                        imageSection,
                        const SizedBox(height: 20),
                        textSection,
                      ]
                    : [
                        textSection,
                        const SizedBox(height: 20),
                        imageSection,
                      ],
              ),
      );
    }

    // For desktop/tablet, maintain the side-by-side layout
    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: isImageLeft
            ? [
                imageSection,
                const SizedBox(width: 20),
                Expanded(child: textSection)
              ]
            : [
                Expanded(child: textSection),
                const SizedBox(width: 20),
                imageSection
              ],
      ),
    );
  }

  Widget _buildImageSection(
      String imagePath, double imageWidth, double imageHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        imagePath,
        height: imageHeight,
        width: imageWidth,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildTextSection(
      String title,
      String description,
      List<String> tags,
      double titleFontSize,
      double descFontSize,
      bool isMobile, {
        String playStoreLink = "",
        String appStoreLink = "",
        String apkStoreLink = "",
        String githubStoreLink = "",
      }) {
    // Function to launch URLs
    Future<void> _launchURL(String url) async {
      try {
        if (!await launchUrl(Uri.parse(url))) {
          throw 'Could not launch $url';
        }
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tags
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: tags
              .map(
                (tag) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFaeef6a),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tag,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isMobile ? 14 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
              .toList(),
        ),
        const SizedBox(height: 15),
        // Title
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        // Description
        Text(
          description,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: descFontSize,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 20),
        // Platform Buttons
        Wrap(
          spacing: 8,
          runSpacing: 2,
          children: [
            playStoreLink.isEmpty
                ? const SizedBox()
                : _buildPlatformButton(
              icon: Icons.android,
              label: 'Android',
              onTap: () => _launchURL(playStoreLink),
            ),
            appStoreLink.isEmpty
                ? const SizedBox()
                : _buildPlatformButton(
              icon: Icons.apple,
              label: 'iOS',
              onTap: () => _launchURL(appStoreLink),
            ),
            githubStoreLink.isEmpty
                ? const SizedBox()
                : _buildPlatformButton(
              icon: Icons.code,
              label: 'GitHub',
              onTap: () => _launchURL(githubStoreLink),
            ),
            apkStoreLink.isEmpty
                ? const SizedBox()
                : _buildPlatformButton(
              icon: Icons.download,
              label: 'APK',
              onTap: () => _launchURL(apkStoreLink),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPlatformButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

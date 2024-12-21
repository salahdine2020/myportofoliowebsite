import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';
import 'package:myportofolio/core/utils/icons.dart';
import 'package:myportofolio/features/home/widgets/actions_button.dart';
import '../../../core/widgets/animatedservices_widget.dart';
import '../../../core/widgets/responsive_widget.dart';
import '../../about/aboutme_screen.dart';
import '../../blogs/blog_screen.dart';
import '../../contact/contact_screen.dart';
import '../../pricing/pricing_screen.dart';
import '../../projects/project_screen.dart';
import '../../services/service_screen.dart';
import '../widgets/happyclients_wdget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _selectedPageNotifier = ValueNotifier<int>(0);
  int _selectedPage = 0;

  // Scroll to a given page (vertical paging)
  void scrollToPage(int page) {
    setState(() {
      _selectedPage = page;
    });
    _pageController.animateToPage(
      page,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _selectedPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Check responsiveness with provided helper
    final isMobile = ResponsiveWidget.isMobile(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isDesktop = ResponsiveWidget.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isMobile ? _buildMobileAppBar(context) : _buildDesktopAppBar(),
      drawer: isMobile ? _buildDrawer() : null,
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        children: [
          _buildHomeSection(context, isMobile),
          _buildServicesSection(context),
          _buildAboutSection(context),
          _buildProjectsSection(context),
          _buildPricingSection(context),
          _buildBlogsSection(context),
          _buildContactSection(context),
        ],
      ),
    );
  }

  AppBar _buildMobileAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        "Mohammed Salah",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black54),
    );
  }

  AppBar _buildDesktopAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  child: Image.asset(
                    'assets/images/test_im.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                "Mohammed Salah",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              const Spacer(),
              ValueListenableBuilder<int>(
                valueListenable: _selectedPageNotifier,
                builder: (context, selectedPage, child) {
                  return Row(
                    children: [
                      _buildNavLink("Home", page: 0),
                      _buildNavLink("Services", page: 1),
                      _buildNavLink("About", page: 2),
                      _buildNavLink("Projects", page: 3),
                      _buildNavLink("Pricing", page: 4),
                      _buildNavLink("Blog", page: 5),
                    ],
                  );
                },
              ),
              const Spacer(),
              _buildContactMeButton(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavLink(String text, {required int page}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () => scrollToPage(page),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black54,
            shadows: _selectedPage == page
                ? [
              Shadow(
                offset: const Offset(0, 16),
                color: Colors.deepPurpleAccent.withOpacity(0.7),
                blurRadius: 4,
              )
            ]
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildContactMeButton() {
    return ElevatedButton(
      onPressed: () {
        scrollToPage(6); // Contact section page
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      ),
      child: const Text(
        "Contact Me",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
            ),
            child: Text(
              'Mohammed Salah',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () => scrollToPage(0),
          ),
          ListTile(
            title: const Text('Services'),
            onTap: () => scrollToPage(1),
          ),
          ListTile(
            title: const Text('About'),
            onTap: () => scrollToPage(2),
          ),
          ListTile(
            title: const Text('Projects'),
            onTap: () => scrollToPage(3),
          ),
          ListTile(
            title: const Text('Pricing'),
            onTap: () => scrollToPage(4),
          ),
          ListTile(
            title: const Text('Blog'),
            onTap: () => scrollToPage(5),
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () => scrollToPage(6),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeSection(BuildContext context, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Instead of constraining the entire content with maxWidth here,
        // only constrain the hero section and image, not the marquee.
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.08),
              _buildHeroText(context),
              SizedBox(height: screenHeight * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/test_im.jpg',
                  height: screenHeight * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ActionButtons(),
              SizedBox(height: screenHeight * (isMobile ? 0.285 : 0.255)),
              // Place the marquee section here, not wrapped by a width-constrained Container
              _buildFullWidthMarquee(context),
            ],
          ),
        ),
        // Positioning the HappyClientsWidget at the bottom center is fine as is.
        Positioned(
          bottom: screenHeight * 0.3,
          left: screenWidth * 0.1,
          right: screenWidth * 0.5,
          child: Center(
            child: isMobile ? const SizedBox() : const HappyClientsWidget(),
          ),
        ),
      ],
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
          text: '    Web Design    ✦    App Design    ✦    Dashboard    ✦    Wireframe    ✦    User Research    ',
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

  Widget _buildAnimatedServiceText() {
    return Container(
      width: double.infinity,
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

  Widget _buildServicesSection(BuildContext context) {
    return const ServiceScreen();
  }

  Widget _buildAboutSection(BuildContext context) {
    return const AboutMeScreen();
  }

  Widget _buildProjectsSection(BuildContext context) {
    return const ProjectScreen();
  }

  Widget _buildBlogsSection(BuildContext context) {
    return const BlogScreen();
  }

  Widget _buildPricingSection(BuildContext context) {
    return const PricingScreen();
  }

  Widget _buildContactSection(BuildContext context) {
    return const ContactScreen();
  }

  Widget _buildHeroText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double helloFontSize = (screenWidth * 0.012).clamp(12, 24);
    double nameFontSize = (screenWidth * 0.034).clamp(24, 40);
    double subTitleFontSize = (screenWidth * 0.03).clamp(16, 28);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // "Hello" line
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "– ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: helloFontSize,
                color: Colors.deepPurpleAccent,
              ),
            ),
            Text(
              "Hello",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: helloFontSize,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),

        // Name & Title
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "I'm ",
            style: TextStyle(
              fontSize: nameFontSize,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "Mohammed Salah,",
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: nameFontSize,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.deepPurpleAccent,
                  decorationThickness: 2,
                ),
              ),
              TextSpan(
                text: "\nMobile App Developer ",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: subTitleFontSize,
                ),
              ),
              TextSpan(
                text: "\nand Blockchain enthusiast",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: subTitleFontSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}

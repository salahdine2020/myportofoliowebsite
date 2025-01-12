import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:myportofolio/core/utils/icons.dart';
import 'package:myportofolio/features/home/widgets/actions_button.dart';
import 'package:url_launcher/url_launcher.dart';
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
  String myImage = "https://raw.githubusercontent.com/salahdine2020/myportofoliowebsite/webv/assets/assets/images/myimage.jpg";

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
      drawer: isMobile ? _buildDrawer(context) : null,
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
                  radius: constraints.maxWidth * .01,
                  child:  CachedNetworkImage(
                    imageUrl: myImage,
                    fit: BoxFit.cover, // Ensures the image covers the box
                    placeholder: (context, url) => const SizedBox(), // Placeholder while loading
                    errorWidget: (context, url, error) => const Icon(Icons.error), // Error widget if image fails to load
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


  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width, // Make the drawer full width
          color: Colors.black87, // Background color
          child: Column(
            children: [
              // Close button
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),

              // Menu Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  children: [
                    _buildDrawerItem(
                      icon: Icons.home_outlined,
                      title: 'Home',
                      isSelected: _selectedPage == 0,
                      onTap: () => scrollToPage(0),
                    ),
                    _buildDrawerItem(
                      icon: Icons.design_services_outlined,
                      title: 'Services',
                      isSelected: _selectedPage == 1,
                      onTap: () => scrollToPage(1),
                    ),
                    _buildDrawerItem(
                      icon: Icons.person_outline,
                      title: 'About',
                      isSelected: _selectedPage == 2,
                      onTap: () => scrollToPage(2),
                    ),
                    _buildDrawerItem(
                      icon: Icons.work_outline,
                      title: 'Projects',
                      isSelected: _selectedPage == 3,
                      onTap: () => scrollToPage(3),
                    ),
                    _buildDrawerItem(
                      icon: Icons.attach_money,
                      title: 'Pricing',
                      isSelected: _selectedPage == 4,
                      onTap: () => scrollToPage(4),
                    ),
                    _buildDrawerItem(
                      icon: Icons.article_outlined,
                      title: 'Blog',
                      isSelected: _selectedPage == 5,
                      onTap: () => scrollToPage(5),
                    ),
                    _buildDrawerItem(
                      icon: Icons.contact_mail_outlined,
                      title: 'Contact',
                      isSelected: _selectedPage == 6,
                      onTap: () => scrollToPage(6),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.white70,
          size: 28,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        onTap: () {
          onTap();
          Navigator.pop(context);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        hoverColor: Colors.white.withOpacity(0.1),
      ),
    );
  }



  Widget _buildHomeSection(BuildContext context, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Social Media Links on the left

        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.08),
              _buildHeroText(context),
              SizedBox(height: screenHeight * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                CachedNetworkImage(
                  imageUrl: myImage,
                  height: screenHeight * 0.5,
                  fit: BoxFit.cover, // Ensures the image covers the box
                  placeholder: (context, url) => const SizedBox(), // Placeholder while loading
                  errorWidget: (context, url, error) => const Icon(Icons.error), // Error widget if image fails to load
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ActionButtons(
                onHireMePressed: () => scrollToPage(6),
                onPortfolioPressed: () => scrollToPage(4),
              ),
              if (isMobile)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: _buildSocialMediaLinksHorizontal(),
                ),
              SizedBox(height: screenHeight * (isMobile ? 0.15 : 0.06)),
              _buildFullWidthMarquee(context),
            ],
          ),
        ),

        if (!isMobile)
          Positioned(
            left: 20,
            top: screenHeight * 0.3,
            child: _buildSocialMediaLinks(),
          ),
      ],
    );
  }


  Widget _buildSocialMediaLinksHorizontal() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildSocialButtons(isVertical: false),
        ),
      ),
    );
  }

  List<Widget> _buildSocialButtons({required bool isVertical}) {
    final socialLinks = [
      (FontAwesomeIcons.linkedin, const Color(0xFF0077B5), 'https://www.linkedin.com/in/mohammed-salah-tighezza-743462142/'),
      (FontAwesomeIcons.facebook, const Color(0xFF1877F2), 'https://www.facebook.com/med.salah.7355'),
      (FontAwesomeIcons.whatsapp, const Color(0xFF25D366), 'https://wa.me/213656375516'),
      (FontAwesomeIcons.github, Colors.black54, 'https://github.com/salahdine2020'),
      (FontAwesomeIcons.x, Colors.black54, 'https://x.com/salahmoham83702?s=21'),
    ];

    return socialLinks.map((social) {
      final button = _buildSocialButton(
        icon: social.$1,
        color: social.$2,
        onTap: () => _launchURL(social.$3),
      );

      if (isVertical) {
        return Column(
          children: [
            button,
            const SizedBox(height: 20),
          ],
        );
      } else {
        return Row(
          children: [
            button,
            const SizedBox(width: 20),
          ],
        );
      }
    }).toList();
  }

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $urlString';
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
      // Optionally show a snackbar to inform the user
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not open link: $urlString'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          //print("start taping to launch url ...");
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: FaIcon(
            icon,
            color: color,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaLinks() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSocialButton(
            icon: FontAwesomeIcons.linkedin,
            color: const Color(0xFF0077B5),
            onTap: () => _launchURL('https://www.linkedin.com/in/mohammed-salah-tighezza-743462142/'),
          ),
          const SizedBox(height: 20),
          _buildSocialButton(
            icon: FontAwesomeIcons.facebook,
            color: const Color(0xFF1877F2),
            onTap: () => _launchURL('https://www.facebook.com/med.salah.7355'),
          ),
          const SizedBox(height: 20),
          _buildSocialButton(
            icon: FontAwesomeIcons.whatsapp,
            color: const Color(0xFF25D366),
            onTap: () => _launchURL('https://wa.me/213656375516')
          ),
          const SizedBox(height: 20),
          _buildSocialButton(
            icon: FontAwesomeIcons.github,
            color: Colors.black54,
            onTap: () => _launchURL('https://github.com/salahdine2020'),
          ),
          const SizedBox(height: 20),
          _buildSocialButton(
            icon: FontAwesomeIcons.x,
            color: Colors.black54,
            onTap: () => _launchURL('https://x.com/salahmoham83702?s=21'),
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
    return BlogScreen();
  }

  Widget _buildPricingSection(BuildContext context) {
    return PricingScreen(onGetStarted: ()=> scrollToPage(6));
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

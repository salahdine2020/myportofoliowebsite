import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/widgets/backgroundtext.dart';

class BlogScreen extends StatelessWidget {
  BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine screen width for responsive design
    final width = MediaQuery.of(context).size.width;

    // Adjust grid columns based on width
    int crossAxisCount;
    if (width < 600) {
      // Mobile
      crossAxisCount = 1;
    } else if (width < 900) {
      // Tablet
      crossAxisCount = 2;
    } else {
      // Desktop
      crossAxisCount = 3;
    }

    final horizontalPadding = width < 600 ? 10.0 : 20.0;
    final verticalPadding = width < 600 ? 20.0 : 40.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          LargeBackgroundText(
            text: 'My Blog Post',
            top: 0,
            left: 0,
            fontSize: width * 0.1,
            color: Colors.black54,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                _buildSectionHeader(context),
                const SizedBox(height: 30),
                // Blog Cards Section
                // Blog Cards Section
                Expanded(
                  child: GridView.count(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: width < 600 ? 0.8 : 1.0, // Adjust card aspect ratio on mobile
                    children: [
                      _buildBlogCard(
                        context,
                        imagePath: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*IJcog1cXdkb9zja6LNLbmQ.png",
                        title: 'Applying SOLID Principles in Flutter: A Practical Example',
                        category: 'Software Development',
                        author: 'Tech Blog',
                        date: '31 Aug 2024',
                        link: "https://medium.com/@salahinetelecom/applying-solid-principles-in-flutter-a-practical-example-a5188aa5248f"
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*ry0C0b0VWTdvqps4NAmSDA.png', // Replace with actual image path
                        title: 'Mastering Object-Oriented Programming in Dart: A Comprehensive Guide',
                        category: 'Programming',
                        author: 'Tech Blog',
                        date: '20 Aug 2024',
                        link: "https://medium.com/@salahinetelecom/mastering-object-oriented-programming-in-dart-a-comprehensive-guide-a9ae11c30eba",
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*GptUI8Sba9LHvHTbjfjGcQ.png', // Replace with actual image path
                        title: 'Integrating C Code with Flutter using Dart FFI: A Step-by-Step Guide',
                        category: 'Flutter Development',
                        author: 'Tech Blog',
                        date: '15 Aug 2024',
                        link: "https://medium.com/@salahinetelecom/integrating-c-code-with-flutter-using-dart-ffi-a-step-by-step-guide-6286050e7dfc",
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*A3_vTjNS5JV3S3Hvd-xaDA.png', // Replace with actual image path
                        title: 'Mastering State Management in Flutter: The BLoC Pattern',
                        category: 'State Management',
                        author: 'Tech Blog',
                        date: '15 Dec 2023',
                        link: "https://medium.com/@salahinetelecom/mastering-state-management-in-flutter-a-comprehensive-guide-to-the-bloc-pattern-and-testing-15ed118a1cfb",
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*6YzBzm8p4RItFM5d_S_Qyg.jpeg', // Replace with actual image path
                        title: 'Streamlining API Requests in Flutter with http and freezed',
                        category: 'Flutter Development',
                        author: 'Tech Blog',
                        date: '06 Dec 2023',
                        link: "https://medium.com/@salahinetelecom/streamlining-api-requests-in-flutter-with-http-and-freezed-a-neat-approach-600d83297993",
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*v-QvobjLKgda5V_4AL3IQA.jpeg', // Replace with actual image path
                        title: 'Boosting App Performance with Flutter: Unleashing the Power of Tree Shaking',
                        category: 'Performance Optimization',
                        author: 'Tech Blog',
                        date: '01 Dec 2023',
                        link: "https://medium.com/@salahinetelecom/boosting-app-performance-with-flutter-unleashing-the-power-of-tree-shaking-8788c73e0070",
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*xzeqD-SvhfOMfaIPBtKMkQ.png', // Replace with actual image path
                        title: 'Investigate Memory Leaks within Flutter',
                        category: 'Memory Management',
                        author: 'Tech Blog',
                        date: '26 Nov 2023',
                        link: "https://medium.com/@salahinetelecom/investigate-memory-leaks-within-flutter-b92db4b41271",
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*Gkz10fHt7gk5WKQXh3YQfg.png', // Replace with actual image path
                        title: 'Learn Flutter in 3 Months: A Roadmap with YouTube Tutorials',
                        category: 'Learning',
                        author: 'Tech Blog',
                        date: '16 Feb 2023',
                        link: "https://medium.com/@salahinetelecom/learn-flutter-in-3-months-a-roadmap-with-youtube-tutorials-d73dfd7b44f7",
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*n6RN_lfrFqq5C7MRMHpyxQ.jpeg', // Replace with actual image path
                        title: '7 Must-Have Packages for Every Flutter Developer',
                        category: 'Development Tools',
                        author: 'Tech Blog',
                        date: '10 Feb 2023',
                        link: "https://medium.com/@salahinetelecom/7-must-have-packages-for-every-flutter-developer-45dab7a7d315",

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final titleFontSize = width < 600 ? 24.0 : 32.0;
    final subtitleFontSize = width < 600 ? 14.0 : 16.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '— Blogs',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: subtitleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              'From My ',
              style: TextStyle(
                color: Colors.black,
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Blog Post',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.view_list, color: Colors.white),
              label: Text(
                "View All Blogs",
                style: TextStyle(color: Colors.white, fontSize: width < 600 ? 12 : 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: width < 600 ? 12 : 16,
                  vertical: width < 600 ? 10 : 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget _buildBlogCard(
      BuildContext context, {
        required String imagePath,
        required String title,
        required String category,
        required String author,
        required String date,
        required String link, // Added link parameter
      }) {
    final width = MediaQuery.of(context).size.width;
    final titleFontSize = (width * 0.03).clamp(14.0, 16.0);
    final categoryFontSize = (width * 0.02).clamp(10.0, 12.0);
    final infoFontSize = (width * 0.02).clamp(10.0, 12.0);
    final cardPadding = (width * 0.03).clamp(10.0, 15.0);
    final imageHeight = (width * 0.5).clamp(100.0, 450.0);

    // Function to launch URL
    Future<void> _launchUrl() async {
      final uri = Uri.parse(link);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $link';
      }
    }

    return GestureDetector(
      onTap: _launchUrl, // Launch the URL when tapped
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                imagePath,
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(cardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Tag
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: categoryFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: width < 600 ? 6 : 10),
                  // Blog Title
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: width < 600 ? 6 : 10),
                  // Author and Date
                  Row(
                    children: [
                      Icon(Icons.person, size: infoFontSize + 2, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        author,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: infoFontSize,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Icon(Icons.calendar_today, size: infoFontSize + 2, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: infoFontSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

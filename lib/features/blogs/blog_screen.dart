import 'package:flutter/material.dart';

import '../../core/widgets/backgroundtext.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

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
                Expanded(
                  child: GridView.count(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: width < 600 ? 0.8 : 1.0, // Adjust card aspect ratio on mobile
                    children: [
                      _buildBlogCard(
                        context,
                        imagePath: 'assets/images/blog01.png', // Replace with actual image path
                        title: 'Design Unraveled: Behind the Scenes of UI/UX Magic',
                        category: 'UI/UX Design',
                        author: 'Jenny Alexander',
                        date: '21 Mar 2024',
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'assets/images/blog2.png', // Replace with actual image path
                        title: 'Beyond Aesthetics: Crafting Intuitive UX',
                        category: 'App Design',
                        author: 'Jenny Alexander',
                        date: '20 Mar 2024',
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'assets/images/blog3.png', // Replace with actual image path
                        title: 'Pixels & Insights: Unveiling the Art of UI/UX',
                        category: 'App Design',
                        author: 'Jenny Alexander',
                        date: '19 Mar 2024',
                      ),_buildBlogCard(
                        context,
                        imagePath: 'assets/images/blog2.png', // Replace with actual image path
                        title: 'Beyond Aesthetics: Crafting Intuitive UX',
                        category: 'App Design',
                        author: 'Jenny Alexander',
                        date: '20 Mar 2024',
                      ),
                      _buildBlogCard(
                        context,
                        imagePath: 'assets/images/blog3.png', // Replace with actual image path
                        title: 'Pixels & Insights: Unveiling the Art of UI/UX',
                        category: 'App Design',
                        author: 'Jenny Alexander',
                        date: '19 Mar 2024',
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
      }) {
    final width = MediaQuery.of(context).size.width;
    final titleFontSize = (width * 0.03).clamp(14.0, 16.0);
    final categoryFontSize = (width * 0.02).clamp(10.0, 12.0);
    final infoFontSize = (width * 0.02).clamp(10.0, 12.0);
    final cardPadding = (width * 0.03).clamp(10.0, 15.0);
    final imageHeight = (width * 0.5).clamp(100.0, 450.0);


    return Container(
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
            child: Image.asset(
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
    );
  }
}

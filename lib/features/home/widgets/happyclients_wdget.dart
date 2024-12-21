import 'package:flutter/material.dart';

class HappyClientsWidget extends StatelessWidget {
  const HappyClientsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '12+',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Happy Clients',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 10),
        // Responsive overlapping avatars
        SizedBox(
          height: 40, // Height of the avatars
          child: LayoutBuilder(
            builder: (context, constraints) {
              double avatarSize = 40.0; // Avatar size
              double overlapFraction = 0.5; // Adjust this for more or less overlap

              return Stack(
                children: [
                  Positioned(
                    left: 0 * avatarSize * overlapFraction,
                    child: _buildAvatar('assets/images/image5.png'),
                  ),
                  Positioned(
                    left: 1 * avatarSize * overlapFraction,
                    child: _buildAvatar('assets/images/image2.png'),
                  ),
                  Positioned(
                    left: 2 * avatarSize * overlapFraction,
                    child: _buildAvatar('assets/images/image3.png'),
                  ),
                  Positioned(
                    left: 3 * avatarSize * overlapFraction,
                    child: _buildAvatar('assets/images/image4.jpg'),
                  ),
                  Positioned(
                    left: 4 * avatarSize * overlapFraction,
                    child: _buildAddMoreAvatar(),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String assetName) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(assetName),
    );
  }

  Widget _buildAddMoreAvatar() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey.shade200,
      child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
    );
  }
}

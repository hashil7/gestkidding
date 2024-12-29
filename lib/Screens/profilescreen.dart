import 'package:flutter/material.dart';
import 'package:gestacare/Screens/basescreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BaseScreen(
      currentIndex: 0, // Ensures the Profile icon is filled
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person,
                size: 32, color: Colors.black), // Filled icon
            onPressed: () {
              // Already on ProfileScreen
            },
          ),
        ],
      ),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.05),
                Center(
                  child: CircleAvatar(
                    radius: screenWidth * 0.15, // Responsive radius
                    backgroundColor: Colors.grey[200], // Fallback color
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile_placeholder.png', // Placeholder image
                        fit: BoxFit.cover,
                        width: screenWidth * 0.3,
                        height: screenWidth * 0.3,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF272727),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                const Text(
                  'user@example.com',
                  style: TextStyle(fontSize: 16, color: Color(0xFFA1A1A1)),
                ),
                SizedBox(height: screenHeight * 0.03),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading:
                            const Icon(Icons.edit, color: Color(0xFFFF9385)),
                        title: const Text(
                          'Edit Profile',
                          style: TextStyle(color: Color(0xFF707070)),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF909090)),
                        onTap: () {
                          // Handle Edit Profile
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings,
                            color: Color(0xFFFF9385)),
                        title: const Text(
                          'Settings',
                          style: TextStyle(color: Color(0xFF707070)),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF909090)),
                        onTap: () {
                          // Handle Settings tap
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.description,
                            color: Color(0xFFFF9385)),
                        title: const Text(
                          'Terms and Privacy Policy',
                          style: TextStyle(color: Color(0xFF707070)),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF909090)),
                        onTap: () {
                          // Handle Terms and Privacy Policy tap
                        },
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.logout, color: Color(0xFFFF9385)),
                        title: const Text(
                          'Logout',
                          style: TextStyle(color: Color(0xFF707070)),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF909090)),
                        onTap: () {
                          // Handle Logout tap
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

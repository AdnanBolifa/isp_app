import 'package:flutter/material.dart';
import 'package:isp_app/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Replace with actual user data
    String userName = 'John Doe';
    String userEmail = 'johndoe@example.com';
    String userPhone = '+1234567890';
    String userAddress = '123 Main St, Springfield, USA';

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: AppColors.primary,
              title: Text(
                'Hi, $userName',
                style: const TextStyle(color: Colors.white),
              ),
              actions: const [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/user_avatar.jpg'),
                ),
                SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        'Your Balance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '\$500.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Profile Information',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildProfileCard(
                    icon: Icons.person,
                    title: 'Name',
                    subtitle: userName,
                  ),
                  _buildProfileCard(
                    icon: Icons.email,
                    title: 'Email',
                    subtitle: userEmail,
                  ),
                  _buildProfileCard(
                    icon: Icons.phone,
                    title: 'Phone',
                    subtitle: userPhone,
                  ),
                  _buildProfileCard(
                    icon: Icons.home,
                    title: 'Address',
                    subtitle: userAddress,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingsCard(
                    icon: Icons.lock,
                    title: 'Change Password',
                    onTap: () {
                      // Handle change password action
                    },
                  ),
                  _buildSettingsCard(
                    icon: Icons.notifications,
                    title: 'Notification Preferences',
                    onTap: () {
                      // Handle notification preferences action
                    },
                  ),
                  _buildSettingsCard(
                    icon: Icons.privacy_tip,
                    title: 'Privacy Settings',
                    onTap: () {
                      // Handle privacy settings action
                    },
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle logout action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  Widget _buildSettingsCard(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      ),
    );
  }
}

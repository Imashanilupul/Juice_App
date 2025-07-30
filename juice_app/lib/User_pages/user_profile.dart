import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColors;

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    // The Scaffold and AppBar are removed.
    // This widget now only returns the content for the body.
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Top Profile Header
            Row(
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.white70,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    currentUser?.email ?? "John Carter",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white70),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(color: Colors.white24),

            // Profile Information List
            _buildProfileDetail(
              label: "87/A, London, USA",
              onPressed: () {},
            ),
            _buildProfileDetail(
              label: "077XXXXXXXX",
              onPressed: () {},
            ),
            _buildProfileDetail(
              label: "••••••••••••••",
              isPassword: true,
              onPressed: () {},
            ),
            const SizedBox(height: 50),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: signUserOut,
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.red[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget remains the same
  Widget _buildProfileDetail({
    required String label,
    required VoidCallback onPressed,
    bool isPassword = false,
  }) {
    // ... no changes needed here
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: isPassword ? 2.0 : 1.0,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white70, size: 20),
                onPressed: onPressed,
              ),
            ],
          ),
        ),
        const Divider(color: Colors.white24, height: 1),
      ],
    );
  }
}
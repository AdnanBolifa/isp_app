import 'package:flutter/material.dart';

class ISPHomePage extends StatelessWidget {
  const ISPHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to ISP Home Page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.grey[850],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                leading: Icon(Icons.network_check, color: Colors.white),
                title: Text(
                  'Checked Network Status',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Network status was checked successfully',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.grey[850],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                leading: Icon(Icons.speed, color: Colors.white),
                title: Text(
                  'Speed Test',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Internet speed test was performed',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.grey[850],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                leading: Icon(Icons.security, color: Colors.white),
                title: Text(
                  'Security Check',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Security protocols were verified',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

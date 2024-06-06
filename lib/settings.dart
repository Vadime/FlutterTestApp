import 'package:flutter/material.dart';
import 'package:fluttertestapp/data_input.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            // Add your settings options here
            // For example, a logout button
            ListTile(
              onTap: () {
                // Implement your logout logic here
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const DataInputScreen()),
                    (route) => false);
              },
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

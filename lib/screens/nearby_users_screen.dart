import 'package:flutter/material.dart';

class NearbyUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for Bluetooth and WiFi scanned peers
    final List<String> scannedPeers = ['User1', 'User2', 'User3']; // Sample data

    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Users'),
      ),
      body: ListView.builder(
        itemCount: scannedPeers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(scannedPeers[index]),
            // Add additional profile information as needed
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String username = 'User Name';
  String bio = 'Short bio about the user';
  List<String> interests = ['Interest 1', 'Interest 2', 'Interest 3'];

  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  void _saveProfile() {
    setState(() {
      username = _usernameController.text;
      bio = _bioController.text;
    });
    // Possibly save to a database
  }

  @override
  void initState() {
    super.initState();
    _bioController.text = bio;
    _usernameController.text = username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[  
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'User Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _bioController,
              decoration: InputDecoration(labelText: 'Bio'),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            Text('Interests: ${interests.join(', ')}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveProfile,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
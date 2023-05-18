import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:movies_books/features/auth/user_profile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  final usersQuery = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const UserProfileScreen()),
                ),
              );
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: FirestoreListView<Map<String, dynamic>>(
          query: usersQuery,
          itemBuilder: (context, snapshot) {
            Map<String, dynamic> user = snapshot.data();
            return Text('User name is ${user['name']}');
          }),
    );
  }
}

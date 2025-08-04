import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.green.shade700,
      body: Stack(
        children: [
          Center(
            child: Text(
              'Welcome to the Lobby!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          if (user != null)
            Positioned(
              top: 40,
              right: 20,
              child: Row(
                children: [
                  if (user.photoURL != null)
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                  const SizedBox(width: 10),
                  Text(
                    user.displayName ?? 'User',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

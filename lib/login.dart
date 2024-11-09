import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      // Handle any errors that occur during sign out
      debugPrint('Error signing out: $e');
      // Optionally show a snackbar or alert to inform the user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error signing out. Please try again.'),
          ),
        );
      }
    }
  }

  String getUserIdentifier() {
    if (user == null) return 'No user logged in';
    return user?.email ?? user?.phoneNumber ?? 'No identifier available';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton( onPressed: signOut,child: Text("Signout"),),
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current User:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              getUserIdentifier(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
           
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth_test/data/firebase_service.dart';

import 'package:flutter/material.dart';

/// Reset Password Page UI
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _email=TextEditingController();
  final FirebaseService _auth=FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar can be removed if not needed.
      appBar: AppBar(title: Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Email Input
            TextFormField(
              controller: _email,
              decoration: InputDecoration(labelText: 'Enter your registered Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            // Reset Password Button
            ElevatedButton(
              onPressed: ()async {
                // After sending reset instructions, you can navigate or show a message.
              await  _auth.setPasswordAndEmailLink(_email.text);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("email for reset password has been sent")));
              Navigator.pop(context);
              },
              child: Text('Send Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}

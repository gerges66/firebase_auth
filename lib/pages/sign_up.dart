import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_test/data/firebase_service.dart';
import 'package:flutter/material.dart';

/// Sign Up Page UI
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
final  TextEditingController _userNameController=TextEditingController();
 final TextEditingController _emailController=TextEditingController();
 final TextEditingController _passwordController=TextEditingController();
final _formKey = GlobalKey<FormState>();
 final FirebaseService firebaseService =FirebaseService();
  @override
  void dispose() {

_emailController.dispose();
_userNameController.dispose();
_passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar can be removed if not needed.
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key:_formKey ,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Name Input
                TextFormField(
                         validator: (data) {
                        if (data!.isEmpty) return 'Field is required';
                        return null;
                      },
                  controller: _userNameController,
                  decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
                ),
                SizedBox(height: 16),
                // Email Input
                TextFormField(
                         validator: (data) {
                        if (data!.isEmpty) return 'Field is required';
                        return null;
                      },
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                ),
                SizedBox(height: 16),
                // Password Input
                TextFormField(
                         validator: (data) {
                        if (data!.isEmpty) return 'Field is required';
                        return null;
                      },
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                ),
                SizedBox(height: 16),
                // Confirm Password Input
                TextFormField(
                         validator: (data) {
                        if (data!.isEmpty) return 'Field is required';
                        return null;
                      },
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm Password', border: OutlineInputBorder()),
                ),
                SizedBox(height: 16),
                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                     if(_formKey.currentState!.validate()){
            _singUp();
                     }
                    //Navigator.pushNamed(context, '/otp');
            
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _singUp() async{
    String userName=_userNameController.text;
    String email=_emailController.text;
    String password=_passwordController.text;
User? user =await firebaseService.signUpWithEmailAndPassword(email, password);
if(user !=null){
  print("user successfully created");
  Navigator.pushNamed(context, "/home");
}else{
  print("some error happend");
}
  }
}
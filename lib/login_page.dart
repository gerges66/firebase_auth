import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_test/data/firebase_service.dart';

import 'package:flutter/material.dart';

/// Login Page UI
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
 //  final String phoneNumber;


  final TextEditingController _emailController=TextEditingController();
 final TextEditingController _passwordController=TextEditingController();
  final FirebaseService firebaseService =FirebaseService();
final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {

  void dispose() {

_emailController.dispose();

_passwordController.dispose();

    super.dispose();
  }
    return Scaffold(
      // AppBar can be removed if not needed.
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Email Input
              TextFormField(
                 validator: (data) {
                        if (data!.isEmpty) return 'Field is required';
                        return null;
                      },
                      controller:_emailController ,
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
              // Login Button
              ElevatedButton(
                onPressed: () {
                             if(_formKey.currentState!.validate()){
            _login();
                     }
                },
                child: Text('Login'),
              ),
              SizedBox(height: 8),
              // Forgot Password Navigation
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/reset-password');
                },
                child: Text('Forgot Password?'),
              ),

              // Navigate to Sign Up Page
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text('Don\'t have an account? Sign Up'),
              ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                        //  Navigator.push(context,MaterialPageRoute(builder: (context)=>OTPPage()));
                        },
                        child: Text("sign with phone number ")),
                    ),
            ],
          ),
        ),
      ),
    );
  }
    void _login() async{
   
    String email=_emailController.text;
    String password=_passwordController.text;
User? user =await firebaseService.signInWithEmailAndPassword(email, password);
if(user !=null){
  print("user successfully login");
  Navigator.pushNamed(context, "/home");
}else{
  print("some error happend");
}
  }
}
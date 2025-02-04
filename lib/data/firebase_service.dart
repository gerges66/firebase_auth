// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseService {
//   final FirebaseAuth _auth=FirebaseAuth.instance;
//   final FirebaseFirestore store=FirebaseFirestore.instance;
//   Future<User?>singUpWithEmailAndPassword(String email,String password) async{
//     try{
// UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email, password: password);
// return userCredential.user;
//     }
// catch(e) {
//   print(e.toString());
// }
//     return null;
//   }
//   Future<User?>singInWithEmailAndPassword(String email,String password) async{
//     try{
// UserCredential userCredential=await _auth.signInWithEmailAndPassword(email: email, password: password);
// return userCredential.user;
//     }
// catch(e) {
//   print(e.toString());
// }
//     return null;
//   }
//   Future<void> setPasswordAndEmailLink(String email)async{
// try{
// await _auth.sendPasswordResetEmail(email: email);
// }
// catch (e){
// print(e.toString());
// }
//   }


// Future<void> signInWithPhoneNumber(String phoneNumber, Function(String) onCodeSent) async {
//   try {
//     await _auth.verifyPhoneNumber(
//       timeout: Duration(seconds: 4),
//       phoneNumber: phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await _auth.signInWithCredential(credential);
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print(e.toString());
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         onCodeSent(verificationId);
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   } catch (e) {
//     print(e.toString());
//   }
// }
// // verfiy otp code
// Future<void> verifyOtp({required String verificationId, required String otp}) async {
//   try {
//     // Create a PhoneAuthCredential
//     final PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
//       verificationId: verificationId,
//       smsCode: otp,
//     );

//     // Sign in with the credential
//     await _auth.signInWithCredential(phoneAuthCredential);
//         // Extract the phone number from the authenticated user

  

 
//   }
// }
//   Future<void> storeNumber(String phoneNumber) async{
// try{
// await store.collection("users").doc(phoneNumber).set({
//   "phoneNumber":phoneNumber,

// });
// }catch (e){
//   print(e.toString());
// }
//   }


// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore store = FirebaseFirestore.instance;

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // Send password reset email
  Future<void> setPasswordAndEmailLink(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

}

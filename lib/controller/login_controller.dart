import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/home/page/home_page.dart';

class logincontroller extends ChangeNotifier{

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  
  Future<void> Register(BuildContext context) async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text.trim(), password: passwordcontroller.text.trim());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }catch(e){
      print("error");
    }
  }


  Future<void> reset(BuildContext context) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reset Password sent in your email")));
    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reset Password not sent")));

    }
    
  }

  Future<UserCredential?> google() async{
    try{
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      if (googleuser != null){
        return null;
      }
      final GoogleSignInAuthentication? googleAuth = await googleuser?.authentication;
      final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return FirebaseAuth.instance.signInWithCredential(credential);

    }catch(e){
      return null;
    }

  }



  Future<void> login(BuildContext context) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text.trim(), password: passwordcontroller.text.trim());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
    }         
  }

}
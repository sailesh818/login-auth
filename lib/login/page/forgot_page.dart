import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final emailcontroller = TextEditingController();

  Future<void> reset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reset Password sent in your email")));
    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reset Password not sent")));

    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Page"),),
      body: Column(
        children: [
          TextField(
            controller: emailcontroller,
            decoration: InputDecoration(
              label: Text("Email"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25)
              )
            ),
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap: reset,
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Center(child: Text("Reset Password", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),
          )
        ],
      ),
    );
  }
}
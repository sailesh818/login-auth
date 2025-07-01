//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/controller/login_controller.dart';
import 'package:provider/provider.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  
  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<logincontroller>(context);

    
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Page"),),
      body: Column(
        children: [
          TextField(
            controller: controller.emailcontroller,
            decoration: InputDecoration(
              label: Text("Email"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25)
              )
            ),
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap: () => controller.reset,
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
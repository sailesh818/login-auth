//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/controller/login_controller.dart';
//import 'package:login/home/page/home_page.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<logincontroller>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Create Account"),),
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
          TextField(
            controller: controller.passwordcontroller,
            decoration: InputDecoration(
              label: Text("Password"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25)
              )
            ),
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap:() => controller.Register(context),
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Center(child: Text("Create Now", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            ),
          )
        ],
      ),
    );
  }
}
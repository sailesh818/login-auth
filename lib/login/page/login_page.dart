import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/home/page/create_page.dart';
import 'package:login/home/page/home_page.dart';
import 'package:login/login/page/forgot_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller =TextEditingController();
  final passwordcontroller =TextEditingController();

  Future<void> login() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text.trim(), password: passwordcontroller.text.trim());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 20),
        child: Column(
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
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPage()));
              },
              child: Text("Forgot Password", style: TextStyle(color: const Color.fromARGB(255, 70, 2, 152)),)),
            SizedBox(height: 25,),
            InkWell(
              onTap: login,
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25)

                ),
                
                child: Center(child: Text("Login", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
              ),
            ),
            
            SizedBox(height: 25,),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreatePage()));
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25)

                ),
                
                child: Center(child: Text("Create Account", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: () async {
                final UserCredential = await google();
                if (UserCredential != null){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));

                }
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25)

                ),
                
                child: Center(child: Text("Google SignIn", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
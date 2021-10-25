import 'package:cab_driver/app_widgets/progress_dialog.dart';
import 'package:cab_driver/app_widgets/taxi_button.dart';
import 'package:cab_driver/screens/auth/registration.dart';
import 'package:cab_driver/screens/home.dart';
import 'package:cab_driver/utils/brand_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future loginUser() async{

    showDialog(
        context: context,
        builder: (BuildContext context) => const ProgressDialog(status: 'Logging you in',));
    final User? user = (await _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ).catchError((err){
      print('erro is ${err.message}');
      Navigator.pop(context);
    })).user;

    if(user != null){
      DatabaseReference userRef = FirebaseDatabase.instance.reference().child('users/${user.uid}');
      userRef.once().then((DataSnapshot snapshot) {
        if(snapshot.value != null){
          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (route) => false);
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70,),
              const Image(
                alignment: Alignment.center,
                image: AssetImage('assets/images/logo.png'),
                height: 100,
                width: 100,
              ),

              const SizedBox(height: 20,),

              const Text(
                  'Sign In as a Rider',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: "Brand-Bold"),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:[
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                              fontSize: 14.0
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0
                          )
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),

                    const SizedBox(height: 10,),

                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontSize: 14.0
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0
                          )
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

             TaxiButton(
               title: 'LOGIN',
               buttonColor: BrandColors.colorGreen,
               onPressed: (){
                 loginUser();
               },
             ),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.id, (route) => false);
                },
                  child: const Text('Dont have an account? Sign up'))
            ],
          ),
        ),
      ),
    );
  }
}



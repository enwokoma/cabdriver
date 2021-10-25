import 'package:cab_driver/app_widgets/progress_dialog.dart';
import 'package:cab_driver/app_widgets/taxi_button.dart';
import 'package:cab_driver/main.dart';
import 'package:cab_driver/screens/auth/login.dart';
import 'package:cab_driver/screens/home.dart';
import 'package:cab_driver/utils/brand_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationScreen extends StatefulWidget {

  static const String id = 'register';


  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final fullNameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerUser() async{
    showDialog(
        context: context,
        builder: (BuildContext context) => const ProgressDialog(status: 'Registering you',));

    final User? user = (await _auth.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
    ).catchError((err){
      Navigator.pop(context);
      print('erro is ${err.message}');
    })).user;

    if(user != null){
      DatabaseReference newUserRef = FirebaseDatabase.instance.reference().child('users/${user.uid}');

      Map userMap = {
        'fullname ': fullNameController.text,
        'email': emailController.text,
        'phone': phoneController.text
      };

      newUserRef.set(userMap);
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (route) => false);
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
                'Create a rider account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: "Brand-Bold"),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: fullNameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: 'Full Name',
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
                      controller: emailController,
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
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Phone number',
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
              title: 'REGISTER',
              buttonColor: BrandColors.colorGreen,
              onPressed: (){
                //check network availability

                registerUser();
              },
            ),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
                },
                  child: const Text('Have an account? Sign In'))
            ],
          ),
        ),
      ),
    );
  }
}

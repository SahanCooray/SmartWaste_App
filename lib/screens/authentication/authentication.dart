import 'package:flutter/material.dart';
import 'package:test_app/screens/authentication/register.dart';
import 'package:test_app/screens/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool singinPage=true;
  void switchPages(){
    setState(() {
      singinPage=!singinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (singinPage==true){
      return Sign_In(toggle:switchPages);
    }else{
      return Register(toggle: switchPages);
    }
  }
}
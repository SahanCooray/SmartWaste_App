import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/UserModel.dart';
import 'package:test_app/navbar.dart';
import 'package:test_app/screens/authentication/authentication.dart';
import 'package:test_app/screens/init.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return const Init();
    } else {
      return CurveBar();
    }
  }
}

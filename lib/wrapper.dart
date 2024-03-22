import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/navbar.dart';
import 'package:test_app/screens/init.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel?>(
      builder: (context, user, child) {
        if (user != null) {
          return const CurveBar();
        } else {
          return const Init();
        }
      },
    );
  }
}

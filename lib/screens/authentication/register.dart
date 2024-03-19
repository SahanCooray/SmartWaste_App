import 'package:flutter/material.dart';
import 'package:test_app/constants/styles.dart';
import 'package:test_app/services/auth.dart';
import 'package:test_app/widgets/buttons.dart';
import 'package:test_app/widgets/form.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth =
      AuthServices(); // Assuming this is correctly set up
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            top: true,
            child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        // Row(
                        //   children: [
                        //     OutlinedButtonPrimary(
                        //       onPressed: () {
                        //         Navigator.pop(context);
                        //       },
                        //       child: const Icon(
                        //         Icons.arrow_back_ios_new,
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Text('Welcome Back! Glad to see you, Again!',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                        const SizedBox(height: 30),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                InputText(labelText: 'Email'),
                                const SizedBox(height: 20),
                                InputText(labelText: 'Password'),
                                const SizedBox(height: 20),
                                InputText(labelText: 'Phone'),
                                const SizedBox(height: 20),

                                // const SizedBox(height: 20),
                                // Text('Already have an account?'),
                                // OutlinedButtonPrimary(
                                //     onPressed: () {
                                //       widget.toggle();
                                //     },
                                //     child: const Text('Sign In')),
                              ],
                            )),
                      ],
                    )))),
      ),
    );
  }
}

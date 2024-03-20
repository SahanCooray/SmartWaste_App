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
                        // Text('Register',
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .headlineMedium!
                        //         .copyWith(
                        //           color: Theme.of(context).colorScheme.primary,
                        //         )),
                        const SizedBox(height: 30),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                InputText(labelText: 'First Name'),
                                const SizedBox(height: 20),
                                InputText(labelText: 'Last Name'),
                                const SizedBox(height: 20),
                                InputText(labelText: 'Email'),
                                const SizedBox(height: 20),
                                InputText(labelText: 'Phone'),
                                const SizedBox(height: 20),
                                InputText(labelText: 'Password'),
                                const SizedBox(height: 20)
                              ],
                            )),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                          child: Container(
                            width: 370,
                            child: Stack(
                              alignment: const AlignmentDirectional(0, 0),
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 12),
                                    child: Container(
                                      width: double.infinity,
                                      height: 1.6,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outlineVariant,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: 70,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Text(
                                      'OR',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        OutlinedButtonPrimary(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply a valid email';
                                  });
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Continue With Google'),
                              ],
                            )),
                        OutlinedButtonPrimary(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply a valid email';
                                  });
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Continue With Apple'),
                              ],
                            )),
                      ],
                    )))),
      ),
    );
  }
}

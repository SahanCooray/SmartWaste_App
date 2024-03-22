import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/widgets/buttons.dart';
import 'package:test_app/widgets/form.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/services/auth.dart';
import 'package:test_app/widgets/navbar.dart';

class Sign_In extends StatefulWidget {
  final Function toggle;
  const Sign_In({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
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
            child: SingleChildScrollView(
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
                            Text('Welcome back! Glad to see you, Again!',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )),
                            const SizedBox(height: 30),
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    InputEmail(
                                      labelText: 'Email',
                                      onChange: (String? value) {
                                        setState(() {
                                          email = value!;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    InputPassword(
                                      labelText: 'Password',
                                      onChange: (String? value) {
                                        setState(() {
                                          password = value!;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    FilledButtonSecondary(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            try {
                                              dynamic result = await _auth
                                                  .registerWithEmailAndPassword(
                                                      email, password);
                                              if (result != null) {
                                                UserModel(uid: result.uid);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const NavBar()),
                                                );
                                              }
                                            } on FirebaseAuthException catch (e) {
                                              String errorMessage;
                                              // Handle different Firebase Auth exceptions
                                              switch (e.code) {
                                                case 'invalid-email':
                                                  errorMessage =
                                                      'The email address is badly formatted.';
                                                  break;
                                                case 'weak-password':
                                                  errorMessage =
                                                      'The password is too weak.';
                                                  break;
                                                case 'email-already-in-use':
                                                  errorMessage =
                                                      'The account already exists for that email.';
                                                  break;
                                                default:
                                                  errorMessage =
                                                      'An undefined Error happened.';
                                              }
                                              setState(() {
                                                error = errorMessage;
                                              });
                                            } catch (e) {
                                              // Handle any other exceptions
                                              setState(() {
                                                error =
                                                    'An error occurred. Please try again.';
                                              });
                                            }
                                          }
                                        },
                                        text: "Login"),
                                    const SizedBox(height: 20),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 24),
                              child: Container(
                                width: 370,
                                child: Stack(
                                  alignment: const AlignmentDirectional(0, 0),
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 12, 0, 12),
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
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Container(
                                        width: 70,
                                        height: 32,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0, 0),
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
                                onPressed: () async {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(PhosphorIcons.google_logo_bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow),
                                    const SizedBox(width: 10),
                                    Text('Continue With Google',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .shadow,
                                            ))
                                  ],
                                )),
                            const SizedBox(height: 10),
                            OutlinedButtonPrimary(
                                onPressed: () async {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(PhosphorIcons.apple_logo_bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow),
                                    const SizedBox(width: 10),
                                    Text('Continue With Apple',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .shadow,
                                            )),
                                  ],
                                )),
                            const SizedBox(height: 10),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .shadow,
                                          )),
                                  TextButton(
                                      onPressed: () {
                                        widget.toggle();
                                      },
                                      child: Text('Register Now',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              )))
                                ],
                              ),
                            )
                          ],
                        ))))),
      ),
    );
  }
}

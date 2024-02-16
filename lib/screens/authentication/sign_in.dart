import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_app/constants/styles.dart';

import 'package:test_app/services/auth.dart';

class Sign_In extends StatefulWidget {
  final Function toggle;
  const Sign_In({Key? key,required this.toggle}):super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final AuthServices _auth= AuthServices();
  final _formKey=GlobalKey<FormState>();
  String email="";
  String password="";
  String error="";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage( image:AssetImage('assets/back.jpg'),
          fit: BoxFit.fill,),
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        body:Center(
          child: SingleChildScrollView(
            child: Container( child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: _formKey,
                  child: Column(children: [
                    Center(child: Image.asset('assets/smartwastenet.jpeg',height: 200,)),
                    SizedBox(height: 30,),
                    TextFormField(
                      decoration: textInputDecoration,
                      validator: (val)=> val?.isEmpty == true ?"Enter a valid Email": null,
                      onChanged: (val){
                        setState(() {
                          email=val;
                        });
                      },
                      ),
                    SizedBox(height: 20,),
                    TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(hintText:"    Password"),
                      validator: (val)=> val!.length<6? "Enter a valid Password": null,
                      onChanged: (val){
                        setState(() {
                          password=val;
                        });
                      },
                      ),
                      SizedBox(height: 20,),
                      Text(error,style: TextStyle(color: Colors.red),),
                      Text('Login with Google',style: TextStyle(color: Colors.white),),
                      GestureDetector(onTap: (){}, child: Center(child: Image.asset('assets/google_ic.png',height: 50,color: Colors.white,))),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Do you have an account?',style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 10,),
                          //go to register page
                          GestureDetector(onTap: (){
                            widget.toggle();
                          }, child: Text('REGISTER',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.w600),))
                        ],
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        //method for login user
                        onTap: () async {
                          dynamic result= await _auth.signInUsingEmailAndPassword(email, password);
                          if(result==null){
                            setState(() {
                              error='Could not login with this email and password';
                            });
                          }

                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(color: Color.fromARGB(255, 197, 253, 44),borderRadius: BorderRadius.circular(100),),
                          child: Center(child: const Text('LOGIN',style: TextStyle(color: Color.fromARGB(255, 1, 31, 1),fontSize: 15),)),
                        ),
                      ),
                      SizedBox(height: 15,),
                      GestureDetector(
                        onTap: ()async {
                          await _auth.signInAnonymously();
                          
                        },
                        //method for login user
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(color: Color.fromARGB(255, 197, 253, 44),borderRadius: BorderRadius.circular(100),),
                          child: Center(child: const Text('LOGIN AS A GUEST',style: TextStyle(color: Color.fromARGB(255, 1, 31, 1),fontSize: 15),)),
                        ),
                      )
                  ]
                  ,)
                  ),
              ]  
            
              
            
              
              
                  
                  ),
            
                
                
                
                  
              
              ),
          ),
        ),
      )
    );
  }
}



// ElevatedButton(
//         child: const Text('Sign in Anonymously'),
//         onPressed: ()async{
//           dynamic resulut= await _auth.signInAnonymously();
//           if (resulut== null){
//             print("error in sign in anonymously");

//           }else{
//             print('singed in anonymously');
//             print(resulut.uid);

//           }
//         },
//       ),
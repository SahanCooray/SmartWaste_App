
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/services/auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthServices _auth =AuthServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        //   bottomNavigationBar: CurvedNavigationBar(
        //   backgroundColor: Colors.transparent,
        //   color: Colors.green,
        //   animationDuration: Duration(milliseconds: 300),
        //   items: [
        //     Icon(Icons.home),
        //     Icon(Icons.person)
        //   ],  
        // ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30,top: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Hi!!\nGood Morning,\nYehen",style: TextStyle(fontSize:30,fontWeight:FontWeight.w500,color: Color.fromRGBO(55, 159, 153, 1.0)))),
                ),     
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/keels.png"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 340,
                  height: 140,
                  margin: const EdgeInsets.only(top: 20),
                ),
                const SizedBox(height: 2),
                Center(child: Image.asset('assets/DailyProgress.png',height: 200,)),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                        Image.asset('assets/box-1.png',height: 100,), 
                        Image.asset('assets/box-2.png',height: 100,)
                      ], ),
                      // const SizedBox(width:50,),
                      Center(child: Image.asset('assets/Donut.png',height: 210,))
                    ],
                  ),
              const SizedBox(height: 100),
              ],
            
            ),
          ),
        ),
        ),
      

    );

  }
}

// MaterialApp(
//       home: Scaffold(
        
//         appBar: AppBar(
//           title: Text('HOME'),
//           actions: [
//             ElevatedButton(onPressed: ()async{
//               await _auth.signOut();
//             }, child: const Icon(Icons.logout_outlined))
//           ],
//         ),
//       )
//     );
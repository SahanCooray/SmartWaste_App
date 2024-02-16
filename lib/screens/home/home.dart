
import 'package:flutter/material.dart';
import 'package:test_app/services/auth.dart';

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
        // bottomNavigationBar: CurvedNavigationBar(
        //   backgroundColor: Colors.transparent,
        //   color: Colors.green,
        //   animationDuration: Duration(milliseconds: 300),
        //   items: [
        //     Icon(Icons.home),
        //     Icon(Icons.home),
        //     Icon(Icons.home),
        //   ],
          
          
        // ),

        



        backgroundColor: Color.fromARGB(255, 225, 230, 225),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 180,width: 180,child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Center(child: const Text("Hi Sahan!!,Good Morning",style: TextStyle(fontSize:30,fontWeight:FontWeight.w500,))),
                    )),
                    
                    ElevatedButton(onPressed: ()async{
                      await _auth.signOut();
                      }, child: const Icon(Icons.logout_outlined))
                  ],
                ),
                const SizedBox(height: 5),
                Center(child: Image.asset('assets/keels.png',height: 200,)),
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
                      Center(child: Image.asset('assets/Donut.png',height: 200,))
                      
                                
                      
                    ],
                  
                  ),
                
            
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
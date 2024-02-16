import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


import 'package:test_app/screens/home/home.dart';
import 'package:test_app/screens/leaderboard.dart';
import 'package:test_app/screens/profile.dart';
import 'package:test_app/screens/redeems.dart';
import 'package:test_app/screens/settings.dart';


class CurveBar extends StatefulWidget {
  const CurveBar({super.key});

  @override
  State<CurveBar> createState() => _CurveBarState();
}

class _CurveBarState extends State<CurveBar> {
  int index = 0;
  final screen = const [
    Home(),
    LeaderBoard(),
    Redeems(),
    Profile(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Icons.home, size: 30),
      const Icon(Icons.leaderboard, size: 30),
      const Icon(Icons.wallet_giftcard_rounded, size: 30),
      const Icon(Icons.person, size: 30),
      const Icon(Icons.settings, size: 30)
    ];
    return SafeArea(
      child: Scaffold(
        
        extendBody: true,
        
        body: screen[index],
        // Center(
        //   child: Text(
        //     '$index',
        //     style: const TextStyle(
        //         fontSize: 110, fontWeight: FontWeight.bold, color: Colors.white),
        //   ),
        // ),
        bottomNavigationBar: Theme(
          // this them is for to change icon colors.
          data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(
            color: Colors.white,
          )),
          child: CurvedNavigationBar(
            // navigationBar colors
            color: Color.fromARGB(255, 25, 158, 25),
            //selected times colors
            buttonBackgroundColor: Color.fromARGB(255, 3, 53, 11),
            backgroundColor: Colors.transparent,
            items: items,
            height: 60,
            index: index,
            onTap: (index) => setState(
              () => this.index = index,
            ),
          ),
        ),
      ),
    );
  }
}
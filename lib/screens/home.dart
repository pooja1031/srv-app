import 'package:flutter/material.dart';
import 'package:srv_app/api/page%202.dart';
import 'package:srv_app/api/side1.dart';
import 'package:srv_app/widgets/searchbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
 gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [const Color(0xFF39A5A8),
      Color.fromARGB(255, 255, 254, 254),
       Color.fromARGB(255, 245, 245, 245),
              Color.fromARGB(255, 243, 248, 247),

       ], 
    ),
            image: DecorationImage(
              
              image: AssetImage('assets/Images/kkkk.png'),
              fit: BoxFit.cover,
            ),
          ),
         child: SideMenu(),
          
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Images/homebackg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
                Image.asset(
                  'assets/Images/Group 2312.png',
                  width: 134,
                  height: 34,
                ),
                IconButton(
                  icon: Icon(Icons.notifications_outlined),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: kToolbarHeight + 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SearchBars(),
                SizedBox(height: 16),
                Positioned(
                  top: kToolbarHeight + 60,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height -
                        kToolbarHeight -
                        250,
                    child: MyHomePage(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:srv_app/screens/batch.dart';
import 'package:srv_app/screens/home.dart';
import 'package:srv_app/screens/reports.dart';
import 'package:srv_app/screens/students.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

List Pages=[

Home(),
BatchPage(),
Reports(),
StudentsPage(),
];
int currentIndex=0;
void onTap(int index){
setState(() {
  currentIndex=index;
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Pages[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        
        child: BottomNavigationBar(
          unselectedFontSize: 12,
          selectedFontSize: 12,
           unselectedLabelStyle: TextStyle(color: const Color.fromARGB(255, 234, 232, 227),fontSize: 12),
          unselectedIconTheme: IconThemeData(color: Colors.black),
                  selectedIconTheme: IconThemeData(color: Color(0xFFFF7A2F),  ),
           selectedLabelStyle: TextStyle(color: Colors.black,fontSize: 12),
          type:BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          iconSize: 30,
          onTap: onTap,
          currentIndex: currentIndex,
         // selectedItemColor: Colors.orange,
         // unselectedItemColor: const Color.fromARGB(255, 6, 6, 6),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          items: [
        BottomNavigationBarItem(label: "Home",icon:Icon(Icons.home_outlined)),
              BottomNavigationBarItem(label: "Batch",icon:Icon(Icons.layers_outlined)),
        BottomNavigationBarItem(label: "Students",icon:Icon(Icons.person_outline)),
        BottomNavigationBarItem(label: "Reports",icon:Icon(Icons.featured_video_outlined)),
        ]),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:scrap/Screens/home.dart';
import 'package:scrap/Screens/rate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pageList = [
    const Home(),
    const Text("Activity"),
    const Rate(),
    const Text("Account")
    
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items:  const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Color.fromARGB(255,130,36,50)),
            BottomNavigationBarItem(icon: Icon(Icons.history),label: "Activity"),
            BottomNavigationBarItem(icon: Icon(Icons.monetization_on_outlined),label: "Rate list"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
        body: pageList.elementAt(_selectedIndex),
      ),
    );
  }
}

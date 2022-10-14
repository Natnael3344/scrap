import 'package:flutter/material.dart';
import 'package:scrap/Screens/home.dart';
import 'package:scrap/Screens/rate.dart';
import 'package:scrap/Screens/activity.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
class _HomePageState extends State<HomePage> {
  List<Widget> pageList = [
    const SizedBox(),
    const Home(),
    const Activity(),
    const Rate(),
  ];
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    index == 0
        ? _drawerKey.currentState!.openDrawer()
    :setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        key: _drawerKey,
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255,130,36,50),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    color:  Color.fromARGB(255,130,36,50),
                    border: Border(bottom: BorderSide(color: Colors.black))
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'SCRAPIFY',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ListTile(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const Dashboard(),
                      //   ),
                      // );
                    },
                    title: const Text(
                      "Profile",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ListTile(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>   const AssetsList(),
                      //   ),
                      // );
                    },
                    title: const Text(
                      "Share",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ListTile(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const TransactionsList(),
                      //   ),
                      // );
                    },
                    title: const Text(
                      "How it works",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ListTile(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const Dashboard(),
                      //   ),
                      // );
                    },
                    title: const Text(
                      "About",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ListTile(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const Dashboard(),
                      //   ),
                      // );
                    },
                    title: const Text(
                      "Call us",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items:  const [
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account",backgroundColor: Color.fromARGB(255,130,36,50)),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Color.fromARGB(255,130,36,50)),
            BottomNavigationBarItem(icon: Icon(Icons.history),label: "Activity"),
            BottomNavigationBarItem(icon: Icon(Icons.monetization_on_outlined),label: "Rate list"),

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

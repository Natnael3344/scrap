import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:scrap/Screens/about.dart';
import 'package:scrap/Screens/call.dart';
import 'package:scrap/Screens/guide.dart';
import 'package:scrap/Screens/home.dart';
import 'package:scrap/Screens/language.dart';
import 'package:scrap/Screens/profile.dart';
import 'package:scrap/Screens/rate.dart';
import 'package:scrap/Screens/activity.dart';
class HomePage extends StatefulWidget {
  final String phone;
  const HomePage({Key? key, required this.phone}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class _HomePageState extends State<HomePage> {

  List<Widget> pageList=[];

  get videoEnable => null;

  get file => null;
  @override
  void initState() {
    super.initState();

    pageList = [
      const SizedBox(),
      Home(phone: widget.phone,),
      Activity(phone: widget.phone,),
      const Rate(),
    ];
  }

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
               DrawerHeader(
                decoration: const BoxDecoration(
                    color:  Color.fromARGB(255,130,36,50),
                    border: Border(bottom: BorderSide(color: Colors.black))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'SCRAPIFY'.tr,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ListTile(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>  Profile(phone: widget.phone,),
                        ),
                      );
                    },
                    title:  Text(
                      "Profile".tr,
                      style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Guide(),
                        ),
                      );
                    },
                    title:  Text(
                      "How_it_works".tr,
                      style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const About(),
                        ),
                      );
                    },
                    title:  Text(
                      "About".tr,
                      style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Language(),
                        ),
                      );
                    },
                    title:  Text(
                      "Language".tr,
                      style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ListTile(
                    onTap: () {
                      _callNumber();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const Call(),
                      //   ),
                      // );
                    },
                    title:  Text(
                      "Call_us".tr,
                      style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items:   [
            BottomNavigationBarItem(icon: const Icon(Icons.person),label: "Account".tr,backgroundColor: Color.fromARGB(255,130,36,50)),
            BottomNavigationBarItem(icon: const Icon(Icons.home),label: "Home".tr,backgroundColor: Color.fromARGB(255,130,36,50)),
            BottomNavigationBarItem(icon: const Icon(Icons.history),label: "Activity".tr),
            BottomNavigationBarItem(icon: const Icon(Icons.monetization_on_outlined),label: "Rate_list".tr),

          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
        body: pageList.elementAt(_selectedIndex),
      ),
    );
  }
  _callNumber() async{
    const number = '+917028431151'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}

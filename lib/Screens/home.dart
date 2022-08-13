import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Color.fromARGB(255,130,36,50)),
          BottomNavigationBarItem(icon: Icon(Icons.history),label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 150,
              width: double.maxFinite,
              decoration: const BoxDecoration(color: Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(20))),
              child:  const Center(child: Text("What would you like to sell?",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(
              height: 275,
              child: GridView.count(
                crossAxisCount: 3,
                primary: false,
                padding: const EdgeInsets.all(15),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child:  Center(child: Column(
                      children: [
                        Lottie.asset('assets/paper.json',height: 90),
                        const Text("Paper",style: TextStyle(color: Colors.white),),
                      ],
                    )),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Center(child: Text("Plastic",style: TextStyle(color: Colors.white),)),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Center(child: Text("Metals",style: TextStyle(color: Colors.white),)),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Center(child: Text("E-Waste",style: TextStyle(color: Colors.white),)),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Center(child: Text("Other items",style: TextStyle(color: Colors.white),)),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              // decoration: const BoxDecoration(
              //     color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))
              // ),
              child:   const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.white,),
                  hintText: "Pick up address....",
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Color.fromARGB(255,130,36,50),
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

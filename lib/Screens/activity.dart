import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  final String phone;
  const Activity({Key? key, required this.phone}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class ActivityModel
{
  late String name;
  late String address;
  late String price;

  ActivityModel.name(this.name, this.address, this.price);
}

class _ActivityState extends State<Activity> {
  List act=[];
  // Future<List<ActivityModel>> getPost() async {
  //   Query postsSnapshot = FirebaseDatabase.instance
  //       .ref()
  //       .child("Confirmation")
  //       .orderByKey();
  //
  //   print(postsSnapshot); // to debug and see if data is returned
  //
  //   List<ActivityModel> posts=[];
  //   AsyncSnapshot<DataSnapshot> snapshot;
  //   Map<dynamic, dynamic>? values =  snapshot.data.value as Map?;
  //   values.forEach((key, values) {
  //     posts.add(values);
  //   });
  //
  //   return posts;
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserAmount();
  }
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Customers');

  Widget listItem({required  Map activity}) {
    if(activity.containsKey(null)) {
      return SizedBox();
    }
    else{
      return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 110,
        decoration: BoxDecoration(
            gradient:LinearGradient(colors: [
              const Color.fromARGB(255,130,36,50).withOpacity(0.1),
              Colors.yellow.withOpacity(0.1),
            ])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity['name'].toString().replaceAll('[', '').replaceAll(
                  ']', ''),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "for Amount ${activity['price'].toString()
                  .replaceAll('[', '')
                  .replaceAll(']', '')}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              activity['address'].toString().replaceAll('[', '').replaceAll(
                  ']', ''),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              activity['date'].toString().replaceAll('[', '').replaceAll(
                  ']', ''),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    }

  }

// Get the data once
//   DatabaseEvent event = await ref.once();
  @override
  Widget build(BuildContext context) {
    Query dbRef = FirebaseDatabase.instance.ref().child("Customers").child(widget.phone).child("Requests");


    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Request history"),
            backgroundColor: const Color.fromARGB(255,130,36,50),
          ),
          body: Container(
            height: double.infinity,
            child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation,  int index) {
                  Map activity = snapshot.value as Map;
                  activity['key'] = snapshot.key;
                  print("object kdfkdfkdlk kldfkdlfkdlfk kdlfkdlfkdlfk");
                  print(activity);
                  if(!activity.containsKey('Profile')&&activity['name']!=null) {
                    return listItem(activity: activity);
                  }
                  else{
                    return const SizedBox();
                  }
              },
            ),
    )));
  }
  // void load(){
  //   FirebaseAnimatedList(
  //     query: dbRef,
  //     itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
  //       setState(() {
  //         activity = snapshot.value as Map;
  //         activity['key'] = snapshot.key;
  //       });
  //       return listItem(activity: activity);
  //
  //     },
  //   ),
  // }
   int getUserAmount()  {
     final response = FirebaseDatabase.instance.ref().child('Customers').child(widget.phone).child("Requests");
    List users = [];
     response.once().then((event) {
       Map  dataSnapshot = event.snapshot.value as Map;
       dataSnapshot.forEach((key, values){
         setState(() {
           users.add(key);
         });
       });
     }
     );
     print("object klklk  kl kj  kl kl  ");
     print(users.length);
     print(users);
    return users.length-1;

  }
}

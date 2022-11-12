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
  Query dbRef = FirebaseDatabase.instance.ref().child('Confirmation');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Confirmation');

  Widget listItem({required Map activity}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            activity['name'].toString().replaceAll('[', '').replaceAll(']', ''),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "for Amount ${activity['price'].toString().replaceAll('[', '').replaceAll(']', '')}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            activity['address'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            activity['date'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

// Get the data once
//   DatabaseEvent event = await ref.once();
  @override
  Widget build(BuildContext context) {
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
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                Map activity = snapshot.value as Map;
                activity['key'] = snapshot.key;

                return listItem(activity: activity);

              },
            ),
    )));
  }
}

import 'package:flutter/material.dart';

import 'otp.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255,130,36,50),
        title: const Text("Login/Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: const Center(
                child: Text(
                  'Enter Phone Number',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextField(
                cursorColor: const Color.fromARGB(255,130,36,50),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:  Color.fromARGB(255,130,36,50))),
                  hintText: 'Phone Number',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+91'),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            )
          ]),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.all(20),
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,130,36,50))
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OTPScreen(_controller.text)));
                },
                child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Next",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          )
        ],
      ),
    );
  }
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'otp.dart';
//
// class Login extends StatefulWidget {
//    const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   TextEditingController phoneController = TextEditingController();
//   FirebaseAuth auth = FirebaseAuth.instance;
//   String verificationID=" ";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         titleSpacing: -10,
//         iconTheme: const IconThemeData(color: Colors.black),
//         title: const Text("Login/Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
//         actions:  [
//           Center(child: Container(margin: const EdgeInsets.only(right: 10),child: TextButton(onPressed:(){
//             Navigator.push(context, MaterialPageRoute (
//               builder: (BuildContext context) =>  Otp(phone: phoneController.text),
//             ),);
//           },child: const Text("NEXT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),))))
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(margin: const EdgeInsets.only(top: 20),child: const Text("We will send you a code to verify your number.",style: TextStyle(fontSize: 15),)),
//           Container(
//             margin: const EdgeInsets.only(left: 10,right: 10,top: 40,bottom: 20),
//             child:  TextField(
//               controller: phoneController,
//               decoration: const InputDecoration(labelText: "Phone number"),
//               keyboardType: TextInputType.phone,
//             ),
//             ),
//           const Text("Standard SMS fees may apply",style: TextStyle(color: Colors.black38),)
//         ],
//       ),
//     );
//   }
//
//   void loginWithPhone() async {
//     auth.verifyPhoneNumber(
//       phoneNumber: phoneController.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await auth.signInWithCredential(credential).then((value){
//           print("You are logged in successfully");
//         });
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print(e.message);
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         verificationID = verificationId;
//         setState(() {});
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//
//       },
//     );
//   }
// }

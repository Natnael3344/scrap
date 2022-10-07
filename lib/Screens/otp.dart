import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'home.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  const OTPScreen(this.phone, {super.key});
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  bool verified=true;
  final TextEditingController _pinPutController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _verifyPhone();
    super.initState();

  }
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content:  Row(
        children: [
          const CircularProgressIndicator(color:  Color.fromARGB(255,130,36,50),),
          Container(margin: const EdgeInsets.only(left: 7),child: const Text("Verifying..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  showLoaderDialog1(BuildContext context){
    AlertDialog alert=AlertDialog(
      content:  Row(
        children: [
          const Icon(Icons.check_circle,color:  Color.fromARGB(255,130,36,50),),
          Container(margin: const EdgeInsets.only(left: 7),child: const Text("Verified" )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: const Text('OTP Verification',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    'Verify +91-${widget.phone}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,

                  controller: _pinPutController,

                  pinAnimationType: PinAnimationType.fade,
                  onSubmitted: (pin) async {
                    setState(() {
                      _pinPutController.text=pin;
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.all(20),
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,130,36,50))
                ),
                onPressed: () async{

                  try {

                    showLoaderDialog(context);
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: _verificationCode!, smsCode: _pinPutController.text))
                        .then((value) async {
                      if (value.user != null){
                        Navigator.pop(context);
                        showLoaderDialog1(context);
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                      (route) => false);
                          });

                        });

                      }
                    });
                  } catch (e) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter otp again.... ")));

                  }

                },
                child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Verify",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          )
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:scrap/Screens/home.dart';
//
// class Otp extends StatefulWidget {
//   const Otp({Key? key, required this.phone}) : super(key: key);
//   final String phone ;
//
//   @override
//   State<Otp> createState() => _OtpState();
// }
//
// class _OtpState extends State<Otp> {
//   TextEditingController otpController = TextEditingController();
//
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   String verificationID=" ";
//   @override
//   void initState() {
//     // TODO: implement initState
//     verifyOTP();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         titleSpacing: -10,
//         iconTheme: const IconThemeData(color: Colors.black),
//         title: const Text("Verify Phone Number",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
//         actions:  [
//           Center(child: Container(margin: const EdgeInsets.only(right: 10),child: TextButton(onPressed: (){
//
//           }, child: TextButton( onPressed: (){
//             Navigator.push(context,
//               MaterialPageRoute (
//                 builder: (BuildContext context) => const Home(),
//               ),);
//           },child: const Text("SUBMIT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),)))))
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(margin: const EdgeInsets.only(top: 20),child: const Text("Please enter the code sent to \n        +917028431151 ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
//           Container(margin: const EdgeInsets.only(top: 40,bottom: 20),child: const Text("ENTER VERIFICATION CODE",style: TextStyle(fontSize: 15,color:Colors.black38),)),
//           OtpTextField(
//             numberOfFields: 5,
//             borderColor: const Color(0xff822432),
//             focusedBorderColor: const Color(0xff822432),
//             //set to true to show as box or false to show as dash
//             showFieldAsBox: true,
//             //runs when a code is typed in
//             onCodeChanged: (String code) {
//               //handle validation or checks here
//             },
//             //runs when every textfield is filled
//             onSubmit: (String verificationCode){
//               showDialog(
//                   context: context,
//                   builder: (context){
//                     return const AlertDialog(
//                       title: Text("Verification Code"),
//                       content: Text('Verified'),
//                     );
//                   }
//               );
//             }, // end onSubmit
//           ),
//           Container(
//               margin: const EdgeInsets.only(top: 20),
//               child: const Text("Request new code",style: TextStyle(color: Colors.black38),))
//         ],
//       ),
//     );
//   }
//   void verifyOTP() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: widget.phone,
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             if (value.user != null) {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => Home()),
//                       (route) => false);
//             }
//           });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (String? verificationID, int? resendToken) {
//           setState(() {
//             verificationID = verificationID;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationID) {
//           setState(() {
//             verificationID = verificationID;
//           });
//         },
//         timeout: Duration(seconds: 120));
//   }
// }

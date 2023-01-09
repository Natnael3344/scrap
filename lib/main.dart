import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:scrap/Screens/home_page.dart';
import 'package:scrap/Screens/login.dart';
import 'package:scrap/Screens/name.dart';

import 'LanguageChangeProvider.dart';
import 'generated/l10n.dart';


List<CameraDescription>? cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) =>  LanguageChangeProvider(),
      child: Builder(
          builder: (context) =>
        MaterialApp(
           locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocale,
           localizationsDelegates: const [
             S.delegate,
             GlobalMaterialLocalizations.delegate,
             GlobalWidgetsLocalizations.delegate,
             GlobalCupertinoLocalizations.delegate,
           ],
           supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
        home: const MyHome()
      ),
    )
    );
  }
}
class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool loading=true;
  @override
   initState()  {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image:DecorationImage(image: AssetImage("images/home.jpg"))
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 230,bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Icon(Icons.recycling_outlined,color: Color.fromARGB(255,130,36,50),),
                  Container(margin: const EdgeInsets.only(left: 10),child: const Text("SCRAPIFY",style: TextStyle(color: Color.fromARGB(255,130,36,50),fontFamily:'Saira_Stencil_One',fontSize: 30,fontWeight: FontWeight.w900),))
                ],
              ),
            ),
            const Text("Scrapify is the best place to buy and sell scrap.\n            Join our platform and start selling\n                         and buying scrap!",
              style: TextStyle(fontSize: 15),) ,
            Padding(
              padding: const EdgeInsets.only(top: 325,bottom: 20),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,130,36,50))
                    ),
                    onPressed: ()  {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: false,
                                builder: (ctx) {
                                  return const SafeArea(
                                    child: Scaffold(
                                      backgroundColor: Colors.white,
                                      // appBar: AppBar(
                                      // title: Text(indicator.toString().split('.').last),
                                      // ),
                                        body: Padding(
                                          padding: EdgeInsets.all(125),
                                          child: Center(
                                              child: LoadingIndicator(
                                                  indicatorType: Indicator.lineScalePulseOut,
                                                  colors: [
                                                    Color.fromARGB(255,130,36,50),
                                                  ],
                                                  strokeWidth: 0.5,
                                                  backgroundColor: Colors.white,
                                                  pathBackgroundColor: Colors.white
                                              )
                                          ),
                                        )
                                    ),
                                  );
                                }
                            )
                        );
                        check();
                    },
                    child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Continue with Phone Number",style: TextStyle(fontSize: 16),))),
              ),
            ),
            const Text("Privacy Policy")
          ],
        ),
      ),
    );
  }
  void check() async
  {


      if (!mounted) return;
      Navigator.push(context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
          const LoginScreen(),
        ),
      );

  }
}

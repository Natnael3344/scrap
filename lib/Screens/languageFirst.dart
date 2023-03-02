import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scrap/Controllers/language_controller.dart';
import 'package:scrap/Model/language_model.dart';
import 'package:scrap/Screens/login.dart';
import 'package:scrap/Utils/app_constants.dart';

import '../LanguageChangeProvider.dart';

class LanguageFirst extends StatelessWidget {
  const LanguageFirst({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: GetBuilder<LocalizationController>(builder: (localizationController) {
        return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerDocked,
            floatingActionButton: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.all(20),
              height: 50,
              child: ElevatedButton(onPressed: () {

                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const LoginScreen(),
                  ),
                );
              },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 130, 36, 50))
                  ),
                  child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child:  Text('continue'.tr, style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),))),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 35, right: 35, top: 70),
                  child: Text('Choose', style: TextStyle(fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 130, 36, 50)),),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35, right: 35, bottom: 40),
                  child: Text('your language',
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildContainer(context, () {
                        localizationController.setLanguage(Locale(
                            AppConstants.languages[0].languageCode,AppConstants.languages[0].countryCode));
                        localizationController.setSelectIndex(0);
                      }, 'Hi!', 'I am Sam', 'English'),
                      buildContainer(context, () {
                        localizationController.setLanguage(Locale(
                            AppConstants.languages[1].languageCode,AppConstants.languages[1].countryCode));
                        localizationController.setSelectIndex(1);
                      }, 'हाय!', 'मी सॅम आहे', 'Marathi'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildContainer(context, () {
                      localizationController.setLanguage(Locale(
                          AppConstants.languages[1].languageCode,AppConstants.languages[1].countryCode));
                      localizationController.setSelectIndex(1);
                    }, 'नमस्ते!', 'मैं सैम हूं', 'Hindi'),
                    buildContainer(context, () {
                      localizationController.setLanguage(Locale(
                          AppConstants.languages[1].languageCode,AppConstants.languages[1].countryCode));
                      localizationController.setSelectIndex(1);
                    }, 'வணக்கம்!', 'நான் சாம்', 'Tamil'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 35, left: 35),
                  child: buildContainer(context, () {
                    localizationController.setLanguage(Locale(
                        AppConstants.languages[1].languageCode,AppConstants.languages[1].countryCode));
                    localizationController.setSelectIndex(1);
                  }, 'హాయ్!', 'నేను సామ్', 'Telugu'),
                ),
              ],
            )
        );
      }
    )
    );
  }

  Container buildContainer(BuildContext context,void Function()? onPressed,String text, String text1, String text2) {
    return Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(color: Color.fromARGB(255,130,36,50),
                  borderRadius: BorderRadius.circular(20)
                  ),
                  child: ElevatedButton(onPressed: onPressed,
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,130,36,50))
                    ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                          Text(text1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(text2,style: TextStyle(color: Colors.blue),),
                          )
                        ],
                      ),
                  ),
                );
  }
}

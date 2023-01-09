import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../LanguageChangeProvider.dart';

class Language extends StatefulWidget {
  const Language({Key? key,}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Language"),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            ElevatedButton(onPressed: (){
              context.read<LanguageChangeProvider>().changeLocale("hi");
            }, child: const Text("Hindi")),
            ElevatedButton(onPressed: (){
              context.read<LanguageChangeProvider>().changeLocale("en");
            }, child: const Text("English")),
          ],
        ),
      ),
    );
  }

}

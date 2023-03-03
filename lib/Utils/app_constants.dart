

import '../Model/language_model.dart';

class AppConstants{
static const String COUNTRY_CODE= 'country_code';
static const String LANGUAGE_CODE='language_code';

static List<LanguageModel> languages=[
  LanguageModel('English', 'en', 'US'),
  LanguageModel('Hindi', 'hi', 'IN'),
  LanguageModel('Marathi', 'mr', 'IN'),
  LanguageModel('Tamil', 'ta', 'IN'),
  LanguageModel('Telugu', 'te', 'IN'),
];
}
import '../../../../model/locale_string_model.dart';

class SmartEmailString {
  // static LocalizationStringModel smartEmail = LocalizationStringModel(jsonName: 'smartEmail', localeValue: ['Smart Email', 'سمارٹ ای میل']);
  static LocalizationStringModel generateEmail = LocalizationStringModel(jsonName: 'generateEmail', localeValue: ['Generate Email', 'ای میل پیدا کریں']);
  static LocalizationStringModel generatedEmail = LocalizationStringModel(jsonName: 'generatedEmail', localeValue: ['Generated Email', 'پیدا شدہ ای میل']);
  static LocalizationStringModel regenerate = LocalizationStringModel(jsonName: 'regenerate', localeValue: ['Regenerate', 'دوبارہ پیدا کریں']);
  static LocalizationStringModel share = LocalizationStringModel(jsonName: 'share', localeValue: ['Share', 'شیئر کریں']);


  static LocalizationStringModel fromNameTitle = LocalizationStringModel(jsonName: 'fromNameTitle', localeValue: ['From Name', 'بھیجنے والے کا نام']);
  static LocalizationStringModel fromNameHint = LocalizationStringModel(jsonName: 'fromNameHint', localeValue: ['From Name (Optional)', 'بھیجنے والے کا نام (ضروری نہیں)']);
  static LocalizationStringModel toNameTitle = LocalizationStringModel(jsonName: 'toNameTitle', localeValue: ['To Name', 'وصول کنندہ کا نام']);
  static LocalizationStringModel toNameHint = LocalizationStringModel(jsonName: 'toNameHint', localeValue: ['To Name (Optional)', 'وصول کنندہ کا نام (ضروری نہیں)']);
  static LocalizationStringModel keyPointsTitle = LocalizationStringModel(jsonName: 'keyPointsTitle', localeValue: ['Key Points*', 'اہم نکات*']);
  static LocalizationStringModel keyPointsHint = LocalizationStringModel(jsonName: 'keyPointsHint', localeValue: ['Write the main topic of your email here.', 'اپنے ای میل کا مرکزی موضوع یہاں لکھیں۔']);


  static LocalizationStringModel selectTone = LocalizationStringModel(jsonName: 'selectTone', localeValue: ['Select Tone*', 'لہجہ منتخب کریں*']);
  static List<LocalizationStringModel> toneList = [
    LocalizationStringModel(jsonName: 'selectFriendly', localeValue: ['Friendly', 'دوستانہ']),
    LocalizationStringModel(jsonName: 'selectLuxury', localeValue: ['Luxury', 'لگژری']),
    LocalizationStringModel(jsonName: 'selectRelaxed', localeValue: ['Relaxed', 'آرام']),
    LocalizationStringModel(jsonName: 'selectProfessional', localeValue: ['Professional', 'پیشہ ور']),
    LocalizationStringModel(jsonName: 'selectAdventurous', localeValue: ['Adventurous', 'مہم جو']),
    LocalizationStringModel(jsonName: 'selectWitty', localeValue: ['Witty', 'ظریف']),
    LocalizationStringModel(jsonName: 'selectPersuasive', localeValue: ['Persuasive', 'قائل کن']),
    LocalizationStringModel(jsonName: 'selectBold', localeValue: ['Bold', 'جسارت مند']),
    LocalizationStringModel(jsonName: 'selectEmpathetic', localeValue: ['Empathetic', 'ہمدرد']),
  ];


  static LocalizationStringModel selectLength = LocalizationStringModel(jsonName: 'selectLength', localeValue: ['Select Length*', 'لمبائی کو منتخب کریں*']);
  static List<LocalizationStringModel> lengthList = [
    LocalizationStringModel(jsonName: 'selectShort', localeValue: ['Short', 'مختصر']),
    LocalizationStringModel(jsonName: 'selectMedium', localeValue: ['Medium', 'درمیانا']),
    LocalizationStringModel(jsonName: 'selectLong', localeValue: ['Long', 'لمبا']),
  ];


}
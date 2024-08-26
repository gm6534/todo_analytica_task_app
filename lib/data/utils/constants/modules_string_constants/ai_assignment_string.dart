import '../../../../model/locale_string_model.dart';

class AiAssignmentString {
  static LocalizationStringModel topicH = LocalizationStringModel(jsonName: 'topicH', localeValue: ['Topic*', 'موضوع*']);
  static LocalizationStringModel topicHint = LocalizationStringModel(jsonName: 'topicHint', localeValue: ['Write assignment topic', 'اسائنمنٹ کا موضوع لکھیں۔']);
  static LocalizationStringModel assignKeyPointsTitle = LocalizationStringModel(jsonName: 'assignKeyPointsTitle', localeValue: ['Key Points*', 'اہم نکات*']);
  static LocalizationStringModel assignKeyPointsHint = LocalizationStringModel(jsonName: 'assignKeyPointsHint', localeValue: ['Write the main points here.', 'اہم نکات یہاں لکھیں۔']);
  static LocalizationStringModel generateAssignment = LocalizationStringModel(jsonName: 'generateAssignment', localeValue: ['Generate Assignment', 'اسائنمنٹ تیار کریں']);
  static LocalizationStringModel generatedAssignment = LocalizationStringModel(jsonName: 'generatedAssignment', localeValue: ['Generated Assignment', 'تخلیق کردہ اسائنمنٹ']);
  static LocalizationStringModel regenerate = LocalizationStringModel(jsonName: 'regenerate', localeValue: ['Regenerate', 'دوبارہ پیدا کریں']);
  static LocalizationStringModel share = LocalizationStringModel(jsonName: 'share', localeValue: ['Share', 'شیئر کریں']);



  static LocalizationStringModel selectCitation = LocalizationStringModel(jsonName: 'selectCitation', localeValue: ['Select Citation*', 'حوالہ منتخب کریں*']);
  static List<LocalizationStringModel> citationList = [
    LocalizationStringModel(jsonName: 'apa', localeValue: ['APA', 'APA']),
    LocalizationStringModel(jsonName: 'mla', localeValue: ['MLA', 'MLA']),
    LocalizationStringModel(jsonName: 'chicago', localeValue: ['Chicago/Turabian', 'Chicago/Turabian']),
    LocalizationStringModel(jsonName: 'harvard', localeValue: ['Harvard', 'Harvard']),
    LocalizationStringModel(jsonName: 'acs', localeValue: ['ACS', 'ACS']),
    LocalizationStringModel(jsonName: 'aip', localeValue: ['AIP', 'AIP']),
    LocalizationStringModel(jsonName: 'ieee', localeValue: ['IEEE', 'IEEE']),
    LocalizationStringModel(jsonName: 'oscola', localeValue: ['OSCOLA', 'OSCOLA']),
  ];


  static LocalizationStringModel selectLengthInWords = LocalizationStringModel(jsonName: 'selectLengthInWords', localeValue: ['Select Length (in words)*', 'لمبائی منتخب کریں (الفاظ میں)*']);
  static List<LocalizationStringModel> lengthList = [
    LocalizationStringModel(jsonName: 'select100To150', localeValue: ['100 - 200', '100 - 200']),
    LocalizationStringModel(jsonName: 'select200To300', localeValue: ['200 - 300', '200 - 300']),
    LocalizationStringModel(jsonName: 'select300To350', localeValue: ['300 - 350', '300 - 350']),
    LocalizationStringModel(jsonName: 'select350To450', localeValue: ['350 - 450', '350 - 450']),
  ];


}
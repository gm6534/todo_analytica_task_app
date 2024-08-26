import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;

// String Extensions
extension StringExtension on String? {
  /// Check email validation
  bool validateEmail() => hasMatch(this, Patterns.email);

  /// Check email validation
  bool validateEmailEnhanced() => hasMatch(this, Patterns.emailEnhanced);

  /// Check phone validation
  bool validatePhone() => hasMatch(this, Patterns.phone);

  /// Check URL validation
  bool validateURL() => hasMatch(this, Patterns.url);

  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull =>
      this == null ||
      (this != null && this!.isEmpty) ||
      (this != null && this! == 'null');

  // Check null string, return given value if null
  String validate({String value = ''}) {
    if (isEmptyOrNull) {
      return value;
    } else {
      return this!;
    }
  }

  /// Capitalize given String
  String capitalizeFirstLetter() => (validate().isNotEmpty)
      ? (this!.substring(0, 1).toUpperCase() + this!.substring(1).toLowerCase())
      : validate();

  /// Image regex
  bool get isImage => hasMatch(this, Patterns.image);

  /// Audio regex
  bool get isAudio => hasMatch(this, Patterns.audio);

  /// Video regex
  bool get isVideo => hasMatch(this, Patterns.video);

  /// Txt regex
  bool get isTxt => hasMatch(this, Patterns.txt);

  /// Document regex
  bool get isDoc => hasMatch(this, Patterns.doc);

  /// Excel regex
  bool get isExcel => hasMatch(this, Patterns.excel);

  /// PPT regex
  bool get isPPT => hasMatch(this, Patterns.ppt);

  /// Document regex
  bool get isApk => hasMatch(this, Patterns.apk);

  /// PDF regex
  bool get isPdf => hasMatch(this, Patterns.pdf);

  /// HTML regex
  bool get isHtml => hasMatch(this, Patterns.html);

  /// Return true if given String is Digit
  bool isDigit() {
    if (validate().isEmpty) {
      return false;
    }
    if (validate().length > 1) {
      for (var r in this!.runes) {
        if (r ^ 0x30 > 9) {
          return false;
        }
      }
      return true;
    } else {
      return this!.runes.first ^ 0x30 <= 9;
    }
  }

  bool get isInt => this!.isDigit();

  // Copy String to Clipboard
  Future<void> copyToClipboard() async {
    await service.Clipboard.setData(service.ClipboardData(text: validate()));
  }

  /// Splits from a [pattern] and returns remaining String after that
  String splitAfter(Pattern pattern) {
    ArgumentError.checkNotNull(pattern, 'pattern');
    var matchIterator = pattern.allMatches(this!).iterator;

    if (matchIterator.moveNext()) {
      var match = matchIterator.current;
      var length = match.end - match.start;
      return validate().substring(match.start + length);
    }
    return '';
  }

  /// Splits from a [pattern] and returns String before that
  String splitBefore(Pattern pattern) {
    ArgumentError.checkNotNull(pattern, 'pattern');
    var matchIterator = pattern.allMatches(validate()).iterator;

    Match? match;
    while (matchIterator.moveNext()) {
      match = matchIterator.current;
    }

    if (match != null) {
      return validate().substring(0, match.start);
    }
    return '';
  }

  /// It matches the String and returns between [startPattern] and [endPattern]
  String splitBetween(Pattern startPattern, Pattern endPattern) {
    return splitAfter(startPattern).splitBefore(endPattern);
  }

  /// Return int value of given string
  int toInt({int defaultValue = 0}) {
    if (this == null) return defaultValue;

    if (isDigit()) {
      return int.parse(this!);
    } else {
      return defaultValue;
    }
  }

  /// Return double value of given string
  double toDouble({double defaultValue = 0.0}) {
    if (this == null) return defaultValue;

    try {
      return double.parse(this!);
    } catch (e) {
      return defaultValue;
    }
  }

  /// Removes white space from given String
  String removeAllWhiteSpace() =>
      validate().replaceAll(RegExp(r"\s+\b|\b\s"), "");

  /// Returns only numbers from a string trim Whitespaces
  String getNumericOnly({bool aFirstWordOnly = false}) {
    String numericOnlyString = '';

    for (var i = 0; i < validate().length; i++) {
      if ((this![i].isDigit())) {
        numericOnlyString += this![i];
      }
      if (aFirstWordOnly && numericOnlyString.isNotEmpty && this![i] == " ") {
        break;
      }
    }

    return numericOnlyString;
  }

  ///  eg. Text("Dr. ${VARIABLE_NAME}"); =>  Text("VARIABLE_NAME.prefixText("Dr.")");
  String prefixText({required String value}) {
    return '$value$this';
  }

  ///  eg. Text("${VARIABLE_NAME} /-"); =>  Text("VARIABLE_NAME.suffixText("/-")");
  String suffixText({required String value}) {
    return '$this$value';
  }

  /// This function returns given string with each word capital
  String capitalizeEachWord() {
    if (validate().isEmpty) {
      return '';
    }

    final capitalizedWords = this!.split(' ').map((word) {
      if (word.isEmpty) {
        return word;
      }
      final firstLetter = word[0].toUpperCase();
      final remainingLetters = word.substring(1).toLowerCase();
      return '$firstLetter$remainingLetters';
    });

    return capitalizedWords.join(' ');
  }

  /// Returns true if the validate() method returns 'true', otherwise returns false.
  bool toBool() => validate() == 'true';
}

// int Extensions
extension IntExtensions on int? {
  /// Validate given int is not null and returns given value if null.
  int validate({int value = 0}) {
    return this ?? value;
  }

  /// Leaves given height of space
  Widget get height => SizedBox(height: this?.toDouble());

  /// Leaves given width of space
  Widget get width => SizedBox(width: this?.toDouble());
}

// Double Extensions
extension DoubleExtensions on double? {
  /// Validate given double is not null and returns given value if null.
  double validate({double value = 0.0}) => this ?? value;
}

// Widget Extensions
extension WidgetExtension on Widget? {
  /// With custom width
  SizedBox withWidth(double width) => SizedBox(width: width, child: this);

  /// With custom height
  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly({
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  /// return padding symmetric
  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  /// add rotation to parent widget
  Widget rotate({
    required double angle,
    bool transformHitTests = true,
    Offset? origin,
  }) {
    return Transform.rotate(
      origin: origin,
      angle: angle,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add scaling to parent widget
  Widget scale({
    required double scale,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) {
    return Transform.scale(
      scale: scale,
      child: this,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
    );
  }

  /// set parent widget in center
  Widget center({double? heightFactor, double? widthFactor}) {
    return Center(
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: this,
    );
  }

  /// set parent widget alignment
  Widget align({AlignmentGeometry alignment = Alignment.center}) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  /// add Expanded to parent widget
  Widget expand({flex = 1}) => Expanded(child: this!, flex: flex);

  /// add Flexible to parent widget
  Widget flexible({flex = 1, FlexFit? fit}) {
    return Flexible(child: this!, flex: flex, fit: fit ?? FlexFit.loose);
  }

  /// add FittedBox to parent widget
  Widget fit({BoxFit? fit, AlignmentGeometry? alignment}) {
    return FittedBox(
      child: this,
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
    );
  }

  /// Validate given widget is not null and returns given value if null.
  Widget withTooltip({required String msg}) {
    return Tooltip(message: msg, child: this);
  }
}

// ScrollController Extensions
extension ScrollExtension on ScrollController {
  /// Scroll to top with given animation duration
  Future<void> animToTop({milliseconds = 300}) async {
    animateTo(
      0,
      duration: Duration(milliseconds: milliseconds),
      curve: Curves.decelerate,
    );
  }

  /// Scroll to bottom with given animation duration
  Future<void> animToBottom({milliseconds = 300}) async {
    animateTo(
      position.maxScrollExtent,
      duration: Duration(milliseconds: milliseconds),
      curve: Curves.linear,
    );
  }

  /// Scroll to given position with given animation duration
  Future<void> animateToPosition(double position, {milliseconds = 300}) async {
    animateTo(
      position,
      duration: Duration(milliseconds: milliseconds),
      curve: Curves.linear,
    );
  }

  /// Scroll to top without animation
  void jumpToTop() => jumpTo(0);

  /// Scroll to bottom without animation
  void jumpToBottom() => jumpTo(position.maxScrollExtent);
}

// Boolean Extensions
extension BooleanExtensions on bool? {
  /// Validate given bool is not null and returns given value if null.
  bool validate({bool value = false}) => this ?? value;
}

RegExp alphaRegExp = RegExp(r'^[a-zA-Z]+$');

/// has match return bool for pattern matching
bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

/// Predefined Patterns for different validation
class Patterns {
  static String url =
      r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

  static String phone = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  static String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String emailEnhanced =
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  static String image = r'.(jpeg|jpg|gif|png|bmp)$';

  /// Audio regex
  static String audio = r'.(mp3|wav|wma|amr|ogg)$';

  /// Video regex
  static String video = r'.(mp4|avi|wmv|rmvb|mpg|mpeg|3gp|mkv)$';

  /// Txt regex
  static String txt = r'.txt$';

  /// Document regex
  static String doc = r'.(doc|docx)$';

  /// Excel regex
  static String excel = r'.(xls|xlsx)$';

  /// PPT regex
  static String ppt = r'.(ppt|pptx)$';

  /// Document regex
  static String apk = r'.apk$';

  /// PDF regex
  static String pdf = r'.pdf$';

  /// HTML regex
  static String html = r'.html$';
}

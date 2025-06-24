import 'package:flutter/material.dart';
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double safeAreaHorizontal;
  static late double safeAreaVertical;
  static late double safeWidth;
  static late double safeHeight;
  static late double blockWidth;
  static late double blockHeight;
  static late double textScaleFactor;
  static late Orientation orientation;
  static bool _initialized = false;
  static void init(BuildContext context) {
    if (_initialized) return;
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    textScaleFactor = _mediaQueryData.textScaleFactor;
    orientation = _mediaQueryData.orientation;

    safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeWidth = screenWidth - safeAreaHorizontal;
    safeHeight = screenHeight - safeAreaVertical;

    blockWidth = safeWidth / 100;
    blockHeight = safeHeight / 100;
    _initialized = true;
  }
}

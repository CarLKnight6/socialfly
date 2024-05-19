import 'package:flutter/material.dart';

class ScreenUtil {
  static MediaQueryData? _mediaQueryData;

  static double _screenWidth = 0;
  static double _screenHeight = 0;

  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  static double safeBlockHorizontal = 0;
  static double safeBlockVertical = 0;

  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;

  static double scaleFactor = 0;
  static init() {
    _mediaQueryData = MediaQueryData.fromView(WidgetsBinding.instance.window);

    _screenWidth = _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData!.size.height;

    blockSizeHorizontal = _screenWidth / 100;
    blockSizeVertical = _screenHeight / 100;

    _safeAreaVertical = _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    _safeAreaHorizontal = _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;

    safeBlockVertical = (_screenHeight - _safeAreaVertical) / 100;
    safeBlockHorizontal = (_screenWidth - _safeAreaHorizontal) / 100;

    scaleFactor = _screenWidth / 375.0;
  }
}

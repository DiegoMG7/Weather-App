import 'package:flutter/material.dart';

class Styles
{
  static const _textSizeLarge = 24.0;
  static const _textSizeMid = 20.0;
  static const _textSizeDefault = 18.0;
  static final Color textColorStrong = _hexToColor('000000');//regular text(black)
  static final Color header1Color = _hexToColor('3B7EA7');//Company Palette
  static final Color btn1Color = _hexToColor('4B4D4F');
  static final Color bColor2 = _hexToColor('B0DAEC');
  static final Color header3Color = _hexToColor('27CED7');
  static final Color tableHeaderColor = _hexToColor('002345');
  static final String _fontNameHeader = 'SourceSansPro-SemiBold';
  static final String _fontNameDefault = 'SourceSansPro-Regular';

  static final navBarTitle = TextStyle(
    fontFamily: _fontNameHeader,
    fontSize: _textSizeMid,
  );

  static final header1 = TextStyle(
    fontFamily: _fontNameHeader,
    fontSize: _textSizeLarge,
  );

  static final header2 = TextStyle(
    fontFamily: _fontNameHeader,
    fontSize: _textSizeMid,
      color: Colors.black
  );

  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    color: Colors.black
  );


  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
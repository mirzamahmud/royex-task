import 'dart:ui';

class ColorHelper{

  static Color convertColor(String colorCode){
    int parsingColor = int.parse("0xff$colorCode");
    return Color(parsingColor);
  }
}
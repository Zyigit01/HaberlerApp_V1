import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RenkSabitleri {
  static MaterialColor temaRengi = Colors.blue;
  static Color appBarRengi = Colors.transparent;
  static Color appBarTitleColor = Colors.black;
}


class StyleSabitleri {
  static TextStyle appBarTitleStyle =
      GoogleFonts.bakbakOne(fontSize: UygulamaFontSize.buyuk.deger(), color: RenkSabitleri.appBarTitleColor);

  static TextStyle sonucStyle = GoogleFonts.akayaKanadaka(fontSize: UygulamaFontSize.extraBuyuk.deger());
}

enum UygulamaFontSize { kucuk, orta, buyuk, extraBuyuk }

extension UygulamaFontSizeExtension on UygulamaFontSize {
  double deger() {
    switch (this) {
      case UygulamaFontSize.kucuk:
        return 16;
      case UygulamaFontSize.orta:
        return 25;
      case UygulamaFontSize.buyuk:
        return 30;
      case UygulamaFontSize.extraBuyuk:
        return 35;
    }
  }
}

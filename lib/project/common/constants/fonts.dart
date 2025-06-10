import 'package:flutter/material.dart';

class Fonts {
  const Fonts._();

  static const double sizeExtraSmall = 10.0;
  static const double sizeSmall = 14.0;
  static const double sizeNormal = 16.0;
  static const double sizeMedium = 18.0;
  static const double sizeLarge = 20.0;
  static const double size2XLarge = 24.0;
  static const double size3XLarge = 32.0;
  static const double size4XLarge = 48.0;

  static const FontWeight weightLight = FontWeight.w300;
  static const FontWeight weightNormal = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightSemiBold = FontWeight.w600;
  static const FontWeight weightBold = FontWeight.w700;
}

extension TextStyleExt on TextStyle {
  TextStyle get extraSmall => copyWith(fontSize: Fonts.sizeExtraSmall);

  TextStyle get small => copyWith(fontSize: Fonts.sizeSmall);

  TextStyle get normal => copyWith(fontSize: Fonts.sizeNormal);

  TextStyle get medium => copyWith(fontSize: Fonts.sizeMedium);

  TextStyle get large => copyWith(fontSize: Fonts.sizeLarge);

  TextStyle get extraLarge => copyWith(fontSize: Fonts.size2XLarge);

  TextStyle get extraExtraLarge => copyWith(fontSize: Fonts.size3XLarge);

  TextStyle get extraExtraExtraLarge => copyWith(fontSize: Fonts.size4XLarge);

  TextStyle get light => copyWith(fontWeight: Fonts.weightLight);

  TextStyle get normalWeight => copyWith(fontWeight: Fonts.weightNormal);

  TextStyle get mediumWeight => copyWith(fontWeight: Fonts.weightMedium);

  TextStyle get semiBold => copyWith(fontWeight: Fonts.weightSemiBold);

  TextStyle get bold => copyWith(fontWeight: Fonts.weightBold);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  TextStyle get none => copyWith(decoration: TextDecoration.none);

  TextStyle get ellipsis => copyWith(overflow: TextOverflow.ellipsis);

  TextStyle get clip => copyWith(overflow: TextOverflow.clip);

  TextStyle get fade => copyWith(overflow: TextOverflow.fade);

  TextStyle get visible => copyWith(overflow: TextOverflow.visible);
}

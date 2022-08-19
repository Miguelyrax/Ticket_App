/// Archivo que contiene todos los títulos
///

import 'package:flutter/material.dart';
import 'package:ticket_app/theme/ticket_colors.dart';

class TicketCustomTitles {

  static const Color _defaultColorTitle = TicketColors.black; 

  TicketCustomTitles();

  static TextStyle get textBase => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: _defaultColorTitle
  );

  static TextStyle get headline1 => textBase.copyWith(
    fontSize: 36,
  );

  static TextStyle get headline2 => textBase.copyWith(
    fontSize: 28,
  );

  static TextStyle get headline3 => textBase.copyWith(
    fontSize: 20,
  );

  static TextStyle get headline4 => textBase.copyWith(
    fontSize: 18,
  );

  static TextStyle get headline5 => textBase.copyWith(
    fontSize: 16,
  );

  static TextStyle get headline6 => textBase.copyWith(
    fontSize: 14,
  );


}

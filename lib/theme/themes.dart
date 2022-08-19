/// Archivo para exportar todos los themes de la aplicacion
///
import 'package:flutter/material.dart';
import 'package:ticket_app/theme/ticket_buttons.dart';
import 'package:ticket_app/theme/ticket_fonts.dart';
import 'package:ticket_app/theme/ticket_inputs.dart';



class ThemeApp {

  TextTheme get textTheme => TextTheme(
    headline1: TicketCustomTitles.headline1,
    headline2: TicketCustomTitles.headline2,
    headline3: TicketCustomTitles.headline3,
    headline4: TicketCustomTitles.headline4,
    headline5: TicketCustomTitles.headline5,
    headline6: TicketCustomTitles.headline6,
  );
  InputDecorationTheme get customInputForm => TicketInputs.customInputForm;
  ElevatedButtonThemeData get buttonTheme => ElevatedButtonThemeData(
    style: TicketCustomButtons.elevatedButton
  );
  TextButtonThemeData get textButtonTheme => TextButtonThemeData(
    style: TicketCustomButtons.textButton
  );
  CheckboxThemeData get checkTheme => TicketInputs.customCheckbox;
}
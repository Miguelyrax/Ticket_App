import 'package:flutter/material.dart';
import 'package:ticket_app/theme/ticket_colors.dart';


class TicketCustomButtons {

  static ButtonStyle get elevatedButton {
    return ButtonStyle(
      textStyle: MaterialStateProperty.all(const TextStyle(
        fontSize: 16,
        letterSpacing: 2,
        fontWeight: FontWeight.w500
      )),
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 24,horizontal: 16)),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        return TicketColors.white;
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return TicketColors.graysolid; 
        }
        return TicketColors.green;
      }),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      )),
    );
  }


  static ButtonStyle get textButton {
    return TextButton.styleFrom(
      padding: const EdgeInsets.fromLTRB(4,10,8,0),
      primary: TicketColors.blue, 
    );
  }
}
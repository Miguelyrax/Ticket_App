import 'package:flutter/material.dart';
import 'package:ticket_app/theme/ticket_colors.dart';


class TicketInputs {

  static const TextStyle fontText = TextStyle(
    fontSize: 16,
  );

  static final OutlineInputBorder _customBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: TicketColors.graysolid,
        width: 0,
      ),
      borderRadius: BorderRadius.circular(4),
    );

  static InputDecorationTheme get customInputForm => InputDecorationTheme(
        hintStyle: fontText.copyWith(color: TicketColors.mountainMist),
        labelStyle: fontText.copyWith(color: TicketColors.green),
        filled: true,
        fillColor: TicketColors.white,
        border: _customBorder,
        enabledBorder: _customBorder,
        focusedBorder: _customBorder.copyWith(
            borderSide:const BorderSide(
              color: TicketColors.graysolid,
            )
        ),
        focusedErrorBorder: _customBorder,
        errorBorder: _customBorder,
        errorStyle: const TextStyle(
          color: TicketColors.sunsetOrange
        ),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0)

      );

  static CheckboxThemeData get customCheckbox => CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)) {
        return TicketColors.blue;
      }
      return TicketColors.graysolid;
    }),
  );

}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/theme/ticket_colors.dart';


class CustomRichText extends StatelessWidget {
  const CustomRichText(
    {
      Key? key,
      required this.onPressed,
      required this.title,
      required this.subtitle,
      this.textAlign=TextAlign.start
    }) : super(key: key);

  final Function() onPressed;
  final String title;
  final String subtitle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textAlign: textAlign,
        text:TextSpan(
              text: title,
              style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w400),
              children: [
                TextSpan(
                  recognizer:TapGestureRecognizer()..onTap=(){
                    onPressed();

                  },
                  text: subtitle,
                  style: Theme.of(context)
                  .textTheme.headline6!
                  .copyWith(
                    color: TicketColors.blue,
                    fontWeight: FontWeight.w400
                  ),
                )
              ]
          )
    );
  }
}
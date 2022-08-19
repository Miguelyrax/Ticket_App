import 'package:flutter/material.dart';
import 'package:ticket_app/theme/ticket_colors.dart';

import '../utils/constants.dart';


class TextWidget extends StatelessWidget {
  final String content;
  final TitleTypes type;

  const TextWidget(
    {
      super.key, required this.content, required this.type
    }
  );
  @override
  Widget build(BuildContext context) {
    final style=Theme.of(context).textTheme;
    TextStyle font=style.headline1!;
    switch (type) {
      case TitleTypes.title:
        font=style.headline2!;
        break;
      case TitleTypes.subtitle:
        font=style.headline3!;
        break;
      case TitleTypes.paragraph:
        font=style.headline6!.copyWith(fontWeight: FontWeight.w400);
        break;
      case TitleTypes.decoration:
        font=style.headline4!;
        break;
      case TitleTypes.smallBold:
        font=style.headline6!.copyWith(fontWeight: FontWeight.bold);
        break;
      case TitleTypes.small:
        font=style.headline6!.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          color: TicketColors.graysolid
        );
        break;
      default:
    }
    return Text(
      content,
      style: font.copyWith()
    );
  }
}
import 'package:flutter/material.dart';

import '../theme/ticket_colors.dart';
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key, required this.onTap, required this.title,
  }) : super(key: key);
  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6!
          .copyWith(color: TicketColors.blue)
        )
      ),
    );
  }
}
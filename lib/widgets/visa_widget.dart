import 'package:flutter/material.dart';
import 'package:ticket_app/theme/ticket_colors.dart';


class VisaWidget extends StatelessWidget {
  const VisaWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: TicketColors.white,
      borderRadius: BorderRadius.circular(4)
    ),
    child: Text(
        'VISA',
        style: Theme.of(context)
        .textTheme.headline6!
        .copyWith(fontWeight: FontWeight.bold)
    ),
   );
  }
}
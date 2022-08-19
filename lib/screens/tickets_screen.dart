import 'package:flutter/material.dart';
import 'package:ticket_app/provider/tickets_provider.dart';
import 'package:ticket_app/widgets/widgets.dart';
import '../widgets/ticket_item_widget.dart';


class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider=TicketsProvider();
    final tickets=provider.tickets;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                direction: Axis.horizontal,
                children:List.generate(
                  tickets.length,
                  (index) => TicketItemWidget(ticket: tickets[index],)
                ),
               ),
          ),
        ),
      ),
   );
  }
}


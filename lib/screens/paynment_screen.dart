import 'package:flutter/material.dart';
import 'package:ticket_app/models/models.dart';
import 'package:ticket_app/views/views.dart';
import 'package:ticket_app/widgets/widgets.dart';


class PaynmentScreen extends StatelessWidget {
  
  const PaynmentScreen(
    {
      Key? key, required this.ticket, required this.quantity
    }
  ) : super(key: key);

  final Ticket ticket;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:SingleChildScrollView(
          child: ResponsiveWidget(
            mobil: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              ResumeView(ticket:ticket,quantity: quantity,),
              const SizedBox(height: 16,),
              const CreditCardDetailView(),
            ]
          ),
            web: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const Expanded(child:  CreditCardDetailView()),
              const SizedBox(width: 10,),
              ResumeView(ticket:ticket,quantity: quantity,),
            ]
          ),
          ),
        ) ,
      ),
   );
  }
}


import 'package:flutter/material.dart';
import 'package:ticket_app/models/models.dart';
import 'package:ticket_app/screens/screens.dart';
import 'package:ticket_app/theme/ticket_colors.dart';
import 'package:ticket_app/utils/constants.dart';
import 'package:ticket_app/widgets/widgets.dart';

import '../utils/breakpoints.dart';
class TicketItemWidget extends StatefulWidget {
  const TicketItemWidget({
    Key? key, required this.ticket,
  }) : super(key: key);

  final Ticket ticket;

  @override
  State<TicketItemWidget> createState() => _TicketItemWidgetState();
}

class _TicketItemWidgetState extends State<TicketItemWidget> {
  final TextEditingController _controller=TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  double size=0.0;
  final GlobalKey<FormState> _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        if(constraints.maxWidth<tablet&&constraints.maxWidth>mobile){
          size =.4;
        }else if(constraints.maxWidth<mobile){
          size =1;
        }else{
          size =.23;
        }
        return Container(
          width: MediaQuery.of(context).size.width * size ,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: TicketColors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: TicketColors.black.withOpacity(.1),
                spreadRadius: 5,
                blurRadius: 5
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.airplane_ticket,size: 50,),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          content:widget.ticket.title,
                          type: TitleTypes.title
                        ),
                        const SizedBox(height: 16,),
                        TextWidget(
                          content:widget.ticket.subTitle,
                          type: TitleTypes.subtitle
                        ),
                        const SizedBox(height: 32,),
                        Divider(thickness: 2,color: TicketColors.black.withOpacity(.4)),
                        const SizedBox(height: 32,),
                        TextWidget(
                          content:widget.ticket.content,
                          type: TitleTypes.paragraph
                        ),
                        const SizedBox(height: 100,),
                        Divider(thickness: 2,color: TicketColors.black.withOpacity(.4)),
                        const SizedBox(height: 16,),
                        const TextWidget(
                          content:'Precio',
                          type: TitleTypes.paragraph
                        ),
                        TextWidget(
                          content:widget.ticket.price.toString(),
                          type: TitleTypes.title
                        ),
                        const SizedBox(height: 16,),
                      ],
                    ),
                  )
                ],
              ),
              const TextWidget(
                content:'Cantidad',
                type: TitleTypes.decoration
              ),
              Form(
                key: _key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200
                  ),
                  child: CustomTextField(
                    number: true,
                    validator: (value){
                      if(value?.isEmpty??false){
                        value = '0';
                      }
                      value ??= '0';
                      if(int.parse(value)>0&&int.parse(value)<=100){
                        return null;
                      }else{
                        return 'Número <= 100';
                      }
                    },
                    controller: _controller,
                    hintText: ''
                  )
                ),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if(_key.currentState?.validate()??false){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  PaynmentScreen(
                            ticket: widget.ticket,
                            quantity: int.parse(_controller.text),
                          )
                        )
                      );
                    }
                  },
                  child: const Text('Comprar')
                ),
              )
            ]
          ),
        );
      }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:ticket_app/models/models.dart';
import 'package:ticket_app/widgets/widgets.dart';

import '../provider/tickets_provider.dart';
import '../theme/ticket_colors.dart';
import '../utils/constants.dart';
class CreditCardWidget extends StatefulWidget {
  const CreditCardWidget({
    Key? key, required this.index, required this.currentIndex, required this.card, required this.onPressed,
  }) : super(key: key);
  final int index;
  final int currentIndex;
  final CreditCard card;
  final Function(int i) onPressed;

  @override
  State<CreditCardWidget> createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> {
  late TextEditingController _ctrlName;    
  late TextEditingController _ctrlCardName;
  late TextEditingController _ctrlDate;    
  late TextEditingController _ctrlCVV;     
  late TextEditingController _ctrlNumber;  
  late TextEditingController _ctrlConfirmCvv;  
  final GlobalKey<FormState> _key=GlobalKey<FormState>();
  @override
  void initState() {
    _ctrlName     = TextEditingController(text: widget.card.userName);
    _ctrlCardName = TextEditingController(text: widget.card.title);
    _ctrlDate     = TextEditingController(text: widget.card.month);
    _ctrlCVV      = TextEditingController(text: widget.card.cvv);
    _ctrlNumber   = TextEditingController(text: widget.card.number);
    _ctrlConfirmCvv   = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _ctrlName.dispose();
    _ctrlCardName.dispose();
    _ctrlDate.dispose();
    _ctrlCVV.dispose();
    _ctrlNumber.dispose();
    super.dispose();
  }
  
  bool edit=false;
  @override
  Widget build(BuildContext context) {
    bool isSelected=widget.index==widget.currentIndex;
    final provider=TicketsProvider();
    return GestureDetector(
      onTap: (){
        widget.onPressed(widget.index);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:!isSelected? TicketColors.black.withOpacity(.03):TicketColors.blueOpacity,
          border: Border.all(color: TicketColors.graysolid),
          borderRadius: BorderRadius.circular(4)
        ),
        child:!edit? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CustomRadio(paint: isSelected,),
                const SizedBox(width: 10,),
                const VisaWidget(),
                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        content: '${widget.card.title} - ***${widget.card.number.toString().substring(widget.card.number.toString().length-3)}',
                        type: TitleTypes.smallBold
                      ),
                      Row(
                        children: [
                          TextWidget(
                            content: widget.card.userName,
                            type: TitleTypes.small
                          ),
                          const SizedBox(width: 5,),
                          const TextWidget(
                            content: '|',
                            type: TitleTypes.small
                          ),
                          const SizedBox(width: 5,),
                          Expanded(
                            child: TextWidget(
                              content: 'exp. ${widget.card.month}',
                              type: TitleTypes.small
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextButton(
                            onTap: (){
                              edit=!edit;
                              setState(() {
                                
                              });
                            },
                            title: 'Edit',
                          ),
                          const SizedBox(width: 5,),
                          const TextWidget(
                            content: '|',
                            type: TitleTypes.small
                          ),
                          const SizedBox(width: 5,),
                          CustomTextButton(
                            onTap: (){
                              provider.delete(
                                widget.card.id,
                              );
                              if(widget.currentIndex==0){
                                widget.onPressed(0);
                              }else{
                                widget.onPressed(widget.index-1);
                              }
                            },
                            title: 'Delete',
                          ),
                        ],
                      )
                      
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16,),
            const TextWidget(
              content: 'Security Code',
              type: TitleTypes.paragraph
            ),
            const SizedBox(height: 4,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: CustomTextField(
                    validate: false,
                    controller: _ctrlConfirmCvv,
                    hintText: ''
                  ),
                ),
                const SizedBox(width: 10,),
                const Icon(Icons.credit_card_rounded,size: 50,),
                const SizedBox(width: 10,),
                const Expanded(
                  child: TextWidget(
                    content: '3-digits on back of card', type: TitleTypes.paragraph
                  ),
                )
              ],
            )
          ]
        ):Form(
          child: Column(
            children: [
              Form(
              key: _key,
              child: Column(
                children: [
                  CustomTextField(controller: _ctrlName,hintText: 'Nombre y apellido',),
                  CustomTextField(controller: _ctrlCardName,hintText: 'Nombre de la tarjeta',),
                  CustomDate(controller: _ctrlDate,date: DateTime.parse(_ctrlDate.text),),
                  CustomTextField(controller: _ctrlCVV,hintText: 'CVV',number: true,),
                  CustomTextField(controller: _ctrlNumber,hintText: '0',number: true,),
                  Row(
                    children: [
                      TextButton(
                        onPressed: (){
                          if(_key.currentState?.validate()??false){
                           provider.edit(
                              widget.card.id,
                              _ctrlName.text,
                              _ctrlCardName.text,
                              _ctrlDate.text,
                              _ctrlCVV.text,
                              _ctrlNumber.text,
                            );
                            edit=!edit;
                            setState(() {
                              
                            });
                          }
                        },
                        child: const Text('Save',style: TextStyle(color: TicketColors.green))
                      ),
                      TextButton(
                        onPressed: (){
                          edit=!edit;
                          _ctrlName.text=widget.card.userName;
                          _ctrlCardName.text=widget.card.title;
                          _ctrlDate.text=widget.card.month;
                          _ctrlCVV.text=widget.card.cvv;
                          _ctrlNumber.text=widget.card.number;
                          setState(() {
                            
                          });
                        },
                        child: const Text('Cancel',style: TextStyle(color: TicketColors.sunsetOrange))
                      ),
                    ]
                  )
                ]
              )
            )
            ]
          )
        ),
      ),
    );
  }
}

class _CustomRadio extends StatelessWidget {
  const _CustomRadio({
    Key? key, required this.paint,
  }) : super(key: key);
  final bool paint;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: TicketColors.graysolid)
          ),
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color:paint?TicketColors.blue:null
         ),
        ),
      ],
    );
  }
}
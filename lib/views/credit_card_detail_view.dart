import 'package:flutter/material.dart';
import 'package:ticket_app/widgets/widgets.dart';
import '../provider/tickets_provider.dart';
import '../theme/ticket_colors.dart';
import '../utils/constants.dart';
class CreditCardDetailView extends StatefulWidget {
  const CreditCardDetailView({
    Key? key,
  }) : super(key: key);

  @override
  State<CreditCardDetailView> createState() => _CreditCardDetailViewState();
}

class _CreditCardDetailViewState extends State<CreditCardDetailView> {
  final provider=TicketsProvider();
  @override
  void initState() {
    provider.addListener(_listener);
    super.initState();
  }
  @override
  void dispose() {
    provider.removeListener(_listener);
    super.dispose();
  }

  void _listener()=>mounted?setState(() {}) : null;
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContentWidget(
          children: [
            Row(
              children: const [
                TextWidget(content: 'Delivery', type: TitleTypes.title),
                SizedBox(width: 10),
                Icon(Icons.check_circle,color: TicketColors.green, size: 30,)
              ],
            ),
            const SizedBox(height: 16,),
            const TextWidget(content: 'Mobile Entry - free', type: TitleTypes.subtitle),
            const SizedBox(height: 16,),
            const TextWidget(
              content: 'Tickets Available by Sun Apr 3, 2022These mobile tickets will be transfered directly to you from a trusted seller, We´ll email you instructions on how to accept them on the original ticket provider´s mobile app.',
              type: TitleTypes.paragraph
            ),
          ],
        ),
        const SizedBox(height: 16),
         ContentWidget(
          children: [
            Row(
              children: const [
                TextWidget(content: 'Paynment', type: TitleTypes.title),
                SizedBox(width: 10),
                Icon(Icons.check_circle,color: TicketColors.green, size: 30,)
              ],
            ),
            const SizedBox(height: 16,),
            const Padding(
              padding:  EdgeInsets.only(left: 16),
              child:  TextWidget(content: 'Use Credit / Debit Card', type: TitleTypes.subtitle),
            ),
            const SizedBox(height: 32,),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.creditCard.length,
                itemBuilder: (_,index){
                  return CreditCardWidget(
                    onPressed: (int indexSelected){
                      currentIndex=indexSelected;
                      setState(() {
                        
                      });
                    },
                    index: index,
                    currentIndex: currentIndex,
                    card: provider.creditCard[index],
                  );
                }
            ),
            const _AddNewCard(),
            const SizedBox(height: 32,),
            const TextWidget(content: 'Or Pay With', type: TitleTypes.subtitle),
            CustomRichText(
              textAlign: TextAlign.start,
              onPressed: (){},
              title: 'By using a digital wallet and continuing past this page, you have a read and are accepting the ',
              subtitle: 'Terms of use'
            )
          ]
        )
      ],
    );
  }
}

class _AddNewCard extends StatefulWidget {
  const _AddNewCard({
    Key? key,
  }) : super(key: key);

  @override
  State<_AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<_AddNewCard> {
  final TextEditingController _ctrlName     = TextEditingController();
  final TextEditingController _ctrlCardName = TextEditingController();
  final TextEditingController _ctrlDate     = TextEditingController();
  final TextEditingController _ctrlCVV      = TextEditingController();
  final TextEditingController _ctrlNumber   = TextEditingController();
  @override
  void dispose() {
    _ctrlName.dispose();
    _ctrlCardName.dispose();
    _ctrlDate.dispose();
    _ctrlCVV.dispose();
    _ctrlNumber.dispose();
    super.dispose();
  }
  final GlobalKey<FormState> _key=GlobalKey<FormState>();
  bool add=false;
  @override
  Widget build(BuildContext context) {
    final provider=TicketsProvider();
    return Column(
      children: [
        if(!add)
          TextButton(
            onPressed: (){
              add=!add;
              setState(() {
                
              });
            },
            child:Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.add,color: TicketColors.blue, size: 30,),
                Icon(Icons.credit_card_sharp,color: TicketColors.blue, size: 30,),
                SizedBox(width: 5,),
                Expanded(
                  child: Text('Add New Card')
                )
              ],
            )
        )else
          Form(
            key: _key,
            child: Column(
              children: [
                CustomTextField(controller: _ctrlName,hintText: 'Nombre y apellido',),
                CustomTextField(controller: _ctrlCardName,hintText: 'Nombre de la tarjeta',),
                CustomDate(controller: _ctrlDate),
                CustomTextField(controller: _ctrlCVV,hintText: 'CVV',number: true,),
                CustomTextField(controller: _ctrlNumber,hintText: '0',number: true,),
                Row(
                  children: [
                    TextButton(
                      onPressed: (){
                        if(_key.currentState?.validate()??false){
                         provider.add(
                            _ctrlName.text,
                            _ctrlCardName.text,
                            _ctrlDate.text,
                            _ctrlCVV.text,
                            _ctrlNumber.text,
                          );
                          _ctrlName.clear();
                          _ctrlCardName.clear();
                          _ctrlDate.clear();
                          _ctrlCVV.clear();
                          _ctrlNumber.clear();
                          add=!add;
                          setState(() {
                            
                          });
                        }
                      },
                      child: const Text('Save',style: TextStyle(color: TicketColors.green))
                    ),
                    TextButton(
                      onPressed: (){
                        add=!add;
                        _ctrlName.clear();
                        _ctrlCardName.clear();
                        _ctrlDate.clear();
                        _ctrlCVV.clear();
                        _ctrlNumber.clear();
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
    );
  }
}

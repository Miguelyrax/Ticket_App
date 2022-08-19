import 'package:flutter/material.dart';
import 'package:ticket_app/models/models.dart';
import 'package:ticket_app/widgets/widgets.dart';

import '../utils/constants.dart';

class ResumeView extends StatefulWidget {
  const ResumeView({
    Key? key, required this.ticket, required this.quantity,
  }) : super(key: key);
  final Ticket ticket;
  final int quantity;

  @override
  State<ResumeView> createState() => _ResumeView();
}

class _ResumeView extends State<ResumeView> {
bool value=false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        return ContentWidget(
                width:constraints.maxWidth<600
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width*.39,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(content: 'Total', type: TitleTypes.title),
                      TextWidget(content: (widget.ticket.price*widget.quantity+88.16+2.95).toStringAsFixed(2), type: TitleTypes.title),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  const TextWidget(content: 'Tickets', type: TitleTypes.subtitle),
                  const SizedBox(height: 16,),
                  _RowItem(title: 'Resale Tickets: \$${widget.ticket.price} x ${widget.quantity}',subTitle: '\$${(widget.ticket.price*widget.quantity).toStringAsFixed(2)}',),
                  const TextWidget(content: 'Notes From Seller', type: TitleTypes.subtitle),
                  const SizedBox(height: 16,),
                  const TextWidget(content: 'xfr XFER Proos of at least one dose COVID-19 vaccination for ages 5 to 11 and guests ages 12 and up will be required to show proof of two COVID-19 vaccine doses or one dose of the Johnson & Johnson vaccine. Mask must be worn.', type: TitleTypes.paragraph),
                  const SizedBox(height: 16,),
                  const TextWidget(content: 'Fees', type: TitleTypes.subtitle),
                  const SizedBox(height: 16,),
                  const _RowItem(title: 'Service Fee: \$44.08 x 2',subTitle: '\$88.16',padding: false,),
                  const _RowItem(title: 'Order Proccessing Fee',subTitle: '\$2.95',),
                  const TextWidget(content: 'Delivery', type: TitleTypes.subtitle),
                  const SizedBox(height: 16,),
                  const _RowItem(title: 'Mobile Entry',subTitle: 'Free',),
                  const TextWidget(content: 'Cancel Order', type: TitleTypes.subtitle),
                  const SizedBox(height: 16,),
                  const TextWidget(content: '* All Sales Final - No Refunds', type: TitleTypes.paragraph),
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        value: value,
                        onChanged: ( valor){
                            value=valor!;
                            setState(() {
                              
                            });
                        }
                      ),
                      Expanded(
                        child: CustomRichText(
                          textAlign: TextAlign.end,
                          onPressed: (){},
                          title: 'I have read and agree to the current ',
                          subtitle: 'Terms of use'
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:value? (){}:null,
                      child: const Text('Place Order')
                    ),
                  )
                ]
              );
      }
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem(
    {
      Key? key,
      required this.title,
      required this.subTitle,
      this.padding=true,
    }
  ) : super(key: key);
  final String title;
  final String subTitle;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:padding? 16:0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: TextWidget(content:title , type: TitleTypes.paragraph)),
          TextWidget(content:subTitle , type: TitleTypes.paragraph),
        ],
      ),
    );
  }
}


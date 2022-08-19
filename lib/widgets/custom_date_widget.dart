import 'package:flutter/material.dart';
import 'package:ticket_app/theme/ticket_colors.dart';
import 'package:ticket_app/widgets/widgets.dart';
class CustomDate extends StatefulWidget {
    CustomDate({
    Key? key,
    required this.controller,
    this.date,
  }) : super(key: key);

  final TextEditingController controller;
  final DateTime? date;
  final DateTime currentDate=DateTime.now();

  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  DateTime? date;
  @override
  void initState() {
    date=widget.date;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomTextField(controller: widget.controller, hintText: ''),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 48,
          decoration: BoxDecoration(
            color: TicketColors.white,
            border: Border.all(color: TicketColors.graysolid,width: 0.7),
            borderRadius: BorderRadius.circular(4),
          ),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(onPressed: ()  async{
                    final result = await showDatePicker(
                      builder: (context, child) {
                        return Theme(
                          
                          data: ThemeData.dark(),
                          child: child!,
                        );
                      },
                      currentDate: date, 
                      context: context,
                      initialDate:date?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 5, DateTime.now().month, DateTime.now().day));
                      if(result != null){
                        date = result;
                        setState(() {
                        });
                        widget.controller.text=result.toIso8601String().split('T')[0];
                    }
                  },
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      if(date==null)
                      const Expanded(
                        child:  Text(
                          'Fecha de expiración dd/mm/aaa',
                          maxLines: 1,
                          style: TextStyle(
                            color: TicketColors.mountainMist,
                            fontSize: 16
                          )
                        ),
                      )
                      else
                      Text(
                        widget.controller.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(
                          color: TicketColors.black,
                          fontSize: 16
                        )
                      ),
                      const SizedBox(width: 5,),
                      const Icon(
                        Icons.calendar_month,
                        size: 20,
                        color: TicketColors.blue
                      ),
                    ]
                  ) 
               ),
          ), 
        ),
      ],
    );
  }

}
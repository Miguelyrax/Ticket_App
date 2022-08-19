import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_app/models/models.dart';

class TicketsProvider with ChangeNotifier{
  static final TicketsProvider _ticketsProvider = TicketsProvider._internal();
  List<Ticket> tickets=[];
  List<CreditCard> creditCard=[];
  factory TicketsProvider(){
    return _ticketsProvider;
  }

  Future<void> seed()async{
    final String response = await rootBundle.loadString('assets/tickets.json');
    List<dynamic> listas=json.decode(response);
    tickets=listas.map((e) => Ticket.fromMap(e)).toList();
  }

  void add(String title,String userName,String month,String cvv, String number){
    creditCard.add(
      CreditCard(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: title,
        userName: userName,
        month: month,
        cvv: cvv,
        number: number
      ));
      notifyListeners();   
  }
  void edit(String id,String title,String userName,String month,String cvv, String number){
    creditCard=creditCard.map(
      (card) => card.id==id
      ?CreditCard(
        id: card.id,
        title: title,
        userName: userName,
        month: month,
        cvv: cvv,
        number: number)
      :card).toList();
      notifyListeners(); 
  }
  void delete(String id){
    creditCard=creditCard.where((card) => card.id!=id).toList();
    notifyListeners();
  }

  TicketsProvider._internal();
}

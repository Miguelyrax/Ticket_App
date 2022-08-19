

import 'dart:convert';

class Ticket{
  final String title;
  final String subTitle;
  final String content;
  final double price;
  
  Ticket(
    {
      required this.title,
      required this.subTitle,
      required this.content,
      required this.price
    }
  );
  factory Ticket.fromJson(String str) => Ticket.fromMap(json.decode(str));
  factory Ticket.fromMap(Map<String, dynamic> json) => Ticket(
        content: json["content"],
        title: json["title"],
        subTitle: json["subTitle"],
        price: json["price"].toDouble(),
    );

}
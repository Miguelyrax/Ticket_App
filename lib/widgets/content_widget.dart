import 'package:flutter/material.dart';
import 'package:ticket_app/theme/ticket_colors.dart';
class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key, required this.children, this.width,
  }) : super(key: key);

  final List<Widget> children;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TicketColors.white,
        border: Border.all(color: TicketColors.graysolid),
        borderRadius: BorderRadius.circular(4)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
      ),
    );
  }
}
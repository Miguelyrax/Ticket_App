import 'package:flutter/material.dart';
import 'package:ticket_app/utils/breakpoints.dart';


class ResponsiveWidget extends StatelessWidget {

  final Widget mobil;
  final Widget web;
  final Widget? tabletBody;

  const ResponsiveWidget({super.key, required this.mobil, required this.web, this.tabletBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_,constraints){
        if(constraints.maxWidth<tablet && tabletBody!=null&&constraints.maxWidth>mobile){
          return tabletBody!;
        }else if(constraints.maxWidth<mobile){
          return mobil;
        }else{
          return web;
        }
      }
    );
  }
}
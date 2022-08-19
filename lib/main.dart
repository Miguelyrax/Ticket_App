import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_app/provider/tickets_provider.dart';
import 'package:ticket_app/screens/screens.dart';
import 'package:ticket_app/theme/themes.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await TicketsProvider().seed();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  ThemeApp themeApp = ThemeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        inputDecorationTheme: themeApp.customInputForm,
        textTheme: themeApp.textTheme,
        elevatedButtonTheme: themeApp.buttonTheme,
        textButtonTheme: themeApp.textButtonTheme,
        checkboxTheme: themeApp.checkTheme
      ),
      builder: (context, child) {
        final data = MediaQuery.of(context);
        final smallestSize = min(data.size.width, data.size.height);
        final textScaleFactor = min(smallestSize / 375, 1.0);
        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: textScaleFactor,
          ),
          child: kIsWeb||Platform.isWindows||Platform.isMacOS?child!: SafeArea(child: child!),
        );
      },
      initialRoute: '/',
      routes: {
        '/':( _ ) => const TicketScreen()
      },
    );
  }
}
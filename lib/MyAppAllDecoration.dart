import 'package:flutter/material.dart';
import 'package:practiceproject/SplasScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplasScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigoAccent,
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          centerTitle: true,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.pink,
        ),
        inputDecorationTheme:  const InputDecorationTheme(
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigoAccent),),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigoAccent),),
          disabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple),),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigoAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
            textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
          )
        ),
      ),
    );
  }
}

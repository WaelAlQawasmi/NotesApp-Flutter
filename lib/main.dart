import 'package:flutter/material.dart';
import 'package:my_notes/Secreens/SignIn.dart';
import 'package:my_notes/Secreens/SignUp.dart';
import 'package:my_notes/Serveses/Auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/signup': (context) => const SignUp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/signin': (context) => const SignIn(),
      },

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.green,
        colorScheme: ThemeData().colorScheme.copyWith(
            primary: Color(0xFFA4D6A7),
            secondary: Color(0Xffff4874)
        ),
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
    );
  }
}



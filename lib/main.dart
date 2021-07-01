import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ventor/providers/event_provider.dart';
import 'package:ventor/providers/user_provider.dart';
import 'package:ventor/screens/auth_screen.dart';
import 'package:ventor/screens/event_info_screen.dart';
import 'package:ventor/screens/live_event_screen.dart';
import 'package:ventor/screens/main_scaffold.dart';
import 'package:ventor/screens/new_event_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isUserSet = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, EventProvider>(
          update: (context, auth, previousMessages) => EventProvider(auth),
          create: (BuildContext context) => EventProvider(null),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, child) => MaterialApp(
          title: 'Ventor',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.sourceSansProTextTheme(
              Theme.of(context).textTheme,
            ),
            primaryColor: Colors.white,
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          home: auth.token.isNotEmpty ? MainScaffold() : AuthScreen(),
          routes: {
            EventInfoScreen.routeName: (ctx) => EventInfoScreen(),
            LiveEventScreen.routeName: (ctx) => LiveEventScreen(),
            NewEventScreen.routeName: (ctx) => NewEventScreen(),
          },
        ),
      ),
    );
  }
}

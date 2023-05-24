import 'package:apitmtpproject/view/detailed_page/detailed_page.dart';
import 'package:apitmtpproject/view/loginpage/loginpage.dart';
import 'package:apitmtpproject/view/navbar/nav_bar.dart';
import 'package:apitmtpproject/view/navbar/pageview_widgets/account.dart';
import 'package:apitmtpproject/view/navbar/pageview_widgets/home.dart';
import 'package:apitmtpproject/view/navbar/pageview_widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: (MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

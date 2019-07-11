import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_flutter_v1/ui/home_page.dart';
import 'package:socket_flutter_v1/ui/page1.dart';
import 'package:socket_flutter_v1/ui/page2.dart';
import 'package:socket_flutter_v1/ui/page3.dart';
import 'package:socket_flutter_v1/ui/transper_page1.dart';
import 'package:socket_flutter_v1/utilities/socket_provider.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/HomePage':(context)=>HomePage(),
        '/Room1':(context)=>Page1(),
        '/Room2':(context)=>Page2(),
        '/Room3':(context)=>Page3(),
        '/Tp1' :(context)=>TransportPage1(),
      },
      debugShowCheckedModeBanner: false,
          home:HomePage(),
    );
  }
}

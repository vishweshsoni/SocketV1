import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_flutter_v1/utilities/socket_provider.dart';
class TransportPage1 extends StatefulWidget {
  @override
  _TransportPage1State createState() => _TransportPage1State();
}

class _TransportPage1State extends State<TransportPage1> {

  @override
  Widget build(BuildContext context) {
    var appState= Provider.of<SocketProvider>(context);
    return MaterialButton(
        height: 75.0,
        minWidth: 120.0,
        color:appState.button1 ? Colors.red:Colors.white,
        child: Text('',style:TextStyle(color: Colors.black)),
        onPressed: ()async{
          await appState.connectSocket('button1');
        }
    );
  }
}

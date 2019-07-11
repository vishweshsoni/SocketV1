import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_flutter_v1/utilities/socket_provider.dart';
class TransportPage3 extends StatefulWidget {
  @override
  _TransportPage3State createState() => _TransportPage3State();
}

class _TransportPage3State extends State<TransportPage3> {
  @override

  @override
  Widget build(BuildContext context) {
    var appState= Provider.of<SocketProvider>(context);
    return MaterialButton(
        height: 75.0,
        minWidth: 120.0,
        color:appState.button1 ? Colors.red:Colors.white,
        child: Text('',style:TextStyle(color: Colors.black)),
        onPressed: ()async{
          await appState.connectSocket('button3');
        }
    );
  }
}

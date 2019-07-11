import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_flutter_v1/utilities/socket_provider.dart';
class TransportPage2 extends StatefulWidget {
  @override
  _TransportPage2State createState() => _TransportPage2State();
}

class _TransportPage2State extends State<TransportPage2> {
  @override

  @override
  Widget build(BuildContext context) {
    var appState= Provider.of<SocketProvider>(context);
    return MaterialButton(
        height: 75.0,
        minWidth: 120.0,
        color: Colors.white,
        child: Text('',style:TextStyle(color: Colors.black)),
        onPressed: ()async{
          await appState.connectSocket('button2');
        }
    );
  }
}

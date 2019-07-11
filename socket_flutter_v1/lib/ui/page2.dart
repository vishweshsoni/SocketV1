import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_flutter_v1/ui/transper_page1.dart';
import 'package:socket_flutter_v1/ui/transport_page2.dart';
import 'package:socket_flutter_v1/ui/transport_page3.dart';
import 'package:socket_flutter_v1/utilities/scoket_provider2.dart';
import 'package:socket_flutter_v1/utilities/size_config.dart';
import 'package:socket_flutter_v1/utilities/socket_provider.dart';
class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 1),
            () {
          SocketProvider().connectSocket("hi");
        }
    );

    return ChangeNotifierProvider(
      builder: (context)=>SocketProvider(),
      child: Scaffold(
        appBar: AppBar(title:Text('Room2',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,),
        backgroundColor: Colors.lightBlueAccent,
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height:SizeConfig.blockSizeHorizontal*60,
              ),
              Center(
                child: Column(
                  children: <Widget>[

                    TransportPage1(),
                    SizedBox(height: 10.0,),
                    TransportPage2(),
                    SizedBox(height: 10.0,),
                    TransportPage3(),



//                    MaterialButton(
//                        color: Colors.grey,
//                        child: Text('',style: TextStyle(color: Colors.black),),
//                        onPressed: (){
//
//                        }
//                    ),
//                    MaterialButton(
//                        color: Colors.grey,
//                        child: Text('',style: TextStyle(color: Colors.black),),
//                        onPressed: (){
//
//                        }
//                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

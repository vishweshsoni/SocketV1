import 'dart:convert';

import 'package:flutter/foundation.dart';
//import 'dart:io';

import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
class SocketProvider with ChangeNotifier{
  SocketIO socketIO ;
  bool connect= false;
  connectSocket(String str) async{
    socketIO = SocketIOManager().createSocketIO("https://arcane-dusk-93500.herokuapp.com","/");
    socketIO.init();
    socketIO.connect();
    try{
      String jsonData = '{"message":"$str"}';
      socketIO.sendMessage('subscribe', jsonData,(data){print(data);});
    }catch(e){
      print(e);
    }

    socketIO.subscribe('subscribe', (dynamic data){print(data);});

//
//    SocketIO socket = await SocketIOManager().createInstance('https://arcane-dusk-93500.herokuapp.com/',enableLogging: true,query: {
//        "auth": "--SOME AUTH STRING---",
//        "info": "new connection from adhara-socketio",
//        "timestamp": DateTime.now().toString()
//      },);
//      socket.onConnect((data){
//        print(data);
//        print(data.toString());
//      });
//      connect=true;
//      notifyListeners();
//      socket.emit('subscribe',[{"name":"$str"}]);
//     /* socket.on('subscribe',(data){
//            if(data is Map){
//              print(data.toString());
//            }
//
//      });*/
//


  }

}
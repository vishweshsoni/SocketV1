import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
//import 'dart:io';

import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
class SocketProvider2 with ChangeNotifier{
  SocketIO socketIO ;
  bool button1= false;
  bool button2= false;
  bool button3= false;
  bool connect= false;
  connectSocket(String str) async{
    socketIO = SocketIOManager().createSocketIO("https://arcane-dusk-93500.herokuapp.com","/");
    socketIO.init();
    if(SocketIO!=null){
      socketIO.connect();
    }

    notifyListeners();

    if(socketIO!=null){
      try{
        String jsonData = '{"message":"$str"}';
        socketIO.sendMessage('subscribe', jsonData,(dynamic data){
          print(data);
          notifyListeners();
        });

      }catch(e){
        print(e);
        notifyListeners();
      }
    }

    socketIO.subscribe('subscribe_room2', (dynamic data){
      if(data.contains("room2_button1")){
        button1=true;
        notifyListeners();

      }
      if(data.contains("room2_button2")){
        button2=true;
        notifyListeners();

      }
      if(data.contains("room2_button3")){
        button3=true;
        notifyListeners();

      }
    });

    Timer(
        Duration(seconds: 3),
            () {
          button1=false;
          button2=false;
          button3=false;
          notifyListeners();
        }
    );


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
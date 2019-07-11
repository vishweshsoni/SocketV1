import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_socket_io/socket.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
//import 'package:adhara_socket_io/adhara_socket_io.dart';
class SocketProvider2 with ChangeNotifier{
  bool connect= false;
  connectSocket(String str) async{
    print('called');


    SocketIO socket = await SocketIOManager().createInstance('https://arcane-dusk-93500.herokuapp.com/',enableLogging: true,query: {
      "auth": "--SOME AUTH STRING---",
      "info": "new connection from adhara-socketio",
      "timestamp": DateTime.now().toString()
    },);
    socket.onConnect((data){

      notifyListeners();
      print(data);

    });
    connect=true;
    notifyListeners();

    socket.emit('subscribe',['$str']);
    print('message emmited');


  }

}
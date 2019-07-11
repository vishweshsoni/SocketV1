import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_socket_io/socket.dart';
import 'package:flutter/foundation.dart';
//import 'dart:io';

import 'package:socket_flutter_plugin/socket_flutter_plugin.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
class SocketProvider with ChangeNotifier{
  bool connect= false;
  connectSocket(String str) async{


      SocketIO socket = await SocketIOManager().createInstance('https://arcane-dusk-93500.herokuapp.com/',enableLogging: true,query: {
        "auth": "--SOME AUTH STRING---",
        "info": "new connection from adhara-socketio",
        "timestamp": DateTime.now().toString()
      },);
      socket.onConnect((data){
        print(data);
        print(data.toString());
      });
      connect=true;
      notifyListeners();
      socket.emit('subscribe',['$str']);
      socket.on('subscribe',(data){
        print(data+"hi");
        debugPrint(data+"hi");
      });

      print('message emmited');


  }

}
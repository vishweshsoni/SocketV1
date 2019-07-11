import 'package:flutter/foundation.dart';
import 'dart:io';
//import 'package:adhara_socket_io/adhara_socket_io.dart';
class SocketProvider with ChangeNotifier{
  bool connect= false;
//  connectSocket() async{
//    print('called');
//
//
//      SocketIO socket = await SocketIOManager().createInstance('https://arcane-dusk-93500.herokuapp.com/',enableLogging: true,query: {
//        "auth": "--SOME AUTH STRING---",
//        "info": "new connection from adhara-socketio",
//        "timestamp": DateTime.now().toString()
//      },);
//      socket.onConnect((data){
//        connect=true;
//        notifyListeners();
//        print("connected...");
//        print(data);
//
//      });
//      List<String> r=['room'];
//
//      socket.on('connecion', (data){
//        print(data);
//      });
//
//
//
//  }

}
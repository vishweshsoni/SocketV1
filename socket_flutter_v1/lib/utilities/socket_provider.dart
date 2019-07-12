import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
//import 'dart:io';

import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
class SocketProvider with ChangeNotifier{
  SocketIO socketIO ;
  bool button1= false;
  bool button2= false;
  bool button3= false;
  bool connect= false;

  getConnection() async{
    if(socketIO==null){
      try{
        socketIO =  SocketIOManager().createSocketIO("https://arcane-dusk-93500.herokuapp.com","/");
        socketIO.init();
        await socketIO.connect();
        notifyListeners();
      }catch(r){
          print(r);
      }

    }
  }
  connectSocket(String str) async{
    await  getConnection();
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
    try{
        socketIO.subscribe('subscribe', (dynamic data){
        if(data.contains("button1")){
          button1=true;
          notifyListeners();
          Timer(
              Duration(seconds: 4),
                  () {
                button1=false;
                notifyListeners();
              }
          );

        }
        if(data.contains("button2")){
          button2=true;
          notifyListeners();
          Timer(
              Duration(seconds: 4),
                  () {
                button2=false;
                notifyListeners();
              }
          );

        }
        if(data.contains("button3")){
          button3=true;
          notifyListeners();
          Timer(
              Duration(seconds: 4),
                  () {
                button3=false;
                notifyListeners();
              }
          );
        }
      });

    }catch(e){print(e);}



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

  destroy(){
    if (socketIO != null) {
      SocketIOManager().destroySocket(socketIO);
    }
  }
}
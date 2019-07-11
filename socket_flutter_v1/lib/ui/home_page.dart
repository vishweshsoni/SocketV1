import 'package:flutter/material.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:socket_flutter_v1/utilities/scoket_provider2.dart';
import 'package:socket_flutter_v1/utilities/scoket_provider3.dart';
import 'package:socket_flutter_v1/utilities/size_config.dart';
import 'package:provider/provider.dart';
import 'package:socket_flutter_v1/utilities/socket_provider.dart';
const String uri = "https://arcane-dusk-93500.herokuapp.com/";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SocketIOManager manager;
  SocketIO socket;
  bool isConnected= false;
  bool ledState = false;
  @override
  void initState() {
    // TODO: implement initState
    manager= SocketIOManager();
    super.initState();
  }
  initSocket() async{
    setState(() {
      isConnected = true;
    });
  socket= await manager
          .createInstance(uri,enableLogging: false);
  socket.onConnect((data){
      print('connected');
      print(data);
      sendMessage();
      socket.onConnectError(print);
      socket.onConnectTimeout(print);
      socket.onError(print);
      socket.onDisconnect(print);
      socket.connect();
  });
  }


  disconnect() async {
    await manager.clearInstance(socket);
    setState(() => isConnected = false);
  }


  sendMessage() {
    if (socket != null) {
      print("sending message...");
      socket.emit(ledState == true ? "subscribe" : "subscribe", ['hei']);
      print("Message emitted...");
      setState(() {
        ledState = !ledState;
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);


    return Scaffold(

        appBar: AppBar(title:Text('SocketIOExample',style: TextStyle(color: Colors.black),),backgroundColor: Colors.grey,),
        backgroundColor: Colors.blueAccent,
        body: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height:SizeConfig.blockSizeHorizontal*60,
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                  MaterialButton(
                      color: Colors.grey,
                      child: Text('Room-1',style:TextStyle(color: Colors.black)),
                      onPressed: ()async{
                        Navigator.pushNamed(context,'/Room1');
                      }
                  ),
//            ChangeNotifierProvider<SocketProvider2>.value(
//              value:SocketProvider2(),
//              child:  MaterialButton(
//                  color: Colors.grey,
//                  child: Text('Room-2',style: TextStyle(color: Colors.black),),
//                  onPressed: (){
//                    Navigator.pushNamed(context, '/Room2');
//                  }
//              ),
//            ),
//          ChangeNotifierProvider<SocketProvider3>.value(
//            value:SocketProvider3(),
//            child:  MaterialButton(
//                color: Colors.grey,
//                child: Text('Room-3',style: TextStyle(color: Colors.black),),
//                onPressed: (){
//                  Navigator.pushNamed(context, '/Room3');
//                }
//            ),
//          ),

                    ],
                  ),
                ),
              ],
            ),
        ),
    );

  }

}

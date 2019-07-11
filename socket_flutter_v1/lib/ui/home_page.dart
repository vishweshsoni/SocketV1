import 'package:flutter/material.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
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
  bool isProbablyConnected = false;
  bool ledState = false;

  @override
  void initState() {
    super.initState();
    manager = SocketIOManager();
    initSocket();
  }

  initSocket() async {
    setState(() => isProbablyConnected = true);
    socket = await manager.createInstance(uri, enableLogging: false);
    socket.onConnect((data) {
      print("connected...");
      print(data);
      sendMessage();
    });
    socket.onConnectError(print);
    socket.onConnectTimeout(print);
    socket.onError(print);
    socket.onDisconnect(print);
    socket.connect();
  }


  disconnect() async {
    await manager.clearInstance(socket);
    setState(() => isProbablyConnected = false);
  }


  sendMessage() {
    if (socket != null) {
      print("sending message...");
      socket.emit(ledState == true ? "ledOff" : "ledOn", ['FLUTTER SAYS HEI']);
      print("Message emitted...");
      setState(() {
        ledState = !ledState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Socket.IO example'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: sendMessage,
                      child:
                      ledState == true ? Text('LED Off') : Text('LED On'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
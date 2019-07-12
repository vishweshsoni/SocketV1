import 'package:flutter/material.dart';
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
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var appState= Provider.of<SocketProvider>(context);
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child:Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/2.2,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      alignment:FractionalOffset.topCenter,
                      fit: BoxFit.fill,
                      child:Image.asset("res/img1.jpg"),

                    ),
                  ),

              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30.0,),
                    MaterialButton(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.grey,
                        child:
                            Text('Room-1', style: TextStyle(color: Colors.black)),
                        onPressed: () async {
                          Navigator.pushNamed(context, '/Room1');
                         await appState.connectSocket("hi");
                        }),
                    MaterialButton(
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.grey,
                        child: Text(
                          'Room-2',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: ()async {
                          Navigator.pushNamed(context, '/Room2');
                          await appState.connectSocket("hi");
                        }),
                    MaterialButton(
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.grey,
                        child: Text(
                          'Room-3',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async{
                          Navigator.pushNamed(context, '/Room3');
                         await  appState.connectSocket("hi");
                        }),
                  ],
                ),
              ),
                ],
              )
            ],
          )
          ,
        ),
      ),
    );
  }
}

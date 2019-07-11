import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_flutter_v1/utilities/size_config.dart';
import 'package:socket_flutter_v1/utilities/socket_provider.dart';
class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<SocketProvider>(context);
    return Scaffold(
      appBar: AppBar(title:Text('Room1',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,),
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
                  MaterialButton(
                      color: Colors.grey,
                      child: Text('',style:TextStyle(color: Colors.black)),
                      onPressed: ()async{
                        await appState.connectSocket('button1');
                      }
                  ),
                  MaterialButton(
                      color: Colors.grey,
                      child: Text('',style: TextStyle(color: Colors.black),),
                      onPressed: (){

                      }
                  ),
                  MaterialButton(
                      color: Colors.grey,
                      child: Text('',style: TextStyle(color: Colors.black),),
                      onPressed: (){

                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:socket_flutter_v1/utilities/size_config.dart';
class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Room2',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,),
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

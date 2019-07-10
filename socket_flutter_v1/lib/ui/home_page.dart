import 'package:flutter/material.dart';
import 'package:socket_flutter_v1/utilities/size_config.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(

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
                          child: Text('Room-1',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>{

                          }
                      ),
                      MaterialButton(
                          color: Colors.grey,
                          child: Text('Room-2',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>{

                          }
                      ),
                      MaterialButton(
                          color: Colors.grey,
                          child: Text('Room-3',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>{

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

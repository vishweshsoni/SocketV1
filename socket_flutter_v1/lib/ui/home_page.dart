import 'package:flutter/material.dart';
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
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(

           alignment: FractionalOffset.center,
            child: Column(
              children: <Widget>[
                MaterialButton(
                    color: Colors.grey,
                    child: Text('Room1',style: TextStyle(color: Colors.black),),
                    onPressed: ()=>{

                       }
                    ),
                MaterialButton(
                    color: Colors.grey,
                    child: Text('Room2',style: TextStyle(color: Colors.black),),
                    onPressed: ()=>{

                    }
                ),
                MaterialButton(
                    color: Colors.grey,
                    child: Text('Room3',style: TextStyle(color: Colors.black),),
                    onPressed: ()=>{

                    }
                ),
              ],
            ),
        ),
    );
  }
}

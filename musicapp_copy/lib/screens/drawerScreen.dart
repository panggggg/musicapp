import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Expanded(child: Text("Profile", style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 150),
                child: Expanded(child: IconButton(
                  icon: Icon(
                      Icons.keyboard_arrow_right_rounded),
                      color: Colors.white,
                      iconSize: 50.0,
                      alignment: Alignment.topRight,
                      onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/backhome');
                      },),),
              )
            ],
          ),

          Center(
            // width: 200.0,
            // height: 200.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset('assets/pug.jpg', width: 170.0, height: 170.0, fit: BoxFit.cover,),
                  ),
            ),
          ),
          Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text("Pawornwan Sriprathung", style: TextStyle(fontSize: 25.0, color: Colors.white),),
                ),
              ),
              SizedBox(height: 50.0,),
              Container(
                height: 40.0,
                width: 150.0,
                child: FlatButton(onPressed: (){},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.white.withOpacity(0.5),
                  child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 20),
                          child: Expanded(child: Icon(Icons.settings ,color: Colors.black,)),
                        ),
                        Expanded(child: Text("Setting", style: TextStyle(color: Colors.black, fontSize: 20.0),))
                      ],
                    ),
                  ),
                ),

              SizedBox(height: 10.0,),
              Container(
                height: 40.0,
                width: 150.0,
                child: FlatButton(onPressed: () async{
                  await Firebase.initializeApp().then((value) async {
                    await FirebaseAuth.instance.signOut().then((value) => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false));
                  });
                },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.white.withOpacity(0.5),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 20),
                        child: Expanded(child: Icon(Icons.exit_to_app ,color: Colors.black,)),
                      ),
                      Expanded(child: Text("LogOut", style: TextStyle(color: Colors.black, fontSize: 20.0),))
                    ],
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );

  }
}

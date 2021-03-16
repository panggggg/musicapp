import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/model/musicmodel.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {


  List<Widget> widgets = [];

  void initState(){
    super.initState();
    readData();

  }



  Future<Null> readData()async{
    await Firebase.initializeApp().then((value) async{
      print("Initialize Success");
      await FirebaseFirestore.instance.collection('songlist').snapshots()
      .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshot in event.docs){
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
          MusicModel model = MusicModel.fromMap(map);
          print('songname = ${model.songname}');
          print('artist = ${model.artist}');
          setState(() {
            widgets.add(createWidget(model));
          });
        }
      });
    });
  }

  Widget createWidget(MusicModel model) =>

      Container(
        height: 400,
        width: 400,
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            padding: EdgeInsets.only(right: 20, left: 20, bottom:0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(model.cover,height: 110,width: 200,)),
                    ),
                  ),
                  // SizedBox(height: 5,),
                  Center(
                    child: Container(
                      width: 200,
                      child: FlatButton(
                        child: Text(model.songname, style: TextStyle(color: Colors.white),),
                        onPressed: (){

                        },
                      )
                    ),
                  )
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 0.0, bottom: 5),
                  //   child: Container(child: FlatButton(child: Text(model.songname, style: TextStyle(color: Colors.white,fontSize: 5),),)),
                  //
                  // ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: widgets.length == 0
      ? Center(child: CircularProgressIndicator(),)
      : GridView.extent(maxCrossAxisExtent: 200, children: widgets,),
      appBar: AppBar(
    leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined, size: 30,), onPressed: (){
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed('/backhome');
    },),
    ),
    );
  }
}

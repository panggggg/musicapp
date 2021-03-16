import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/model/musicmodel.dart';


class AsiaList extends StatefulWidget {
  @override
  _AsiaListState createState() => _AsiaListState();
}

class _AsiaListState extends State<AsiaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined, size: 30,),
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/backhome');
              }
          )
      ),
      body: ListView(
        children: [
          Container(

            color: Colors.black,
            padding: EdgeInsets.only(right: 0, left: 20, bottom:0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: HotPlayCard1()),
                      Expanded(child: HotPlayCard2())
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: HotPlayCard3()),
                          Expanded(child: HotPlayCard4())
                        ],
                      ),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Expanded(child: HotPlayCard5()),
                  //         Expanded(child: HotPlayCard6())
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Expanded(child: HotPlayCard7()),
                  //         Expanded(child: HotPlayCard8())
                  //       ],
                  //     ),
                  //   ],
                  // ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class HotPlayCard1 extends StatelessWidget {

  final image;

  HotPlayCard1({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FDemon%20Slayer%20Kimetsu%20no%20Yaiba%20-%20Opening%20Full%E3%80%8EGurenge%E3%80%8F2.jpg?alt=media&token=bb3a80d2-ebd8-4422-a3ae-59df7633a001")),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){},
              child: Center(
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/demon');
                      },
                      child: Text("Gurenge",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    Text("Demon Slayer")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotPlayCard2 extends StatelessWidget {

  final image;

  HotPlayCard2({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FRin%E9%9F%B3%20-%20sleepy%20wonder%202.jpg?alt=media&token=a196afd4-2a8b-4b73-8cb6-e03023209550")),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){},
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed('/sleepy');
                        },
                        child: Text("Sleepy Wonder",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Text("RIN")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotPlayCard3 extends StatelessWidget {

  final image;

  HotPlayCard3({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FYOASOBI%E3%80%8C%E3%83%8F%E3%83%AB%E3%82%B8%E3%82%AA%E3%83%B3%E3%80%8D2.jpg?alt=media&token=62e4c050-1719-43ef-a57c-f1285975d47a")),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){},
              child: Center(
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/yoa');
                      },
                      child: Text("YOASOBI",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    Text("Unknow")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotPlayCard4 extends StatelessWidget {

  final image;

  HotPlayCard4({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2F%EA%B0%80%ED%98%B8%20-%20Running%20%5B%EC%8A%A4%ED%83%80%ED%8A%B8%EC%97%85%202.jpg?alt=media&token=776eedc0-5eac-469c-b05c-2e1c524c6714")),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){},
              child: Center(
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/run');
                      },
                      child: Text("Running",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    Text("Unknow")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotPlayCard5 extends StatelessWidget {

  final image;

  HotPlayCard5({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2F%E0%B8%95%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B8%8A%E0%B8%AD%E0%B8%9A%E0%B9%81%E0%B8%84%E0%B9%88%E0%B9%84%E0%B8%AB%E0%B8%99%20(FIRST%20LOVE)%20-%20PRETZELLE%202.jpg?alt=media&token=5a2f763e-93bf-466f-b84c-59e71d974200")),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){},
              child: Center(
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/first');
                      },
                      child: Text("FIRST LOVE",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    Text("PRETZELLE")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotPlayCard6 extends StatelessWidget {

  final image;

  HotPlayCard6({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2F%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B9%83%E0%B8%8A%E0%B9%88%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%A3%E0%B8%B9%E0%B9%89%E0%B8%AA%E0%B8%B6%E0%B8%81%20-%20Tom%20Isara%202.jpg?alt=media&token=7cb850ab-bbd8-4681-bd29-205f0aeeb4d2")),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){},
              child: Center(
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/tom');
                      },
                      child: Text("ไม่ใช่ไม่รู้สึก",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    Text("Tom Isara")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotPlayCard7 extends StatelessWidget {

  final image;

  HotPlayCard7({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2F%E0%B8%AD%E0%B8%A2%E0%B9%88%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%97%E0%B9%8D%E0%B8%B2%20(YHT)%20-%20Atom%20%E0%B8%8A%E0%B8%99%E0%B8%81%E0%B8%B1%E0%B8%99%E0%B8%95%E0%B9%8C%202.jpg?alt=media&token=12abae13-4918-4e41-b61e-dbbca529caa8")),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){},
              child: Center(
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/yht');
                      },
                      child: Text("อย่าหาทำ (YHT)",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:13),),
                    ),
                    Text("Atom")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotPlayCard8 extends StatelessWidget {

  final image;

  HotPlayCard8({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2F%E0%B9%80%E0%B8%AD%E0%B9%88%E0%B8%AD%E0%B8%84%E0%B8%B7%E0%B8%AD%E0%B9%80%E0%B8%A3%E0%B8%B2%E0%B8%A1%E0%B8%B5%E0%B9%84%E0%B8%A3%E0%B8%88%E0%B8%B0%E0%B8%9A%E0%B8%AD%E0%B8%81%20-%20CORNBOI%202.jpg?alt=media&token=11d04e6a-e592-42e2-894c-4809c6e71401")),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){},
              child: Center(
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/cornboi');
                      },
                      child: Text("เอ่อคือเรามีอะไรจะบอก",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    Text("CORNBOI")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



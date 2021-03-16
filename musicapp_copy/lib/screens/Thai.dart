import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/model/musicmodel.dart';


class ThaiList extends StatefulWidget {
  @override
  _ThaiListState createState() => _ThaiListState();
}

class _ThaiListState extends State<ThaiList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: HotPlayCard5()),
                              Expanded(child: HotPlayCard6())
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: HotPlayCard7()),
                              Expanded(child: HotPlayCard8())
                            ],
                          ),
                        ],
                      ),

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
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FF.HERO%20Ft.%20BRIGHT%20VACHIRAWIT%20(Prod.%20By%20NINO)%20-%20Sad%20Movie%202.jpg?alt=media&token=91f1d85f-af84-4cf6-942e-d54eea80372b")),
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
                        Navigator.of(context).pushNamed('/sad');
                      },
                      child: Text("Sad Movie",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    // Text("F.HERO Ft. BRIGHT VACHIRAWIT")
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
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FILLSLICK%20-%20%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%A3%E0%B8%B2%E0%B8%B0%E0%B9%83%E0%B8%AA%E0%B9%88%E0%B8%89%E0%B8%B1%E0%B8%99%202.jpg?alt=media&token=9446fb92-93bd-4e1b-a83e-d76c65f4939b")),
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
                          Navigator.of(context).pushNamed('/ill');
                        },
                        child: Text("หัวเราะใส่ฉัน",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Text("ILLSLICK")
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
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FLUSS%20-%20247%202.jpg?alt=media&token=6e10b0bc-b9f0-470c-9417-15be6083f26b")),
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
                        Navigator.of(context).pushNamed('/luss');
                      },
                      child: Text("247",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    Text("LUSS")
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
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FSOYBAD%20-%20%E0%B8%9F%E0%B9%89%E0%B8%B2%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%87%202.jpg?alt=media&token=94e841ca-fda8-400a-94d6-e9480e936d91")),
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
                        Navigator.of(context).pushNamed('/soybad');
                      },
                      child: Text("ฟ้าร้อง",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    Text("SOYBAD")
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



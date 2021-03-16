import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{


  String songname;
  String artist;
  String image;
  var tabController;

  // void initState2(){
  //   super.initState();
  //   readData();
  // }
  //
  // Future<Null> readData()async{
  //   await Firebase.initializeApp().then((value){
  //     print("Initialize Success");
  //   });
  // }


  @override
  void initState() {
    super.initState();
    tabController = TabController(length:2,initialIndex: 0, vsync: this);
  }

  bool liked = false;
  void _pressed(){
    setState(() {
      liked = !liked;
    });
  }

  double xOffset = 0;
  double yOffset= 0;
  double scaleFactor = 1;

  int _selectedItemIndex = 0;


  @override
  Widget build(BuildContext context) {



    // Widget bottomNavBar = BottomNavigationBar(
    //     currentIndex: currentIndex,
    //     onTap: (int index){
    //       setState(() {
    //         currentIndex = index;
    //       });
    //     },
    //     items: [
    //       BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
    //       BottomNavigationBarItem(icon: Icon(Icons.music_note_rounded), title: Text("Favourite")),
    //       BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Search")),
    //
    //     ]);



    return Scaffold(
      // bottomNavigationBar: bottomNavBar,
        // bottomNavigationBar: Row(
        //   children: <Widget>[
        //    buildNavBarItem(Icons.home, true, 0),
        //     buildNavBarItem(Icons.library_music, false, 1),
        //     buildNavBarItem(Icons.account_circle, false, 2),
        //
        //   ],
        // ),
        //

    backgroundColor: Colors.black,
    appBar: AppBar(
    leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/drawer');
    },),
    title: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.5)
      ),
        child: TextField(
            decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(Icons.search, color: Colors.white,),
              ),
              hintText: "Search album, song..."
            ),
        )
    ),
    actions: [
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
          child: Image.asset('assets/pug.jpg', width: 50.0, height: 50.0, fit: BoxFit.cover,)
    )
    )
    ],
    ),
    body: Stack(
        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                Text("Hot Recommended",
                  style: TextStyle(
                    color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        RecommendedCard1(),
                        RecommendedCard2(),
                        RecommendedCard3(),
                        RecommendedCard4(),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Text("Hot Playlists",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                      ),
                      Spacer(),
                      // SizedBox(
                      //   height: 30,
                      //   child: FlatButton(onPressed: (){
                      //     Navigator.of(context).pop();
                      //     Navigator.of(context).pushNamed('/test');
                      //   },
                      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      //       color: Colors.white,
                      //       child: Text("View All",
                      //       style: TextStyle(
                      //         color: Colors.black
                      //       ),
                      //       ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8)),
                GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: MediaQuery.of(context).size.width/
                      (MediaQuery.of(context).size.height/1.5),
                  physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [HotPlayCard1(), HotPlayCard2(), HotPlayCard3()]
                ),
                Row(
                  children: [
                    Text("Our Choices For You",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 30,
                      child: FlatButton(onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/test');
                      },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        color: Colors.white,
                        child: Text("View All",
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                TabBar(
                  controller: tabController,
                    indicatorColor: Colors.pink,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 5,
                    tabs: [
                      Tab(child: Text("Songs", style: TextStyle(color: Colors.white))),
                      Tab(child: Text("Playlists", style: TextStyle(color: Colors.white),),)
                    ]
                ),
                LimitedBox(
                  maxHeight: 400,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView(
                        children: [
                          ChoiceCard1(), ChoiceCard2(), ChoiceCard3(), ChoiceCard4(), ChoiceCard5(), ChoiceCard6()
                        ],
                      ),
                      ListView(
                        children: [
                          ChoiceCard8(),
                          ChoiceCard9()
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),



        ],
      ),
    );

  }

  }


class ChoiceCard1 extends StatelessWidget {
  @override


  //ยังกดหัวใจไม่ได้นะ ต้องแก้
  bool liked = false;
  void _pressed(){
    setState(() {
      // liked = !liked;
    });
  }




  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FKDA%20-%20MORE%20%5BOfficial%20Music%20Video%5D%202.jpg?alt=media&token=d6c314c5-ae8b-4ac1-9a11-6157f0eebce6",
              width: 70,
              height: 70,
            fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                FlatButton(
                    child: Text(
                      "More",
                      style: TextStyle(color: Colors.white,
                          fontSize: 16),
                    ),
                  onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/more');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text("KDA", style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.grey,),
                onPressed: (){
                  _pressed();
                })
            ],
          )
        ],
      ),
    );
  }
  void setState(Null Function() param0) {
    liked = !liked;
  }

}

class ChoiceCard2 extends StatelessWidget {
  @override


  //ยังกดหัวใจไม่ได้นะ ต้องแก้
  bool liked = false;
  void _pressed(){
    setState(() {
      // liked = !liked;
    });
  }


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FMaroon%205%20-%20Sugar%202.jpg?alt=media&token=e49cfd2c-817a-4741-8337-07f071972126",
              width: 70,
              height: 70,
              fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text(
                    "Sugar",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/sugar');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 23),
                  child: Text("Maroon5", style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.grey,),
                  onPressed: (){
                    _pressed();
                  })
            ],
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {
    liked = !liked;
  }
}

class ChoiceCard3 extends StatelessWidget {
  @override


  //ยังกดหัวใจไม่ได้นะ ต้องแก้
  bool liked = false;
  void _pressed(){
    setState(() {
      // liked = !liked;
    });
  }


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FPost%20Malone%2C%20Swae%20Lee%20-%20Sunflower%202.jpg?alt=media&token=8c3eeb12-01b4-4e2c-a972-afec8fff5874",
              width: 70,
              height: 70,
              fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text(
                    "Sunflower",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/sunflower');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 15),
                  child: Text("Post Malone, Swea Lee", style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.grey,),
                  onPressed: (){
                    _pressed();
                  })
            ],
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {
    liked = !liked;
  }
}

class ChoiceCard4 extends StatelessWidget {
  @override


  //ยังกดหัวใจไม่ได้นะ ต้องแก้
  bool liked = false;
  void _pressed(){
    setState(() {
      // liked = !liked;
    });
  }


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FLinkin%20Park%20-%20Powerless%202.jpg?alt=media&token=d00475a8-5dca-4e51-90c2-f93f9889d02f",
              width: 70,
              height: 70,
              fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                FlatButton(
                  child: Text(
                    "Powerless",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/power');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text("Linkin Park", style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.grey,),
                  onPressed: (){
                    _pressed();
                  })
            ],
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {
    liked = !liked;
  }
}

class ChoiceCard5 extends StatelessWidget {
  @override


  //ยังกดหัวใจไม่ได้นะ ต้องแก้
  bool liked = false;
  void _pressed(){
    setState(() {
      // liked = !liked;
    });
  }


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FRick%20Astley%20-%20Never%20Gonna%20Give%20You%20Up%202.jpg?alt=media&token=694592e5-7cbf-4c1c-a48f-871298d4cd15",
              width: 70,
              height: 70,
              fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                FlatButton(
                  child: Text(
                    "Never Gonna Give You Up",
                    style: TextStyle(color: Colors.white,
                        fontSize: 14),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/never');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, right: 90),
                  child: Text("Rick Astley", style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.grey,),
                  onPressed: (){
                    _pressed();
                  })
            ],
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {
    liked = !liked;
  }
}

class ChoiceCard6 extends StatelessWidget {
  @override


  //ยังกดหัวใจไม่ได้นะ ต้องแก้
  bool liked = false;
  void _pressed(){
    setState(() {
      // liked = !liked;
    });
  }


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FRISE%20(ft.%20The%20Glitch%20Mob%2C%20Mako%2C%20and%20The%20Word%20Alive)%20%20Worlds%202018%20-%20League%20of%20Legends%202.jpg?alt=media&token=21e9ea1f-276f-4f68-8fee-fddeb5ee6080",
              width: 70,
              height: 70,
              fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                FlatButton(
                  child: Text(
                    "RISE",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/lol');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0,left: 5),
                  child: Text("League of Legends", style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.grey,),
                  onPressed: (){
                    _pressed();
                  })
            ],
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {
    liked = !liked;
  }
}

class ChoiceCard7 extends StatelessWidget {
  @override


  //ยังกดหัวใจไม่ได้นะ ต้องแก้
  bool liked = false;
  void _pressed(){
    setState(() {
      // liked = !liked;
    });
  }


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FRISE%20(ft.%20The%20Glitch%20Mob%2C%20Mako%2C%20and%20The%20Word%20Alive)%20%20Worlds%202018%20-%20League%20of%20Legends.jpg?alt=media&token=82c6dfb5-300f-4226-8f09-5cd4bb222a30",
              width: 70,
              height: 70,
              fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                FlatButton(
                  child: Text(
                    "Billie Jean",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/billie');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0,right: 105),
                  child: Text("Micheal Jackson", style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.grey,),
                  onPressed: (){
                    _pressed();
                  })
            ],
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {
    liked = !liked;
  }
}

class ChoiceCard8 extends StatelessWidget {
  @override


  //ยังกดหัวใจไม่ได้นะ ต้องแก้
  bool liked = false;
  void _pressed(){
    setState(() {
      // liked = !liked;
    });
  }


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FTitanic%20-%20My%20Heart%20Will%20Go%20On%202.jpg?alt=media&token=b95c7d01-d4a1-47e1-b204-4abfc033b422",
              width: 70,
              height: 70,
              fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                FlatButton(
                  child: Text(
                    "My Heart Will Go On",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/myheart');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0,right: 75),
                  child: Text("Celine Dion", style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.grey,),
                  onPressed: (){
                    _pressed();
                  })
            ],
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {
    liked = !liked;
  }
}

class ChoiceCard9 extends StatelessWidget {
  @override


  //ยังกดหัวใจไม่ได้นะ ต้องแก้
  bool liked = false;
  void _pressed(){
    setState(() {
      // liked = !liked;
    });
  }


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FMichael%20Jackson%20-%20Billie%20Jean%202.jpg?alt=media&token=c217c18b-2400-45cd-8faf-11d35200a8fb",
              width: 70,
              height: 70,
              fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                FlatButton(
                  child: Text(
                    "Billie Jean",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/billie');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0,left: 20),
                  child: Text("Michael Jackson ", style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.grey,),
                  onPressed: (){
                    _pressed();
                  })
            ],
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {
    liked = !liked;
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
              child: Image.asset('assets/thai.jpg')),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/thai');
              },
              child: Text("Thai List",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
              child: Image.asset('assets/asia.jpg')),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/asia');
              },
              child: Text("Asia List",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
              child: Image.asset('assets/inter.jpg')),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FlatButton(
              onPressed: (){},
              child: Text("Western List",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}


class RecommendedCard1 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FSOYBAD%20-%20%E0%B8%9F%E0%B9%89%E0%B8%B2%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%87%202.jpg?alt=media&token=94e841ca-fda8-400a-94d6-e9480e936d91",
                height: 180,
                width: 300,
                fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.only(top:5.0, left: 5.0),
                  child: FlatButton(
                      child: Text(
                        "ฟ้าร้อง",
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 18),),
                    onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/soybad');
                    },
                  )
              ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                              child: Text("SOYBAD", style: TextStyle(color: Colors.white70)))
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedCard2 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FLUSS%20-%20247%202.jpg?alt=media&token=6e10b0bc-b9f0-470c-9417-15be6083f26b",
                height: 180,
                width: 300,
                fit: BoxFit.cover,),
              Padding(
                  padding: const EdgeInsets.only(top:5.0, left: 0.0),
                  child: FlatButton(
                    child: Text(
                      "247",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),),
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/luss');
                    },
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("LUS", style: TextStyle(color: Colors.white70)))
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedCard3 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FMarshmello%20-%20Alone%202.jpeg?alt=media&token=383fe7c2-a079-4173-9cf9-64cfec62cb4c",
                height: 180,
                width: 300,
                fit: BoxFit.cover,),
              Padding(
                  padding: const EdgeInsets.only(top:5.0, left: 5.0),
                  child: FlatButton(
                    child: Text(
                      "Alone",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),),
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/alone');
                    },
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Marshmello ", style: TextStyle(color: Colors.white70)))
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedCard4 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FTaylor%20Swift%20-%20You%20Belong%20With%20Me%202.jpg?alt=media&token=406a159d-0fdb-44d7-ac9c-5003c84c4778",
                height: 180,
                width: 300,
                fit: BoxFit.cover,),
              Padding(
                  padding: const EdgeInsets.only(top:5.0, left: 5.0),
                  child: FlatButton(
                    child: Text(
                      "You Belong With Me",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),),
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/taylor');
                    },
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Taylor Swift ", style: TextStyle(color: Colors.white70)))
            ],
          ),
        ),
      ),
    );
  }
}












class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cover1.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54,
                    BlendMode.darken)
              )
            ),
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Flexible(
                    child: Center(
                      child: Text(
                        "Fung Pleng Gun",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                ),
              ),

              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[500].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(Icons.person, color: Colors.white, size: 25,),
                        ),
                        hintText: 'Username',
                      ),
                      style: TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.next,

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[500].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(Icons.lock_outline, color: Colors.white, size: 25,),
                        ),
                        hintText: 'Password',
                      ),
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.next,

                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.pink.withOpacity(0.8)
                ),
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 15),),
                ),
              ),

              SizedBox(height: 50,),
              Container(
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/register');
                  },
                  child: Text("Register", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),),
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}

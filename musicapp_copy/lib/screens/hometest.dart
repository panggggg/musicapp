import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:musicapp/model/musicmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> with SingleTickerProviderStateMixin{

  List<Widget> widgets = [];
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
            // widgets.add(createWidget(model));
          });
        }
      });
    });
  }


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


  Widget createWidget(MusicModel model) => Stack(
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
  Container(
  child: Padding(
  padding: const EdgeInsets.only(right: 10.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(15),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Image.network(model.cover),
  // height: 180,
  // width: 300,
  // fit: BoxFit.cover,),
  Padding(
  padding: const EdgeInsets.only(top:5.0, left: 5.0),
  child: FlatButton(
  child: Text(
  model.songname,
  style: TextStyle(
  color: Colors.white,
  fontSize: 18),),
  onPressed: (){
  Navigator.of(context).pop();
  Navigator.of(context).pushNamed('/play');
  },
  )
  ),
  Padding(
  padding: const EdgeInsets.only(left: 20.0),
  child: Text(model.artist, style: TextStyle(color: Colors.white70)))
  ],
  ),
  ),
  ),
  )

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
            ),
            Padding(
                padding: const EdgeInsets.all(8)),
            GridView.count(
                shrinkWrap: true,
                childAspectRatio: MediaQuery.of(context).size.width/
                    (MediaQuery.of(context).size.height/1.5),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: [HotPlayCard(), HotPlayCard(), HotPlayCard(), HotPlayCard()]
            ),
            Text("Our Choices For You",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
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
                      ChoiceCard(), ChoiceCard(), ChoiceCard(), ChoiceCard(), ChoiceCard(), ChoiceCard()
                    ],
                  ),
                  ListView(
                    children: [
                      ChoiceCard()
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),



      // Positioned(
      //   bottom: 0,
      //   child: ClipRRect(
      //   child: BackdropFilter(
      //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      //     child: Container(
      //       color: Colors.black.withOpacity(0.6),
      //       width: MediaQuery.of(context).size.width,
      //       child: Row(
      //         children: [
      //           Flexible(
      //               flex: 1, fit: FlexFit.tight,
      //               child: MenuItem(
      //                 icon: Icons.library_music,
      //                 title: "My Songs",
      //               )),
      //           Flexible(
      //               flex: 1, fit: FlexFit.tight,
      //               child: MenuItem(
      //               icon: Icons.history,
      //               title: "Discover")),
      //           Flexible(
      //               flex: 1, fit: FlexFit.tight,
      //               child: MenuItem(
      //                 icon: Icons.album,
      //                 title: "Albums",
      //               )),
      //           Flexible(
      //               flex: 1, fit: FlexFit.tight,
      //               child: MenuItem(
      //                 icon: Icons.account_circle_outlined,
      //                 title: "Profile",
      //               )),
      //         ],
      //       )
      //     ),
      //   ),
      // )
      // )


    ],
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(

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
                        RecommendedCard(),
                        RecommendedCard(),
                        RecommendedCard(),

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
                ),
                Padding(
                    padding: const EdgeInsets.all(8)),
                GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: MediaQuery.of(context).size.width/
                        (MediaQuery.of(context).size.height/1.5),
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [HotPlayCard(), HotPlayCard(), HotPlayCard(), HotPlayCard()]
                ),
                Text("Our Choices For You",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
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
                  Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('assets/2.jpg',
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
                                "I'm Not Mad",
                                style: TextStyle(color: Colors.white,
                                    fontSize: 16),
                              ),
                              onPressed: (){
                                Navigator.of(context).pop();
                                Navigator.of(context).pushNamed('/play');
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text("Halsey", style: TextStyle(color: Colors.white70),),
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
                )
                        ],
                      ),
                      ListView(
                        children: [
                          ChoiceCard()
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),



          // Positioned(
          //   bottom: 0,
          //   child: ClipRRect(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          //     child: Container(
          //       color: Colors.black.withOpacity(0.6),
          //       width: MediaQuery.of(context).size.width,
          //       child: Row(
          //         children: [
          //           Flexible(
          //               flex: 1, fit: FlexFit.tight,
          //               child: MenuItem(
          //                 icon: Icons.library_music,
          //                 title: "My Songs",
          //               )),
          //           Flexible(
          //               flex: 1, fit: FlexFit.tight,
          //               child: MenuItem(
          //               icon: Icons.history,
          //               title: "Discover")),
          //           Flexible(
          //               flex: 1, fit: FlexFit.tight,
          //               child: MenuItem(
          //                 icon: Icons.album,
          //                 title: "Albums",
          //               )),
          //           Flexible(
          //               flex: 1, fit: FlexFit.tight,
          //               child: MenuItem(
          //                 icon: Icons.account_circle_outlined,
          //                 title: "Profile",
          //               )),
          //         ],
          //       )
          //     ),
          //   ),
          // )
          // )


        ],
      ),
    );

  }

// Container buildNavBarItem(IconData icon, bool isActive, int index){
//   return  Container(
//     height: 60,
//     width: MediaQuery.of(context).size.width/3,
//     decoration: BoxDecoration(
//         color: index == _selectedItemIndex ? Colors.pink : Colors.black
//     ),
//     child: Icon(icon, color: Colors.white,),
//   );
}





// class MenuItem extends StatelessWidget {
//   final icon;
//   final title;
//   MenuItem({this.icon, this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: (){
//           Navigator.of(context).pop();
//           Navigator.of(context).pushNamed('/test');
//         },
//         child: Container(
//           padding: EdgeInsets.only(top: 10, bottom: 15),
//           child: Column(
//             children: [Icon(icon, color: Colors.white70,), Text(title, style: TextStyle(color: Colors.white),)],
//           ),
//         ),
//       ),
//     );
//   }
// }


class ChoiceCard extends StatelessWidget {
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
            child: Image.asset('assets/2.jpg',
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
                    "I'm Not Mad",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/play');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text("Halsey", style: TextStyle(color: Colors.white70),),
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



class HotPlayCard extends StatelessWidget {

  final image;

  HotPlayCard({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/3.jpg')),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text("Pop List",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}


class RecommendedCard extends StatelessWidget {
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
              Image.asset('assets/position.jpg',
                height: 180,
                width: 300,
                fit: BoxFit.cover,),
              Padding(
                  padding: const EdgeInsets.only(top:5.0, left: 5.0),
                  child: FlatButton(
                    child: Text(
                      "Position",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),),
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/play');
                    },
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Ariana Grande", style: TextStyle(color: Colors.white70)))
            ],
          ),
        ),
      ),
    );
  }
}







//
// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ShaderMask(
//           shaderCallback: (rect) => LinearGradient(
//             begin: Alignment.bottomCenter,
//             end: Alignment.center,
//             colors: [Colors.black, Colors.transparent],
//           ).createShader(rect),
//           blendMode: BlendMode.darken,
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/cover1.jpg'),
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(Colors.black54,
//                     BlendMode.darken)
//               )
//             ),
//           ),
//         ),
//
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 130),
//                 child: Flexible(
//                     child: Center(
//                       child: Text(
//                         "Fung Pleng Gun",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 42,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                 ),
//               ),
//
//               SizedBox(height: 50,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Container(
//                   height: 50,
//                   width: 300,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[500].withOpacity(0.5),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Center(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         prefixIcon: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Icon(Icons.person, color: Colors.white, size: 25,),
//                         ),
//                         hintText: 'Username',
//                       ),
//                       style: TextStyle(color: Colors.white),
//                       textInputAction: TextInputAction.next,
//
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Container(
//                   height: 50,
//                   width: 300,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[500].withOpacity(0.5),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Center(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         prefixIcon: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Icon(Icons.lock_outline, color: Colors.white, size: 25,),
//                         ),
//                         hintText: 'Password',
//                       ),
//                       obscureText: true,
//                       style: TextStyle(color: Colors.white),
//                       textInputAction: TextInputAction.next,
//
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   color: Colors.pink.withOpacity(0.8)
//                 ),
//                 child: FlatButton(
//                   onPressed: (){
//                     Navigator.of(context).pop();
//                     Navigator.of(context).pushNamed('/login');
//                   },
//                   child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 15),),
//                 ),
//               ),
//
//               SizedBox(height: 50,),
//               Container(
//                 child: FlatButton(
//                   onPressed: (){
//                     Navigator.of(context).pop();
//                     Navigator.of(context).pushNamed('/register');
//                   },
//                   child: Text("Register", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),),
//                 ),
//               ),
//
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

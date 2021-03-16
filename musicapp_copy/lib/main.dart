import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/Playing/Sunflower.dart';
import 'package:musicapp/Playing/alone.dart';
import 'package:musicapp/Playing/billie.dart';
import 'package:musicapp/Playing/cornboy.dart';
import 'package:musicapp/Playing/demon.dart';
import 'package:musicapp/Playing/firstlove.dart';
import 'package:musicapp/Playing/honkai.dart';
import 'package:musicapp/Playing/ill.dart';
import 'package:musicapp/Playing/imagine.dart';
import 'package:musicapp/Playing/more.dart';
import 'package:musicapp/Playing/myheart.dart';
import 'package:musicapp/Playing/never.dart';
import 'package:musicapp/Playing/power.dart';
import 'package:musicapp/Playing/running.dart';
import 'package:musicapp/Playing/sadmovie.dart';
import 'package:musicapp/Playing/sleepy.dart';
import 'package:musicapp/Playing/soybad.dart';
import 'package:musicapp/Playing/sugar.dart';
import 'package:musicapp/Playing/taylor.dart';
import 'package:musicapp/Playing/tom.dart';
import 'package:musicapp/Playing/yht.dart';
import 'package:musicapp/Playing/yoasobi.dart';
import 'package:musicapp/model/myaudio.dart';
import 'package:musicapp/Playing/lol.dart';
import 'package:musicapp/screens/Thai.dart';
import 'package:musicapp/screens/asia.dart';


import 'file:///C:/Users/Admin/AndroidStudioProjects/musicapp_copy/lib/Playing/247.dart';
import 'package:musicapp/screens/drawerScreen.dart';
import 'package:musicapp/screens/home.dart';
import 'package:musicapp/screens/register.dart';
import 'package:musicapp/utility/dialog.dart';
import 'package:musicapp/screens/Test.dart';
import 'package:musicapp/screens/hometest.dart';
import 'package:provider/provider.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:firebase_core/firebase_core.dart';




String initialRoute = '/login';

Future<Null> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async{
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if(event != null){
        initialRoute = '/backhome';
      }
      runApp(MyApp());
    });
  });
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (_)=> MyAudio(),
          child: MyHomePage()),
      routes: <String, WidgetBuilder>{
        '/luss': (BuildContext context) => Luss(),
        '/backhome': (BuildContext context) => MyHomePage(),
        '/drawer': (BuildContext context) => DrawerScreen(),
        '/login': (BuildContext context) => Login(),
        '/register': (BuildContext context) => Register(),
        '/test': (BuildContext context) => Test(),
        '/soybad': (BuildContext context) => Soybad(),
        '/alone': (BuildContext context) => Alone(),
        '/taylor': (BuildContext context) => Taylor(),
        '/more': (BuildContext context) => More(),
        '/sugar': (BuildContext context) => Sugar(),
        '/sunflower': (BuildContext context) => Sunflower(),
        '/power': (BuildContext context) => Power(),
        '/never': (BuildContext context) => Never(),
        '/lol': (BuildContext context) => Lol(),
        '/myheart': (BuildContext context) => Myheart(),
        '/billie' : (BuildContext context) => Billie(),
        '/honkai': (BuildContext context) => Honkai(),
        '/thai': (BuildContext context) => ThaiList(),
        '/sad': (BuildContext context) => Sad(),
        '/ill': (BuildContext context) => Illslick(),
        '/first': (BuildContext context) => FirstLove(),
        '/tom': (BuildContext context) => Tom(),
        '/yht': (BuildContext context) => YHT(),
        '/cornboi': (BuildContext context) => CornBoi(),
        '/demon': (BuildContext context) => Demon(),
        '/sleepy': (BuildContext context) => Sleepy(),
        '/yoa': (BuildContext context) => Yoasobai(),
        '/run': (BuildContext context) => Running(),
        '/asia': (BuildContext context) => AsiaList(),
        '/imagine': (BuildContext context) => Imagine(),













      },
    );
  }
}


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email, password;

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
                      onChanged: (value) => email = value.trim(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(Icons.alternate_email_sharp, color: Colors.white, size: 25,),
                        ),
                        hintText: 'Email',
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
                      onChanged: (value) => password = value.trim(),
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
                    if((email?.isEmpty??true)||(password?.isEmpty??true)){
                      normalDialog(context, 'Please complete all information');
                    }else{
                      checkAuthen();
                    }
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
  Future<Null> checkAuthen() async{
    await Firebase.initializeApp().then((value) async{
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.pushNamedAndRemoveUntil(context, '/backhome', (route) => false))
          .catchError((value) => normalDialog(context, value.message));
    });
  }
}






//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
//
//   var tabController;
//
//
//
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length:2,initialIndex: 0, vsync: this);
//   }
//
//   bool liked = false;
//   void _pressed(){
//     setState(() {
//       liked = !liked;
//     });
//   }
//
//   double xOffset = 0;
//   double yOffset= 0;
//   double scaleFactor = 1;
//
//   int _selectedItemIndex = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     // Widget bottomNavBar = BottomNavigationBar(
//     //     currentIndex: currentIndex,
//     //     onTap: (int index){
//     //       setState(() {
//     //         currentIndex = index;
//     //       });
//     //     },
//     //     items: [
//     //       BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
//     //       BottomNavigationBarItem(icon: Icon(Icons.music_note_rounded), title: Text("Favourite")),
//     //       BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Search")),
//     //
//     //     ]);
//
//
//
//     return Scaffold(
//       // bottomNavigationBar: bottomNavBar,
//         // bottomNavigationBar: Row(
//         //   children: <Widget>[
//         //    buildNavBarItem(Icons.home, true, 0),
//         //     buildNavBarItem(Icons.library_music, false, 1),
//         //     buildNavBarItem(Icons.account_circle, false, 2),
//         //
//         //   ],
//         // ),
//         //
//
//     backgroundColor: Colors.black,
//     appBar: AppBar(
//     leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
//       Navigator.of(context).pop();
//       Navigator.of(context).pushNamed('/drawer');
//     },),
//     title: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white.withOpacity(0.5)
//       ),
//         child: TextField(
//             decoration: InputDecoration(
//               icon: Padding(
//                 padding: const EdgeInsets.only(left: 5),
//                 child: Icon(Icons.search, color: Colors.white,),
//               ),
//               hintText: "Search album, song..."
//             ),
//         )
//     ),
//     actions: [
//       Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: ClipRRect(
//         borderRadius: BorderRadius.circular(50.0),
//           child: Image.asset('assets/pug.jpg', width: 50.0, height: 50.0, fit: BoxFit.cover,)
//     )
//     )
//     ],
//     ),
//     body: Stack(
//         children: [
//
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: ListView(
//               children: <Widget>[
//                 Text("Hot Recommended",
//                   style: TextStyle(
//                     color: Colors.white,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: SizedBox(
//                     height: 250,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         RecommendedCard(),
//                         RecommendedCard(),
//                         RecommendedCard(),
//
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     children: [
//                       Text("Hot Playlists",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white
//                           ),
//                       ),
//                       Spacer(),
//                       SizedBox(
//                         height: 30,
//                         child: FlatButton(onPressed: (){},
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                             color: Colors.white,
//                             child: Text("View All",
//                             style: TextStyle(
//                               color: Colors.black
//                             ),
//                             ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.all(8)),
//                 GridView.count(
//                   shrinkWrap: true,
//                   childAspectRatio: MediaQuery.of(context).size.width/
//                       (MediaQuery.of(context).size.height/1.5),
//                   physics: NeverScrollableScrollPhysics(),
//                     crossAxisCount: 2,
//                     children: [HotPlayCard(), HotPlayCard(), HotPlayCard(), HotPlayCard()]
//                 ),
//                 Text("Our Choices For You",
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white
//                 ),
//                 ),
//                 TabBar(
//                   controller: tabController,
//                     indicatorColor: Colors.pink,
//                     indicatorSize: TabBarIndicatorSize.label,
//                     indicatorWeight: 5,
//                     tabs: [
//                       Tab(child: Text("Songs", style: TextStyle(color: Colors.white))),
//                       Tab(child: Text("Playlists", style: TextStyle(color: Colors.white),),)
//                     ]
//                 ),
//                 LimitedBox(
//                   maxHeight: 400,
//                   child: TabBarView(
//                     controller: tabController,
//                     children: [
//                       ListView(
//                         children: [
//                           ChoiceCard(), ChoiceCard(), ChoiceCard(), ChoiceCard(), ChoiceCard(), ChoiceCard()
//                         ],
//                       ),
//                       ListView(
//                         children: [
//                           ChoiceCard()
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//
//
//
//           // Positioned(
//           //   bottom: 0,
//           //   child: ClipRRect(
//           //   child: BackdropFilter(
//           //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//           //     child: Container(
//           //       color: Colors.black.withOpacity(0.6),
//           //       width: MediaQuery.of(context).size.width,
//           //       child: Row(
//           //         children: [
//           //           Flexible(
//           //               flex: 1, fit: FlexFit.tight,
//           //               child: MenuItem(
//           //                 icon: Icons.library_music,
//           //                 title: "My Songs",
//           //               )),
//           //           Flexible(
//           //               flex: 1, fit: FlexFit.tight,
//           //               child: MenuItem(
//           //               icon: Icons.history,
//           //               title: "Discover")),
//           //           Flexible(
//           //               flex: 1, fit: FlexFit.tight,
//           //               child: MenuItem(
//           //                 icon: Icons.album,
//           //                 title: "Albums",
//           //               )),
//           //           Flexible(
//           //               flex: 1, fit: FlexFit.tight,
//           //               child: MenuItem(
//           //                 icon: Icons.account_circle_outlined,
//           //                 title: "Profile",
//           //               )),
//           //         ],
//           //       )
//           //     ),
//           //   ),
//           // )
//           // )
//
//
//         ],
//       ),
//     );
//
//   }
//
//   // Container buildNavBarItem(IconData icon, bool isActive, int index){
//   //   return  Container(
//   //     height: 60,
//   //     width: MediaQuery.of(context).size.width/3,
//   //     decoration: BoxDecoration(
//   //         color: index == _selectedItemIndex ? Colors.pink : Colors.black
//   //     ),
//   //     child: Icon(icon, color: Colors.white,),
//   //   );
//   }
//
//
//
//
//
// // class MenuItem extends StatelessWidget {
// //   final icon;
// //   final title;
// //   MenuItem({this.icon, this.title});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       color: Colors.transparent,
// //       child: InkWell(
// //         onTap: (){
// //           Navigator.of(context).pop();
// //           Navigator.of(context).pushNamed('/test');
// //         },
// //         child: Container(
// //           padding: EdgeInsets.only(top: 10, bottom: 15),
// //           child: Column(
// //             children: [Icon(icon, color: Colors.white70,), Text(title, style: TextStyle(color: Colors.white),)],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// class ChoiceCard extends StatelessWidget {
//   @override
//
//
//   //ยังกดหัวใจไม่ได้นะ ต้องแก้
//   bool liked = false;
//   void _pressed(){
//     setState(() {
//       // liked = !liked;
//     });
//   }
//
//
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 10),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(15),
//             child: Image.asset('assets/2.jpg',
//               width: 70,
//               height: 70,
//             fit: BoxFit.cover,),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: Column(
//               children: [
//                 FlatButton(
//                     child: Text(
//                       "I'm Not Mad",
//                       style: TextStyle(color: Colors.white,
//                           fontSize: 16),
//                     ),
//                   onPressed: (){
//                       Navigator.of(context).pop();
//                       Navigator.of(context).pushNamed('/play');
//                   },
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 0),
//                   child: Text("Halsey", style: TextStyle(color: Colors.white70),),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           Column(
//             children: [
//               IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.grey,),
//                 onPressed: (){
//                   _pressed();
//                 })
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   void setState(Null Function() param0) {
//     liked = !liked;
//   }
// }
//
//
//
// class HotPlayCard extends StatelessWidget {
//
//   final image;
//
//   HotPlayCard({this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(right: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(15),
//               child: Image.asset('assets/3.jpg')),
//           Padding(
//             padding: const EdgeInsets.only(top: 5.0),
//             child: Text("Pop List",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class RecommendedCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.only(right: 10.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset('assets/position.jpg',
//                 height: 180,
//                 width: 300,
//                 fit: BoxFit.cover,),
//               Padding(
//                 padding: const EdgeInsets.only(top:5.0, left: 5.0),
//                   child: FlatButton(
//                       child: Text(
//                         "Position",
//                           style: TextStyle(
//                             color: Colors.white,
//                               fontSize: 18),),
//                     onPressed: (){
//                         Navigator.of(context).pop();
//                         Navigator.of(context).pushNamed('/play');
//                     },
//                   )
//               ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20.0),
//                               child: Text("Ariana Grande", style: TextStyle(color: Colors.white70)))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


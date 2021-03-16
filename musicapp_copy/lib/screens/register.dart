import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/model/user_model.dart';
import 'package:musicapp/utility/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String username, email, password, name;
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
                    image: AssetImage('assets/cover2.jpg'),
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
                padding: const EdgeInsets.only(top: 150),
                child: Flexible(
                  child: Center(
                    child: Text(
                      "REGISTER",
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
                  height: 45,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[500].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextField(
                      onChanged: (value) => username = value.trim(),
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
                  height: 45,
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
                      keyboardType: TextInputType.emailAddress,

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 45,
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
                    // Navigator.of(context).pop();
                    // Navigator.of(context).pushNamed('/backhome');
                    print('username = $username, email = $email, password = $password');
                    if((username?.isEmpty??true)||(email?.isEmpty??true)||(password?.isEmpty??true)){
                      print("Have space");
                      normalDialog(context, 'Please complete all information');
                    } else {
                      print("No space");
                      registerFirebase();
                    }
                  },
                  child: Text("REGISTER", style: TextStyle(color: Colors.white, fontSize: 15),),
                ),
              ),



            ],
          ),
        ),
      ],
    );

  }
  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) async {
      print('Firebase Initialize Success');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async{
          print('Register Success');
          await value.user
              .updateProfile(displayName: name)
              .then((value2) async {
                String uid = value.user.uid;
                print("Update Profile Success and uid = $uid");
                UserModel model = UserModel(name: name, email: email);
                Map<String, dynamic> data = model.toMap();
                await FirebaseFirestore.instance.collection('users').doc(uid).set(data)
                    .then((value) => print("Insert Value To Firestore Success"));
                return Navigator.pushNamedAndRemoveUntil(context, '/backhome', (route) => false);
              });
    }).catchError((value){
      normalDialog(context, value.message);
    });

    });
  }
}

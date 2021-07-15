import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app2/Provider/auth_provider.dart';
import 'package:recipe_app2/Screens/authscreen/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? email = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    double _iconSize = 20.0;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            elevation: 2.0,
            bottom: TabBar(
              labelColor: Theme.of(context).indicatorColor,
              tabs: [
                Tab(icon: Icon(Icons.restaurant, size: _iconSize)),
                Tab(icon: Icon(Icons.local_drink, size: _iconSize)),
                Tab(icon: Icon(Icons.favorite, size: _iconSize)),
                Tab(icon: Icon(Icons.settings, size: _iconSize)),
              ],
            ),
            textTheme: GoogleFonts.ralewayTextTheme(
              Theme.of(context).textTheme,
            ),
            title: Text('Recipeé'),
            actions: [
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    //sign Out User
                    AuthClass().signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                        (route) => false);
                  })
            ],
          ),
          body: ListView(
            children: <Widget>[
              Image.asset('assets/cool.png'),
              Text(
                'True North Seafood',
                style: GoogleFonts.raleway(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "A little history: \n There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. ",
                style: GoogleFonts.raleway(
                    textStyle: Theme.of(context).textTheme.headline6,
                    fontWeight: FontWeight.normal),
              ),
            ],
          )),
    );
  }
}

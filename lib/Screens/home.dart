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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Image.asset('assets/cool.png'),
                Center(
                  child: Text(
                    'Recipe of the Day!',
                    style: GoogleFonts.raleway(
                        textStyle: Theme.of(context).textTheme.headline5,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Center(
                  child: Text(
                    'True North Seafood',
                    style: GoogleFonts.raleway(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Center(
                  child: Text(
                    "A little history.",
                    style: GoogleFonts.raleway(
                        textStyle: Theme.of(context).textTheme.headline6,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Center(
                  child: Text(
                    " There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                    style: GoogleFonts.raleway(
                        textStyle: Theme.of(context).textTheme.headline6,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Text(
                  '''
                   \n INGREDIENTS: 
                  \n  4 6-ounce skinned salmon fillets 
                  \n Salt and black pepper 
                  \n 1 tablespoon ground coriander 
                  \n ¼ teaspoon ground cloves 
                  \n 1 ½ teaspoons ground cumin
                  \n 1 teaspoon freshly grated nutmeg
                  \n 2 tablespoons peanut oil, grape seed or other neutral oil, or clarified butter
                  \n DIRECTIONS:
                  \n 1.Season fillets with salt and pepper. 
                  \n 2.Combine spices and press on top of each fillet.
                  \n 3.Heat oil until shimmering, then add salmon, spice side down.
                  \n 4.Cook for 2-3 minutes on each sides.
                  \n 5.RELAX.''',
                  style: GoogleFonts.raleway(
                      textStyle: Theme.of(context).textTheme.headline6,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )),
    );
  }
}

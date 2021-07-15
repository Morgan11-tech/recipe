import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app2/Provider/auth_provider.dart';
import 'package:recipe_app2/Screens/authscreen/register.dart';
import 'package:recipe_app2/Screens/authscreen/reset.dart';
import 'package:recipe_app2/Screens/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Login'),
            textTheme:
                GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme)),
        body: isLoading == false
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                    FlatButton(
                      color: Colors.deepOrange[400],
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        AuthClass()
                            .signIN(
                                email: _email.text.trim(),
                                password: _password.text.trim())
                            .then((value) {
                          if (value == 'Welcome') {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false);
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(value!)));
                          }
                        });
                      },
                      child: Text('Login'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text("Don't have an account? Register"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Reset()),
                        );
                      },
                      child: Text('I forgot my password'),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}

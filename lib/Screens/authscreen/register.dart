import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app2/Provider/auth_provider.dart';
import 'package:recipe_app2/Screens/authscreen/login.dart';
import 'package:recipe_app2/Screens/home.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Register into our App'),
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
                            .createAccount(
                                email: _email.text.trim(),
                                password: _password.text.trim())
                            .then((value) {
                          if (value == 'Account created') {
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
                      child: Text('Create Account'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text('Already have an account? Login'),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}

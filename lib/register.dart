import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                new Image.asset("image/flame-1235.png"),
                SizedBox(height: 16),
                Text("You're about to create an account..."),
              ],
            ),
            SizedBox(height: 40),
            TextField(
              onChanged: (value) {
                username = value;
              },
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Email",
              ),
            ),
            SizedBox(height: 12),
            TextField(
              onChanged: (value) {
                password = value;
              },
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Password",
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                RaisedButton(
                    child: Text("Next"),
                    onPressed: () async {
                      try {
                        final newuser =
                            await _auth.createUserWithEmailAndPassword(
                                email: username, password: password);

                        if (newuser != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        }
                      } catch (e) {
                        print(e.toString());
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

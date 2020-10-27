import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Register [DEBUG]"),
        backgroundColor: Colors.red[800],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 00.0),
            Column(
              children: <Widget>[
                new Image.asset("image/flame-no-connection.png"),
                SizedBox(height: 16),
                Text("Netflix&Chill Register"),
              ],
            ),
            SizedBox(height: 40),
            TextField(
              onChanged: (value) {
                username = value;
              },
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Username",
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
                      _usernameController.clear();
                      _passwordController.clear();
                      //Clear text field
                    }),
                RaisedButton(
                    child: Text("Next"),
                    onPressed: () async {
                      try {
                        final newuser =
                            await _auth.createUserWithEmailAndPassword(
                                email: username, password: password);

                        if (newuser != null) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        }
                      } catch (e) {
                        print(e.toString());
                      }
                      //See content
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

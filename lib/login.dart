import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                new Image.asset("image/flame-no-connection.png"),
                SizedBox(height: 16),
                Text("Netflix&Chill"),
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
                        final newuser = await _auth.signInWithEmailAndPassword(
                            email: username, password: password);
                        print(newuser.toString());

                        if (newuser != null) {
                          print("Login succesfully");
                          Navigator.pop(context);
                        }
                      } catch (e) {
                        print(e);
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

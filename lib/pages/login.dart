import 'package:flutter/material.dart';
import 'package:mini_shop/pages/home.dart';
import 'package:mini_shop/pages/signup.dart';

import '../colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTop(),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Card(
                      child: TextFormField(
                        validator: (t) {
                          if (t!.isEmpty) {
                            return "Please Enter Your Username";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Username",
                          labelText: "Username",
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Card(
                      child: TextFormField(
                        validator: (t) {
                          if (t!.isEmpty) {
                            return "Please Enter Your Password";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Password",
                          labelText: "Password",
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: rsPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsetsDirectional.all(16.0),
                                primary: rsPrimaryColor,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeView(),
                                  ));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Successfully logged in"),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text("Invalid username or password"),
                                    ),
                                  );
                                }
                              },
                              child: Text("Login"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ));
                          },
                          child: Text(
                            "create a new account",
                            style: TextStyle(color: rsPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildTop() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(Icons.person_outline, size: 50, color: Colors.grey[400]),
          maxRadius: 50,
        ),
        SizedBox(height: 20),
        Text(
          "Welcome",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Sign to Continue",
          style: TextStyle(
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}

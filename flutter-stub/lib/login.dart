import 'package:login_signup/Animation/faded_animation.dart';
import 'package:login_signup/StaticStrings.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
import 'package:login_signup/signup.dart';


class CustomerLogin extends StatefulWidget {
  @override
  _CustomerLoginState createState() => new _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {

  bool _hasFingerPrintSupport = false;
  bool _autoValidate = false;
  String _authorizedOrNot = "Not Authorized";
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isLoggedin = false;












  bool _isVisible = false;
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400]
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/log1.png",
                            height: 80,
                            width: 100,
                          )
                      )),
                  FadeAnimation(
                      1,
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.4,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Form(
                                autovalidate: _autoValidate,
                                key: formkey,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(

                                        decoration: InputDecoration(
                                            prefixIcon:
                                            Icon(Icons.account_circle),
                                            hintText: "Username",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Row(children: <Widget>[
                                      Expanded(
                                        child: new Container(
                                            margin: const EdgeInsets.only(
                                                left: 10.0, right: 15.0),
                                            child: Divider(
                                              color: Colors.black,
                                              height: 30,
                                            )),
                                      ),
                                      Text("OR"),
                                      Expanded(
                                        child: new Container(
                                            margin: const EdgeInsets.only(
                                                left: 15.0, right: 10.0),
                                            child: Divider(
                                              color: Colors.black,
                                              height: 30,
                                            )),
                                      ),
                                    ]),
                                    Container(
                                      padding:
                                      EdgeInsets.fromLTRB(10, 0, 10, 10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(

                                        decoration: InputDecoration(
                                            prefixIcon:
                                            Icon(Icons.account_circle),
                                            hintText: "Email",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(

                                        obscureText: !_passwordVisible,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                _passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  _passwordVisible =
                                                  !_passwordVisible;
                                                });
                                              },
                                            ),
                                            hintText: "Password",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
//
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                          1.6,
                          SizedBox(
                            width: 300,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.orange[900])),
                              onPressed:() =>{

                            },
                              color: Colors.orange[900],
                              textColor: Colors.white,
                              child: Text("Login".toUpperCase(),
                                  style: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: (){


                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUp()));


//                            Navigator.pushNamed(context, 'SignUp');
                          },
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'Don\'t have an account?',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: '  SIGN UP',
                                      style: TextStyle(
                                          color: Colors.orange[900], fontWeight: FontWeight.bold),
                                    )
                                  ]),
                            ),
                          ),
                        )
//
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

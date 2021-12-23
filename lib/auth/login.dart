// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uas_ptm/validator/validator.dart';
import 'package:uas_ptm/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  bool _isProcessing = false;

  TextEditingController _controllerPassword = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  var url = "http://192.168.1.9/ptm/login.php";

  get http => null;

  void addData() async {
    var response = await http.post(url, body: {
      "email": _controllerEmail.text.trim(),
      "password": _controllerPassword.text.trim(),
    });
    var jsonData = jsonDecode(response.body);
    var jsonString = jsonData['message'];
    if (jsonString == 'success') {
      myToast(jsonString);
    } else {
      myToast(jsonString);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        centerTitle: true,
        title: Text(
          'Login',
        ),
        leading: new IconButton(
          icon: new Icon(Icons.home),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 60, right: 60),
          child: Center(
              child: Column(
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/1.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        validator: (value) => Validator.validateEmail(
                          email: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Email",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        controller: _passwordTextController,
                        focusNode: _focusPassword,
                        obscureText: true,
                        validator: (value) => Validator.validatePassword(
                          password: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Password",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      _isProcessing
                          ? CircularProgressIndicator()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () async {
                                    _focusEmail.unfocus();
                                    _focusPassword.unfocus();
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _isProcessing = true;
                                      });
                                      if (_emailTextController.text ==
                                              _controllerEmail.text &&
                                          _passwordTextController.text.trim() ==
                                              _controllerPassword.text.trim()) {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) => Home(),
                                          ),
                                          ModalRoute.withName('/'),
                                        );
                                      }
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.deepPurple.shade700),
                                  ),
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                                SizedBox(width: 24.0),
                              ],
                            )
                    ],
                  ))
            ],
          ))),
    );
  }

  void doLogin(BuildContext context) {
    Navigator.of(context).pop(1);
  }
}

myToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white);
}

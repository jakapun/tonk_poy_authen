import 'package:flutter/material.dart';
import 'register.dart';
import 'package:http/http.dart' show get; // call get method
import 'dart:convert'; //change respond to ascii
import '../models/user_model.dart'; //call user_model.dart -> model database

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //explicit
  String emailString, passwordString;

  //key
  final formKey = GlobalKey<FormState>();
  final homeScaffoldKey = GlobalKey<ScaffoldState>(); //new draw in old draw
  //logo

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  // App Name

  Widget showText() {
    return Text(
      'สนุกสนาน ล่าสุดใหม่สุดๆ',
      style: TextStyle(
          fontFamily: 'Pridi',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent[100]),
    );
  }

  //Email TextField

  Widget emailTextfield() {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Email Address',
          hintText: 'you@email.com'),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'Please type email address';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  //Password textfield

  Widget passwordTextfield() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password:',
        hintText: 'more 6 charactor',
        labelStyle: TextStyle(color: Colors.white),
      ),
      validator: (String value) {
        if (value.length <= 5) {
          return 'password is short';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  //button signin
  Widget signInButton(BuildContext context) {
    return RaisedButton(
      color: Colors.redAccent,
      child: Text('Sign In'),
      onPressed: () {
        //call void
        checkEmailAndPassword(context);
      },
    );
  }

  void checkEmailAndPassword(BuildContext context) async {
    print('You Click SignIn');

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print('email => $emailString, pass => $passwordString');

      String urlString =
          'https://www.androidthai.in.th/poy/getUserWhereEmailPoy.php?isAdd=true&Email=$emailString';

      var response = await get(urlString);
      var result = json.decode(response.body);

      print('result => $result');

      if (result.toString() == 'null') {
        showSnakeBar('User Fault,Please try again'); //like torst in ionic
      } else {

        // have json
        for (var data in result) {

          var userModel =UserModel.formJson(data);
          String truePass =userModel.password.toString();
          String nameReadable =userModel.name.toString();

          if (passwordString ==truePass) {
            showSnakeBar('Welcome $nameReadable');
          } else {
            showSnakeBar('Password False');
          }
          
        }
        
      }
    }
  }

  void showSnakeBar(String messageString) {
    final snackBar = new SnackBar(
      content: Text(messageString),
    );
    homeScaffoldKey.currentState.showSnackBar(snackBar);
  }

  //button signup

  Widget signUpButton(BuildContext context1) {
    //สร้างตัวแปรชื่อ context
    return RaisedButton(
      color: Colors.blue,
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click SignUp');
        var registerRoute = new MaterialPageRoute(
            builder: (BuildContext context) => Register());
        Navigator.of(context1).push(registerRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      resizeToAvoidBottomPadding: false,
      // body: Text('Home',style: TextStyle(fontSize: 50.0),),
      body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.white],
                    begin: Alignment(-1, -1))),
            padding: EdgeInsets.only(top: 100.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                showLogo(),
                Container(
                  //ครอบ container เพื่อจัด margin ของ text
                  margin: EdgeInsets.only(top: 20.0),
                  child: showText(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: emailTextfield(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: passwordTextfield(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                        child: signInButton(context),
                      ),
                      new Expanded(
                        child: signUpButton(context), //goto line 63
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

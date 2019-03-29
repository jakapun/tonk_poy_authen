import 'package:flutter/material.dart';
import 'register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    );
  }

  //Password textfield

  Widget passwordTextfield() {
    return TextFormField(
        decoration: InputDecoration(
      labelText: 'Password:',
      hintText: 'more 6 charactor',
      labelStyle: TextStyle(color: Colors.white),
    ));
  }

  //button signin
  Widget signInButton() {
    return RaisedButton(
      color: Colors.redAccent,
      child: Text('Sign In'),
      onPressed: () {
        print('You Click SignIn');
      },
    );
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
        // body: Text('Home',style: TextStyle(fontSize: 50.0),),
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red, Colors.white], begin: Alignment(-1, -1))),
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
                  child: signInButton(),
                ),
                new Expanded(
                  child: signUpButton(context), //goto line 63
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

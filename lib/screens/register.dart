import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //name
  Widget nameTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Name: ', hintText: 'Type Your Name'),
    );
  }

  // email
  Widget emailTextfield() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address :', hintText: 'your@email.com'),
    );
  }

  //password

  Widget passwordTextfield() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'more 6 charactor'),
    );
  }

  void clickCloudUpload(){

    print('click upload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, //keyboard ทับ scaffold
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cloud_upload),
            tooltip: 'Upload To Server', //press 3 second
            onPressed: () {clickCloudUpload();},
          )
        ],
      ),
      // body: Text('this is body'),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                  width: 2.0, color: Colors.blue, style: BorderStyle.solid)),
          child: Column(
            children: <Widget>[
              nameTextField(),
              emailTextfield(),
              passwordTextfield()
            ],
          ),
        ),
      ),
    );
  }
}

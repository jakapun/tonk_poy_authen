import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit //ประกาศตัวแปร

  String nameString, emailString, passwordString;

  // Key

  final formKey = GlobalKey<FormState>();

  //name
  Widget nameTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Name: ', hintText: 'Type Your Name'),
      validator: (String value) {
        if (value.length == 0) {
          return 'please type name?';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  // email
  Widget emailTextfield() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address :', hintText: 'your@email.com'),
      validator: (String value) {
        if (!((value.contains('@') && value.contains('.')))) {
          return 'type email format yourmail@name.com';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  //password

  Widget passwordTextfield() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'more 6 charactor'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Please Type Password > 5 digit';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  void clickCloudUpload() {
    print('click upload');
    print(formKey.currentState.validate());
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(
          'name => $nameString, email => $emailString, password => $passwordString');
    }
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
              onPressed: () {
                clickCloudUpload();
              },
            )
          ],
        ),
        // body: Text('this is body'),
        body: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(50.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                      width: 2.0,
                      color: Colors.blue,
                      style: BorderStyle.solid)),
              child: Column(
                children: <Widget>[
                  nameTextField(),
                  emailTextfield(),
                  passwordTextfield()
                ],
              ),
            ),
          ),
        ));
  }
}

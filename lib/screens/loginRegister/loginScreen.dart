import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hastanedemo/Api/AccountApi/authenticate.Api.dart';

import 'package:hastanedemo/desigin/login/myCustomClipper.dart';
import 'package:hastanedemo/models/authenticate/authenticateModel.dart';
import 'package:hastanedemo/screens/loginRegister/registerChoiceScreen.dart';
import 'package:passwordfield/passwordfield.dart';
import '../mainScreen.dart';
import 'forgotPasswordScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginScreen();
  }
}

class _loginScreen extends State {
  TextEditingController _textEditingControllerUsername =
      TextEditingController();
  TextEditingController _textEditingControllerPassword =
      TextEditingController();
  AuthenticateModel authenticateModel;
  AuthenticateApi authenticateApi = new AuthenticateApi();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/image/virhosttransparan.png",
                    ),
                    scale: 5,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0),
              height: 250,
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        loginNameField(),
                        loginPasswordField(),
                        loginButton(),
                      ],
                    ),
            ),
            registerWidget(),
          ],
        ),
      ),
    );
  }

  Widget loginNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "E-Posta", hintText: "koksal@koksal.com"),
      controller: _textEditingControllerUsername,
    );
  }

  Widget loginPasswordField() {
    return PasswordField(
      floatingText: "Şifre",
      color: Colors.blue,
      hasFloatingPlaceholder: true,
      controller: _textEditingControllerPassword,
      //pattern: r'.*[@$#.*].*',

      //errorMessage: 'Özel karakter içermelidir. . * @ # \$',
    );

  }

  Widget loginButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              child: Text('Şifrenizi mi Unuttunuz ?',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPassword()),
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Text("Giriş"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  this.isLoading = true;
                });
                var login = json.encode(AuthenticateModel(
                        _textEditingControllerUsername.text,
                        _textEditingControllerPassword.text)
                    .toJson());
                AuthenticateApi.login(login).then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                  if (value.statusCode == 200) {
                    var person = json.decode(value.body);
                    print(person);
                    var nextScreen = Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                    nextScreen.then((value) {
                      setState(() {
                        this.isLoading = false;
                      });
                    });
                  } else {
                    setState(() {
                      this.isLoading = false;
                    });
                    print("şifre Yanlış");
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget registerWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 75.0),
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Text("Henüz Kayıtlı Değil misiniz ?"),
          RaisedButton(
            child: Text('Kaydol',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterCoice()),
              );
            },
            color: Colors.blue,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

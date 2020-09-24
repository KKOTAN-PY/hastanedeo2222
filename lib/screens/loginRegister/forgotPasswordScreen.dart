import 'package:flutter/material.dart';
import 'package:hastanedemo/desigin/login/myCustomClipper.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _forgotPassword();
  }
}

class _forgotPassword extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              width: double.infinity,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/image/virhosttransparan.png",
                  ),
                  scale: 4,
                ),
              ),
            ),
          ),

           forgotPasswordField(),
        ],
      ),
    );
  }

  Widget forgotPasswordField() {
    return Container(
      padding: EdgeInsets.all(40),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.5,
      child: Column(
        children: [
          Text("Şifremi Unuttum"),
          TextFormField(
            decoration: InputDecoration(
              labelText: "E-mail",
              hintText: "blabla@blabla.com",
              suffixIcon: Icon(Icons.email),
            ),
          ),
          RaisedButton(
            child: Text("Gönder"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: (){
              print("gönder");
            },
          ),
        ],
      ),
    );
  }
}

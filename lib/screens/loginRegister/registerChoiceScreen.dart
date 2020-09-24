import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import 'package:hastanedemo/desigin/login/myCustomClipper.dart';

class RegisterCoice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _registerCoice();
  }

}

class _registerCoice extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.5,
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
          Container(

            height: MediaQuery.of(context).size.height*0.5,
            padding: EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    registerFacebookButton(),
                  ],
                ),
                Row(
                  children: [
                    registerGoogleButton(),
                  ],
                ),
                Row(
                  children: [
                    registerTwitterButton(),
                  ],
                ),
                Row(
                  children: [
                    registerLinkedinButton(),
                  ],
                ),
                Row(
                  children: [
                    registerButton(),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),

    );
  }

 Widget registerGoogleButton() {
    return  Expanded(
      child: GoogleSignInButton(
        borderRadius: 10.0,
        text: "Google İle Devam Et",
        onPressed: () {
          print("google");
          },
        darkMode: true, // default: false
      )
    );
 }

  Widget registerFacebookButton() {
    return Expanded(
      child:  FacebookSignInButton(
          borderRadius: 10.0,
        text: "Facebook İle Devam Et",
          onPressed: () {
        print("facebook");
      }),
    );
  }

  Widget registerTwitterButton() {
    return Expanded(
      child: TwitterSignInButton(
          borderRadius: 10.0,
        text: "Twiter İle Devam Et",
          onPressed: () {
        print("tiwter");
      }),
    );
  }



  Widget registerLinkedinButton() {
    return Expanded(
      child: AppleSignInButton(
        borderRadius: 10.0,
        text: "Apple ile Devam Et",
        onPressed: (){
          print("appale");
        },
      ),
    );
  }
  Widget registerButton() {
    return Expanded(

      child: RaisedButton(
        child: Row(
          children: [

            Icon(Icons.people),
            Text("Kaydol",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: "Roboto"),),
          ],
        ),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          print("kaydol");
        },
      ),
    );
  }
}
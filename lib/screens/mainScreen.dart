
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:hastanedemo/screens/profilScreen.dart';
import 'package:flutter_countdown_timer/countdown_timer.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _mainScreen();
  }

}

class _mainScreen extends State {
  int _widgetIndex = 0;
  bool _checked = false;
  CountDownController _controller = CountDownController();
  int endTime = DateTime(2020, 10, 20, 18, 00).millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        elevation: 0.0
    ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          //padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              myProfilInformationImage(),
              myProfilInformationText(),
              Divider(),
              Row(
                children: [
                  mainProfileButton(),
                  Padding(padding: EdgeInsets.all(5),),
                  randevuAlButton(),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5),),
              Row(
                children: [
                  randevuTakvimi(),
                  Padding(padding: EdgeInsets.all(5),),
                  tamamlanaRandevular(),
                ],
              ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            title: Text("Randevu"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices_other),
            title: Text("Cihazlar"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            title: Text("Hastaneler"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Eczaneler"),
          ),
        ],
      ),

    );
  }

  myProfilInformationImage() {
    return  ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        height: MediaQuery.of(context).size.height*0.30,
        width: MediaQuery.of(context).size.width  ,
        color: Colors.blue,
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            child: CircleAvatar(
              backgroundImage:AssetImage("assets/image/profileavatar.png"),
              backgroundColor: Colors.white,
            ),
          ),),
      ),
    );

  }

  myProfilInformationText() {

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text("Köksal Kotan",style: TextStyle(fontSize: 20, color: Colors.black)),
        ],
      ),
    );
  }

  mainProfileButton(){
    return Container(
          width: 200,
          height: 100,
          child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            color: Colors.grey[200],
            child: Row(
              children: [
                Icon(Icons.person,color: Colors.blue,),
                Padding(padding: EdgeInsets.all(10),),
                Text("Profilim"),
              ],
            ),
            splashColor: Colors.blue[100],
            onPressed: ()=> print("press"),
          ),
        );

  }

  randevuAlButton() {
    return Container(
      width: 200,
      height: 100,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

        color: Colors.grey[200],
        child: Row(
          children: [
            Icon(Icons.local_hospital,color: Colors.blue,),
            Padding(padding: EdgeInsets.all(10),),
            Text("Randevu Oluştur."),
          ],
        ),
        splashColor: Colors.blue[100],
        onPressed: ()=> print("press"),
      ),
    );
  }

  randevuTakvimi() {

    return Container(
      width: 200,
      height: 100,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

        color: Colors.grey[200],
        child: Row(
          children: [
            Icon(Icons.calendar_today,color: Colors.blue,),
            Padding(padding: EdgeInsets.all(10),),
            Text("Randevu Takvimi."),
          ],
        ),
        splashColor: Colors.blue[100],
        onPressed: ()=> print("press"),
      ),
    );
  }

  tamamlanaRandevular() {
    return Container(
      width: 200,
      height: 100,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Colors.grey[200],
        child: Row(
          children: [
            Icon(Icons.done,color: Colors.blue,),
            Padding(padding: EdgeInsets.all(10),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Tamamlanan"),
              Text("Radevular"),
            ],
            ),

          ],
        ),
        splashColor: Colors.blue[100],
        onPressed: ()=> print("press"),
      ),
    );

  }

}
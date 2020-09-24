import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'mainScreen.dart';

class ProfilScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _profilScreen();
  }

}

class _profilScreen extends State {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Profil"),),
        leading: Image.asset("assets/image/virhosttransparan.png",),
        actions: [ optionButton(),],
      ),
      body:Container(
        child: Column(
          children: [
            profilCardWidget(),
            dateTimeSelect(),
            randevuTalepleriButton(),
            blogButton(),
          ],
        ),
      ),

    );
  }



  optionButton(){
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: PopupMenuButton(
        onSelected: _selecProcess,
        itemBuilder: (BuildContext context)=><PopupMenuEntry>[
          PopupMenuItem(
            value: 0,
            child: Text("Bilgilerim."),
          ),
          PopupMenuItem(
            value: 1,
            child: Text("Çift Doğrulama."),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("Şifre Değiştir."),
          ),
          PopupMenuItem(
            value: 3,
            child: Text("Çıkış."),
          ),
        ],

      ),
    );
  }

  void _selecProcess(value) async{
    print(value);
  }

  profilCardWidget() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width*9,
        height: 200,
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text("Adı :"),
                ],
              ),
              Row(
                children: [
                  Text("SoyAdı :"),
                ],
              ),
              Row(
                children: [
                  Text("Tel :"),
                ],
              ),
              Row(
                children: [
                  Text("Ülke :"),
                ],

              ),
            ],
          ),
        ),
      ),
    );

  }

  dateTimeSelect() {
    return RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(2020, 9, 20,24,60,59),
              maxTime: DateTime(2030, 12, 31,24,60,59), onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                print('confirm $date');
              }, currentTime: DateTime.now(), locale: LocaleType.tr);

        },
        child: Text(
          'Çalışma Zamanı Belirle.',
          style: TextStyle(color: Colors.white),
        ));
  }

  randevuTalepleriButton() {
    return RaisedButton(
      child: Text("Randevu Taleplerim"),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
      },
    );
  }

  blogButton() {
    return RaisedButton(
      child: Text("Blog"),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen()),);

      },
    );
  }
}
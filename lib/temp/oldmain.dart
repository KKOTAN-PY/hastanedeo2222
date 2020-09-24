
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:hastanedemo/screens/profilScreen.dart';
import 'package:flutter_countdown_timer/countdown_timer.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _mainScreen();
  }

}

class _mainScreen extends State{
  int _widgetIndex =0;
  bool _checked = false;
  CountDownController _controller = CountDownController();
  int endTime = DateTime(2020,10,20,18,00).millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("Randevu Al"),
        //leading: Text("aa"), remove Back Button
      ),
      body:Container(
        child: Column(
          children: [

            uzmanlikAlanSecimiCardWidget(),
            randevularimLineWidget(),

            countdownWidget(),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            title: Text("Randevu"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices_other),
            title: Text("Cihazlar"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text(""),
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
      floatingActionButton:  Container(
        padding: EdgeInsets.only(top:30),
        width: 100,
        height: 100,
        child: FloatingActionButton(
          child: Image.asset("assets/image/virhosttransparan.png",),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilScreen()),);

          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

    );
  }


  uzmanlikWidget() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width*9,
        height: 350,
        child: Column(
          children: [
            Text("1/4"),
            DropDownField(
              //value: accountname,
                required: true,
                strict: true,
                labelText: 'Uzmanlık',
                icon: Icon(Icons.aspect_ratio),
                //items: accountNames,
                setter: (dynamic newValue) {
                  //accountname = newValue;
                }
            ),
            Divider(),
            DropDownField(
              //value: accountname,
                required: true,
                strict: true,
                labelText: 'Ülke',
                icon: Icon(Icons.account_balance),
                //items: accountNames,

                setter: (dynamic newValue) {
                  //accountname = newValue;
                }
            ),
            Divider(),
            DropDownField(
              //value: accountname,
                required: true,
                strict: true,
                labelText: 'Şehir',
                icon: Icon(Icons.location_city),
                //items: accountNames,
                setter: (dynamic newValue) {
                  //accountname = newValue;
                }
            ),
            FlatButton(
              padding: EdgeInsets.only(left: 300),
              child: Text("İleri"),
              onPressed: (){
                setState(() {
                  if(_widgetIndex < 2){
                    _widgetIndex++;
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }

  sikayetRaportWidget() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width*9,
        height: 350,
        child: Column(
          children: [
            Text("2/4"),
            //Controller eklenecek
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Şikayetiniz",
              ),
            ),
            Row(
              children: [

                Text("Rapor Ekle"),
                RaisedButton(
                  child: Text("Gözat"),
                ),
              ],
            ),
            CheckboxListTile(
              title: Text("Diğer Doktorlar Görebilsin."),
              controlAffinity: ListTileControlAffinity.leading,
              value: this._checked,
              onChanged: (bool value){
                setState(() {
                  this._checked = value;
                  print(_checked);
                });
              },
            ),
            FlatButton(
              padding: EdgeInsets.only(left: 300),
              child: Text("İleri"),
              onPressed: (){
                setState(() {
                  if(_widgetIndex < 2){
                    _widgetIndex++;
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }

  doktorSecRandevuGosterWidget() {
    return  Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width*9,
        height: 350,
        child: Column(
          children: [
            Text("3/3"),
            DropDownField(
              //value: accountname,
                required: true,
                strict: true,
                labelText: 'Doktor Seç',
                icon: Icon(Icons.local_hospital),
                //items: accountNames,
                setter: (dynamic newValue) {
                  //accountname = newValue;
                }
            ),
            Divider(),
            Center(
              child: Container(child: Text("Veya",),margin: EdgeInsets.all(20),),

            ),
            Divider(),
            RaisedButton(
              child: Text("Boş Randevuları Göster."),
              onPressed: (){
                print("randevu göster");
              },
            ),

            FlatButton(
              padding: EdgeInsets.only(left: 300),
              child: Text("İleri"),
              onPressed: (){
                print("ileri");
              },
            )
          ],
        ),
      ),
    );
  }

  uzmanlikAlanSecimiCardWidget() {
    return IndexedStack(
      index: _widgetIndex,

      children: [
        uzmanlikWidget(),//1/4
        sikayetRaportWidget(),//2/4
        doktorSecRandevuGosterWidget(),
      ],
    );

  }

  randevularimLineWidget() {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
      Text("Randevularım"),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
    ]);
  }

  countdownWidget() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage("assets/image/virhosttransparan.png"), // no matter how big it is, it won't overflow
      ),
      title: Text("Latif Ergün"),
      subtitle:randevuTime(),
    );

  }

  randevuTime() {
    return Row(
      children: [
        CountdownTimer(
          endTime: endTime,
          defaultDays: "==",
          defaultHours: "--",
          defaultMin: "**",
          defaultSec: "++",
          daysSymbol: "Gün",
          hoursSymbol: "s ",
          minSymbol: "dk ",
          secSymbol: "sn",
          daysTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          hoursTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          minTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          secTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          daysSymbolTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          hoursSymbolTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          minSymbolTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          secSymbolTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}
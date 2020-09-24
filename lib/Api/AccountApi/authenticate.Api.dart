import 'package:hastanedemo/models/authenticate/authenticateModel.dart';
import 'package:hastanedemo/screens/loginRegister/loginScreen.dart';
import 'package:http/http.dart' as http;


class AuthenticateApi{
  static Future login(json) {

    return http.post('https://api.virhos.com/api/Account/authenticate',headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'} ,body:json);
  }
}
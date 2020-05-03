import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'components/widgetsbasicos.dart';
 
import 'dart:convert';
import 'userinfo.dart';
import 'dart:async';

class ProviderLog extends ChangeNotifier{
 
     String nombre = "";
    String contra = "";
     String email = "";
     String token;
    bool islogged  ;

  
  Future estalogeado() async {
     
  SharedPreferences prefs = await SharedPreferences.getInstance();
   final key = 'islogged';
   if (islogged != null){
           
          await prefs.setBool('islogged', islogged);
            notifyListeners();
   }else{
      islogged = prefs.getBool(key) ?? false;
        notifyListeners();
      await prefs.setBool('islogged', islogged);

   
   }

  
}
 Future<UserInfo> logear(String email,String contra) async{
       final http.Response response = await http.post(
      'https://movil-api.herokuapp.com/signin',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,'password': contra
      }),
    );
    
    print('${response.body}');
    print('${response.statusCode}');
    if (response.statusCode == 200) {

      print('login exitoso '+'${response.body}');
       islogged = true;
      estalogeado();
      notifyListeners();
      return UserInfo.fromJson(json.decode(response.body));
     
    } else {
      print("login failed");
      print('${response.body}');
 
    }

 
  }
   void cerrarsesion(){
        islogged = false;
         estalogeado();
       notifyListeners();
      
  }
 
  void checkAccount(String nombre,String pass){
       logear(nombre,pass);
  }
 
 
 

}
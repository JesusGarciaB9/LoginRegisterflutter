import 'package:flutter/material.dart';


 
  Widget account(  nameController ){
 
       return   TextFormField(
                controller: nameController ,
                validator: (value) {
                 if (value.isEmpty) {
                         return 'Por favor digite su usuario';
                   }
                 },
              decoration: InputDecoration(hintText: 'Cuenta '),
            );
  }
  Widget password(passController){
     return      TextFormField(
           controller: passController ,
       obscureText: true,
                 validator: (value) {
                 if (value.isEmpty) {
                         return 'Por favor digite su contraseña';
                   }
                 },
                 
              decoration: InputDecoration(hintText: 'Contraseña '),
            );
  }
   Widget email(emailController){
     return      TextFormField(
           controller: emailController ,
    
                 validator: (value) {
                 if (value.isEmpty) {
                         return 'Por favor digite su email';
                   }
                 },
                 
              decoration: InputDecoration(hintText: 'email '),
            );
  }


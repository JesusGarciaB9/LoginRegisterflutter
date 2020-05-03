import 'package:flutter/material.dart';
import 'provider.dart';
import 'package:provider/provider.dart';
import 'components/widgetsbasicos.dart';
import 'Signup.dart';

class LoginHome extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderLog>(
      create: (context) => ProviderLog(),
      child: Builder(
        builder: (context) {

          return Scaffold(
            
            body: Container(
              padding: EdgeInsets.all(16),
              child: Form(
                child: Consumer<ProviderLog>(
                  builder: (context, provider, child){
                     provider.estalogeado();
                   return  (provider.islogged == false || provider.islogged == null) ?
                   
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              
                              //if isEligible is null then set orange color else if it is true then set green else red 
                              color:   Colors.redAccent
                          ),
                          height: 30,
                          width: 50,
                        ),

                        SizedBox(height: 10,),
                                 email(emailController),
                                password(passController),
             
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          child: FlatButton(
                            child: Text("Ingresar "),
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () async{
                              
                              //getting the text from TextField and converting it into int
                
                                final String email =  emailController.text.trim();
                                final String password =  passController.text.trim();
                                
                              //Calling the method from provider.
                   
                            await provider.logear(email,password);
                            },
                          ),
                          
                        ),
                        SizedBox(height: 16,),
                          Container(
                          width: double.infinity,
                          child: FlatButton(
                            child: Text("¿No tienes una cuenta? crea una"),
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: (){
                              
                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignUp()),
                                     );  
 
                            },
                          ),
                          
                        ),
                     

                      ],
                    ) 
                    :
                       Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              
                              //if isEligible is null then set orange color else if it is true then set green else red 
                              color:  Colors.orangeAccent  
                          ),
                          height: 50,
                          width: 50,
                        ),
                          
                               Padding (
                           padding : const EdgeInsets.only(top:40,left: 30),
                               child: RaisedButton(
                              onPressed: () {
                                      provider.cerrarsesion();
                                },
                              child: Text('Cerrar sesión'),
                              ),
                             ),
                        SizedBox(height: 16,),
                           

                      ],
                    );
                  },
                )
              ),
            ),
          );
        }
      )
    );
  }
}
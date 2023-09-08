import 'package:app_stage1/SignUp2.dart';
import 'package:app_stage1/Sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextEditingController _emailController = new TextEditingController();
TextEditingController _fullnameController = new TextEditingController();
TextEditingController _confirmPassController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();
bool _isPasswordVisible = false;
bool _isConfirmVisible = false;
final _form1Key = GlobalKey<FormState>();

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _form1Key,
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                left: 28,
                right: 28,
              ),
                child: Column(
                children: [
                  Image.asset("assets/subscribe.png",
                  height: 250,
                  width:500,),
                  TextFormField(
                      controller: _fullnameController,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
          
                      ),
                      labelText: 'Nom et prénom',
                      
                    ),
                    validator: (String? value) {
                      print('value $value');
                      return value!.isEmpty
                          ? 'Veuillez entrer votre nom et prénom'
                          : !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                              ? 'Veuillez entrer votre nom et prénom'
                              : null;
                    },
                  ),
                  SizedBox(
                    height:20,
                  ),

                      TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
          
                      ),
                      labelText: 'Adresse mail',
                    ),
                   validator: (value) {
                      
                      print('value $value');
                      return value!.isEmpty
                          ? 'Veuillez entrer votre numéro de mail'
                          : !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)
                              ? 'Veuillez entrer votre adresse mail'
                              : null;
                    },
                    
                  ),
                  SizedBox(
                    height:20,
                  ),
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: _passwordController,
                    validator: (value) {
                     if(value!.isEmpty)
                              return 'Veuillez entrer votre mot de passe';
                              return null;
                              },
                        decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
          
                        ),
                        
                        labelText: 'Mot de passe',
                        suffixIcon: IconButton(
                    icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                       _isPasswordVisible = !_isPasswordVisible;
                      });
                    })),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: _confirmPassController,
                    validator: (value) {
                      if(value!.isEmpty)
                                   return 'Veuillez confirmer votre mot de passe';
                              if(value != _passwordController.text)
                                   return 'Les mots de passe ne corresspondent pas' ;
                              return null;
                              
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        labelText: 'Confirmer votre mot de passe',
                        suffixIcon: IconButton(
                    icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                       _isPasswordVisible = !_isPasswordVisible;
                      });
                    })),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          child: Text('Suivant'),
                          onPressed: () async {
                            
                          
          
                            if (_form1Key.currentState!.validate()) {
                              Navigator.push(
                        context,
                       MaterialPageRoute(builder: (context) => SignupScreen2()),
            );
          
                            }
                          },
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Déja membre?'),
                      TextButton(
                          onPressed: () async{
                            if (_emailController.text.isEmpty||_passwordController.text.isEmpty
                            || _fullnameController.text.isEmpty||_confirmPassController.text.isEmpty ){
                                      print('Veuillez saisir   ');
 
                                    }
                                    else{
                                     if (_passwordController.text.trim()==_confirmPassController.text.trim());
                                    
                                    else{
                                       Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => LoginPage()));
                                    }
                                   
                                    }
                                    
                          },
                          
              child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: Text(
            'Connexion',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

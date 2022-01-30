// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:firebase_auth_db/main.dart';
import 'package:firebase_auth_db/services/authentication_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'signin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final Color buttonColor = Colors.cyan;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final fail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cadastro",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'ou'),
                            TextSpan(
                              text: ' fazer login',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()));
                                },
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [

                  Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: (fail) 
                          ? Text(
                            'Ocorreu um erro!',
                            style: TextStyle(
                                color: Colors.red[500],
                            ),
                          )
                          : null
                        ),

                        SizedBox(height: 8),
                      ],
                    ),

                    

                    Row(
                      children: [
                        SizedBox(
                            width: (MediaQuery.of(context).size.width - 50) / 2,
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Primeiro nome',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0), width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: (MediaQuery.of(context).size.width - 50) / 2,
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Sobrenome',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0), width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusColor: Color(0xffE0E0E0),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    buildEmailField(),
                    SizedBox(
                      height: 8,
                    ),
                    buildPhoneField(),
                    SizedBox(
                      height: 8,
                    ),
                    buildPasswordField('Senha'),
                    SizedBox(
                      height: 8,
                    ),
                    buildPasswordField('Confirmação da senha'),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Deve conter pelo menos 8 caracteres"
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildSignUpButton(buttonColor, fail),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'By tapping Register, you agree to our '),
                            TextSpan(
                                text: 'Terms of use ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'and '),
                            TextSpan(
                                text: 'Privacy',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPhoneField() {
    return SizedBox(
        height: 60,
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: 'Phone number',
            prefixIcon: ImageIcon(
              AssetImage("lib/assets/images/signin_phonenumbericon.png"),
            ),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xffE0E0E0), width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusColor: Color(0xffE0E0E0),
          ),
        ));
  }

  Widget buildSignUpButton(Color buttonClr, bool fail) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 40,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonClr),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
        onPressed: () {
          context.read<AuthenticationService>().signUp(
            email: emailController.text.trim(),
            password: passwordController.text.trim()
          )
          .then((value) => value == "Signed up" 
            ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()))
            : print(value)
          );
        },
        child: Text(
          "Criar cadastro",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: emailController,
        textCapitalization: TextCapitalization.none,
        key: ValueKey('email'),
        autocorrect: false,
        enableSuggestions: false,
        validator: (value) {
          final pattern = r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$';
          final regExp = RegExp(pattern);

          if (!regExp.hasMatch(value!)) {
            return 'Email inválido';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: 'Email',
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusColor: Color(0xffE0E0E0),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget buildPasswordField(String label) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: passwordController,
        textCapitalization: TextCapitalization.none,
        key: ValueKey('password'),
        autocorrect: false,
        enableSuggestions: false,
        validator: (value) {
          if (value!.isEmpty || value.length < 7) {
            return 'A senha deve conter pelo menos 7 caracteres';
          }
        },
        obscureText: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusColor: Color(0xffE0E0E0),
        ),
      ),
    );
  }
}

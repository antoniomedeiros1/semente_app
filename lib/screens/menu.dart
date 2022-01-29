import 'package:firebase_auth_db/services/google_sign_in.dart';
import 'package:firebase_auth_db/screens/signin.dart';
import 'package:firebase_auth_db/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth_db/screens/discover/discover_screen.dart';
import 'package:firebase_auth_db/constants.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Image(image: AssetImage("lib/assets/images/semente-logo.png")),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Olá, seja bem vindo!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Realize login para prosseguir",
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width - 40,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(8.0)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        // MaterialPageRoute(builder: (context) => SignUpPage()));
                        MaterialPageRoute(builder: (context) => DiscoverScreen()));
                  },
                  child: Text(
                    "Registrar com email",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "Já tem cadastro?  "),
                      TextSpan(
                        text: 'Fazer login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          },
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

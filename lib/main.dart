import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_db/constants.dart';
import 'package:firebase_auth_db/screens/discover/discover_screen.dart';
import 'package:firebase_auth_db/services/authentication_service.dart';
import 'package:firebase_auth_db/screens/menu.dart';
import 'package:firebase_auth_db/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'DM Sans',
          primaryColor: kPrimaryColor,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            User? user = snapshot.data;
            return user != null ? DiscoverScreen(user) : const Menu();
          }
          return const Menu();
        });
  }
}

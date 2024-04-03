import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_api/pages/bottomNavBar.dart';
import 'package:phone_api/pages/details_page.dart';
import 'package:phone_api/pages/get_details.dart';
import 'package:phone_api/singn_up/sign_in.dart';
import 'package:phone_api/singn_up/sign_up(reg).dart';
import 'package:phone_api/singn_up/splash_screen.dart';

import 'pages/category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCFE0QqIm4b8Z1QVTP-atNiSpu9LgwfOoc',
          appId: '1:704618991423:android:c5c03d96db3edee2788d8a',
          messagingSenderId: 'sendid',
          projectId: 'shopingon-8af7a',
          storageBucket: 'shopingon-8af7a.appspot.com'
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetDetails(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        BottomNavBar.id: (context) => const BottomNavBar(),
        SignInPage.id: (context) => const SignInPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        GetDetails.id: (context) => const GetDetails(),
        DetailsPage.id: (context) => const DetailsPage(),

      },
    );
  }
}

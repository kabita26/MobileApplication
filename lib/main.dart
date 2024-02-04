import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skincare_android/provider/productProvider.dart';
import 'package:skincare_android/screens/pages/intro_page.dart';
import 'package:skincare_android/viewmodels/cartViewModel.dart';
import 'package:skincare_android/viewmodels/global_ui_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:skincare_android/viewmodels/auth_viewmodel.dart';

import 'firebase_options.dart';
import 'viewmodels/auth_viewmodel.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_)=> GlobalUIViewModel()),
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider<CartViewModel>(
          create: (_) => CartViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'SkinCare',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        // ),

        home:IntroPage(),
      ),
    );
  }
}

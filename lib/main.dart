import 'package:e_commerce_q1/auth_gate.dart';
import 'package:flutter/material.dart';

import 'Model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


const clientId = 'YOUR_CLIENT_ID';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );


 runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
          ChangeNotifierProvider(create: (context) => CartModel(),

        child: MaterialApp(
          title: 'k-Kart App',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: Color.fromRGBO(28, 110, 198, 1)),
          ),
          home: AuthGate(),
        ));
  }
}

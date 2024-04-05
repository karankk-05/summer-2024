import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home_page.dart';

class AuthGate extends StatelessWidget {
 const AuthGate({super.key});

 @override
 Widget build(BuildContext context) {
   return StreamBuilder<User?>(
     stream: FirebaseAuth.instance.authStateChanges(),
     builder: (context, snapshot) {
       if (!snapshot.hasData) {
         return SignInScreen(
           providers: [EmailAuthProvider(),
           
           ],
           headerBuilder: (context, constraints, shrinkOffset) {return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: Center(
          child: Align(alignment: Alignment.center,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  
                  Transform.scale(
                    scale: 2,
                    child:
                        Image.asset('assets/logo.png', height: 100, width: 50)
                            .animate()
                            .fade(duration: 2.seconds,delay: 2.seconds)
                            
                  ),
                ]),
          ),
        ));},
           
           subtitleBuilder: (context, action) {
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0),
               child: action == AuthAction.signIn
                   ? const Text('Welcome to FlutterFire, please sign in!')
                   : const Text('Welcome to Flutterfire, please sign up!'),
             );
           },
           footerBuilder: (context, action) {
             return const Padding(
               padding: EdgeInsets.only(top: 16),
               child: Text(
                 'By signing in, you agree to our terms and conditions.',
                 style: TextStyle(color: Colors.grey),
               ),
             );
           },
           sideBuilder: (context, shrinkOffset) {
             return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: Center(
          child: Align(alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Transform.scale(
                    scale: 3,
                    child: RichText(
                      text: TextSpan(
                        text: 'Welcome To',
                        style:TextStyle(color:Theme.of(context).colorScheme.primary )
                      ),
                    ).animate().fade(duration: 2.seconds)
                  ),
                  SizedBox(height: 90,),
                  Transform.scale(
                    scale: 3,
                    child:
                        Image.asset('assets/logo.png', height: 100, width: 50)
                            .animate()
                            .fade(duration: 2.seconds,delay: 2.seconds)
                            
                  ),
                ]),
          ),
        ));
           },
         );
       }
       return  HomePage();
     },
   );
 }
}
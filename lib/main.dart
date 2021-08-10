import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synergy_flutter/app/pages/bottom_tab/bottomTab_view.dart';
import 'package:synergy_flutter/app/pages/home/home_view.dart';
import 'app/pages/community/community_view.dart';
import 'app/pages/welcome/welcome_view.dart';
import 'data/utils/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          final User user = snapshot.data; //explicit type
          if (snapshot.hasData) {
            // return BottomTab();
            return Provider<Database>(
              create: (_) => FirestoreDatabase(uid: user.uid),
              // child: Community(),
              child: CommunityView(),
              // child: BottomTab(),
            );
          } else
            return WelcomePage();
        },
      ),

      // WelcomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodly_ecosystem/core/theme/app_theme.dart';
import 'package:foodly_ecosystem/core/widgets/custom_field.dart';
import 'package:foodly_ecosystem/core/widgets/logout_dialog.dart';
import 'package:foodly_ecosystem/core/widgets/navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffF5CB58),
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        bottomNavigationBar: NavBar(currentIndex: 0),
        body: Builder(
          builder: (context) =>Container(
            margin: EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                SizedBox(height: 60),
                MaterialButton(
                  color: Colors.amber,
                  onPressed: () {
                   return LogoutDialog.show(context);
                  },
                  child: Text("press"),
                ),
              ],
            ),
          ), 
          
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yum_quick/core/theme/app_theme.dart';
import 'package:yum_quick/core/widgets/navigation_bar.dart';
import 'package:yum_quick/core/widgets/search_bar.dart';

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
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              SizedBox(height: 60),

              CustomSearchBar(controller: TextEditingController(),onFilterTap: () => print(3),)
            ],
          ),
        ),
      ),
    );
  }
}

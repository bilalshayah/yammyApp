import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/home/data/datasources/homeRemoteDataSource.dart';
import 'features/home/data/repository/homeRepositoryImpl.dart';
import 'features/home/domain/repository/homeRepository.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  final remoteDataSource = HomeRemoteDataSourceImpl(dio: dio);
  final homeRepository = HomeRepositoryImpl(remoteDataSource: remoteDataSource);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffF5CB58),
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(
    RepositoryProvider<HomeRepository>(
      create: (context) => homeRepository,
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});



  @override

  Widget build(BuildContext context) {

    return MaterialApp(

        debugShowCheckedModeBanner: false,

        theme: AppTheme.lightTheme,

        initialRoute: "/home",

        onGenerateRoute: (settings) => AppRouter.generateRoute(settings));

  }}
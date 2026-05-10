import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/features/orders/data/datasources/orderDatasource.dart';
import 'package:yammyapp/features/orders/data/repository/orderRepositoryImp.dart';
import 'package:yammyapp/features/orders/domain/usecases/getOrderUseCase.dart';
import 'package:yammyapp/features/orders/presentation/bloc/order_bloc.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffF5CB58),
      statusBarBrightness: Brightness.dark,
    ),
  );

  final Dio dio = Dio();
  final dataSource = Orderdatasource(dio);
  final repository = Orderrepositoryimp(orderdatasource: dataSource);
  final getOrdersUseCase = Getorderusecase(repository: repository);
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
      create: (_) => OrderBloc(getorderusecase: getOrdersUseCase),
      )
    ], child: const MyApp(),)
    
      
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: "/myOrders",
      
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
    );
  }
}

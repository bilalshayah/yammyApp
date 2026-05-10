import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api_helper/dio_client.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/orders/data/datasources/orderDatasource.dart';
import 'features/orders/data/repository/orderRepositoryImp.dart';
import 'features/orders/domain/usecases/getOrderUseCase.dart';
import 'features/orders/presentation/bloc/order_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffF5CB58),
      statusBarBrightness: Brightness.dark,
    ),
  );
  final DioClient dioClient = DioClient();
  final dataSource = Orderdatasource(dioClient);
  final repository = Orderrepositoryimp(orderdatasource: dataSource);
  final getOrdersUseCase = Getorderusecase(repository: repository);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(authRepository: AuthRepository(dioClient: DioClient())),
        ),
        BlocProvider(
          create: (_) => OrderBloc(getorderusecase: getOrdersUseCase),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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

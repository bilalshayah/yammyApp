import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/features/orders/domain/usecases/cancelOrderUseCase.dart';
import 'package:yammyapp/features/orders/domain/usecases/createOrderUseCase.dart';
import 'package:yammyapp/features/orders/domain/usecases/getOrderDetailsUseCase.dart';
import 'core/api_helper/dio_client.dart';
import 'core/notifications/firebase_notifications_service.dart';
import 'core/notifications/local_notifications_service.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/notifications/data/repository/notification_repository.dart';
import 'features/notifications/presentation/bloc/notification_bloc.dart';
import 'features/orders/data/datasources/orderDatasource.dart';
import 'features/orders/data/repository/orderRepositoryImp.dart';
import 'features/orders/domain/usecases/getOrderUseCase.dart';
import 'features/orders/presentation/bloc/order_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  final getOrderDetailsUseCase = GetOrderDetailsUseCase(
    orderrepository: repository,
  );
  final cancelorderusecase = Cancelorderusecase(orderrepository: repository);
  final createorderUseCase = CreateorderUseCase(repository: repository);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalNotificationService.init();
  await FireNotificationService.initFireNotification();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(authRepository: AuthRepository(dioClient: dioClient)),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => NotificationBloc(repository: NotificationRepository(dioClient: dioClient)),
        ),
        BlocProvider(
          create: (_) => OrderBloc(
            getorderusecase: getOrdersUseCase,
            getOrderDetailsUseCase: getOrderDetailsUseCase,
            cancelorderusecase: cancelorderusecase,
            createorderUseCase: createorderUseCase,
          ),
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
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
    );
  }
}

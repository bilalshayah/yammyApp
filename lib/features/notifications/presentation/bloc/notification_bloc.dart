import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/notification_repository.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository repository;

  NotificationBloc({required this.repository}) : super(NotificationInitial()) {

    on<FetchNotifications>((event, emit) async {
      emit(NotificationLoading());
      try {
        final notifications = await repository.fetchNotifications();
        emit(NotificationLoaded(notifications: notifications));
      } catch (e) {
        emit(NotificationError(message: "${e.toString()}"));
      }
    });

    on<RefreshNotifications>((event, emit) {
      add(FetchNotifications());
    });
  }
}
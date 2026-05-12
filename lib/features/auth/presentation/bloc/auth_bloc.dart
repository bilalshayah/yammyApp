import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {

    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        final userModel = await authRepository.login(event.email, event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<RegisterSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.register(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName,
          phone: event.phone,
        );
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<ForgetPasswordRequested>((event, emit) async {
    emit(AuthLoading());
    try {
    final token = await authRepository.requestForgetPasswordToken(event.email);
    emit(ForgetPasswordEmailSent(token));
    } catch (e) {
    emit(AuthError(e.toString()));
    }
    });

    on<ResetPasswordSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.resetPassword(
          token: event.token,
          newPassword: event.newPassword,
        );
        emit(ResetPasswordSuccess());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<LogoutRequested>((event, emit) async {
      await authRepository.storageService.deleteToken();
      emit(AuthInitial());
    });
  }
}
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yammyapp/features/profile/presentation/bloc/profileEvent.dart';
import 'package:yammyapp/features/profile/presentation/bloc/profileState.dart';

import '../../data/models/userModel.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Dio dio;
  final GetStorage token =  GetStorage('token');
  ProfileBloc(this.dio) : super(ProfileInitial()) {
    on<GetProfileData>((event, emit) async {
      emit(ProfileLoading());
      try {
        final response = await dio.get(
          'https://yammybackend-production.up.railway.app/api/v1/profile/',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
            },
          ),
        );
        final user = UserModel.fromJson(response.data);
        emit(ProfileSuccess(user));
      } catch (e) {
        print("Error Details: $e");
        emit(ProfileError(e.toString()));
      }
    });
  }
}
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yammyapp/core/storage/storage_service.dart';
import 'package:yammyapp/features/profile/presentation/bloc/profile/profileEvent.dart';
import 'package:yammyapp/features/profile/presentation/bloc/profile/profileState.dart';

import '../../../../auth/data/models/user_model.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Dio dio;
  final StorageService storageService = StorageService();

  ProfileBloc(this.dio) : super(ProfileInitial()) {
    on<GetProfileData>((event, emit) async {
      emit(ProfileLoading());
      try {
        final String? authToken = await storageService.getToken();

        print("Token being sent: $authToken"); 

        if (authToken == null) {
          emit(ProfileError("الرجاء تسجيل الدخول أولاً"));
          return;
        }

        final response = await dio.get(
          'https://yammybackend-production.up.railway.app/api/v1/profile/',
          options: Options(
            headers: {
              'Authorization': 'Bearer $authToken', 
              'Accept': 'application/json',
            },
          ),
        );

        print("Profile Response Data: ${response.data}");

        final userData = response.data['data'] ?? response.data;
        
        final user = UserModel.fromJson({'user': userData});
        emit(ProfileSuccess(user));
      } catch (e) {
        print("Error Details: $e");
        if (e is DioException && e.response?.statusCode == 401) {
           emit(ProfileError("انتهت صلاحية الجلسة، يرجى تسجيل الدخول مجدداً"));
        } else {
           emit(ProfileError(e.toString()));
        }
      }
    });

    on<UpdateProfileData>((event, emit) async {
      emit(ProfileLoading());
      try {
        final String? authToken = await storageService.getToken();

        final response = await dio.put(
          'https://yammybackend-production.up.railway.app/api/v1/profile/',
          data: event.updateData,
          options: Options(
            headers: {
              'Authorization': 'Bearer $authToken',
              'Accept': 'application/json',
            },
          ),
        );

        if (response.statusCode == 200) {
          add(GetProfileData());
        }
      } catch (e) {
        if (e is DioException) {
          print("Server Error Data: ${e.response?.data}");
        }
        emit(ProfileError(e.toString()));
      }
    });
  }
}
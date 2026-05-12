import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yammyapp/core/storage/storage_service.dart';
import '../../../data/models/addressModel.dart';
import 'addressEvent.dart';
import 'addressState.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final Dio dio;
  final StorageService storageService = StorageService();

  AddressBloc(this.dio) : super(AddressInitial()) {

    on<GetAddresses>((event, emit) async {
      emit(AddressLoading());
      try {
        final token = await storageService.getToken();
        final response = await dio.get(
          'https://yammybackend-production.up.railway.app/api/v1/profile/addresses',
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );

        // التحقق من أن الاستجابة تحتوي على مفتاح data وهي قائمة
        if (response.data['success'] == true) {
          final List rawList = response.data['data'] ?? [];

          List<AddressModel> addresses = rawList
              .map((e) => AddressModel.fromJson(e))
              .toList();

          emit(AddressLoaded(addresses));
        } else {
          emit(AddressError("Failed to fetch data"));
        }
      } catch (e) {
        print("Error: $e");
        emit(AddressError(e.toString()));
      }
    });

    on<AddAddress>((event, emit) async {
      emit(AddressLoading());
      try {
        final token = await storageService.getToken();
        final response = await dio.post(
          'https://yammybackend-production.up.railway.app/api/v1/profile/addresses',
          data: event.address.toJson(), 
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'X-CSRFTOKEN': 'JMoA6r5flUWpjMYkF7kKiU2354zAI056SaOFGWf18fBC3xPMrbvZVoaNLy7aNRab',
            },
          ),
        );

        if (response.statusCode == 201 || response.statusCode == 200) {
          emit(AddressActionSuccess("Address Added Successfully"));
        }
      } catch (e) {
        emit(AddressError(e.toString()));
      }
    });

    on<DeleteAddress>((event, emit) async {
      try {
        final token = await storageService.getToken();
        final response = await dio.delete(
          'https://yammybackend-production.up.railway.app/api/v1/profile/addresses/${event.addressId}',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'X-CSRFTOKEN': 'JMoA6r5flUWpjMYkF7kKiU2354zAI056SaOFGWf18fBC3xPMrbvZVoaNLy7aNRab',
            },
          ),
        );

        if (response.statusCode == 204 || response.statusCode == 200) {
          emit(AddressActionSuccess("Address Deleted Successfully"));
          add(GetAddresses());
        }
      } catch (e) {
        emit(AddressError(e.toString()));
      }
    });

  }
}

import '../../../data/models/addressModel.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final List<AddressModel> addresses;
  AddressLoaded(this.addresses);
}

class AddressActionSuccess extends AddressState {
  final String message;
  AddressActionSuccess(this.message);
}

class AddressError extends AddressState {
  final String message;
  AddressError(this.message);
}
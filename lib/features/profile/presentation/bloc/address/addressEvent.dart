import '../../../data/models/addressModel.dart';

abstract class AddressEvent {}

class GetAddresses extends AddressEvent {}

class AddAddress extends AddressEvent {
  final AddressModel address;
  AddAddress(this.address);
}

class DeleteAddress extends AddressEvent {
  final String addressId;
  DeleteAddress(this.addressId);
}
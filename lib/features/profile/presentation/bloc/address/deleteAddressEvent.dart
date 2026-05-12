import 'addressEvent.dart';

class DeleteAddress extends AddressEvent {
  final String addressId;
  DeleteAddress(this.addressId);
}
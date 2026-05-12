abstract class ProfileEvent {}
class GetProfileData extends ProfileEvent {}
class UpdateProfileData extends ProfileEvent {
  final Map<String, dynamic> updateData;
  UpdateProfileData(this.updateData);
}
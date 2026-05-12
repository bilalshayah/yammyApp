import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/appTextStyle.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/addressModel.dart';
import '../bloc/address/addressBloc.dart';
import '../bloc/address/addressEvent.dart';

Widget buildAddressCard(BuildContext context,AddressModel item) {
  return InkWell(
    onLongPress: (){
      _showDeleteDialog(context, item);
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.activeCategory.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.home_outlined, color: AppColors.textOrange, size: 30),
        ),
        title: Text(item.label, style: AppTextStyles.h2()),
        subtitle: Text(item.street, style: AppTextStyles.subtitle()),
        trailing: const Icon(
          Icons.radio_button_checked,
          color: AppColors.textOrange,
        ),
      ),
    ),
  );
}
void _showDeleteDialog(BuildContext context, AddressModel item) {
  showDialog(
    context: context,
    builder: (childContext) => AlertDialog(
      title: const Text("Delete Address"),
      content: Text("Are you sure you want to delete '${item.label}'?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(childContext),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            context.read<AddressBloc>().add(DeleteAddress(item.id!));
            Navigator.pop(childContext);
          },
          child: const Text("Delete", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}
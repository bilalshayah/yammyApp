import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_appbar.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_field.dart';
import '../../../../core/widgets/navigation_bar.dart';
import '../../data/models/addressModel.dart';
import '../bloc/address/addressBloc.dart';
import '../bloc/address/addressEvent.dart';
import '../bloc/address/addressState.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController streetCont = TextEditingController();

  @override
  void dispose() {
    nameCont.dispose();
    streetCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // الـ NavBar في الأسفل
      bottomNavigationBar: const NavBar(currentIndex: 0),
      backgroundColor: AppColors.activeCategory,
      appBar: AppAppBar(
        text: 'Add New Address',
        iSArrowIcon: true,
        function: () {
          Navigator.pop(context);
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: Icon(
                            Icons.home_outlined,
                            size: 100,
                            color: AppColors.textOrange,
                          ),
                        ),
                        const SizedBox(height: 40),

                        const Text("Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 10),
                        CustomField(
                          type: "fname",
                          controller: nameCont,
                          validator: (value) =>
                          value!.isEmpty ? "Required" : null,
                        ),

                        const SizedBox(height: 25),
                        const Text("Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 10),
                        CustomField(
                          type: "Damascus",
                          controller: streetCont,
                          validator: (value) =>
                          value!.isEmpty ? "Required" : null,
                        ),

                        const Spacer(),

                        const SizedBox(height: 30),

                        BlocConsumer<AddressBloc, AddressState>(
                          listener: (context, state) {
                            if (state is AddressActionSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                              Navigator.pop(context);
                              context.read<AddressBloc>().add(GetAddresses());
                            } else if (state is AddressError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is AddressLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return CustomButton(
                              text: "Apply",
                              color: AppColors.textOrange,
                              function: () {
                                if (_formKey.currentState!.validate()) {
                                  final newAddress = AddressModel(
                                    label: nameCont.text,
                                    street: streetCont.text,
                                    building: "1",
                                    city: "Damascus",
                                    country: "Syria",
                                    isDefault: true,
                                  );
                                  context
                                      .read<AddressBloc>()
                                      .add(AddAddress(newAddress));
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
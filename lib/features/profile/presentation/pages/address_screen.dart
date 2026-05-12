import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/router/app_router.dart';
import 'package:yammyapp/core/widgets/custom_button.dart';
import '../../../../core/constants/app_appbar.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/appTextStyle.dart';
import '../../../../core/widgets/navigation_bar.dart';
import '../../data/models/addressModel.dart';
import '../bloc/address/addressBloc.dart';
import '../bloc/address/addressEvent.dart';
import '../bloc/address/addressState.dart';
import '../widgets/buildAddressCard.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(GetAddresses());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 0),
      backgroundColor: AppColors.activeCategory,
      appBar: AppAppBar(text: 'Delivery Address',iSArrowIcon: true,function: (){
        Navigator.pop(context);
      },),

      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            if (state is AddressLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AddressLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(25),
                      itemCount: state.addresses.length,
                      itemBuilder: (context, index) {
                        final item = state.addresses[index];
                        return buildAddressCard(context,item);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(27.0),
                    child: CustomButton(
                      text: "Add New Address",
                      function: () {
                        // إغلاق الكيبورد بشكل آمن
                        FocusScope.of(context).unfocus();

                        // الانتقال مع تمرير الـ Bloc لضمان عمل الصفحة التالية
                        Navigator.pushNamed(
                          context, 
                          AppRouter.addAddress,
                          arguments: context.read<AddressBloc>(),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is AddressError) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

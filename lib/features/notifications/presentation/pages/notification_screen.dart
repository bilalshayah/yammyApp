import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_assets.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import 'package:yammyapp/core/constants/content_background.dart';
import 'package:yammyapp/core/constants/svg_icon.dart';
import '../bloc/notification_bloc.dart';
import '../bloc/notification_event.dart';
import '../bloc/notification_state.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(FetchNotifications());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ContentBackground(),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            left: 60,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(50),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: Offset(-5, 0),
                  )
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIcon(path: AppAssets.notification),
                        const SizedBox(width: 15),
                        Text(
                          "Notifications",
                          style: AppTextStyles.h2(color: AppColors.textWhite),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.white54, thickness: 1, indent: 30, endIndent: 30),
                  Expanded(
                    child: BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (context, state) {
                        if (state is NotificationLoading) {
                          return const Center(child: CircularProgressIndicator(color: Colors.white));
                        } else if (state is NotificationLoaded) {
                          if (state.notifications.isEmpty) {
                            return const Center(
                              child: Text(
                                "There's no notifications now",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            );
                          }
                          return ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: state.notifications.length,
                            itemBuilder: (context, index) {
                              final item = state.notifications[index];
                              return NotificationItem(
                                text: item.title,
                                path: AppAssets.notification,
                              );
                            },
                          );
                        } else if (state is NotificationError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
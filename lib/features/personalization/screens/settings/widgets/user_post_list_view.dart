import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hps/features/personalization/controllers/settings_controller.dart';

class UserPostsListView extends StatelessWidget {
  const UserPostsListView({super.key, required this.settingsController1});

  final settingsController settingsController1;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        key: const PageStorageKey<String>('UserPostsListView'),
        itemBuilder: (_, index) {
          return Obx(
            () =>
                settingsController1
                    // ignore: invalid_use_of_protected_member
                    .settingsUserPostDetailsWithWidget
                    .value[index],
          );
        },
        itemCount: settingsController1.settingsUserPostDetails.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}

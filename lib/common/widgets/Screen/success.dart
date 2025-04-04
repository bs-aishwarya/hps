import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hps/features/authentication/screens/login/login_screen.dart';
import 'package:hps/utils/constants/colors.dart';
import 'package:hps/utils/constants/sizes.dart';
import 'package:hps/utils/constants/text_strings.dart';
import 'package:hps/utils/helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => LoginScreen()),
            icon: const Icon(Icons.cancel_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MyAppSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                width: MyAppHelperFunctions.screenWidth(),
                image: AssetImage(image),
              ),
              const SizedBox(height: MyAppSizes.spaceBtwItems),

              /// Title & Sub-Title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: MyAppSizes.spaceBtwItems),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: MyAppSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    MyAppTexts.myAppcontinue,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: MyAppColors.textWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

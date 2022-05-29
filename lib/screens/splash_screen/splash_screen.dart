import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../env/dimensions.dart';
import '../shared_widgets/custom_btn.dart';
import '../shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/invoice_logo.svg",
              height: Dimensions.calcH(200),
              color: Colors.white,
            ),
            SizedBox(
              height: Dimensions.calcH(15),
            ),
            CustomText(
              text: AppStrings.APP_NAME,
              color: Colors.white,
              weight: FontWeight.bold,
              fontSize: Dimensions.calcH(25),
            ),
            SizedBox(
              height: Dimensions.calcH(5),
            ),
            CustomText(
              text: AppStrings.APP_DESC,
              color: Colors.white,
              weight: FontWeight.w600,
              height: 1.3,
              fontSize: Dimensions.calcH(18),
            ),
            SizedBox(
              height: Dimensions.calcH(5),
            ),
            CustomBtn(
              label: AppStrings.START_BTN,
              action: () {
                Get.offAndToNamed("/home");
              },
            )
          ],
        ),
      ),
    );
  }
}

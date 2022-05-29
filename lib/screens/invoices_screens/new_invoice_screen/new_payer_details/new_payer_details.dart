import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../controllers/customer_controller.dart';
import '../../../../env/dimensions.dart';
import '../../../shared_widgets/appbar_eng_view.dart';
import '../../../shared_widgets/custom_btn.dart';
import '../../../shared_widgets/custom_input_eng.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPayerScreen extends StatelessWidget {
  const NewPayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar_eng(
        title: AppStrings.ADD_PAYER_TITLE,
        showBackArrow: true,
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: GetBuilder<CustomerController>(
              init: CustomerController(),
              builder: (controller) => Container(
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.calcH(5),
                  horizontal: Dimensions.calcW(15),
                ),
                child: Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          CustomInput_eng(
                            controller: controller.customerNameInputController,
                            label: AppStrings.ADD_PAYER_NAME,
                            isRequired: true,
                          ),
                          CustomInput_eng(
                            controller: controller.customerEmailInputController,
                            label: AppStrings.ADD_PAYER_EMAIL,
                            isRequired: true,
                            type: TextInputType.emailAddress,
                          ),
                          CustomInput_eng(
                            controller: controller.customerPhoneInputController,
                            label: AppStrings.ADD_PAYER_PHONE,
                            isRequired: true,
                            type: TextInputType.phone,
                          ),
                          CustomInput_eng(
                            controller:
                                controller.customerAddressInputController,
                            label: AppStrings.ADD_PAYER_ADDRESS,
                            height: Dimensions.calcH(100),
                            isRequired: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.calcH(50),
                    ),
                    CustomBtn(
                      label: AppStrings.SAVE_BTN,
                      action: () {
                        bool isValid = controller.validate();
                        if (isValid) {
                          Get.back();
                        }
                      },
                      color: AppColors.kPrimaryColor,
                      textColor: Colors.white,
                      width: Dimensions.calcW(150),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable, non_constant_identifier_names

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../controllers/invoices_controller.dart';
import '../../../env/dimensions.dart';
import 'pdf_ai.dart';
import '../../shared_widgets/appbar_eng_view.dart';
import '../../shared_widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class InvoicePreviewScreen extends StatelessWidget {
  Map<String, dynamic> args = Get.arguments;

  InvoicePreviewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondaryColor,
      appBar: AppBar_eng(
        title: AppStrings.PREVIEW_TITLE,
        showBackArrow: true,
      ),
      body: FutureBuilder(
          future: PdfInvoiceApi.generate(args['invoice']),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic _documentBytes = snapshot.data;

              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.calcW(15),
                              vertical: Dimensions.calcH(8)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: SfPdfViewer.memory(
                            _documentBytes,
                            initialZoomLevel: 0.5,
                          )),
                    ),

                  ]);
            } else {
              return Center(
                child: SizedBox(
                  height: Dimensions.calcH(80),
                  width: Dimensions.calcW(80),
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              );
            }
          }),
    );
  }
}

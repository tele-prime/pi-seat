import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/user_manual_page/controller/user_manual_page_controller.dart';

class UserManualPage extends StatelessWidget {
  const UserManualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserManualPageController>(builder: (controller) => Scaffold(
      body: Container(),
      // body: PdfBookViewer(
      //   pdfUrl: controller.pdfPath,
      //   backgroundColor: Colors.grey.shade100,
      //   showNavigationControls: true,
      //   onPageChanged: (currentPage, totalPages) {
      //     print('Page $currentPage of $totalPages');
      //   },
      //   onError: (String error) {
      //     print('PDF loading error: $error');
      //     // Handle error - show dialog, snackbar, etc.
      //   },
      //   style: PdfBookViewerStyle(
      //     backgroundColor: Colors.black,
      //     centerDividerColor: Colors.amber,
      //     loadingIndicatorColor: Colors.blue,
      //     centerDividerWidth: 6.0,
      //     navigationControlsStyle: NavigationControlsStyle(
      //       buttonColor: Colors.orange,
      //       iconColor: Colors.white,
      //     ),
      //   ),
      // )
    ));
  }
}

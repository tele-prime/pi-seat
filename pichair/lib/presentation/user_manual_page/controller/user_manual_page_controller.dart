import 'package:get/get.dart';

class UserManualPageController extends GetxController {
  int currentPageIndex = 0;

  String pdfPath = 'assets/pdf/seat.pdf';

  void changePage(int index) => currentPageIndex = index;

}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pichair/app/theme/color_theme.dart';
// import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_webos_controller.dart';
//
// class TvLayoutTouch extends StatelessWidget {
//   const TvLayoutTouch({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TvPageWebOsController>(builder: (controller) => Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: SssColor.grey,
//         ),
//         child: GestureDetector(
//           onPanUpdate: controller.onTouchPositionUpdate,
//           onPanEnd: controller.onTouchEnd,
//           onTap: controller.onTouchTap,
//         ),
//       ),
//     ));
//   }
// }

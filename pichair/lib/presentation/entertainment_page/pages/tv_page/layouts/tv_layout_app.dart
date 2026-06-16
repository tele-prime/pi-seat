// import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
// import 'package:get/get.dart';
// import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_webos_controller.dart';
//
// class TvLayoutApp extends StatelessWidget {
//   const TvLayoutApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TvPageWebOsController>(builder: (controller) => Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
//           child: GridView(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 6,
//                 childAspectRatio: 0.8,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10
//               ),
//             children: controller.applicationList.map((app) => GestureDetector(
//               onTap: () => controller.onTapApp(app['package']),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(child: Image.asset(app['logo'])),
//                     SizedBox(height: 5),
//                     Text(app['name'], style: TextStyle(color: Colors.black),),
//                   ],
//                 ),
//               )
//               // child: Card(
//               //   color: Colors.black,
//               //   child: Center(
//               //     child: Text(app['name'], style: TextStyle(color: Colors.white),),
//               //   ),
//               // ),
//             )).toList(),
//           ),
//         ),
//     ));
//   }
// }
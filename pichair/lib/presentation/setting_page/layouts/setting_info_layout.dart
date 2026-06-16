import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/setting_page/controller/setting_page_controller.dart';
import 'package:pichair/presentation/setting_page/widgets/setting_info_row.dart';
import 'package:pichair/presentation/setting_page/widgets/setting_info_update_row.dart';
import 'package:pichair/presentation/widgets/setting_list_divider.dart';
import 'package:pichair/presentation/widgets/wifi_dialog.dart';

class SettingInfoLayout extends StatelessWidget {
  const SettingInfoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPageController>(builder: (controller) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
              // if (controller.connectedNetwork != null) ...[
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       // TextButton(onPressed: controller.refreshNetworks, child: Text('refresh')),
              //       Text(
              //         "Current Network",
              //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              //   const SizedBox(height: 10),
              //   Card(
              //     color: Colors.green.shade50,
              //     child: ListTile(
              //       leading: const Icon(Icons.wifi, color: Colors.green),
              //       title: Text(controller.connectedNetwork!.ssid),
              //       subtitle: const Text("Connected"),
              //       trailing: TextButton.icon(
              //         icon: const Icon(Icons.close, color: Colors.red),
              //         label: const Text("Forget", style: TextStyle(color: Colors.red)),
              //         onPressed: () => controller.handleDisconnect(controller.connectedNetwork!),
              //       ),
              //     ),
              //   ),
              //   const SizedBox(height: 20),
              //   SettingListDivider(),
              // ],
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     controller.isLoading ? Padding(
              //       padding: const EdgeInsets.only(right: 10),
              //       child: SizedBox(
              //         width: 40,
              //         height: 30,
              //         child: Center(child: LinearProgressIndicator()),
              //       ),
              //     ) :
              //     TextButton(onPressed: controller.refreshNetworks, child: Text('refresh')),
              //     Text(
              //       "Available Network",
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 10),
              // ...controller.networks.where((n) => !n.isConnected).toList().map((network) {
              //   return Card(
              //     child: ListTile(
              //       leading: Icon(
              //         network.isSecure ? Icons.wifi_lock : Icons.wifi,
              //         color: Colors.grey[700],
              //       ),
              //       title: Text(network.ssid),
              //       subtitle: Text("Signal: ${network.signalStrength}%"),
              //       trailing: ElevatedButton(
              //         onPressed: () async {
              //           if(network.isSecure){
              //             var result = await Get.dialog(WifiPasswordDialog(ssid: network.ssid));
              //             if(result != null){
              //               await controller.handleConnect(network, result);
              //             }
              //           }else{
              //             await controller.handleConnect(network, null);
              //           }
              //         },
              //         child: const Text("Connect"),
              //       ),
              //     ),
              //   );
              // }),
            SizedBox(height: 20),
            SettingInfoRow(
              label: 'Device IP',
              value: controller.wifiIp??'unknown',
            ),
            SettingListDivider(),
            SettingInfoRow(
              label: 'Application version',
              value: controller.currentVersion.tagName.replaceAll('v', '1.'),
            ),
            SettingListDivider(),
            SettingInfoUpdateRow(),
            SettingListDivider(),
          ],
        ),
      )
    ));
  }
}

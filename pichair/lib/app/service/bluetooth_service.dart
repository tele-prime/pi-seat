// import 'dart:async';
// import 'package:bluez/bluez.dart';
//
// class BluetoothService {
//   final BlueZClient _client = BlueZClient();
//   BlueZDevice? _targetDevice;
//   BlueZGattCharacteristic? _controlChar;
//
//   // The device address from your bluetoothctl info
//   final String _tvAddress = '00:00:46:00:00:01';
//
//   // Common GATT UUIDs for HID and Control
//   final String _hidServiceUuid = '00001812-0000-1000-8000-00805f9b34fb';
//   final String _reportCharUuid = '00002a4d-0000-1000-8000-00805f9b34fb';
//
//   Future<void> init() async {
//     await _client.connect();
//     _connectToTv();
//   }
//
//   Future<void> _connectToTv() async {
//     for (var device in _client.devices) {
//       if (device.address == _tvAddress) {
//         _targetDevice = device;
//         break;
//       }
//     }
//     //
//     // if (_targetDevice != null) {
//     //   if (!_targetDevice!.connected) {
//     //     print('#### device not connected ####');
//     //     try {
//     //       await _targetDevice!.connect();
//     //       Timer(const Duration(seconds: 1), _findCharacteristic);
//     //     } catch (e) {
//     //       print("Connection error: $e");
//     //     }
//     //   } else {
//     //     print('#### device connected ####');
//     //     Timer(const Duration(seconds: 1), _findCharacteristic);
//     //   }
//     // }
//
//     print('#### device start listen ####');
//     // Find device...
//     if (_targetDevice != null) {
//       // Set up listener BEFORE connecting
//       print('#### device not null ####');
//       _targetDevice!.propertiesChanged.listen((properties) {
//         print('#### device listen properties #### ${properties.length}');
//         print('#### device listen properties #### $properties');
//         if (properties.contains('ServicesResolved') &&
//             _targetDevice!.servicesResolved) {
//           print('Services resolved! Found ${_targetDevice!.gattServices.length} services');
//           _findCharacteristic();
//         }
//       });
//
//       print('#### device listen done ####');
//       if (!_targetDevice!.connected) {
//         print('#### device not connected ####');
//         await _targetDevice!.connect();
//       } else if (_targetDevice!.servicesResolved) {
//         // Already connected and resolved
//         _findCharacteristic();
//       } else if (!_targetDevice!.servicesResolved) {
//         // Already connected and resolved
//         while (!_targetDevice!.servicesResolved) {
//           print('#### device services is not resolved ####');
//           await Future.delayed(const Duration(milliseconds: 100));
//         }
//         _findCharacteristic();
//       } else{
//         print('#### device do nothing ####');
//       }
//     }
//   }
//
//   void _findCharacteristic() {
//     if (_targetDevice == null) return;
//
//     print('#### device gattServices #### ${_targetDevice!.gattServices.length}');
//     print('#### device serviceData #### ${_targetDevice!.serviceData}');
//     print('#### device addressType.name #### ${_targetDevice!.addressType.name}');
//     print('#### device path #### ${_targetDevice!.path}');
//     print('#### device name #### ${_targetDevice!.name}');
//     // print('#### device uuids #### ${_targetDevice!.uuids}');
//     for (var service in _targetDevice!.gattServices) {
//       if (service.uuid.toString() == _hidServiceUuid) {
//         for (var char in service.characteristics) {
//           if (char.uuid.toString() == _reportCharUuid) {
//             _controlChar = char;
//             return;
//           }
//         }
//       }
//     }
//
//     // Fallback: Use the first writable characteristic found
//     if (_controlChar == null) {
//       for (var service in _targetDevice!.gattServices) {
//         for (var char in service.characteristics) {
//           if (char.flags.contains(BlueZGattCharacteristicFlag.write) ||
//               char.flags.contains(BlueZGattCharacteristicFlag.writeWithoutResponse)) {
//             _controlChar = char;
//             return;
//           }
//         }
//       }
//     }
//   }
//
//   Future<void> sendCommand(List<int> data) async {
//     if (_controlChar != null) {
//       try {
//         await _controlChar!.writeValue(data,
//             type: BlueZGattCharacteristicWriteType.request);
//       } catch (e) {
//         print("Bluetooth Write Failed: $e");
//       }
//     }
//   }
//
//   void dispose() {
//     _client.close();
//   }
// }
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
//
// class BluetoothControl {
//   Socket? _socket;
//   final String _socketPath = '/tmp/hid_bridge';
//
//   static const int modNone = 0x00;
//   static const int modLShift = 0x02;
//
//   final Map<dynamic, List<int>> _hidMap = {
//     'a': [0x04, 0], 'b': [0x05, 0], 'c': [0x06, 0], 'd': [0x07, 0], 'e': [0x08, 0],
//     'f': [0x09, 0], 'g': [0x0a, 0], 'h': [0x0b, 0], 'i': [0x0c, 0], 'j': [0x0d, 0],
//     'k': [0x0e, 0], 'l': [0x0f, 0], 'm': [0x10, 0], 'n': [0x11, 0], 'o': [0x12, 0],
//     'p': [0x13, 0], 'q': [0x14, 0], 'r': [0x15, 0], 's': [0x16, 0], 't': [0x17, 0],
//     'u': [0x18, 0], 'v': [0x19, 0], 'w': [0x1a, 0], 'x': [0x1b, 0], 'y': [0x1c, 0],
//     'z': [0x1d, 0],
//
//     '1': [0x1e, 0], '2': [0x1f, 0], '3': [0x20, 0], '4': [0x21, 0], '5': [0x22, 0],
//     '6': [0x23, 0], '7': [0x24, 0], '8': [0x25, 0], '9': [0x26, 0], '0': [0x27, 0],
//
//     ' ': [0x2c, 0], '-': [0x2d, 0], '=': [0x2e, 0], '[': [0x2f, 0], ']': [0x30, 0],
//     '\\': [0x31, 0], ';': [0x33, 0], '\'': [0x34, 0], '`': [0x35, 0], ',': [0x36, 0],
//     '.': [0x37, 0], '/': [0x38, 0],
//
//     '!': [0x1e, 1], '@': [0x1f, 1], '#': [0x20, 1], '\$': [0x21, 1], '%': [0x22, 1],
//     '^': [0x23, 1], '&': [0x24, 1], '*': [0x25, 1], '(': [0x26, 1], ')': [0x27, 1],
//     '_': [0x2d, 1], '+': [0x2e, 1], '{': [0x2f, 1], '}': [0x30, 1], '|': [0x31, 1],
//     ':': [0x33, 1], '"': [0x34, 1], '~': [0x35, 1], '<': [0x36, 1], '>': [0x37, 1],
//     '?': [0x38, 1],
//
//     VirtualKeyboardKeyAction.Return: [0x28, 0],
//     VirtualKeyboardKeyAction.Backspace: [0x2a, 0],
//     VirtualKeyboardKeyAction.Space: [0x2c, 0],
//   };
//
//   Future<void> init() async {
//     try {
//       _socket = await Socket.connect(
//         InternetAddress(_socketPath, type: InternetAddressType.unix),
//         0,
//       );
//     } catch (e) {
//       print("Socket Error: $e");
//     }
//   }
//
//   void onVirtualKeyPress(VirtualKeyboardKey key, bool isShiftEnabled) {
//     if (key.action != null) {
//       _handleAction(key.action!);
//     } else if (key.text != null) {
//       _handleText(key.text!, isShiftEnabled);
//     }
//   }
//
//   void _handleText(String text, bool isShiftEnabled) {
//     print('#### handle text #### $text');
//     String char = text.toLowerCase();
//     if (!_hidMap.containsKey(char)) return;
//
//     List<int> mapping = _hidMap[char]!;
//     int keyCode = mapping[0];
//     bool shiftRequiredBySymbol = mapping[1] == 1;
//
//     int modifier = (isShiftEnabled || shiftRequiredBySymbol) ? modLShift : modNone;
//
//     _sendHidReport(modifier, keyCode);
//   }
//
//   void _handleAction(VirtualKeyboardKeyAction action) {
//     print('#### handle action #### ${action.name}');
//     if (!_hidMap.containsKey(action)) return;
//     _sendHidReport(modNone, _hidMap[action]![0]);
//   }
//
//   void _sendHidReport(int modifier, int keyCode) {
//     final press = Uint8List.fromList([0xA1, 0x01, modifier, 0x00, keyCode, 0x00, 0x00, 0x00, 0x00, 0x00]);
//     final release = Uint8List.fromList([0xA1, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]);
//
//     _socket?.add(press);
//     _socket?.add(release);
//   }
//
//   void sendButton(int usageId) {
//     print('#### send button #### $usageId');
//     final report = Uint8List.fromList([0xA1, 0x03, usageId & 0xFF, (usageId >> 8) & 0xFF]);
//     _socket?.add(report);
//     _socket?.add(Uint8List.fromList([0xA1, 0x03, 0x00, 0x00]));
//   }
//
//   void sendKey(int keyCode) {
//     print('#### send key #### $keyCode');
//     final report = Uint8List.fromList([0xA1, 0x01, 0x00, 0x00, keyCode, 0x00, 0x00, 0x00, 0x00, 0x00]);
//     _socket?.add(report);
//     _socket?.add(Uint8List.fromList([0xA1, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]));
//   }
//
//   void power() => sendButton(0x0030);
//   void volumeUp() => sendButton(0x00E9);
//   void volumeDown() => sendButton(0x00EA);
//   void home() => sendButton(0x0223);
//   void back() => sendButton(0x0224);
//   void up() => sendKey(0x52);
//   void down() => sendKey(0x51);
//   void left() => sendKey(0x50);
//   void right() => sendKey(0x4F);
// }


import 'dart:io';

class BluetoothController {
  // The MAC address from your terminal output
  final String deviceMac = "00:00:46:00:00:01";

  Future<void> sendCommand(String cmd) async {
    try {
      // We use 'sh -c' to pipe the command into bluetoothctl
      // This mimics typing "play" inside the bluetoothctl prompt.
      final result = await Process.run('sh', [
        '-c',
        'echo "$cmd" | bluetoothctl'
      ]);

      if (result.exitCode == 0) {
        print("Success: $cmd sent to $deviceMac");
      } else {
        print("Error: ${result.stderr}");
      }
    } catch (e) {
      print("Failed to execute command: $e");
    }
  }

  // Helper methods for your UI buttons
  // void play() => sendCommand("play");
  void play() async {
    await Process.run('sudo', [
      '/home/aye/PythonBluetooth/commands/play.sh'
    ]);

  }
  // void pause() => sendCommand("pause");
  void pause() async {
    await Process.run('sudo', [
      '/home/aye/PythonBluetooth/commands/pause.sh'
    ]);
  }
  void next() => sendCommand("next");
  void previous() => sendCommand("previous");
}
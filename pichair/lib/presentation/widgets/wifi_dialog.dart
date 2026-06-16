import 'package:flutter/material.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class WifiPasswordDialog extends StatefulWidget {
  final String ssid;
  const WifiPasswordDialog({super.key, required this.ssid});

  @override
  State<WifiPasswordDialog> createState() => _WifiPasswordDialogState();
}

class _WifiPasswordDialogState extends State<WifiPasswordDialog> {
  final TextEditingController _controller = TextEditingController();
  late CustomLayoutKeys _customLayoutKeys;

  bool _shiftEnabled = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _customLayoutKeys = CustomLayoutKeys();
  }

  void _onPostKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      String? text = (_shiftEnabled && key.capsText != null) ? key.capsText! : key.text;
      _insertText(text??'');
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Return:
          Navigator.pop(context, _controller.text);
          break;

        case VirtualKeyboardKeyAction.Shift:
          setState(() {
            _shiftEnabled = !_shiftEnabled;
          });
          break;

        case VirtualKeyboardKeyAction.SwithLanguage:
          setState(() {
            _customLayoutKeys.switchLanguage();
          });
          break;

        case VirtualKeyboardKeyAction.Space:
          _insertText(key.text ?? ' ');
          break;

        case VirtualKeyboardKeyAction.Backspace:
          _onBackspace();
          break;

        default:
          break;
      }
    }
  }

  void _insertText(String myText) {
    final text = _controller.text;
    final textSelection = _controller.selection;
    int start = textSelection.start;
    int end = textSelection.end;

    if (start == -1) {
      start = text.length;
      end = text.length;
    }

    String newText = text.replaceRange(start, end, myText);
    final myTextLength = myText.length;
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: start + myTextLength),
    );
  }

  void _onBackspace() {
    final text = _controller.text;
    final textSelection = _controller.selection;
    int start = textSelection.start;
    int end = textSelection.end;

    if (start == -1) {
      start = text.length;
      end = text.length;
    }

    if (end > start) {
      final newText = text.replaceRange(start, end, '');
      _controller.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: start),
      );
      return;
    }

    if (start == 0) return;

    final newText = text.replaceRange(start - 1, start, '');
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: start - 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(10),
      content: SizedBox(
        width: 700,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Connect to ${widget.ssid}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(
              controller: _controller,
              readOnly: true,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter Password',
                suffixIcon: IconButton(
                  icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              color: Colors.grey[100],
              child: VirtualKeyboard(
                height: 120,
                textColor: Colors.black87,
                fontSize: 20,
                postKeyPress: _onPostKeyPress,
                alwaysCaps: _shiftEnabled,
                type: VirtualKeyboardType.Alphanumeric,
                customLayoutKeys: _customLayoutKeys,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, _controller.text),
          child: const Text('Connect'),
        ),
      ],
    );
  }
}

class CustomLayoutKeys extends VirtualKeyboardLayoutKeys {
  @override
  int getLanguagesCount() => 2;

  @override
  List<List> getLanguage(int index) {
    switch (index) {
      case 0:
        return _englishLayout;
      case 1:
        return _symbolsLayout;
      default:
        return _englishLayout;
    }
  }
}

const List<List> _englishLayout = [
  // Row 1
  [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ],
  // Row 2
  [
    'q',
    'w',
    'e',
    'r',
    't',
    'y',
    'u',
    'i',
    'o',
    'p',
    VirtualKeyboardKeyAction.Backspace
  ],
  // Row 3
  [
    'a',
    's',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    ';',
    '\'',
    VirtualKeyboardKeyAction.Return
  ],
  // Row 4
  [
    VirtualKeyboardKeyAction.Shift,
    'z',
    'x',
    'c',
    'v',
    'b',
    'n',
    'm',
    ',',
    '.',
    '/',
    VirtualKeyboardKeyAction.Shift
  ],
  // Row 5
  [
    VirtualKeyboardKeyAction.SwithLanguage,
    '@',
    VirtualKeyboardKeyAction.Space,
    '-',
    '&',
    '_',
  ]
];

const List<List> _symbolsLayout = [
  // Row 1
  [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ],
  // Row 2
  [
    '!',
    '@',
    '#',
    '\$',
    '%',
    '^',
    '&',
    '*',
    '(',
    ')',
    VirtualKeyboardKeyAction.Backspace
  ],
  // Row 3
  [
    '-',
    '_',
    '=',
    '+',
    '[',
    ']',
    '{',
    '}',
    '\\',
    '|',
    VirtualKeyboardKeyAction.Return
  ],
  // Row 4
  [
    ':',
    ';',
    '"',
    '\'',
    '<',
    '>',
    '?',
    ',',
    '.',
    '/',
    VirtualKeyboardKeyAction.Return // Placeholder or another useful key
  ],
  // Row 5
  [
    VirtualKeyboardKeyAction.SwithLanguage,
    ' ',
    VirtualKeyboardKeyAction.Space,
    '~',
    '`',
    ' ',
  ]
];

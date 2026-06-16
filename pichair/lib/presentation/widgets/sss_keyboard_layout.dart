import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class SssKeyboardLayout extends VirtualKeyboardLayoutKeys {
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
# Multi Link Text

A Flutter package multi_link_text allows you to create text with clickable links and additional styling options.

PHOTO

## Features

**Clickable Links**
- `MultiLinkText` allows you to specify certain words as clickable links, and you can define actions to be performed when those links are clicked.

**Rich Text Support**
- It supports rich text formatting, enabling you to customize the appearance of different words in the text.

**Paragraph Handling**
-You can include paragraph breaks in the text, and the widget will handle them accordingly.


## Installation

To use this package, add **multi_link_text** as a dependency in your `pubspec.yaml` file.

```bash
dependencies:
  flutter:
    sdk: flutter
  multi_link_text: ^0.0.1  # Use the latest version
```
‼️ Then run the following command to fetch the package:

```bash
flutter clean
flutter pub get
```


## Usage


```dart
import 'package:flutter/material.dart';
import 'package:multi_link_text/multi_link_text.dart';

void main() {
  runApp(const MultiLinkTextExample());
}

class MultiLinkTextExample extends StatelessWidget {
  const MultiLinkTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multi Link Text example'),
          backgroundColor: Colors.orange,
        ),
        body: const Center(
          child: MultiLinkText(
            data: 'It is Multi Link Text package. How to use it? Click ME !',
            params: {'ME': 'https://www.google.com'},
            extraParams: ['Multi', 'Link', 'Text', 'How'],
            paragraph: ['How'],
            extraParamsStyle: TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.wavy,
              color: Colors.green,
              fontSize: 25,
            ),
            paramsStyle: TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.wavy,
              color: Colors.orange,
              fontSize: 20,
              decorationColor: Color(0xFFFF6F00),
            ),
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
    );
  }
}


```

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.
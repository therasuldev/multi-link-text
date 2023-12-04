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

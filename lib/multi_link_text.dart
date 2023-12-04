library multi_link_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MultiLinkText extends StatefulWidget {
  const MultiLinkText({
    super.key,
    required this.data,
    this.extraParams,
    required this.params,
    this.style,
    this.paramsStyle = const TextStyle(color: Colors.blue),
    this.extraParamsStyle,
    this.paragraph,
    this.locale,
  });

  /// This should include the entire text.
  final String data;

  /// List of non-clickable words that are only visually differentiated using styles.
  final List<String>? extraParams;

  /// The map containing words as keys and corresponding URLs as values.
  final Map<String, String> params;

  /// The style of the [data]
  final TextStyle? style;

  /// The style of the words specified in [params].
  final TextStyle? paramsStyle;

  /// The style of the words specified in [extraParams].
  final TextStyle? extraParamsStyle;

  /// List of words to start a new paragraph.
  final List<String>? paragraph;

  /// The language of the text in this span and its span children.
  ///
  /// Setting the locale of this text span affects the way that assistive
  /// technologies, such as VoiceOver or TalkBack, pronounce the text.
  ///
  /// If this span contains other text span children, they also inherit the
  /// locale from this span unless explicitly set to different locales.
  final Locale? locale;

  @override
  State<MultiLinkText> createState() => _MultiLinkTextState();
}

class _MultiLinkTextState extends State<MultiLinkText> {
  // Function to extract words from the input text and return them in a list format.
  List<String> _params() {
    final sentenceParams = widget.data.trim().split(RegExp(r'\s+'));
    return sentenceParams;
  }

  // Function to determine the style of a word based on its type.
  TextStyle? _style({required String paramKey}) {
    // Check if the word is a clickable word (exists in widget.params).
    if (widget.params.keys
        .any((key) => RegExp(r'\b' + key + r'\b').hasMatch(paramKey))) {
      return widget.paramsStyle; // Return style for clickable words.
    }
    // Check if the word is a non-clickable word (exists in widget.extraParams).
    else if (widget.extraParams != null &&
        widget.extraParams!.contains(paramKey)) {
      return widget.extraParamsStyle; // Return style for non-clickable words.
    }
    // In this case, the word doesn't match any predefined styles, so it won't receive any specific style.
    return null;
  }

  // Function to create a tap gesture recognizer for clickable words in the "params" category.
  TapGestureRecognizer? _recognizer({required String word}) {
    return TapGestureRecognizer()
      ..onTap = () async {
        // Check if the word is a clickable word in the "params" category.
        if (widget.params.keys.contains(word)) {
          // Check if the corresponding URL is not empty.
          if (widget.params[word]!.isEmpty) return;

          // If the conditions are met, open the specified URL in a browser.
          await _goToBrowser(url: widget.params[word]!);
        }
      };
  }

  // Function to format the text, adding new lines for specified paragraph words.
  String _text({required String word}) {
    String text = '';

    // Check if the word is in the list of words that should start a new paragraph.
    if (widget.paragraph != null && widget.paragraph!.contains(word)) {
      // If the word should start a new paragraph, add a new line before the word.
      text += '\n$word ';
    } else {
      // If the word shouldn't start a new paragraph, add a space after the word.
      text += '$word ';
    }

    // Return the formatted text.
    return text;
  }

  Future<void> _goToBrowser({required String url}) async {
    try {
      await launchUrl(Uri.parse(url));
    } on Exception catch (exception) {
      throw exception.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    _sentenceParams = _params();
  }

  late List<String> _sentenceParams;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: widget.style,
        children: List.generate(
          _sentenceParams.length,
          (index) {
            final word = _sentenceParams[index];
            return TextSpan(
              text: _text(word: word),
              style: _style(paramKey: word),
              recognizer: _recognizer(word: word),
              locale: widget.locale,
            );
          },
        ),
      ),
    );
  }
}

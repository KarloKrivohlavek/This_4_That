import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final int maxLength;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const TextFieldWidget(
      {Key? key,
      this.maxLines = 1,
      required this.label,
      required this.text,
      required this.onChanged,
      required this.controller,
      required this.maxLength})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLength: widget.maxLength,
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
          ),
        ],
      );
}

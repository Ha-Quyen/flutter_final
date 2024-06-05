import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputFrom extends StatefulWidget {
  final String type;
  String initText;
  TextInputType keyboard;
  final ValueChanged<String> onChanged;

  InputFrom({
    super.key,
    required this.type,
    this.initText = "",
    this.keyboard = TextInputType.text,
    required this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _InputFromState createState() => _InputFromState();
}

class _InputFromState extends State<InputFrom> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _controller;

  late String _textChange;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initText);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              style: const TextStyle(
                color: Color(0xFF979797),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              widget.type,
            ),
          ),
          TextFormField(
            controller: _controller,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Value is required";
              }
              return null;
            },
            keyboardType: widget.keyboard,
            onChanged: (value) {
              setState(() {
                _textChange = value;
              });

              _formKey.currentState!.validate();
              widget.onChanged(_textChange);
            },
          ),
        ],
      ),
    );
  }
}

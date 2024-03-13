import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String? labelTitle;
  final String? labelHint;
  final bool? isNumeric;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? valueBarang;

  const InputField({
    super.key,
    this.labelTitle,
    this.labelHint,
    this.isNumeric,
    this.controller,
    this.validator,
    this.valueBarang,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool showSuffix = false;

  @override
  void initState() {
    super.initState();
    widget.controller?.text = widget.valueBarang ?? '';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.labelTitle}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff202327),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Column(
            children: [
              TextFormField(
                controller: widget.controller,
                scrollPadding: const EdgeInsets.only(bottom: 40),
                autofocus: true,
                validator: widget.validator,
                style: TextStyle(fontWeight: FontWeight.w500),
                keyboardType: widget.isNumeric == true
                    ? TextInputType.number
                    : TextInputType.text,
                decoration: InputDecoration(
                  hintText: "${widget.labelHint}",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  errorStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validate=true,
    this.number=false,
    this.validator,
  }) :super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool validate;
  final bool number;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  late GlobalKey<FormFieldState> _fieldKey;
  @override
  void initState() {
    _focusNode = FocusNode()..addListener(_listener);
    _fieldKey = GlobalKey<FormFieldState>();
    super.initState();
  }
  void _listener() {
    if (!_focusNode.hasFocus) {
      _fieldKey.currentState?.validate();
    }
  }
  @override
  void dispose() {
    _focusNode.removeListener(_listener);
    _focusNode.dispose();
    _fieldKey.currentState?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        key: _fieldKey,
        focusNode: _focusNode,
        validator:widget.validator ?? (widget.validate? (value){
          if(value!=null&&value.length>=3){
            return null;
          }else{
            return 'Min lenght = 3';
          }
        }:null),
        inputFormatters:widget.number?[
            FilteringTextInputFormatter.digitsOnly
          
          ]:null,
        keyboardType:widget.number? TextInputType.number:TextInputType.text,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText),
      ),
    );
  }
}

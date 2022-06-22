import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lectarium/core/size_config.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final IconData? preffixIconData;
  final IconData? suffixIconData;
  final IconButton? suffixIconBtn;
  final bool? obscureText;
  final Function(String)? onChange;
  final TextInputType? keyboardType;

  TextFieldWidget(
      {this.hintText,
      this.preffixIconData,
      this.obscureText,
      this.onChange,
      this.suffixIconData,
      this.suffixIconBtn,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    FloatingLabelAlignment labelAligment = FloatingLabelAlignment.start;

    return TextField(
      onChanged: onChange,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(SizeConfig.heightMultiplier * 3),
          labelStyle: TextStyle(color: Colors.black, fontSize: 16),
          filled: true,
          fillColor: Color.fromARGB(255, 231, 235, 239),
          floatingLabelStyle: TextStyle(
              height: 7,
              color: Color.fromARGB(255, 128, 128, 128),
              fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
          labelText: hintText,
          suffixIcon: suffixIconBtn != null
              ? suffixIconBtn
              : Icon(
                  suffixIconData,
                  size: SizeConfig.textMultiplier * 2.1,
                  color: Theme.of(context).accentColor,
                )),
    );
  }
}

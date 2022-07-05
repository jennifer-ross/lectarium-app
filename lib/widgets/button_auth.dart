// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lectarium/core/custom_colors.dart';
import 'package:lectarium/core/utils.dart';
import 'package:sizer/sizer.dart';

class ButtonAuthWidget extends StatelessWidget {
  String text = '';
  Function? onPressed;

  ButtonAuthWidget({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => !isEmpty(onPressed) ? onPressed!() : () => false,
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 8.0.w)),
            shadowColor: MaterialStateProperty.all<Color>(Color(0x00FFFFFF)),
            textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(color: Colors.black, fontSize: 16.0.sp)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            backgroundColor: MaterialStateProperty.all<Color>(
                CustomColors.authButtonBackground),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ))),
        child: Text(
          text,
        ),
      ),
    );
  }
}

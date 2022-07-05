import 'package:flutter/material.dart';
import 'package:lectarium/core/custom_colors.dart';
import 'package:lectarium/core/utils.dart';
import 'package:sizer/sizer.dart';

class FieldAuthWidget extends StatelessWidget {
  final String? label;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final IconData? suffixIconData;
  final IconButton? suffixIconBtn;
  final EdgeInsets? margin;
  final String? initialValue;

  FieldAuthWidget(
      {Key? key,
      this.label,
      this.onChanged,
      required this.keyboardType,
      this.obscureText = false,
      this.suffixIconBtn,
      this.suffixIconData,
      this.margin,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            decoration: InputDecoration(
                suffixIcon: !isEmpty(suffixIconBtn)
                    ? suffixIconBtn
                    : Icon(
                        suffixIconData,
                        size: 20.0.sp,
                        color: Colors.black,
                      ),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                labelStyle: TextStyle(color: Colors.black, fontSize: 14.0.sp),
                fillColor: CustomColors.authFieldBackground,
                filled: true,
                labelText: label,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.transparent)),
                floatingLabelStyle: TextStyle(
                    height: 4.5.sp,
                    color: CustomColors.authFieldLabelFocused,
                    fontSize: 12.0.sp),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 5.0.w)),
            autofocus: false,
            style: TextStyle(fontSize: 16.0.sp, height: 1.5.sp),
            keyboardType: keyboardType,
            obscureText: obscureText,
            initialValue: initialValue,
            onChanged: (v) {
              if (!isEmpty(onChanged)) {
                onChanged!(v);
              }
            },
          ),
        ],
      ),
    );
  }
}

library login_view;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lectarium/core/custom_colors.dart';
import 'package:lectarium/core/locator.dart';
import 'package:lectarium/widgets/button_auth.dart';
import 'package:lectarium/widgets/field_auth_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => locator<LoginViewModel>(),
        disposeViewModel: false,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, _) {
          return ListView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 5.0.h),
              shrinkWrap: true,
              children: [TitleSection(), FormSection()]);
        });
  }
}

class TitleSection extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(bottom: 2.4.h),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: viewModel.headTitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SubtitleSection()
            ]),
          ),
        ],
      ),
    );
  }
}

class SubtitleSection extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: viewModel.subtitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 16.0.sp,
                height: 1.16.sp),
          ),
        ],
      ),
    );
  }
}

class FormSection extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Form(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0.h),
        width: double.infinity,
        padding: EdgeInsets.only(
            top: 2.5.h, bottom: 6.0.h, left: 5.0.w, right: 5.0.w),
        decoration: BoxDecoration(
            color: CustomColors.authCardBackground,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(bottom: 5.0.h),
              child: Text(
                viewModel.formTitle,
                style:
                    TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.w400),
              ),
            ),
            FormFieldsSection(),
            FormActionsSection(),
          ],
        ),
      ),
    );
  }
}

class FormFieldsSection extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Column(
      children: [
        FieldAuthWidget(
          label: viewModel.loginInputLabel,
          keyboardType: TextInputType.emailAddress,
          initialValue: viewModel.loginValue,
          onChanged: (v) => viewModel.loginValue = v,
          margin: EdgeInsets.only(bottom: 2.0.h),
        ),
        FieldAuthWidget(
          label: viewModel.passwordInputLabel,
          keyboardType: TextInputType.visiblePassword,
          obscureText: viewModel.obscurePassword,
          margin: EdgeInsets.only(bottom: 2.0.h),
          initialValue: viewModel.passwordValue,
          onChanged: (v) => viewModel.passwordValue = v,
          suffixIconBtn: IconButton(
              icon: viewModel.obscurePassword
                  ? Icon(Icons.visibility_off, size: 20.0.sp)
                  : Icon(Icons.visibility, size: 20.0.sp),
              color: Colors.black.withOpacity(0.4),
              onPressed: () {
                viewModel.obscurePassword = !viewModel.obscurePassword;
              }),
        ),
      ],
    );
  }
}

class FormActionsSection extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Column(
      children: [
        ButtonAuthWidget(
          text: viewModel.buttonText,
          onPressed: () {
            viewModel.loginAction();
          },
        ),
      ],
    );
  }
}

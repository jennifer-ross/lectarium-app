library login_view;

import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:lectarium/core/lectarium_api.dart';
import 'package:lectarium/core/locator.dart';
import 'package:lectarium/core/models/user.dart';
import 'package:lectarium/core/services/navigator_service.dart';
import 'package:lectarium/core/size_config.dart';
import 'package:lectarium/widgets/button_widget.dart';
import 'package:lectarium/widgets/textfield_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_view_model.dart';

part 'login_mobile.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = locator<LoginViewModel>();

    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => viewModel,
        disposeViewModel: false,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _LoginMobile(viewModel),
            desktop: _LoginMobile(viewModel),
            tablet: _LoginMobile(viewModel),
          );
        });
  }
}

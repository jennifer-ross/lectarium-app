library signup_view;

import 'package:lectarium/core/lectarium_api.dart';
import 'package:lectarium/core/locator.dart';
import 'package:lectarium/core/services/navigator_service.dart';
import 'package:lectarium/core/size_config.dart';
import 'package:lectarium/widgets/button_widget.dart';
import 'package:lectarium/widgets/textfield_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'signup_view_model.dart';

part 'signup_mobile.dart';
part 'signup_tablet.dart';
part 'signup_desktop.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignupViewModel viewModel = SignupViewModel();
    return ViewModelProvider<SignupViewModel>.withConsumer(
        viewModelBuilder: () => viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _SignupMobile(viewModel),
            desktop: _SignupMobile(viewModel),
            tablet: _SignupMobile(viewModel),
          );
        });
  }
}

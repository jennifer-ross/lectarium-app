library dashboard_view;

import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lectarium/core/lectarium_api.dart';
import 'package:lectarium/core/locator.dart';
import 'package:lectarium/core/models/user.dart';
import 'package:lectarium/core/size_config.dart';
import 'package:lectarium/core/utils.dart';
import 'package:lectarium/widgets/button_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'dashboard_view_model.dart';

part 'dashboard_mobile.dart';
part 'dashboard_tablet.dart';
part 'dashboard_desktop.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DashboardViewModel viewModel = DashboardViewModel();

    return ViewModelProvider<DashboardViewModel>.withConsumer(
        viewModelBuilder: () => viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _DashboardMobile(viewModel),
            desktop: _DashboardMobile(viewModel),
            tablet: _DashboardMobile(viewModel),
          );
        });
  }
}

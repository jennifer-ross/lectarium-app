library home_view;

import 'package:lectarium/core/locator.dart';
import 'package:lectarium/core/size_config.dart';
import 'package:lectarium/widgets/button_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'home_view_model.dart';

part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = locator<HomeViewModel>();

    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModelBuilder: () => viewModel,
        disposeViewModel: false,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _HomeMobile(viewModel),
            desktop: _HomeMobile(viewModel),
            tablet: _HomeMobile(viewModel),
          );
        });
  }
}

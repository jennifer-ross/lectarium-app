import 'package:lectarium/core/stores/dashboard_store.dart';
import 'package:lectarium/core/stores/theme_store.dart';

import '../core/locator.dart';
import '../core/services/navigator_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderInjector {
  static List<SingleChildWidget> providers = [
    ..._independentServices,
    ..._dependentServices,
    ..._consumableServices,
  ];

  static List<SingleChildWidget> _independentServices = [
    Provider.value(value: locator<ThemeStore>()),
    Provider.value(value: locator<DashboardStore>()),
    Provider.value(value: locator<NavigatorService>()),
  ];

  static List<SingleChildWidget> _dependentServices = [];

  static List<SingleChildWidget> _consumableServices = [];
}

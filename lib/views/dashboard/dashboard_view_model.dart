import 'package:lectarium/core/base/base_view_model.dart';

import '../../core/lectarium_api.dart';
import '../../core/locator.dart';

class DashboardViewModel extends BaseViewModel {
  bool _loading = true;

  bool get isLoading => _loading;

  set isLoading(bool loading) {
    _loading = loading;
  }

  Future<bool> loading() async {
    await locator<LectariumApi>().fetchCourses();
    this.notifyListeners();
    return true;
  }

  DashboardViewModel() {
    loading();
  }

  // Add ViewModel specific code here
}

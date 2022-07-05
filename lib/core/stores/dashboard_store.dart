import 'package:lectarium/core/lectarium_api.dart';
import 'package:lectarium/core/locator.dart';
import 'package:lectarium/core/models/course.dart';
import 'package:lectarium/core/models/pagination_model.dart';
import 'package:lectarium/core/utils.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStoreBase with _$DashboardStore;

abstract class _DashboardStoreBase with Store {
  final LectariumApi api = locator<LectariumApi>();
  bool isFetchData = false;
  int _page = 1;
  int _limit = 20;

  @observable
  ObservableList<Course> currentCourses = ObservableList.of(<Course>[]);

  @action
  Future<void> fetchCourses() async {
    if (isFetchData) {
      return;
    }

    isFetchData = true;

    Map<String, Course> res =
        await api.fetchCourses(PaginationModel(page: _page, limit: _limit));
    List<Course> resList = <Course>[];

    if (res.isNotEmpty) {
      res.forEach((key, value) {
        resList.add(value);
      });

      currentCourses.addAll(resList);
      _page++;
    }

    isFetchData = false;
  }
}

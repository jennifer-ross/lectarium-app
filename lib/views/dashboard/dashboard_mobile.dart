part of dashboard_view;

class _DashboardMobile extends StatelessWidget {
  final DashboardViewModel viewModel;

  final User user = locator<User>();

  _DashboardMobile(this.viewModel);

  List<Widget> _courses(BuildContext context) {
    List<Widget> widgets = <Widget>[];

    user.courses?.forEach((key, course) {
      List<Widget> types = <Widget>[];

      widgets.add(Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 242, 247, 253),
            borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 20.0, left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(course.kartinka_kursa[0]),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                top: 12.0,
              ),
              child: Text(
                course.product_cat[0]['name'],
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 24),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                  margin: const EdgeInsets.only(top: 12.0),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    course.kategoriya_kursa,
                    style: TextStyle(
                        color: Color.fromARGB(255, 128, 128, 128),
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    course.month[0]['name'],
                    style: TextStyle(
                        color: Color.fromARGB(255, 77, 92, 109), fontSize: 18),
                  ),
                  // IconButton(
                  //     onPressed: () => {},
                  //     icon: SvgPicture.asset('fav.svg',
                  //         color: Color.fromARGB(255, 100, 100, 100),
                  //         semanticsLabel: 'Favorite course')),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 12.0),
              child: Text(
                course.author?.display_name ?? '',
                style: TextStyle(
                    color: Color.fromARGB(255, 135, 135, 135), fontSize: 14),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: LinearProgressIndicator(
                  minHeight: 8,
                  value:
                      (course.course_progress['percentage'] as int).toDouble(),
                  backgroundColor: Color.fromARGB(255, 240, 240, 240),
                  color: Color.fromARGB(255, 255, 199, 0),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(children: [
                Text(
                  'Ты здесь',
                  style: TextStyle(
                      color: Color.fromARGB(255, 135, 135, 135), fontSize: 16),
                ),
                SizedBox(
                  child: null,
                  width: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                      child: Text(
                          course.current_last_openned_index! > 0
                              ? course.current_last_openned_index.toString() +
                                  "Урок"
                              : 'Начать курс',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text(
                  'Знания',
                  style: TextStyle(
                      color: Color.fromARGB(255, 135, 135, 135), fontSize: 16),
                ),
                SizedBox(
                  child: null,
                  width: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        (course.course_progress['percentage'] as int)
                                .toString() +
                            ' %',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    padding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  child: Text('Прогресс',
                      style: TextStyle(
                          fontSize: 16.0, color: Color.fromARGB(255, 0, 0, 0))),
                )),
          ],
        ),
      ));
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        margin: const EdgeInsets.only(
            top: 40.0, left: 16.0, right: 16.0, bottom: 48.0),
        child: Center(
          child: new SingleChildScrollView(
              child: new Column(children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 28.0, bottom: 38.0),
              child: Text(
                'Мое обучение',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 32),
              ),
            ),
            if (user.courses!.isNotEmpty) ..._courses(context)
          ])),
        ),
      ),
    );
  }
}

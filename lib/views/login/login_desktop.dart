part of login_view;

class _LoginDesktop extends StatelessWidget {
  final LoginViewModel viewModel;

  _LoginDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;

    return Container();
  }
}

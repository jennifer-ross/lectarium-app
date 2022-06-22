part of login_view;

class _LoginTablet extends StatelessWidget {
  final LoginViewModel viewModel;

  _LoginTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}

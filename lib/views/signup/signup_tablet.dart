part of signup_view;

class _SignupTablet extends StatelessWidget {
  final SignupViewModel viewModel;

  _SignupTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('SignupTablet')),
    );
  }
}
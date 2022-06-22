part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Добро пожаловать в",
          softWrap: true,
          overflow: TextOverflow.fade,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.textMultiplier * 2.2,
              letterSpacing: SizeConfig.textMultiplier * 0.25),
        ),
        Text(
          "Lectarium",
          softWrap: true,
          overflow: TextOverflow.fade,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.textMultiplier * 5.8,
              letterSpacing: SizeConfig.textMultiplier * 0.01),
        ),
      ],
    );
  }

  Widget _buildMainActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ButtonWidget(
            onClick: () {
              viewModel.onSignUpClick();
            },
            title: "Зарегистрироваться",
            hasBorder: true,
            color: Theme.of(context).primaryColor,
            background: Colors.transparent,
            paddingMultiplier: 2,
            borderColor: Theme.of(context).primaryColor),
        SizedBox(
          height: SizeConfig.heightMultiplier * 1.35,
        ),
        ButtonWidget(
            onClick: () {
              viewModel.onLoginClick();
            },
            title: "Войти",
            hasBorder: true,
            color: Colors.black,
            background: Theme.of(context).primaryColor,
            paddingMultiplier: 2,
            borderColor: Theme.of(context).primaryColor),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: Image.asset("assets/images/home_screen.jpg").image,
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.65),
            padding: EdgeInsets.only(
                left: SizeConfig.heightMultiplier * 4,
                right: SizeConfig.heightMultiplier * 4,
                top: SizeConfig.heightMultiplier * 12,
                bottom: SizeConfig.heightMultiplier * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildHeader(context),
                _buildMainActions(context)
              ],
            ),
          )
        ],
      ),
    );
  }
}

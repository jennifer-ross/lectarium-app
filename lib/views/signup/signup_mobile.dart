part of signup_view;

class _SignupMobile extends StatelessWidget {
  final SignupViewModel viewModel;

  _SignupMobile(this.viewModel);

  Widget _buildForm(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            TextFieldWidget(
              hintText: 'Номер телефона',
              obscureText: false,
              keyboardType: TextInputType.phone,
              preffixIconData: Icons.phone_outlined,
              onChange: (value) {
                viewModel.login = value;
                // return viewModel.isValidMobile(value);
              },
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.2,
            ),
            TextFieldWidget(
              hintText: 'Пароль',
              obscureText: viewModel.obscurePassword,
              keyboardType: TextInputType.text,
              preffixIconData: Icons.lock_outline_rounded,
              onChange: (value) {
                viewModel.password = value;
                // return viewModel.isValidPassword(value);
              },
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.2,
            ),
            TextFieldWidget(
              hintText: 'Повторите пароль',
              obscureText: true,
              keyboardType: TextInputType.text,
              preffixIconData: Icons.lock_outline_rounded,
              onChange: (value) {
                viewModel.password = value;
                // return viewModel.isValidPassword(value);
              },
            ),
            // SizedBox(
            //   height: SizeConfig.heightMultiplier * 2.2,
            // ),
            // TextFieldWidget(
            //   hintText: 'Код из смс',
            //   obscureText: true,
            //   keyboardType: TextInputType.number,
            //   preffixIconData: Icons.speaker_notes_outlined,
            //   onChange: (value) {
            //     viewModel.password = value;
            //     // return viewModel.isValidPassword(value);
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    if (SizeConfig.isKeyBoadrdVisible) return Container();

    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: ButtonWidget(
            paddingMultiplier: 2,
            onClick: () async {
              LectariumApi api = locator<LectariumApi>();
            },
            hasBorder: false,
            title: 'Зарегистрироваться',
            color: Theme.of(context).primaryColor,
            // viewModel: locator<LoginViewModel>(),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Image(
          width: MediaQuery.of(context).size.width,
          image: Image.asset("assets/images/signup_screen_bg.jpg").image,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiplier * 5,
                    horizontal: SizeConfig.heightMultiplier * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        alignment: Alignment.center,
                        iconSize: SizeConfig.textMultiplier * 3.5,
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          locator<NavigatorService>().pop();
                        })
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.heightMultiplier *
                        (!SizeConfig.isMobile ? 8 : 3),
                    vertical: SizeConfig.heightMultiplier *
                        (SizeConfig.isKeyBoadrdVisible ? 1 : 6)),
                height: SizeConfig.heightMultiplier *
                    (SizeConfig.isKeyBoadrdVisible ? 30 : 55),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0, -5),
                          color: Colors.white.withOpacity(0.4),
                          spreadRadius: 10,
                          blurRadius: 30),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  mainAxisAlignment: SizeConfig.isKeyBoadrdVisible
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildForm(context),
                    _buildActions(context)
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

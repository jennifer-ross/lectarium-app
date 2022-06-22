part of login_view;

class _LoginMobile extends StatelessWidget {
  _LoginMobile(this.viewModel);

  final LoginViewModel viewModel;

  Widget _buildForm(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 31.0),
              child: Text(
                'Создайте свой профиль',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            TextFieldWidget(
              hintText: 'Email или номер телефона',
              obscureText: false,
              keyboardType: TextInputType.text,
              onChange: (value) {
                viewModel.login = value;
                return viewModel.isValidMobile(value);
              },
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFieldWidget(
                    hintText: 'Пароль',
                    obscureText: viewModel.obscurePassword,
                    keyboardType: TextInputType.text,
                    onChange: (value) {
                      viewModel.password = value;
                      return viewModel.isValidPassword(value);
                    },
                    suffixIconBtn: IconButton(
                        icon: viewModel.obscurePassword
                            ? Icon(
                                Icons.visibility_off_outlined,
                                size: SizeConfig.textMultiplier * 3,
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                size: SizeConfig.textMultiplier * 3,
                              ),
                        color: Theme.of(context).accentColor.withOpacity(0.6),
                        onPressed: () {
                          viewModel.obscurePassword =
                              !viewModel.obscurePassword;
                        })),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.5,
                ),
                _buildActions(context),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Забыли пароль?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).accentColor,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
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

              dynamic isLogin = await api.authUser(
                  login: viewModel.login, password: viewModel.password);

              if (isLogin != null && isLogin == true) {
                viewModel.isLogin = true;
                viewModel.onLoginClick();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.black,
                  content: Text(
                    isLogin.toString(),
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  duration: const Duration(seconds: 8),
                  action: SnackBarAction(
                    textColor: Theme.of(context).primaryColor,
                    label: 'OK',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ));
              }
            },
            hasBorder: false,
            title: 'Вход',
            color: Colors.black,
            background: Color.fromARGB(255, 104, 155, 251),
            borderColor: Colors.transparent,
            // viewModel: locator<LoginViewModel>(),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 6, horizontal: 0),
      children: <Widget>[
        Column(
          children: [
            Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(bottom: 31.0),
                padding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: SizeConfig.heightMultiplier * 2),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Войдите в\nкабинет",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiplier * 0,
                    horizontal: SizeConfig.heightMultiplier * 2),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "Сотни прикладных курсов для профессионального роста, поддержка наставников и новые знакомства.\nПросто начните!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(top: 24),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiplier * 4,
                    horizontal: SizeConfig.heightMultiplier * 2),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 242, 247, 253),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: _buildForm(context)),
          ],
        )
      ],
    )
        // Stack(children: <Widget>[
        //   Container(
        //     color: Color(0x00F2F7FD),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       children: [
        //         Container(
        //             padding: EdgeInsets.symmetric(
        //                 vertical: SizeConfig.heightMultiplier * 8,
        //                 horizontal: SizeConfig.heightMultiplier * 2),
        //             child: RichText(
        //               text: TextSpan(
        //                 children: <TextSpan>[
        //                   TextSpan(
        //                     text: "Добро пожаловать \nв школу Лектариум!",
        //                     style: TextStyle(
        //                       color: Colors.black,
        //                       fontSize: 32,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             )),
        //         Container(
        //             padding: EdgeInsets.symmetric(
        //                 vertical: 0, horizontal: SizeConfig.heightMultiplier * 2),
        //             child: RichText(
        //               text: TextSpan(
        //                 children: <TextSpan>[
        //                   TextSpan(
        //                     text:
        //                         "Ваше персональное предложение.Обратите внимание на ограничение по времени.",
        //                     style: TextStyle(
        //                       color: Colors.black,
        //                       fontSize: 20,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ))
        //       ],
        //     ),
        //   ),
        // ]),
        );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: SafeArea(
  //       bottom: false,
  //       left: false,
  //       right: false,
  //       child: Column(
  //         children: <Widget>[
  //           Flexible(
  //             flex: 5,
  //             child: Align(
  //               alignment: Alignment.center,
  //               child: Center(
  //                 child: Padding(
  //                   padding: EdgeInsets.all(SizeConfig.heightMultiplier * 5),
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.max,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: <Widget>[
  //                       _buildHead(context),
  //                       _buildForm(context),
  //                       _buildActions(context),

  // Container(
  //   height: screenSize.height / 2.5,
  //   color: Theme.of(context).accentColor,
  // ),
  // AnimatedPositioned(
  //   duration: Duration(milliseconds: 200),
  //   curve: Curves.easeOutQuad,
  //   top: keyboardOpen ? -screenSize.height / 3.7 : 0.0,
  //   child: WaveWidget(
  //     size: screenSize,
  //     yOffset: screenSize.height / 3,
  //     color: Colors.white,
  //   ),
  // ),
  // Padding(
  //   padding: EdgeInsets.only(top: 100),
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Text(
  //         'Login',
  //         style: TextStyle(
  //             color: Colors.white,
  //             fontSize: screenSize.width / 10,
  //             fontWeight: FontWeight.w900),
  //       )
  //     ],
  //   ),
  // ),
  // Padding(
  //   padding: const EdgeInsets.all(30.0),
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: <Widget>[
  //       TextFieldWidget(
  //         hintText: 'Phone number',
  //         obscureText: false,
  //         preffixIconData: Icons.phone_outlined,
  //         onChange: (value) =>
  //             viewModel.isValidMobile(value),
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: [
  //           TextFieldWidget(
  //               hintText: 'Password',
  //               obscureText: viewModel.obscurePassword,
  //               preffixIconData: Icons.lock_outline_rounded,
  //               onChange: (value) =>
  //                   viewModel.isValidPassword(value),
  //               suffixIconBtn: IconButton(
  //                   icon: viewModel.obscurePassword
  //                       ? Icon(
  //                           Icons.visibility_off_outlined,
  //                           size: 18,
  //                         )
  //                       : Icon(
  //                           Icons.visibility_outlined,
  //                           size: 18,
  //                         ),
  //                   color: Theme.of(context)
  //                       .accentColor
  //                       .withOpacity(0.4),
  //                   onPressed: () {
  //                     viewModel.obscurePassword =
  //                         !viewModel.obscurePassword;
  //                   })),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Text(
  //             'Forgot password?',
  //             style: TextStyle(
  //                 color: Theme.of(context).accentColor),
  //           )
  //         ],
  //       ),
  //       SizedBox(
  //         height: 20,
  //       ),
  //       ButtonWidget(hasBorder: false, title: 'Login'),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       ButtonWidget(hasBorder: true, title: 'Sign up'),
  //     ],
  //   ),
  // ),

  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   ),
  // );

  // return Scaffold(
  //   backgroundColor: Theme.of(context).accentColor,
  //   body: SingleChildScrollView(
  //       child: SafeArea(
  //     child: Container(
  //       width: screenSize.width,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           Container(
  //             width: double.infinity,
  //             padding: orientation == Orientation.landscape
  //                 ? EdgeInsets.symmetric(vertical: 15, horizontal: 15)
  //                 : EdgeInsets.symmetric(vertical: 30, horizontal: 20),
  //             margin: orientation == Orientation.landscape
  //                 ? EdgeInsets.symmetric(horizontal: screenSize.width / 6)
  //                 : EdgeInsets.symmetric(horizontal: screenSize.width / 20),
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20),
  //                 color: Theme.of(context).primaryColor,
  //                 boxShadow: [
  //                   BoxShadow(
  //                       color: Theme.of(context).hintColor.withOpacity(0.2),
  //                       offset: Offset(0, 10),
  //                       blurRadius: 20),
  //                 ]),
  //             child: Form(
  //               child: Column(
  //                 children: <Widget>[
  //                   SizedBox(
  //                     height: orientation == Orientation.landscape ? 15 : 25,
  //                   ),
  //                   Text(
  //                     "Login",
  //                     style: Theme.of(context).textTheme.headline2,
  //                   ),
  //                   SizedBox(
  //                     height: orientation == Orientation.landscape ? 25 : 35,
  //                   ),
  //                   new TextFormField(
  //                     keyboardType: TextInputType.phone,
  //                     validator: (value) => viewModel.validateMobile(value),
  //                     decoration: new InputDecoration(
  //                         hintText: "Phone number",
  //                         enabledBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                           color: Theme.of(context)
  //                               .accentColor
  //                               .withOpacity(0.2),
  //                         )),
  //                         focusedBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 color: Theme.of(context).accentColor)),
  //                         prefixIcon: Icon(
  //                           Icons.phone,
  //                           size: 18,
  //                           color: Theme.of(context).accentColor,
  //                         )),
  //                   ),
  //                   SizedBox(
  //                     height: 20,
  //                   ),
  //                   new TextFormField(
  //                     keyboardType: TextInputType.visiblePassword,
  //                     obscureText: viewModel.obscurePassword,
  //                     validator: (value) => viewModel.validatePassword(value),
  //                     decoration: new InputDecoration(
  //                         hintText: "Password",
  //                         enabledBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                           color: Theme.of(context)
  //                               .accentColor
  //                               .withOpacity(0.2),
  //                         )),
  //                         focusedBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                                 color: Theme.of(context).accentColor)),
  //                         prefixIcon: Icon(
  //                           Icons.lock,
  //                           size: 18,
  //                           color: Theme.of(context).accentColor,
  //                         ),
  //                         suffixIcon: IconButton(
  //                             icon: viewModel.obscurePassword
  //                                 ? Icon(Icons.visibility_off)
  //                                 : Icon(Icons.visibility),
  //                             color: Theme.of(context)
  //                                 .accentColor
  //                                 .withOpacity(0.4),
  //                             onPressed: () {
  //                               viewModel.obscurePassword =
  //                                   !viewModel.obscurePassword;
  //                             })),
  //                   ),
  //                   SizedBox(
  //                     height: orientation == Orientation.landscape ? 40 : 60,
  //                   ),
  //                   FlatButton(
  //                     onPressed: () {},
  //                     padding:
  //                         EdgeInsets.symmetric(vertical: 12, horizontal: 80),
  //                     child: Text(
  //                       "Login",
  //                       style: TextStyle(color: Colors.white),
  //                     ),
  //                     color: Theme.of(context).accentColor,
  //                     shape: StadiumBorder(),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   )),
  // );
  // }
}

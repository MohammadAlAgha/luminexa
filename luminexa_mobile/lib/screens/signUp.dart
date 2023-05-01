import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luminexa_mobile/remoteDataSource/authDataSource.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ConfirmPasswordController =
      TextEditingController();

  void register() async {
    final String userName = userNameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = ConfirmPasswordController.text;

    try {
      await AuthDataSource.register(userName, email, password, confirmPassword);
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              SvgPicture.asset('images/Logo.svg'),
              SizedBox(
                height: 50,
              ),
              titleWidget(title: "Sign Up"),
              Container(
                height: 370,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      sytledTextField(
                        controller: userNameController,
                        label: "Name",
                        hintText: "Name",
                        isPass: false,
                      ),
                      sytledTextField(
                        controller: emailController,
                        label: "Email",
                        hintText: "Email",
                        isPass: false,
                      ),
                      sytledTextField(
                        controller: passwordController,
                        label: "Password",
                        hintText: "Password",
                        isPass: true,
                      ),
                      sytledTextField(
                        controller: ConfirmPasswordController,
                        label: "Confirm Password",
                        hintText: "Confirm Password",
                        isPass: true,
                      )
                    ]),
              ),
              SizedBox(
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    styledButton(
                      innerText: "Sign Up",
                      onTap: register,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Joined Us Before? ",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                                fontFamily: "RalewayBold",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor,
                                decoration: TextDecoration.underline),
                            text: "Sign In",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .popAndPushNamed(RouteManager.login);
                              },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

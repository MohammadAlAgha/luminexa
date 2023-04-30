import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
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
                SvgPicture.asset("images/Logo.svg"),
                SizedBox(
                  height: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    titleWidget(title: "Sign In"),
                    Container(
                      height: 200,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            sytledTextField(
                              controller: emailController,
                              hintText: "Email",
                              label: "Email",
                              isPass: false,
                            ),
                            sytledTextField(
                              controller: passwordController,
                              hintText: "Password",
                              label: "Password",
                              isPass: true,
                            ),
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 180,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      styledButton(
                        innerText: "Sign In",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "No account? ",
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
                              text: "Sign Up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .popAndPushNamed(RouteManager.signUp);
                                },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

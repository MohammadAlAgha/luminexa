import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luminexa_mobile/screens/login.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ConfirmPasswordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset('images/Logo.svg'),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w900,
                        fontSize: 23),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
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
                      isPass: false,
                      obscureText: true,
                    )
                  ]),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  styledButton(
                    innerText: "Sign Up",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Joined Us Before? ",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 14,
                            fontWeight: FontWeight.w800),
                      ),
                      Text.rich(TextSpan(
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 63, 139, 0),
                              decoration: TextDecoration.underline),
                          text: "Sign In",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return logIn();
                              }));
                            }))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

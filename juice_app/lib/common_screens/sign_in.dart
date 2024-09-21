import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColor;
import 'package:juice_app/User_pages/user_sign_up.dart' as signUpPage;

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.background,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: appColor.buttons_col,
                  ),
                ),
                Container(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Stay updated on your juice..."),
                Container(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            size: 32,
                          ),
                          labelText: "Contact Number"),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 17),

                    //password field
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_open_rounded,
                          size: 32,
                        ),
                        labelText: "Password",
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 17),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 200,
                ),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.buttons_col,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Color(0xFFffffff),
                    size: 60,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("New to juice_Bar ? "),
                    InkWell(
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Color.fromARGB(255, 54, 0, 248),
                            fontSize: 17),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signUpPage.UserSignUp()));
                      },
                    ),
                    const SizedBox(
                      width: 150,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

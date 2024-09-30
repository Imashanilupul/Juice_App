import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColor;
import 'package:juice_app/User_pages/user_sign_up.dart' as signUpPage;

class SignIn extends StatelessWidget {
  SignIn({super.key});

  //Text editing controllers
  final emailController = TextEditingController();

  final passwdController = TextEditingController();

  // show snakbar
  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Sign user in method
  void signUserIn(BuildContext context) async {
    if (emailController.text.isEmpty || passwdController.text.isEmpty) {
      showSnackBar(context, "Email and password fields cannot be empty.");
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwdController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      }
    }
  }

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
                      controller: emailController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 32,
                          ),
                          labelText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 17),

                    //password field
                    TextFormField(
                      controller: passwdController,
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
                  onPressed: () => signUserIn(context),
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

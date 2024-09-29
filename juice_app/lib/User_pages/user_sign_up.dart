import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColor;
import 'package:juice_app/common_screens/sign_in.dart' as signinScreen;

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);

  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
// Phone number validation
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => signinScreen.SignIn())),
          icon: Icon(
            Icons.arrow_back,
            color: appColor.buttons_col,
            size: 32,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Sign Up",
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
                const Text("Connect with coffee.."),
                Container(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                child: Column(
                  children: [
                    //Name Field
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle_rounded,
                          size: 32,
                        ),
                        labelText: "Full Name",
                      ),
                      validator: (name) {
                        if (name == null || name.isEmpty) {
                          return "Enter your name";
                        }
                      },
                    ),
                    SizedBox(height: 17),

                    //email field
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          size: 32,
                        ),
                        labelText: "Email",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 17),

                    //Telephone number field
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            size: 32,
                          ),
                          labelText: "Contact Number"),
                      validator: validatePhoneNumber,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 17),
                    //Address field
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            size: 32,
                          ),
                          labelText: "Adddress"),
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
                    //confirm password field
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_open_rounded,
                          size: 32,
                        ),
                        labelText: "Confirm Password",
                      ),
                      obscureText: true,
                    ),
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
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Already have an account ? "),
                    InkWell(
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: Color.fromARGB(255, 54, 0, 248),
                            fontSize: 17),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signinScreen.SignIn()));
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

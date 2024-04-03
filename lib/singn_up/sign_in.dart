import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_api/auth_service.dart';
import 'package:phone_api/pages/bottomNavBar.dart';
import 'package:phone_api/pages/category.dart';
import 'package:phone_api/singn_up/sign_up(reg).dart';

class SignInPage extends StatefulWidget {
  static const String id = 'sign_in';

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibilty = true;

  _doSignIn() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty && password.length >= 6) {
      AuthService.signInUser(email, password).then((user) {
        Navigator.pushReplacementNamed(context, BottomNavBar.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/signin.jpeg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: EdgeInsets.all(35),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 130),
                  Text(
                    'Welcome there',
                    style: TextStyle(
                        fontSize: 42,
                        fontFamily: ('homePage'),
                        color: Color(0xFFF2E4D7)),
                  ),
                  SizedBox(height: 50),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20,
                                  offset: (Offset(20, 20)))
                            ],
                          ),
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_sharp),
                              border: InputBorder.none,
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20,
                                  offset: (Offset(20, 20)))
                            ],
                          ),
                          child: TextField(
                            controller: passwordController,
                            obscureText: passwordVisibilty,
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordVisibilty = !passwordVisibilty;
                                    });
                                  },
                                  icon: passwordVisibilty
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            _doSignIn();
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color(0xFF495867),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                                child: Text(
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 21, color: Colors.white70),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color(0xFF582dcf),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                                child: Text(
                              "Sign in with Twitter",
                              style: TextStyle(
                                  fontSize: 21, color: Colors.white70),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color(0xFF2da1cf),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                                child: Text(
                              "Sign in with Facebook",
                              style: TextStyle(
                                  fontSize: 21, color: Colors.white70),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(fontSize: 15),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, SignUpPage.id);
                                  },
                                  child: Text('Sign Up Now',
                                      style: TextStyle(fontSize: 15)))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}

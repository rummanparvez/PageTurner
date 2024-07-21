import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import

import '../../controller/helper_classes/firebase_auth_helper.dart'; // Adjust paths as needed
import '../../models/resources.dart'; // Adjust paths as needed

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailControllerLog = TextEditingController();
  TextEditingController passwordControllerLog = TextEditingController();
  GlobalKey<FormState> logInKey = GlobalKey<FormState>();
  bool logViewPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Please,',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                          const Text(
                            'Log In Here to Continue...',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Center(
                            child: Image.asset(
                              'assets/images/stocks/4.png',
                              scale: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(-1, -2),
                          blurRadius: 15)
                    ],
                    color: Colors.lightBlueAccent,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(70),
                    ),
                  ),
                  child: Form(
                    key: logInKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade500,
                                    offset: const Offset(1, 2),
                                    blurRadius: 10,
                                  )
                                ],
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hoverColor: Colors.grey,
                                  isDense: true,
                                  isCollapsed: true,
                                  hintText: 'User email',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold),
                                  contentPadding: const EdgeInsets.all(25),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Icon(
                                      Icons.email_rounded,
                                      size: 25,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  fillColor: Colors.grey.shade50,
                                  focusColor: Colors.grey.shade50,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide:
                                    const BorderSide(color: Colors.white),
                                  ),
                                ),
                                controller: emailControllerLog,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Please enter your Email...';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade500,
                                    offset: const Offset(1, 2),
                                    blurRadius: 10,
                                  )
                                ],
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold),
                                  contentPadding: const EdgeInsets.all(25),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Icon(
                                      Icons.password,
                                      size: 25,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  fillColor: Colors.grey.shade50,
                                  focusColor: Colors.grey.shade50,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide:
                                    const BorderSide(color: Colors.white),
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        logViewPassword = !logViewPassword;
                                      });
                                    },
                                    child: Icon(
                                      logViewPassword
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.remove_red_eye,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                obscuringCharacter: '*',
                                obscureText: logViewPassword,
                                controller: passwordControllerLog,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Please enter your password...';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all(
                                  Colors.black,
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.black,
                                ),
                              ),
                              onPressed: () async {
                                if (logInKey.currentState!.validate()) {
                                  logInKey.currentState!.save();
                                  Map<String, dynamic> res =
                                  await FirebaseAuthHelper.firebaseAuthHelper
                                      .logInWithEmailAndPassword(
                                      email: emailControllerLog.text,
                                      password:
                                      passwordControllerLog.text);
                                  if (res['error'] != null) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          '${res['error']}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (res['user'] != null) {
                                    // Navigate to home screen on successful login
                                    Navigator.pushReplacementNamed(
                                        context, 'homePage'); // Replace '/home' with your actual home screen route
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          'Unsuccessful operation',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

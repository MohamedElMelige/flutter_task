import 'package:flutter/material.dart';

import '../shared/componants/default_form_field.dart';
import 'home_server.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var emailController = TextEditingController();

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key:signInFormKey ,
          child: Column(
            children: [
              Image.asset(
                'assets/images/splash screen.png',
                height: 200,
                width: 200,),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Please enter your email and password to log in',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                controller: emailController,
                value: 'Email',
                icon:  Icons.email,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                controller: passwordController,
                value: 'Password',
                icon:  Icons.lock,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  print(emailController.text);
                  print(passwordController.text);
                  if (emailController.text == 'user' &&
                      passwordController.text == 'password') {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const HomeLayout(),
                    ),);
                  } else {
                    print('Wrong');
                  }
                },
                child: const Text('Log In'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

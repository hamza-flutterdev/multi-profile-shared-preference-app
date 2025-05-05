import 'package:flutter/material.dart';
import 'package:multi_profile/screens/home_screen.dart';
import 'package:multi_profile/widgets/my_button.dart';
import 'package:multi_profile/widgets/my_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(hintText: 'Email', controller: emailController),
          MyTextField(hintText: 'Password ', controller: passwordController),
          MyButton(
            title: 'Login',
            onTap: () async {
              final SharedPreferences pref =
                  await SharedPreferences.getInstance();
              pref.setString('email', 'xyz@gmail.com');
              pref.setString('password', '12345678');

              print(pref.getString('email'));
              print(pref.getString('password'));
            },
          ),
        ],
      ),
    );
  }
}

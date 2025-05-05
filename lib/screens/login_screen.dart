import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  final String? email = dotenv.env['EMAIL'];
  final String? password = dotenv.env['PASSWORD'];
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
          MyTextField(
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          MyTextField(
            hintText: 'Password ',
            controller: passwordController,
            keyboardType: TextInputType.text,
          ),
          MyButton(
            title: 'Login',
            onTap: () {
              _login();
              if (emailController.text.trim() == email &&
                  passwordController.text == password) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Entered credentials are incorrect"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email!);
    pref.setString('password', password!);
  }
}

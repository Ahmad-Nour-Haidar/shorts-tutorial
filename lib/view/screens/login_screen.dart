import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shorts_tutorial/view/screens/signup_screen.dart';
import '../../core/navigation/navigator.dart';
import '../widgets/custom_text_form_field.dart';

const color = Color(0xffFF6F02);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isSelectRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              hintText: 'Email',
              controller: emailController,
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value != null && value.isNotEmpty && value.contains('@')) {
                  return null;
                }
                return 'Email is not valid';
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: Icons.key,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value != null && value.length >= 6) {
                  return null;
                }
                return 'Password is not strong';
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              checkColor: Colors.white,
              activeColor: isSelectRememberMe ? color : Colors.white,
              title: Text(
                'Remember Me',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: isSelectRememberMe ? color : Colors.black,
                ),
              ),
              value: isSelectRememberMe,
              onChanged: (value) {
                setState(() {
                  isSelectRememberMe = value ?? false;
                });
              },
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width - 80,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  navigatorAndFinish(context, const SignupScreen());
                },
                child: const Text(
                  'Don\'t have an account? Signup Now',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // CustomCard(
            //   onPressed: () {
            //     print('onPressed');
            //   },
            //   restaurantName: 'Name',
            //   partnerName: 'Partner\'s name',
            //   age: 10,
            // ),
            // const SizedBox(height: 24),
            // CustomCard(
            //   onPressed: () {
            //     print('onPressed');
            //   },
            //   restaurantName: 'Name',
            //   partnerName: 'Partner\'s name',
            //   age: 10,
            // ),
          ],
        ),
      ),
    );
  }
}

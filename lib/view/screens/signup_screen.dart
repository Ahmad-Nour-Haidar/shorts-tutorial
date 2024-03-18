import 'package:flutter/material.dart';
import 'package:shorts_tutorial/core/navigation/navigator.dart';
import 'package:shorts_tutorial/view/screens/login_screen.dart';
import 'package:shorts_tutorial/view/widgets/custom_menu.dart';
import '../widgets/custom_text_form_field.dart';

const color = Color(0xffFF6F02);

String? email, password;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reenterPasswordController = TextEditingController();
  String? gender, country, city;
  bool isAccept = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Signup',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/empty-image.jpg',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Name',
              controller: nameController,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value != null && value.length > 2) {
                  return null;
                }
                return 'Name is too short';
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Age',
              controller: ageController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  final age = int.tryParse(value);
                  if (age != null && age > 1 && age <= 120) {
                    return null;
                  }
                  return 'Age not correct';
                }
                return 'Age not correct';
              },
            ),
            const SizedBox(height: 16),
            CustomMenu(
              title: gender ?? 'Gender',
              items: const [
                PopupMenuItemModel(title: 'Male', value: 'Male'),
                PopupMenuItemModel(title: 'Female', value: 'Female'),
              ],
              onChange: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomMenu(
              title: country ?? 'Country',
              items: const [
                PopupMenuItemModel(title: 'Syria', value: 'Syria'),
                PopupMenuItemModel(title: 'Sweden', value: 'Sweden'),
                PopupMenuItemModel(title: 'Germany', value: 'Germany'),
              ],
              onChange: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomMenu(
              title: city ?? 'City',
              items: const [
                PopupMenuItemModel(title: 'Stockholm', value: 'Stockholm'),
                PopupMenuItemModel(title: 'Gothenburg', value: 'Gothenburg'),
                PopupMenuItemModel(title: 'Malmö', value: 'Malmö'),
              ],
              onChange: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Phone number',
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value != null && value.length == 10) {
                  return null;
                }
                return 'Phone number is not valid';
              },
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Reenter password',
              isPassword: true,
              controller: reenterPasswordController,
              icon: Icons.key,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value != null &&
                    value.length >= 6 &&
                    passwordController.text == reenterPasswordController.text) {
                  return null;
                }
                return 'Password is not strong';
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              checkColor: Colors.white,
              activeColor: isAccept ? color : Colors.white,
              title: Text(
                'Accept the Term & Services',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: isAccept ? color : Colors.black,
                ),
              ),
              value: isAccept,
              onChanged: (value) {
                setState(() {
                  isAccept = value ?? false;
                });
              },
            ),
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
                  onPressed: () {
                    email = emailController.text;
                    password = passwordController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          'Success',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                    navigatorAndFinish(context, const LoginScreen());
                  },
                  child: const Text(
                    'Signup',
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
            const SizedBox(height: 32),
            const Divider(color: Colors.grey, endIndent: 40),
            Row(
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    navigatorAndFinish(context, const LoginScreen());
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: color,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shorts_tutorial/view/widgets/custom_menu.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_text_form_field.dart';

const color = Color(0xffFF6F02);

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
    return Scaffold(
      appBar: AppBar(
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
              if (value != null && value.isNotEmpty && value.length < 3) {
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
          CustomTextFormField(
            hintText: 'Phone number',
            controller: phoneNumberController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value != null && value.isNotEmpty && value.contains('@')) {
                return null;
              }
              return 'Email is not valid';
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
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _login(BuildContext context) {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      _formKey.currentState?.save();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const InterestsScreen()),
          (route) => false);
    }
  }

  void _setFormData({required String key, String? value}) {
    if (value != null) {
      formData[key] = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
                onSaved: (value) => _setFormData(key: "email", value: value),
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(hintText: "Password"),
                onSaved: (value) => _setFormData(key: "password", value: value),
              ),
              Gaps.v28,
              FormButton(disabled: false, text: "Log in", onTap: _login)
            ],
          ),
        ),
      ),
    );
  }
}

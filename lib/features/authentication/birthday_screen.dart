import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  final initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  void _onDateChanged(DateTime value) {
    _setTextFieldDate(value);
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;

    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _onNextTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "When's your birthday?",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "Your birthday won't be shown\npublicly.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const FaIcon(
                  FontAwesomeIcons.cakeCandles,
                  size: Sizes.size60,
                )
              ],
            ),
            Gaps.v32,
            TextField(
              enabled: false,
              controller: _birthdayController,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey.shade400),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v32,
            FormButton(
              disabled: false,
              text: "Next",
              onTap: _onNextTap,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 300,
        child: CupertinoDatePicker(
          initialDateTime: initialDate,
          maximumDate: initialDate,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: _onDateChanged,
        ),
      ),
    );
  }
}

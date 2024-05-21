import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:weather_flutter/app_view.dart';

import 'package:weather_flutter/core/components/custom/weather_scaffold.dart';

class PinPutView extends StatefulWidget {
  const PinPutView({super.key, required this.verificationId});
  final String verificationId;
  @override
  State<PinPutView> createState() => _PinPutViewState();
}

class _PinPutViewState extends State<PinPutView> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WeatherScaffold(
      bottomSafe: false,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3,
          ),
          const Text(
            "Verify OTP",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "The code has been sent to the phone number",
          ),
          const SizedBox(
            height: 20,
          ),
          _buildPinput(),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Resend Code"),
          )
        ],
      ),
    );
  }

  Widget _buildPinput() {
    const length = 6;
    final itemWidth = MediaQuery.sizeOf(context).width / 9;
    final itemHeight = itemWidth * 1.3;

    final defaultPinTheme = PinTheme(
      width: itemWidth,
      height: itemHeight,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).primaryColorLight,
          width: 1.5,
        ),
      ),
    );

    return Center(
      child: Pinput(
        length: length,
        controller: pinController,
        // focusNode: _controller.focusNode,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(.08),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).primaryColorDark,
              width: 1.5,
            ),
          ),
        ),
        autofocus: false,
        showCursor: false,
        closeKeyboardWhenCompleted: false,
        onCompleted: (pin) async {
          await hideKeyboard(context);

          try {
            final cre = PhoneAuthProvider.credential(
                verificationId: widget.verificationId,
                smsCode: pinController.text);
            await FirebaseAuth.instance.signInWithCredential(cre);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AppView(),
              ),
            );
          } catch (e) {
            print(e.toString());
          }

          print("ok");
        },
        onChanged: (pin) {},
        onSubmitted: (pin) async {
          await hideKeyboard(context);
        },
      ),
    );
  }

  Future hideKeyboard(BuildContext context) async {
    FocusScope.of(context).unfocus();
  }
}

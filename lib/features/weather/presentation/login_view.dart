import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter/core/components/custom/weather_scaffold.dart';
import 'package:weather_flutter/features/weather/presentation/pinput_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WeatherScaffold(
      bottomSafe: false,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    "assets/icon/clear-sky.png",
                    width: 50,
                    height: 50,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _controller,
                      decoration: const InputDecoration(
                        label: Text("Input your's phone"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         const PinPutView(verificationId: ""),
                        //   ),
                        // );

                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: "+84${_controller.text}",
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {
                            print(e.toString());
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PinPutView(verificationId: verificationId),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      },
                      child: const Text("Submit"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

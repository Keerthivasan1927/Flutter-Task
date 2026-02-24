import 'package:flutter/material.dart';
import 'package:my_sample_app/controllers/login_controller.dart';
import 'package:my_sample_app/screens/home_screen.dart';
import 'package:my_sample_app/utils/buttons.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logProvider = context.watch<LoginController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Login Screen'),
          centerTitle: true,

          backgroundColor: Colors.white,
        ),
        body: Column(
          spacing: 20,
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            Buttons(
              title: 'Email',
              keypadtype: TextInputType.emailAddress,
              onChage: logProvider.updateEmail,
            ),
            Buttons(
              title: 'Password',
              keypadtype: TextInputType.visiblePassword,
              onChage: logProvider.updatePassword,
            ),
            Center(
              child: ElevatedButton(
                onPressed: logProvider.isValid
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: logProvider.isValid
                      ? Colors.blue
                      : Colors.grey,
                ),
                child: Text('Login ', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

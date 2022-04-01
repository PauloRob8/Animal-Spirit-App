import 'package:flutter/material.dart';

class LogoTextWidget extends StatelessWidget {
  const LogoTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Animal',
              style: TextStyle(
                color: Colors.green,
                fontSize: 24.0,
              ),
            ),
            TextSpan(
              text: ' Spirit',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      );
}

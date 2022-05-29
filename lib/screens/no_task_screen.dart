import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoTaskScreen extends StatelessWidget {
  const NoTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text('No timers active.\nPress here to start a new one'),
            const SizedBox(width: 30),
            SvgPicture.asset(
              'assets/icons/arrow.svg',
              height: 100,
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}

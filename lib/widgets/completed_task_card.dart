import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompletedTaskCard extends StatelessWidget {
  const CompletedTaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.67,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Theme.of(context).canvasColor,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/sound_wave.svg',
                          width: 24,
                        ),
                        Text(
                          'FINISHED',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/sound_wave.svg',
                          width: 24,
                        ),
                      ],
                    ),
                    const SizedBox(height: 11),
                    Text(
                      'Egg boiling',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'Need to take out the egg from the boiler when this timer ends',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('MARK COMPLETE'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

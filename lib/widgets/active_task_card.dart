import 'package:flutter/material.dart';

class ActiveTaskCard extends StatelessWidget {
  const ActiveTaskCard({Key? key}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '00:00:00',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(width: 8),
                  _buildIconButtonContainer(Icons.play_arrow),
                  const SizedBox(width: 8),
                  _buildIconButtonContainer(Icons.stop),
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
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButtonContainer(IconData icon) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xFF5B5B7D),
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}

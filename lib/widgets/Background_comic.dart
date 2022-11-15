
import 'package:flutter/material.dart';
import '../themes/theme.dart';

class BackgroundComic extends StatelessWidget {

  final Widget child;
  const BackgroundComic({
    super.key, 
    required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      /* color: Colors.amberAccent, */
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/space.png'),
          fit:  BoxFit.cover
          )
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [             
          child,
          ],
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';
import '../themes/theme.dart';

class BackgroundFavorite extends StatelessWidget {

  final Widget child;
  const BackgroundFavorite({
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
            const _SpaceBackground(),           
          child,
          ],
        ),
      ),
    );
  }
}


class _SpaceBackground extends StatelessWidget {
  const _SpaceBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox( height: 50,),
          Container(
            color: Color.fromARGB(100, 245, 244, 244),
            width: double.infinity,
            height: size.height,
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

import '../themes/theme.dart';


class Background extends StatelessWidget {

  final Widget child;

  const Background({
    super.key, 
    required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      /* color: Colors.amberAccent, */
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _RexBox(),
          _IconPerson(),
          child,
        ],
      ),
    );
  }
}

class _IconPerson extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only( top: 80),
        child: Icon( Icons.person_pin, color: Colors.white,size: 100,),
      ),
    );
  }
}

class _RexBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: _RedDecoration(),
      child: Stack(
        children: [
          Positioned(top: 80, left: 20, child: _Marco()),
          Positioned(bottom: 20, left: 20, child: _Marco()),
          Positioned(top: 80, left: 20, child: _MarcoVertical()),
          Positioned(top: 80, right: 20, child: _MarcoVertical()),
        ],
      ),
    );
  }

BoxDecoration _RedDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
      ColorsApp.red,
      ColorsApp.gremory      
      ],
      stops: [ 0.5, 1]
      )
  );
}

class _Marco extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    var size =  MediaQuery.of(context).size;
    return Container(
      width: size.width-40,
      height: 5,
      color: Colors.white,     
    );
  }
}

class _MarcoVertical extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    var size =  MediaQuery.of(context).size;
    return Container(
      width: 5,
      height: size.height-100,
      color: Colors.white,     
    );
  }
}
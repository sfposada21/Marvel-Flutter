import 'package:flutter/material.dart';


class CardContainer extends StatelessWidget {

  final Widget child;

  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 40.0, vertical: 10),
      child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: _createCardShape(),
                  child: child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
       BoxShadow(
        color: Colors.black12,
        blurRadius: 20,
        offset: Offset(0, 10)
      )
    ]

  );
}
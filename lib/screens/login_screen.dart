import 'package:flutter/material.dart';

import '../themes/theme.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
          child: Column(
            children:  [
             const SizedBox( height: 200,),
              CardContainer( 
                child: Column(
                  children: const [
                     Text('Login', style: TextStyle( fontSize: 28, color: Color.fromARGB(255, 90, 41, 48)  ),), 
                  ]
                  ))
            ]
            )),
    );
  }
}

class FormEmail extends StatelessWidget {
  const FormEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,           
            onChanged: (value) => {},
           
          ),
          const SizedBox( height: 30,),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,            
            onChanged: ( value ) => {},                  
        ),
        ],
      ),
    );
  }
}

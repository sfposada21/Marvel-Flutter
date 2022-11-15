import 'package:flutter/material.dart';
import 'package:marvel_app/models/models.dart';
import 'package:marvel_app/widgets/Background_home.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final comic = Provider.of<ComicsService>( context);

    return  Scaffold(
      appBar: AppBar(
        title: const  Text( 'Comics marvel'),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.favorite)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.login_outlined)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.home))
        ],
      ),
      body: BackgroundHome(
        child: Text('Hola Mundo'),
    
    
     ),
   );
  }
}
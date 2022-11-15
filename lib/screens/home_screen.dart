import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../widgets/comicsSlider.dart';
import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final comic = Provider.of<ComicsService>( context);

    return  Scaffold(
      appBar: AppBar(
        title: const  Text( 'Comics marvel'),
        actions: [
          IconButton(onPressed: ()=> Navigator.pushReplacementNamed(context, 'favorite'), icon: const Icon(Icons.favorite)),
          IconButton(onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'), icon: const Icon(Icons.login_outlined)),
          IconButton(onPressed: ()=> Navigator.pushReplacementNamed(context, 'home'), icon: const Icon(Icons.home))
        ],
      ),
      body: BackgroundHome(
        child: Column(
          children: [
            const SizedBox( height: 60,),
            const Center(child: Text('El Universo Marvel', 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 28,
                fontWeight: FontWeight.bold),)),
            const SizedBox( height: 80,),
            ComicsSlider( onNextPage: ()=> comic.moreLoadComics() )

          ],
        ),   
     ),
   );
  }
}

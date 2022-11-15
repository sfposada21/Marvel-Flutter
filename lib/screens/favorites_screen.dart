import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../services/comics_Services.dart';
import '../widgets/widgets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final comic = Provider.of<ComicsService>( context);
    
    var textStyle = const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comics marvel'),
        actions: [
          IconButton(onPressed: ()=> Navigator.pushReplacementNamed(context, 'favorite'), icon: const Icon(Icons.favorite)),
          IconButton(onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'), icon: const Icon(Icons.login_outlined)),
          IconButton(onPressed: ()=> Navigator.pushReplacementNamed(context, 'home'), icon: const Icon(Icons.home))
        ],
      ),
      body: BackgroundFavorite(
        child: Column(
          children: [
            const SizedBox( height: 10,  ),
            Center( child: Text( "Favoritos",  style: textStyle, )),            
            const SizedBox( height: 30,),
            const ComicsSliderVertical()
            
          ],
        ),
      ),
    );
  }
}

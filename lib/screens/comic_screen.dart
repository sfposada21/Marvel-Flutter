import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ComicScreen extends StatelessWidget {
  const ComicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ComicMarvel comic =
        ModalRoute.of(context)!.settings.arguments as ComicMarvel;

    var textStyle = const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comics marvel'),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.login_outlined)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.home))
        ],
      ),
      body: BackgroundComic(
        child: Column(
          children: [
            const SizedBox( height: 10,  ),
            Center( child: Text( comic.title ?? "No Found",  style: textStyle, )),
            const SizedBox( height: 10,  ),
            _PosterAndTitle(comic: comic),
          ],
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final ComicMarvel comic;
  const _PosterAndTitle({required this.comic});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    var textStyle1 = const TextStyle( color: Colors.white,
                      fontSize: 22);
    var textStyle2 = const TextStyle( color: Colors.white,
                      fontSize: 18);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [  
              Hero(
                tag: comic.id!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      width: 200,
                      height: 240,
                      child: getImage(comic.thumbnail.path)),
                ),
              ),
              const SizedBox(height: 20),            
              Text( "Fecha : "+ comic.modified,
                  style: textStyle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
             
            ],
          ),     
    );
  }

    Widget getImage(String? picture) {
      if (picture!.contains('image_not_available')) {
        return const Image(
          image: AssetImage('assets/marvel.jpg'),
          fit: BoxFit.cover,
        );
      } else {
        return FadeInImage(
          image: NetworkImage('$picture.jpg'),
          placeholder: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
        );
      }
    }
}

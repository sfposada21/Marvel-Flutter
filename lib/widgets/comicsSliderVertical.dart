
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/comic_model.dart';
import '../services/services.dart';

  
class ComicsSliderVertical extends StatelessWidget {

  const ComicsSliderVertical({super.key});

  @override
  Widget build(BuildContext context) {
    
    final marvel = Provider.of<ComicsService>(context);

    return Container(
      width: 400,
      height: 700, 
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: marvel.listComics.length,
                itemBuilder: (_, int index) => _portadaComic(comic: marvel.listComics[index],)                
                    ),
          ),
        ],
      ),      
    );
  }
}

class _portadaComic extends StatelessWidget {
  
  final ComicMarvel comic;

  const _portadaComic({
    Key? key, required this.comic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240, 
      margin: EdgeInsets.symmetric( horizontal: 10 ),
      child: GestureDetector(
         onTap: () => Navigator.pushNamed(context, 'comic', arguments: comic ),
        child: Column(
          children: [
            Hero(
              tag: comic.id!,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 190, 
                    child: getImage( comic.thumbnail.path )),
                ),
            ),
            const SizedBox( height: 10 ),
            Text( 
              comic.title ?? "No Found",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

    Widget getImage( String? picture ) {
    if ( picture!.contains('image_not_available')) {
      return const Image(
          image: AssetImage('assets/marvel.jpg'),
          fit: BoxFit.cover,
        );
    } else {
        return FadeInImage(
          image: NetworkImage( '$picture.jpg' ),
          placeholder: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
        );
    }   
  }

}
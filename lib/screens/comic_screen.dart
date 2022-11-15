import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ComicScreen extends StatelessWidget {
  const ComicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ComicMarvel comic =
        ModalRoute.of(context)!.settings.arguments as ComicMarvel;

    final size = MediaQuery.of(context).size;

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
      body: BackgroundComic(
        child: Column(
          children: [
            const SizedBox( height: 10,  ),
            Container(
              width: size.width *0.8,
              child: Center( child: Text( comic.title ?? "No Found",  style: textStyle, ))),
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
              _rowsDetails(nameRow: 'Titulo: ', valueRow: comic.title!,),
              const SizedBox(height: 20),            
              _rowsDetails(nameRow: 'Paginas del comic: ', valueRow: comic.pageCount.toString(),),
              const SizedBox(height: 20),            
              _rowsDetails(nameRow: 'Fecha de modificacion: ', valueRow: comic.modified,),
              const SizedBox(height: 20),            
              _rowsDetails(nameRow: 'Enlace de mompra: ', valueRow: comic.urls[0].url ?? " No-Found",),
              const SizedBox(height: 20),            
              _rowsDetails(nameRow: 'descripcion: ', valueRow: comic.description.toString() == "" ? comic.description! : "Browse and purchase Marvel digital & print comics. Subscribe to Marvel Unlimited to access thousands of digital comics for one low price!",),
             
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

class _rowsDetails extends StatelessWidget {

  final String nameRow;
  final String valueRow;

  const _rowsDetails({
    Key? key,
    required this.nameRow,    
    required this.valueRow,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var textStyle1 = const TextStyle( color: Colors.white,
                      fontSize: 18);
    var textStyle2 = const TextStyle( color: Colors.white,
                      fontSize: 16);
    return SingleChildScrollView(
      child: Row(
        children: [
          Container(
            width: size.width *0.4,   
            child: Text( nameRow ,
                style: textStyle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 3),
          ),
          Container(
            width: size.width *0.5,   
            child: Text( valueRow,
                style: textStyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 3),
          ),
        ],
      ),
    );
  }
}

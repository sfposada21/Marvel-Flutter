import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/models.dart';

class ComicsService extends ChangeNotifier{

  final String _baseUrl = 'gateway.marvel.com';  
  final String _ts = '1';    
  final String _apikey = '1b06f7f035ecfa56b80d5bd48e202232';  
  final String _hash = '2a0e66d40c2410277438e05c76c35d34';         
  final int _limit = 20; 
  int _offset = 0; 

   List<ComicMarvel> listComics = [];
   List<ComicMarvel> listComicsTemp = [];
 
  // fetch de comics
ComicsService(){
    loadComics();
    
  }

  Future loadComics() async{
     final url = Uri.https( _baseUrl, '/v1/public/comics', {
      "ts" : _ts,
      "apikey" : _apikey,
      "hash" : _hash,     
      "limit" : '$_limit', 
     }
    );

    final resp = await http.get(url);
    final respData = json.decode(resp.body);
    for (var comic in respData['data']['results']) {
      ComicMarvel dato = ComicMarvel.fromJson(comic);
      listComics.add(dato);
    }
    print('Entro 2');
    print(listComics);
    notifyListeners();
  }

  Future moreLoadComics() async{
    print('Entro 2');

    final url = Uri.https( _baseUrl, '/v1/public/comics', {
      "ts" : _ts,
      "apikey" : _apikey,
      "hash" : _hash, 
      "offset" : '$_offset', 
      "limit" : '$_limit', 
    });
    _offset += 20;

    final resp = await http.get(url);
    final respData = json.decode(resp.body);
    for (var comic in respData['data']['results']) {
      ComicMarvel dato = ComicMarvel.fromJson(comic);
      listComicsTemp.add(dato);
    }
    listComics = [ ...listComics, ...listComicsTemp ];
    notifyListeners();
  }


}
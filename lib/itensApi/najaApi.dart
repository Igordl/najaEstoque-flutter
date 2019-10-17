import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Api {
  Future<List> loadItens(int category) async {
    String selection = '';
    String url =
        "'https://najapp.herokuapp.com/products/search?category=$selection";
    if (category == 0)
      selection = 'eletrodomestico';
    else if (category == 1)
      selection = 'tv';
    else if (category == 2)
      selection = 'celular';
    else
      selection = 'videogame';
    try {
      http.Response response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJuYWphIiwic3ViIjoiNWQ5MjY0MmZjOWRhMTA1MDA0NmQ2YWZlIiwiaWF0IjoxNTcxMDgzNzg1NzM2LCJleHAiOjE1NzExNzAxODU3MzZ9.8AQMtS_GDb9PNUhRFoppVnxxeTKXO9mx7HonrdJ0juY"
      });
      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (_) {
      return null;
    }
  }

  Future removeItem(String id) async {
    String url = "https://api-naja.herokuapp.com/product?id=$id";
    try {
      await http.delete(url, headers: {
        HttpHeaders.authorizationHeader:
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJuYWphIiwic3ViIjoiNWQ5MjY0MmZjOWRhMTA1MDA0NmQ2YWZlIiwiaWF0IjoxNTcxMDgzNzg1NzM2LCJleHAiOjE1NzExNzAxODU3MzZ9.8AQMtS_GDb9PNUhRFoppVnxxeTKXO9mx7HonrdJ0juY"
      });
    } on Exception catch (_) {
      return null;
    }
  }

  Future cadastrarItem(String name, String price, String quantity,
      String category, String image) async {
    String url = 'https://api-naja.herokuapp.com/product';
    String token =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJuYWphIiwic3ViIjoiNWQ5MjY0MmZjOWRhMTA1MDA0NmQ2YWZlIiwiaWF0IjoxNTcxMDgzNzg1NzM2LCJleHAiOjE1NzExNzAxODU3MzZ9.8AQMtS_GDb9PNUhRFoppVnxxeTKXO9mx7HonrdJ0juY';
    Map product = {
      "name": name,
      "price": price,
      "quantity": quantity,
      "category": category,
      "image": image
    };
    var body = json.encode(product);
    await http.post(url, body: body, headers: {
      HttpHeaders.authorizationHeader: token,
      "Content-Type": "application/json",
    });
  }
}

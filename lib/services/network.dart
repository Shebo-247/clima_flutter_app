import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper{

  final String url;

  NetworkHelper(this.url);

  Future<dynamic> getData() async{

    http.Response response = await http.get(url);

    if (response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else{
      return response.statusCode;
    }

  }

}
import 'dart:convert';

import 'package:entre/model/Listing_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String url = "https://ostweg.github.io/VolunteerConnect.json";
  
  Future<List<ListingModel>> getJsonData() async {
    http.Response res = await http.get(Uri.parse(url));

    try {
      if(res.statusCode==200){
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => ListingModel.fromJson(e)).toList();
      }else {
        return <ListingModel>[];
      }
    }catch(e){
      print(e);
      return <ListingModel>[];
    }
}
}
import 'dart:convert';

import 'package:http/http.dart' as http;

class DataServices {
  String url = "https://ostweg.github.io/VolunteerConnect.json";
  
  getJsonData() async {
    http.Response res = await http.get(Uri.parse(url));

    try {
      if(res.statusCode==200){
        List<dynamic> list = json.decode(res.body);
      }
    }catch(e){
      print(e);
    }
}
}
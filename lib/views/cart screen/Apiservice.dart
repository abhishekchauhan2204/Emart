
import 'package:http/http.dart' as http;


import 'cart model.dart';

var baseres = "https://dummyjson.com";

getdata() async {
  Uri url = Uri.parse("$baseres/carts");
  var res = await http.get(url);

  try {
    if (res.statusCode == 200) {
      var data = cartmodelFromJson(res.body);
      return data.carts;
    } else {
      print("error in connection");
    }
  } catch (e) {
    print(e.toString());
  }
}



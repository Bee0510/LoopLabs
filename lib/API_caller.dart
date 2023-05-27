import 'dart:convert';
import 'package:http/http.dart' as http;

class API_Caller {
  Future getPost() async {
    final Response = await http.get(
        Uri.parse('https://internship-service.onrender.com/videos?page=9'));
    var data = jsonDecode(Response.body);

    if (Response.statusCode == 200) {
      return data;
    } else {
      print(Response.statusCode);
      return 0;
    }
  }
}

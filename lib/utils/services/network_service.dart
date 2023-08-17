import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class Network {
  static Future<String> apiRequest(String url, Map jsonMap) async {
    HttpClient httpClient = HttpClient();
    try {
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/x-www-form-urlencoded');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();

      // todo - you should check the response.statusCode
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      return reply;
    } catch (exe) {
      return "dadas";
    }
  }

  static Future<Map<String, dynamic>> sendData(
      http.Client http, String url, Object data) async {
    // data = {
    //   "first_name": "Balu",
    //   "surname": "Matta",
    //   "email": "balasubramanyam@zignite.io",
    //   "phone": "+16812491315",
    //   "message": "sdasdasdasdasdasdasdasd"
    // };

    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"has_error": true, "error_message": "Something went wrong"};
      }
    } catch (exe) {
      return {"has_error": true, "error_message": "Something went wrong"};
    }
  }

  static Future<String> getData(http.Client http, String url) async {
    final response = await http.get(Uri.parse(url),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'});
    if (response.statusCode == 200) {
      return (response.body);
    } else {
      return 'No Data';
    }
  }
}

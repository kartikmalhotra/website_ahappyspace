import 'dart:convert';
import 'package:ahs_website/utils/services/network_service.dart';
import 'package:flutter_test/flutter_test.dart';

// file which has the getNumberTrivia function
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  group('testAPI', () {
    test('test GEO API', () async {
      // Mock the API call to return a json response with http status 200 Ok //
      final mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        final response = {
          "ip": "2405:201:6803:b028:e766:cd2d:967a:5e8e",
          "country_code": "IN",
          "country_name": "India",
          "region_code": "UT",
          "region_name": "Uttarakhand",
          "city": "Dehradun",
          "zip_code": "248001",
          "time_zone": "Asia/Kolkata",
          "latitude": 30.322,
          "longitude": 78.03,
          "metro_code": 0
        };
        return Response(jsonEncode(response), 200);
      });
      // Check whether getNumberTrivia function returns
      // number trivia which will be a String
      expect(
          await Network.getData(mockHTTPClient,
              "https://api.freegeoip.app/json/?apikey=dd8ad7e0-9ec3-11ec-850a-2d1cc811dd49"),
          isA<String>());
    });

    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });
      expect(
        Network.getData(mockHTTPClient,
            "https://api.freegeoip.app/json/?apikey=dd8ad7e0-9ec3-11ec-850a-2d1cc811dd49"),
        isA<Future<String>>(),
      );
    });

    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });
      expect(
        Network.getData(mockHTTPClient,
            "https://api.freegeoip.app/json/?apikey=dd8ad7e0-9ec3-11ec-850a-2d1cc811dd49"),
        isA<Future<String>>(),
      );
    });

    test('Form Submittion', () async {
      // Mock the API call to return a json response with http status 200 Ok //
      final mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        final response = {"has_error": false, "error_message": "Email sent"};
        return Response(jsonEncode(response), 200);
      });

      Map data = {
        "first_name": "name",
        "surname": "surname",
        "email": ".@",
        "phone": "+@323",
        "message": "Sdsd"
      };

      // Check whether getNumberTrivia function returns
      // number trivia which will be a String
      expect(
        Network.sendData(
            mockHTTPClient,
            "https://websiteahappyspacemailer-r3iqxnqupq-el.a.run.app/api/send-mail",
            data),
        isA<Future<Map<String, dynamic>>>(),
      );
    });
  });
}

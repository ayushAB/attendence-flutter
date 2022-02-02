import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  late String baseURL = '';

  Future<http.Response> testApi() {
    return http.get(Uri.parse(baseURL + 'TestRouter'));
  }

  Future<http.Response> login() {
    return http.get(Uri.parse(baseURL + 'TestRouter'));
  }

  Future<http.Response> markAttendence(String title) {
    return http.post(
      Uri.parse(baseURL + "AddAttendance"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "UserId": "9d4324cd-904a-4c62-b2f7-e6e04318f4d3",
        "EmpCode": "12345",
        "DeviceDetails": null,
        "TimeStamp": "2022-01-22T16:06:36.2091355+05:30",
        "IsCheckIn": false,
        "Id": "c839ff69-a5ba-418e-9265-f2685eb71241"
      }),
    );
  }
}

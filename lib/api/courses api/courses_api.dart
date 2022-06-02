import 'dart:convert' as convert;
import 'dart:io';
import 'package:app/api/courses%20api/courses_response.dart';
import 'package:http/http.dart' as http;

class APIResult {
  late dynamic data;
  String error = "";
}

class CourseAPI {
  Future<APIResult> getCoursesAPI() async {
    String url = "https://ieeeswalexsc.herokuapp.com/api/courses";
    late CoursesResponse coursesResponse;
    APIResult result = APIResult();

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        coursesResponse = CoursesResponse.fromJson(jsonResponse);
        result.data = coursesResponse.courses;
      } else {
        // todo handle anothers api status codes

      }
    } on FormatException {
      result.error = "Invalid Data Format";
    } on SocketException {
      result.error = "No Internet Connection";
    } catch (exception) {
      result.error = "Unexpected Error";
    }
    return result;
  }
}

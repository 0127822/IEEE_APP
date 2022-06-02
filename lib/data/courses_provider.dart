import 'package:flutter/material.dart';
import '../api/courses api/courses_api.dart';
import 'course.dart';

enum listScreenState { initial, error, loaded }

class CoursesProvider with ChangeNotifier {
  listScreenState state = listScreenState.initial;
  late List<Course> courseList;
  late APIResult apiResult;
  late String errorMessage;
  getCourses() async {
    // courseList = await CourseAPI().getCoursesAPI();
    apiResult = await CourseAPI().getCoursesAPI();

    if (apiResult.error == "") //No Error Happened
    {
      courseList = apiResult.data;
      state = listScreenState.loaded;
      notifyListeners();
    } else {
      state = listScreenState.error;
      errorMessage = apiResult.error;
      notifyListeners();
    }
  }

  Course findCourseById(int id) {
    return courseList.firstWhere((element) => element.id == id);
  }
}

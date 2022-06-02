import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/course.dart';
import '../data/courses_provider.dart';

class CourseDetailsScreen extends StatelessWidget {
  CourseDetailsScreen({Key? key}) : super(key: key);
  late Course courses;
  static const String routeName = '/courseDetailsScreen';
  @override
  Widget build(BuildContext context) {
    final int courseId = ModalRoute.of(context)!.settings.arguments as int;
    courses = Provider.of<CoursesProvider>(context, listen: false)
        .findCourseById(courseId);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 48,
                ),
                Container(
                  width: 360,
                  height: 86,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Text(
                    "${courses.title}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFBA0C2F),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                // Center(
                //   child: Image(
                //     image: AssetImage('${courses.imageUrl}'),
                //     alignment: Alignment.center,
                //   ),
                // ),
                const SizedBox(
                  height: 23,
                ),
                Container(
                  width: 360,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.only(left: 28),
                  child: const Text(
                    'Description',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFBA0C2F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 296,
                  margin: const EdgeInsets.only(left: 32),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontFamily: 'Poppins'),
                      children: <TextSpan>[
                        TextSpan(
                            text: "${courses.courseDescription}",
                            style: const TextStyle(
                              fontSize: 11,
                              height: 1,
                            )),
                        const TextSpan(
                            text: '\nContent',
                            style: TextStyle(
                                color: Color(0xFFBA0C2F),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 2)),
                        TextSpan(
                            text: "\n${courses.courseContent}",
                            style: const TextStyle(fontSize: 11)),
                        const TextSpan(
                            text: '\nPrerequisites',
                            style: TextStyle(
                                color: Color(0xFFBA0C2F),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 2)),
                        TextSpan(
                            text: "\n${courses.perquisites}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            )),
                        const TextSpan(
                            text: '\nInstructor',
                            style: TextStyle(
                                color: Color(0xFFBA0C2F),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 2)),
                        TextSpan(
                            text: "\n${courses.instructors}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            )),
                        const TextSpan(
                            text: '\nCourse Length',
                            style: TextStyle(
                                color: Color(0xFFBA0C2F),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 2)),
                        TextSpan(
                            text: "\n${courses.courseLength}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            )),
                        const TextSpan(
                            text: '\nFees',
                            style: TextStyle(
                                color: Color(0xFFBA0C2F),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 2)),
                        TextSpan(
                            text: "\n${courses.fees}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'course_detail.dart';
import '../models/courses.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courseList.length,
      itemBuilder: (context, index) {
        final course = courseList[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF2d3e50),
              child: Text(course.title[0], style: const TextStyle(color: Colors.white)),
            ),
            title: Text(course.title),
            subtitle: Text(course.category),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CourseDetailPage(course: course),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

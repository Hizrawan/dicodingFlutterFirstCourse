import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({super.key});

  final List<Map<String, String>> _courses = [
    {
      "title": "Flutter Development",
      "desc": "Belajar membuat aplikasi mobile cross-platform"
    },
    {
      "title": "Laravel Backend",
      "desc": "Membangun REST API dengan Laravel"
    },
    {
      "title": "Data Science",
      "desc": "Dasar-dasar analisis data dan machine learning"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _courses.length,
      itemBuilder: (context, index) {
        final course = _courses[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF2d3e50),
              child: Text(
                course["title"]![0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(course["title"]!),
            subtitle: Text(course["desc"]!),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Buka ${course['title']}")),
              );
            },
          ),
        );
      },
    );
  }
}

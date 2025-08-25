import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, String>> modules = List.generate(
      course.totalModules,
      (index) => {
        "title": "Module ${index + 1}",
        "content": "ini nanti isinya ringkasan dari module ke ${index + 1}",
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
        backgroundColor: const Color(0xFF2d3e50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(course.title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(course.description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 24),
            Text("Progress (${(course.progress * 100).toInt()}%)", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: course.progress,
              backgroundColor: Colors.grey.shade300,
              color: const Color(0xFF2d3e50),
              minHeight: 10,
            ),
            const SizedBox(height: 24),
            const Text("Course Content", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: modules.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final module = modules[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFF2d3e50),
                        child: Text("${index + 1}", style: const TextStyle(color: Colors.white)),
                      ),
                      title: Text(module["title"]!),
                      subtitle: Text(module["content"]!),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Buka ${module['title']}")),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

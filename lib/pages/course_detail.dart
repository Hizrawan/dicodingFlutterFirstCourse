import 'package:flutter/material.dart';
import '../models/courses.dart';
import 'module_detail.dart';

class CourseDetailPage extends StatefulWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
        backgroundColor: const Color(0xFF2d3e50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.course.title,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(widget.course.description,
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 24),
            Text("Progress (${(widget.course.progress * 100).toInt()}%)",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: widget.course.progress,
              backgroundColor: Colors.grey.shade300,
              color: const Color(0xFF2d3e50),
              minHeight: 10,
            ),
            const SizedBox(height: 24),
            const Text("Course Content",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: widget.course.modules.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final module = widget.course.modules[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFF2d3e50),
                        child: Text("${index + 1}",
                            style: const TextStyle(color: Colors.white)),
                      ),
                      title: Text(module.title),
                      subtitle: Text(module.content),
                      trailing: Icon(
                          module.isCompleted
                              ? Icons.check_circle
                              : Icons.arrow_forward_ios,
                          size: 16,
                          color: module.isCompleted
                              ? Colors.green
                              : Colors.grey),
                      onTap: () async {
                        bool completed = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ModuleDetailPage(
                                  moduleTitle: module.title,
                                  content: module.content,
                                  initialCompleted: module.isCompleted,
                                ),
                              ),
                            ) ??
                            module.isCompleted;

                        setState(() {
                          module.isCompleted = completed;
                        });
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

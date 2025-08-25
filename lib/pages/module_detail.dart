import 'package:flutter/material.dart';

class ModuleDetailPage extends StatefulWidget {
  final String moduleTitle;
  final String content;
  final bool initialCompleted;

  const ModuleDetailPage({
    super.key,
    required this.moduleTitle,
    required this.content,
    this.initialCompleted = false,
  });

  @override
  State<ModuleDetailPage> createState() => _ModuleDetailPageState();
}

class _ModuleDetailPageState extends State<ModuleDetailPage> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.initialCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.moduleTitle), backgroundColor: const Color(0xFF2d3e50)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.moduleTitle,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
                child: SingleChildScrollView(
                    child: Text(widget.content, style: const TextStyle(fontSize: 16)))),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isCompleted ? Colors.grey : const Color(0xFF2d3e50),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  setState(() => isCompleted = !isCompleted);
                  Navigator.pop(context, isCompleted);
                },
                child:
                    Text(isCompleted ? "Mark as Incomplete" : "Mark as Complete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

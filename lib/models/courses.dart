class Module {
  String title;
  String content;
  bool isCompleted;

  Module({
    required this.title,
    required this.content,
    this.isCompleted = false,
  });
}

class Course {
  String title;
  String description;
  String category;
  String level;
  List<Module> modules;
  String imageAsset;

  Course({
    required this.title,
    required this.description,
    required this.category,
    required this.level,
    required this.modules,
    required this.imageAsset,
  });

  double get progress {
    if (modules.isEmpty) return 0;
    int completed = modules.where((m) => m.isCompleted).length;
    return completed / modules.length;
  }
}

final List<Course> courseList = [
  Course(
    title: "Flutter Development",
    description: "Belajar membuat aplikasi mobile cross-platform",
    category: "Mobile Development",
    level: "Beginner",
    imageAsset: "",
    modules: List.generate(
      5,
      (i) => Module(
        title: "Module ${i + 1}",
        content: "Ringkasan materi module ${i + 1}",
      ),
    ),
  ),
  Course(
    title: "Laravel Backend",
    description: "Membangun REST API dengan Laravel",
    category: "Backend Development",
    level: "Intermediate",
    imageAsset: "",
    modules: List.generate(
      6,
      (i) => Module(
        title: "Module ${i + 1}",
        content: "Ringkasan materi module ${i + 1}",
      ),
    ),
  ),
];

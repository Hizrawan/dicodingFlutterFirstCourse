class Course {
  String title;
  String description;
  String category;
  String level;
  int totalModules;
  double progress; // 0.0 - 1.0
  String imageAsset;

  Course({
    required this.title,
    required this.description,
    required this.category,
    required this.level,
    this.totalModules = 5,
    this.progress = 0.0,
    required this.imageAsset,
  });
}


final List<Course> courseList = [
  Course(
    title: "Flutter Development",
    description: "Belajar membuat aplikasi mobile cross-platform",
    category: "Mobile Development",
    level: "Beginner",
    totalModules: 5,
    progress: 0.2,
    imageAsset: "",
  ),
  Course(
    title: "Laravel Backend",
    description: "Membangun REST API dengan Laravel",
    category: "Backend Development",
    level: "Intermediate",
    totalModules: 6,
    progress: 0.5,
    imageAsset: "",
  ),
  Course(
    title: "Data Science",
    description: "Dasar-dasar analisis data dan machine learning",
    category: "Data Science",
    level: "Beginner",
    totalModules: 4,
    progress: 0.3,
    imageAsset: "",
  ),
];

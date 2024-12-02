class Category {
  final String name;

  // Constructor
  Category(this.name);

  // Phương thức chuyển từ danh sách JSON thành danh sách Category
  static List<Category> fromJsonList(List<dynamic> json) {
    return json.map((item) => Category(item as String)).toList();
  }

  @override
  String toString() => name; // Giúp in ra tên của Category
}

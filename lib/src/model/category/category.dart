class Category
{
  int? no;
  String? name;
  String? color;

  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'name': name,
      'color': color,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      no: map['no'],
      name: map['name'],
      color: map['color'],
    );
  }

  Category({required this.no, required this.name, required this.color});
}
class Category {
  final String name;
  final String? description;

  const Category({
    required this.name,
    this.description,
  });
}

class Expense {
  final String title;
  final double amount;
  final String category;
  final DateTime date;
  final String? note;

  const Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    this.note,
  });
}
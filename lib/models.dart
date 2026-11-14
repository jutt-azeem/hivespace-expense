
class Expense {
  final String title;
  final double amount;
  final String category;
  final DateTime date;

  const Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });
}

class Category {
  final String id;
  final String name;

  const Category({
    required this.id,
    required this.name,
  });
}

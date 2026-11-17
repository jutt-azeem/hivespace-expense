
import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class Expense {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String? note;

  const Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    this.note,
  });
}

@HiveType(typeId: 1)
class Category {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? description;

  const Category({
    required this.id,
    required this.name,
    this.description,
  });
}

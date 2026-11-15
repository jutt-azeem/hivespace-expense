import 'models.dart';

class MockRepository {
  Future<List<Expense>> getExpenses() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final today = DateTime.now();

    return [
      Expense(
        title: 'Office Rent',
        amount: 20000,
        category: 'Rent',
        date: today,
      ),
      Expense(
        title: 'Electricity Bill',
        amount: 5500,
        category: 'Utilities',
        date: today.subtract(const Duration(days: 1)),
      ),
      Expense(
        title: 'Tea and Snacks',
        amount: 1800,
        category: 'Refreshments',
        date: today.subtract(const Duration(days: 2)),
      ),
      Expense(
        title: 'Internet Bill',
        amount: 3500,
        category: 'Utilities',
        date: today.subtract(const Duration(days: 3)),
      ),
    ];
  }
}
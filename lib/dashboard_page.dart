import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fl_chart/fl_chart.dart';

import 'models.dart';
import 'csv_export.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseBox = Hive.box<Expense>('expenses');

    final expenses = expenseBox.values.toList();

    double totalExpenses = 0;

    for (final expense in expenses) {
      totalExpenses += expense.amount;
    }
    final Map<String, double> categoryTotals = {};

    for (final expense in expenses) {
      categoryTotals[expense.category] =
          (categoryTotals[expense.category] ?? 0) + expense.amount;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                await exportExpensesToCsv();

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('CSV file exported successfully!'),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.download),
              label: const Text('Export CSV'),
            ),
            const SizedBox(height: 20),
            Text(
              'Total Expenses: Rs. ${totalExpenses.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Category Wise Expenses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            if (categoryTotals.isEmpty)
              const Text('No expenses available for chart')
            else
              SizedBox(
                height: 250,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final categories = categoryTotals.keys.toList();
                            final index = value.toInt();

                            if (index < 0 || index >= categories.length) {
                              return const SizedBox();
                            }

                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                categories[index],
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    maxY: categoryTotals.values.reduce(
                          (a, b) => a > b ? a : b,
                    ) *
                        1.2,
                    barGroups: categoryTotals.entries
                        .toList()
                        .asMap()
                        .entries
                        .map((entry) {
                      return BarChartGroupData(
                        x: entry.key,
                        barRods: [
                          BarChartRodData(
                            toY: entry.value.value,
                            color: Colors.blue,
                            width: 25,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
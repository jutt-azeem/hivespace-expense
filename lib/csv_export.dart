
import 'dart:convert';
import 'dart:typed_data';
import 'package:csv/csv.dart';
import 'package:file_saver/file_saver.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models.dart';

Future<void> exportExpensesToCsv() async {
  final expenseBox = Hive.box<Expense>('expenses');

  final List<List<dynamic>> rows = [
    ['Title', 'Amount', 'Category', 'Date', 'Note'],
  ];

  for (final expense in expenseBox.values) {
    rows.add([
      expense.title,
      expense.amount,
      expense.category,
      expense.date.toString(),
      expense.note,
    ]);
  }

  final csvData = csv.encode(rows);
  final bytes = Uint8List.fromList(utf8.encode(csvData));

  await FileSaver.instance.saveFile(
    name: 'expenses',
    bytes: bytes,
    fileExtension: 'csv',
    mimeType: MimeType.csv,
  );
}

# HiveSpace Coworking Expense Tracker

A lightweight Flutter app for HiveSpace Coworking staff to record daily operational expenses, organise them into categories, and store everything locally using Hive.

**Status:** Task 1, Task 2 and Task 3 features completed.

**Live demo:** Coming soon (GitHub Pages deployment).

---

## Features

### Task 1 & Task 2
- Add Category screen with form validation.
- Duplicate categories are blocked.
- Add Expense screen with title, amount, category and optional note.
- Validation for required fields and positive amount.
- Data is stored locally using Hive.
- Home page displays saved expenses.

### Task 3
- Dashboard showing total expenses.
- Category-wise expense summary.
- Bar chart displaying category-wise expenses.
- Export expenses to CSV file.
- CSV file includes title, amount, category, date and note.

## Tech Stack

- Flutter (Dart)
- Hive and hive_flutter for local storage.
- hive_generator and build_runner for Hive adapters.
- fl_chart for bar chart.
- csv for CSV data generation.
- file_saver for saving CSV files.

## Project Structure

```text
lib/
  main.dart
  models.dart
  models.g.dart
  dashboard_page.dart
  csv_export.dart
```

## Setup

1. Install Flutter: https://docs.flutter.dev/get-started/install
2. Clone the repository:

```bash
git clone https://github.com/jutt-azeem/hivespace-expense.git
cd hivespace-expense
```

3. Install dependencies:

```bash
flutter pub get
```

4. Generate Hive adapters (only if you change models.dart):

```bash
dart run build_runner build --delete-conflicting-outputs
```

5. Run the app:

```bash
flutter run
```

For Chrome:

```bash
flutter run -d chrome
```

## Usage

1. Add categories using the category option.
2. Open Add Expense and enter the expense details.
3. Save the expense.
4. View total expenses and category-wise summary on the Dashboard.
5. View the bar chart.
6. Use Export CSV to save expense records as a CSV file.

## Validation Rules

| Field | Rule |
|---|---|
| Category name | Required and must be unique |
| Expense title | Required |
| Expense amount | Must be greater than 0 |
| Expense category | Must be selected |

## Notes on Web Persistence

On web, Hive stores data in the browser's storage. Data is associated with the browser profile and website origin.

On Android, data persists locally across app restarts.

## Roadmap

- [x] Task 1: Project setup and first screen.
- [x] Task 2: Add Category, Add Expense, validation and Hive local storage.
- [x] Task 3: Dashboard, category-wise bar chart and CSV export.
- [ ] GitHub Pages deployment and live demo.

## Author

Azeem Ali  
Flutter Intern  
Built for the HiveSpace Coworking project brief.

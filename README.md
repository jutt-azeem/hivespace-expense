# HiveSpace Coworking Expense Tracker

A lightweight Flutter app for HiveSpace Coworking staff to record daily operational expenses, organise them into categories, and keep everything stored locally with Hive (no paid backend needed). Runs on Android, iOS and the web.

> **Status:** Task 2 complete (Add Category, Add Expense, validation, local persistence).
> Task 3 (summary dashboard, bar chart, CSV export, GitHub Pages link) is coming next.

**Live demo:** _coming in Task 3 (GitHub Pages link)_

---

## Features (Task 2)

- **Add Category** screen with form validation (name is required, duplicates are blocked, description is optional).
- **Add Expense** screen with:
    - Title (must not be empty)
    - Amount (must be a positive number)
    - Category dropdown filled from saved categories
    - Optional note
- Inline error messages when validation fails.
- Data is saved locally with **Hive**, so it survives app restarts.
- **Home page** lists all saved expenses (newest first) and reloads after returning from the Add Expense screen.

## Tech stack

- Flutter (Dart)
- [hive](https://pub.dev/packages/hive) and [hive_flutter](https://pub.dev/packages/hive_flutter) for local storage
- [hive_generator](https://pub.dev/packages/hive_generator) and [build_runner](https://pub.dev/packages/build_runner) to generate type adapters

## Project structure

```
lib/
  main.dart             # App entry, Hive init, HomePage, AddCategoryPage, AddExpensePage
  models.dart           # Expense and Category models (Hive annotations)
  models.g.dart         # Generated Hive adapters (committed)
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
4. Generate the Hive adapters (only needed if you change `models.dart`):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
5. Run the app:
   ```bash
   flutter run -d chrome        # web
   flutter run                  # connected Android/iOS device or emulator
   ```

## Usage

1. Tap the **category icon** in the top bar, enter a name (for example `Rent`) and press **Save Category**.
2. Tap **Add Expense**, fill in Title and Amount, choose a category, and press **Save Expense**.
3. The expense appears at the top of the Home list.
4. Close and reopen the app: your categories and expenses are still there.

### Validation rules

| Field | Rule |
|---|---|
| Category name | Required, must be unique (case-insensitive) |
| Expense title | Required |
| Expense amount | Must be a number greater than 0 |
| Expense category | Must be selected |

## Notes on web persistence

On web, Hive stores data in the browser's IndexedDB, which is tied to the browser profile and the `localhost` port. `flutter run -d chrome` opens a temporary Chrome profile, so data can disappear between runs. To test persistence on web, refresh the page (F5) during the same run, or use a fixed port in your normal browser:

```bash
flutter run -d web-server --web-port=5000
# then open http://localhost:5000
```

On Android and iOS the data persists across restarts as expected.

## Roadmap

- [x] Task 1: Project bootstrap and first screen with async sample data
- [x] Task 2: Add-Expense form with validation and Hive local storage
- [ ] Task 3: Summary dashboard, bar chart, CSV export, GitHub Pages deployment

## Author

Azeem Ali, Flutter intern, built for the HiveSpace Coworking project brief.
# Market Watchlist

---

## Overview

Market Watchlist is a Flutter-based interview assignment inspired by a modern trading app UI. The project focuses on building a clean and practical watchlist experience with market summary data, real-time stock search, bottom navigation, and an edit watchlist flow for reordering and deleting stocks.

The app uses dummy local data and is structured to support future scalability, including repository-based data access and clear separation between UI and business logic.

---

## Features

- Watchlist UI with compact stock rows
- Market summary section
- Real-time stock search
- Edit watchlist screen
- Drag and drop reorder using BLoC
- Delete stocks from the watchlist
- Responsive UI for small Android devices
- Bottom navigation for trading-app UI parity

---

## Architecture

The project follows a feature-first clean architecture approach. Code is grouped by feature so each module can own its screens, widgets, state management, models, and repository layer.

The Watchlist feature separates responsibilities into:

- `bloc/` for business logic and state transitions
- `data/` for dummy local data
- `models/` for immutable data models
- `repository/` for data access abstraction
- `screens/` for UI pages
- `widgets/` for reusable UI components

This structure keeps the codebase readable, scalable, and suitable for interview evaluation.

---

## Project Structure

```text
lib/
  app/
    router/
    theme/

  core/
    constants/
    utils/
    widgets/

  features/
    watchlist/
      bloc/
        watchlist_bloc.dart
        watchlist_event.dart
        watchlist_state.dart

      data/
        dummy/
          watchlist_dummy_data.dart
        models/
          stock_model.dart
        repository/
          watchlist_repository.dart

      screens/
        watchlist_screen.dart
        edit_watchlist_screen.dart

      widgets/
        stock_tile.dart
        editable_stock_tile.dart
        watchlist_tab_bar.dart
        watchlist_bottom_nav.dart
```

---

## Reorder Logic

The edit watchlist screen uses `ReorderableListView.builder` to support drag and drop reordering.

Reorder behavior is handled inside `WatchlistBloc` through the `ReorderStocks` event. The BLoC removes the dragged stock from its old index and inserts it into the new index.

When `newIndex > oldIndex`, the new index is decremented before insertion. This ensures the list shifts correctly after the item is removed and prevents naive swapping behavior.

---

## Search Logic

Search is handled entirely through `WatchlistBloc` using the `SearchStocks` event.

The state maintains:

- `allStocks`: the original complete watchlist
- `stocks`: the filtered list displayed in the UI

When the user types in the search field, the query is trimmed and matched against `stock.symbol` using case-insensitive filtering. If the query is empty, the full `allStocks` list is restored.

---

## Tech Stack

- Flutter
- Dart
- `flutter_bloc`
- `go_router`

---

## Run Instructions

Install dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

---

## Why BLoC

`flutter_bloc` is used to keep business logic separate from UI code. It provides predictable state transitions and makes the watchlist flow easier to reason about, test, and scale.

BLoC handles:

- Loading watchlist data
- Searching stocks
- Reordering stocks
- Deleting stocks
- Saving the watchlist state

This keeps widgets focused on rendering UI while the BLoC owns all watchlist behavior.

---

## Notes

- The app uses dummy local data and does not call an API.
- The main focus is the Watchlist and Edit Watchlist flow.
- Bottom navigation is included for UI parity with trading apps.
- The repository layer is ready for future API integration.

---

## Author

Nishant Ingle

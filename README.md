# Market Watchlist

A compact Flutter watchlist assignment that mirrors a modern trading app flow. The app shows a watchlist, market summary, search field, watchlist tabs, visual bottom navigation, and a dedicated edit screen where stocks can be reordered with drag and drop or removed.

## Architecture

The project follows a feature-first structure. Watchlist code is grouped under `lib/features/watchlist`, with data, BLoC, screens, and widgets separated so the UI remains thin and business logic stays testable.

## Folder Structure

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
      data/
        dummy/
        models/
        repositories/
      screens/
      widgets/
```

## Why BLoC

`flutter_bloc` keeps watchlist behavior predictable and interview-ready. Loading, reordering, deleting, and saving are expressed as events, while widgets simply rebuild from `WatchlistState`.

## Reorder Behavior

Drag and drop uses `ReorderableListView.builder`. The BLoC handles reordering by removing the dragged item and inserting it at the new position. When `newIndex > oldIndex`, the new index is decremented before insertion to account for the removed item.

## Bottom Navigation

The six-item bottom navigation bar is implemented on the watchlist screen for UI parity with trading apps. It is intentionally visual only; the assignment focus is the watchlist and edit-watchlist flow.

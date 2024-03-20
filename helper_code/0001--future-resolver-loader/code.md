```dart
void futureResolverWithLoader<T>(
  BuildContext context, {
  required Future<T> future,
}) {
  // Dialog to show loader
  AppProgress(context);

  future.then(
    (value) {
      // After future resolved close the loader dialog
      Navigator.pop(context);
    },
  ).catchError(
    (err) {
      // if error close the loader dialog
      Navigator.pop(context);
    },
  );
}

```

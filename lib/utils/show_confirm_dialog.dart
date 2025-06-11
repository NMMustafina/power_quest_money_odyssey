import 'package:flutter/cupertino.dart';

Future<void> showConfirmDialog(
  BuildContext context, {
  required String title,
  String? content,
  required String confirmText,
  required VoidCallback onConfirm,
}) async {
  await showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(title),
      content: content != null
          ? Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(content),
            )
          : null,
      actions: [
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(confirmText),
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
        ),
      ],
    ),
  );
}

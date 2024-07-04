import 'package:flutter/material.dart';

class RootNavigationController {
  GlobalKey<NavigatorState> _key = GlobalKey();

  GlobalKey<NavigatorState> get key => _key;

  void pop(bool result) {
    _key.currentState?.pop(result);
  }

  Future<bool?> showConfirmationDialog(
    String title,
    String content,
    String ok,
    String cancel,
  ) async {
    return showGeneralDialog<bool>(
      context: key.currentState!.context,
      pageBuilder: (context, _, __) => AlertDialog.adaptive(
        icon: Icon(Icons.dangerous_outlined),
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => pop(false),
            child: Text(cancel),
          ),
          TextButton(
            onPressed: () => pop(true),
            child: Text(ok),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:route_task/core/extensions/extention_navigator.dart';

void setupErrorState(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: const TextStyle(fontSize: 11),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text(
            'Got it',
            style: TextStyle(fontSize: 11),
          ),
        ),
      ],
    ),
  );
}

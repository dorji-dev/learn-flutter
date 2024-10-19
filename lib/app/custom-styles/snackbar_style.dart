import 'package:flutter/material.dart';
import 'package:twitter_clone/app/keys/global_keys.dart';

SnackBar snackBarStyles({required String text}) {
  return SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
          },
        ),
      ],
    ),
    backgroundColor: const Color(0xFF1DA1F2),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16),
  );
}

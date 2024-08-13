import 'package:flutter/material.dart';

import 'error_handler.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.e,
    required this.onPressed,
  });

  final dynamic e;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final error = ErrorHandler.handle(e);
    return Column(children: [
      Text(error.description),
      TextButton(
        onPressed: onPressed,
        child: const Text('Retry'),
      ),
    ]);
  }
}

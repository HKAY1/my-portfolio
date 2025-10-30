import 'package:flutter/material.dart';

/// Simple wrapper that just returns the child
/// Footer is now added directly in each page's content
class PageWrapper extends StatelessWidget {
  final Widget child;

  const PageWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

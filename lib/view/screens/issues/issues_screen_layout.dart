import 'package:flutter/material.dart';
import 'package:royex_task/view/screens/issues/issues_screen.dart';
import 'package:royex_task/view/widgets/layout/base_layout.dart';

class IssuesScreenLayout extends StatelessWidget {
  const IssuesScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      mobileLayout: IssuesScreen(),
    );
  }
}

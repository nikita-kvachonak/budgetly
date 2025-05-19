import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String e;

  const AppErrorWidget({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Error"),
          Text(e),
        ],
      ),
    );
  }
}

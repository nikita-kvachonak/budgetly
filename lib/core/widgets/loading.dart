import 'package:flutter/cupertino.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}

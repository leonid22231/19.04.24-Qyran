import 'package:flutter/material.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';

class CusstomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  const CusstomScaffold({super.key, required this.title, required this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  S.of(context).back,
                  style: TextStyle(color: primaryColor),
                ))
          ],
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
              fontSize: welcomeTitleSize, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(widgetPadding),
          child: body,
        ),
      ),
    );
  }
}

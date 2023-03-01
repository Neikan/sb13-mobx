// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:mtg_mobx/consts/keys.dart';
import 'package:mtg_mobx/consts/translations.dart';
import 'package:mtg_mobx/ui/components/app_header.dart';
import 'package:mtg_mobx/ui/components/app_text.dart';

class ScreenNotFound extends StatelessWidget {
  const ScreenNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: labelsNotFound[keyTitle]!,
      ),
      body: SafeArea(
        child: Center(
          child: AppText(
            text: labelsNotFound[keyContent]!,
          ),
        ),
      ),
    );
  }
}

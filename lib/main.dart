// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:mtg_mobx/initialization.dart';
import 'package:mtg_mobx/observables/state_app_observable.dart';
import 'package:mtg_mobx/repository/repository_cards/repository_cards_imp.dart';
import 'package:mtg_mobx/repository/repository_cart/repository_cart_imp.dart';
import 'package:mtg_mobx/ui/components/app.dart';

void main() {
  initializeServices();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => StateApp(
            const RepositoryCardsImp(),
            const RepositoryCartImp(),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}

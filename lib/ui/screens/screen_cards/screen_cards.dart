// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:mtg_mobx/observables/state_app_observable.dart';
import 'package:mtg_mobx/ui/components/app_error_data.dart';
import 'package:mtg_mobx/ui/screens/screen_cards/components/header_cards/header_cards.dart';
import 'package:mtg_mobx/ui/screens/screen_cards/components/loader_cards.dart';
import 'package:mtg_mobx/ui/screens/screen_cards/components/view_cards.dart';

class ScreenCards extends StatelessWidget {
  const ScreenCards({super.key});

  @override
  Widget build(BuildContext context) {
    final StateApp state = Provider.of<StateApp>(context);

    return Observer(
      builder: (_) {
        if (!state.isLoaded) return const LoaderCards();

        if (state.cardsError.isNotEmpty) {
          return Scaffold(
            appBar: const HeaderCards(),
            body: AppErrorData(text: state.cardsError),
          );
        }

        return ViewCards(cards: state.cards);
      },
    );
  }
}

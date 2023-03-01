// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:mtg_mobx/consts/keys.dart';
import 'package:mtg_mobx/consts/translations.dart';
import 'package:mtg_mobx/models/mtg_card_info/mtg_card_info.dart';
import 'package:mtg_mobx/observables/state_app_observable.dart';
import 'package:mtg_mobx/ui/components/app_header.dart';
import 'package:mtg_mobx/ui/components/app_text.dart';
import 'package:mtg_mobx/ui/screens/screen_cards/components/list_cards/list_card.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StateApp>(context);

    return Observer(
      builder: (context) {
        final cardsToList = <MtgCardInfo>[];

        for (final card in state.cards) {
          if (state.cart.contains(card.id)) {
            cardsToList.add(card);
          }
        }

        return Scaffold(
          appBar: AppHeader(
            title: labelsCart[keyTitle]!,
          ),
          body: SafeArea(
            child: state.cart.isEmpty
                ? Center(
                    child: AppText(
                      text: labelsCart[keyContent]!,
                      fontSize: 16,
                    ),
                  )
                : ListCards(cards: cardsToList),
          ),
        );
      },
    );
  }
}

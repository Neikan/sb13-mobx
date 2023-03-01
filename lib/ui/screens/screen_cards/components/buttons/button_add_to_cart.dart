// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:mtg_mobx/observables/state_app_observable.dart';

class ButtonAddToCart extends StatelessWidget {
  final String cardId;

  const ButtonAddToCart({
    super.key,
    required this.cardId,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StateApp>(context);

    return Observer(
      builder: (_) {
        if (state.cart.contains(cardId)) {
          return IconButton(
            icon: Icon(
              Icons.remove_shopping_cart_outlined,
              color: Colors.red.shade800,
            ),
            onPressed: () => state.removeCardFromCart(cardId),
          );
        }

        return IconButton(
          icon: Icon(
            Icons.add_shopping_cart_outlined,
            color: Colors.green.shade800,
          ),
          onPressed: () => state.addCardToCart(cardId),
        );
      },
    );
  }
}

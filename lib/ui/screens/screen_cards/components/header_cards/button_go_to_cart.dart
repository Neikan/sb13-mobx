// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:mtg_mobx/consts/routes.dart';
import 'package:mtg_mobx/observables/state_app_observable.dart';
import 'package:mtg_mobx/ui/components/app_icon_button.dart';

const int _cartCountMax = 99;

class ButtonGoToCart extends StatelessWidget {
  const ButtonGoToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StateApp>(context);

    return Observer(builder: (_) {
      final count = state.cart.length;

      final countText = count > 0
          ? count > _cartCountMax
              ? '$_cartCountMax+'
              : '$count'
          : '';

      return AppIconButton(
        padding: const EdgeInsets.only(right: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              Icons.shopping_cart_checkout,
              color: Colors.grey,
            ),
            if (countText.isNotEmpty)
              Positioned(
                top: 8,
                right: 0,
                child: Container(
                  padding: _getBadgePadding(countText),
                  decoration: _getBadgeDecoration(countText),
                  alignment: Alignment.center,
                  child: Text(
                    countText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
          ],
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            routeCart,
          );
        },
      );
    });
  }

  BoxDecoration _getBadgeDecoration(String countText) {
    if (countText.length > 1) {
      return BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.red.shade900,
        borderRadius: const BorderRadius.all(Radius.circular(56)),
      );
    }

    return BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.red.shade900,
    );
  }

  EdgeInsets _getBadgePadding(String countText) {
    if (countText.length > 1) {
      return const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      );
    }

    return const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 2,
    );
  }
}

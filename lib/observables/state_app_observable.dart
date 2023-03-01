// Package imports:
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:mtg_mobx/models/mtg_card_info/mtg_card_info.dart';
import 'package:mtg_mobx/repository/repository_cards/repository_cards_imp.dart';
import 'package:mtg_mobx/repository/repository_cart/repository_cart.dart';

part 'state_app_observable.g.dart';

class StateApp = DataState with _$StateApp;

abstract class DataState with Store {
  final RepositoryCardsImp _repositoryCards;
  final RepositoryCart _repositoryCart;

  @observable
  List<MtgCardInfo> cards = [];

  @observable
  List<String> cart = [];

  @observable
  String cardsError = '';

  @computed
  bool get isLoaded => cards.isNotEmpty || cardsError.isNotEmpty;

  DataState(this._repositoryCards, this._repositoryCart) {
    _initCards();
  }

  @action
  Future<void> _initCards() async {
    try {
      cards = await _repositoryCards.load();
    } on DioError catch (e) {
      cardsError = e.error.toString();
    }
  }

  @action
  void addCardToCart(String cardId) {
    _repositoryCart.add(cardId);

    cart = _repositoryCart.data;
  }

  @action
  void removeCardFromCart(String cardId) {
    _repositoryCart.remove(cardId);

    cart = _repositoryCart.data;
  }
}

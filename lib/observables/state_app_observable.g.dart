// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_app_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StateApp on DataState, Store {
  Computed<bool>? _$isLoadedComputed;

  @override
  bool get isLoaded => (_$isLoadedComputed ??=
          Computed<bool>(() => super.isLoaded, name: 'DataState.isLoaded'))
      .value;

  late final _$cardsAtom = Atom(name: 'DataState.cards', context: context);

  @override
  List<MtgCardInfo> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(List<MtgCardInfo> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$cartAtom = Atom(name: 'DataState.cart', context: context);

  @override
  List<String> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(List<String> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  late final _$cardsErrorAtom =
      Atom(name: 'DataState.cardsError', context: context);

  @override
  String get cardsError {
    _$cardsErrorAtom.reportRead();
    return super.cardsError;
  }

  @override
  set cardsError(String value) {
    _$cardsErrorAtom.reportWrite(value, super.cardsError, () {
      super.cardsError = value;
    });
  }

  late final _$_initCardsAsyncAction =
      AsyncAction('DataState._initCards', context: context);

  @override
  Future<void> _initCards() {
    return _$_initCardsAsyncAction.run(() => super._initCards());
  }

  late final _$DataStateActionController =
      ActionController(name: 'DataState', context: context);

  @override
  void addCardToCart(String cardId) {
    final _$actionInfo = _$DataStateActionController.startAction(
        name: 'DataState.addCardToCart');
    try {
      return super.addCardToCart(cardId);
    } finally {
      _$DataStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCardFromCart(String cardId) {
    final _$actionInfo = _$DataStateActionController.startAction(
        name: 'DataState.removeCardFromCart');
    try {
      return super.removeCardFromCart(cardId);
    } finally {
      _$DataStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cards: ${cards},
cart: ${cart},
cardsError: ${cardsError},
isLoaded: ${isLoaded}
    ''';
  }
}

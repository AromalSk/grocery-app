// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;
  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;
  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeWishListNavigationEvent extends HomeEvent {}

class HomeCartNavigationEvent extends HomeEvent {}

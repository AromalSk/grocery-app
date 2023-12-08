import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/cart_item.dart';
import 'package:grocery_app/data/grocery_data.dart';
import 'package:grocery_app/data/wishlist_items.dart';
import 'package:grocery_app/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishListNavigationEvent>(homeWishListNavigationEvent);
    on<HomeCartNavigationEvent>(homeCartNavigationEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 4));
    emit(HomeLoadedSuccessState(
        product: GroceryData.groceryProducts
            .map((e) => ProductModel(
                id: e['id'],
                name: e['name'],
                category: e['category'],
                price: e['price'],
                quantity: e['quantity'],
                image: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Clicked ');
    wishlistItems.add(event.clickedProduct);
    emit(HomeWishListedState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Clicked ');
    cartItems.add(event.clickedProduct);
    emit(HomeItemCartingState());
  }

  FutureOr<void> homeWishListNavigationEvent(
      HomeWishListNavigationEvent event, Emitter<HomeState> emit) {
    print("Wishlist Navigate Clicked");
    emit(HomeNavigateToWishListPage());
  }

  FutureOr<void> homeCartNavigationEvent(
      HomeCartNavigationEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate Clicked');
    emit(HomeNavigateToCartPage());
  }
}

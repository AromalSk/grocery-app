import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/cart_item.dart';
import 'package:grocery_app/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
      on<CartInitialEvent>(cartInitialEvent);
      on<CartRemoveEvent>(cartRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartedItems: cartItems));
  }

  FutureOr<void> cartRemoveEvent(CartRemoveEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.removedProduct);
    emit(CartSuccessState(cartedItems: cartItems));
  }
}

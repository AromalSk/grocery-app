// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

class CartState {}

class CartActionState extends CartState{}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductModel> cartedItems;
  CartSuccessState({
    required this.cartedItems,
  });
}

  

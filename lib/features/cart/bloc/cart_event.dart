// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveEvent extends CartEvent {
  final ProductModel removedProduct;
  CartRemoveEvent({
    required this.removedProduct,
  });
}

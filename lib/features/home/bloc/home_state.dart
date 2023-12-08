// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {}

class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  List<ProductModel> product;
  HomeLoadedSuccessState({
    required this.product,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPage extends HomeActionState {}

class HomeNavigateToCartPage extends HomeActionState {}

class HomeWishListedState extends HomeActionState {}

class HomeItemCartingState extends HomeActionState {}

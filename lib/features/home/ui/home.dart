import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/ui/cart.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/ui/product_tile_widget.dart';
import 'package:grocery_app/features/wishlist/ui/wishlist.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishListPage) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return WishList();
            },
          ));
        } else if (state is HomeNavigateToCartPage) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return Cart();
            },
          ));
        } else if (state is HomeWishListedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item added to wishlist")));
        } else if (state is HomeItemCartingState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item added to cart')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Colors.amberAccent),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.amber,
                title: Text(
                  'Groceries',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishListNavigationEvent());
                    },
                    icon: Icon(
                      Iconsax.heart5,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartNavigationEvent());
                      },
                      icon: Icon(
                        Iconsax.shop,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: successState.product.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                      homeBloc: homeBloc,
                      productModel: successState.product[index]);
                },
              ),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({
    Key? key,
    required this.productModel,
    required this.homeBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productModel.image))),
            ),
            Text(
              productModel.name,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              productModel.category,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            Text(
              "Price : \$" + productModel.price.toString(),
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            Text(
              "Quantity : " + productModel.quantity.toString(),
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        clickedProduct: productModel));
                  },
                  icon: Icon(
                    Iconsax.heart5,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartButtonClickedEvent(
                          clickedProduct: productModel));
                    },
                    icon: Icon(
                      Iconsax.shop,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

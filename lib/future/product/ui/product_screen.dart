import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/utils/app_assets.dart';

import '../../../core/get_it/get_it.dart';
import '../../../core/helpers/cache_helper.dart';
import '../../../core/helpers/spacing.dart';
import 'widget/product_bloc_listener.dart';
import 'widget/search_and_cart_component.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 60.h,
            ),

            // Logo App
            Image.asset(
              AppAssets.appLogoSvg,
              width: 70.w,
            ),

            SizedBox(
              height: 10.h,
            ),

            const SearchAndCartComponent(),
            verticalSpace(12),
            const ProductBlocListener(),
            IconButton(
                onPressed: () {
                  getIt<CacheHelper>().clearData();
                },
                icon: const Icon(Icons.remove)),
          ]),
        ),
      ),

      // const SearchBlocListener(),

      // Search Product And Add Product To Cart
      // ,
    );
  }
}

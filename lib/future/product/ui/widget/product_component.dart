import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:route_task/core/get_it/get_it.dart';
import 'package:route_task/core/helpers/cache_helper.dart';
import 'package:route_task/future/product/logic/product_cubit.dart';
import 'package:route_task/future/product/logic/product_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/utils/app_colors.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.desPrice,
    required this.rate,
    required this.id,
  });
  final int id;
  final String image;
  final String name;
  final String description;
  final String price;
  final String desPrice;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 250.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.lightBlue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Image And Heart Icon
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: image.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,
                          height: 80.w,
                          width: double.infinity,
                        )
                      : const Icon(
                          Icons.error,
                          size: 25,
                        ),
                ),

                // Heart Icon
                BlocConsumer<ProductCubit, ProductState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () =>
                              context.read<ProductCubit>().favorite(id),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  getIt<CacheHelper>().getData(key: 'id') == id
                                      ? AppColor.red
                                      : AppColor.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                IconlyLight.heart,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name Product
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColor.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  // Desc Product
                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColor.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  // Price
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'EGP: $price',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColor.primary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          '$desPrice EGP',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: AppColor.lightBlue,
                                fontSize: 14.sp,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColor.primary,
                              ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  // Rating
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'Review ($rate)',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColor.primary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          IconlyBold.star,
                          size: 20.sp,
                          color: AppColor.yellow,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.add,
                                color: AppColor.white,
                                size: 19.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
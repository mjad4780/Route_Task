import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/future/product/logic/product_cubit.dart';
import 'package:route_task/future/product/ui/widget/card_product.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/utils/app_colors.dart';
import '../../logic/product_state.dart';

class ProductBlocListener extends StatelessWidget {
  const ProductBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error ||
          current is Search,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.mainBlue,
              ),
            );
          },
          success: (products) {
            // context.pop();
            return CardProduct(product: products!);
          },
          search: (search) {
            if (search!.isEmpty) {
              return const Center(
                  child: Text(
                      'Sorry ,you will not find this product \n                    but smile'));
            } else {
              return CardProduct(product: search);
            }
          },
          error: (error) {
            return setupErrorState(context, error);
            // setupErrorState(context, error);
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
      listener: (BuildContext context, ProductState state) {},
    );
  }

  Widget setupErrorState(BuildContext context, String error) {
    // showDialog(
    //   context: context,
    //   builder: (context) =>
    return AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.read<ProductCubit>().getproduct();
          },
          child: Text(
            'Agin too',
            style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
      // ),
    );
  }
}

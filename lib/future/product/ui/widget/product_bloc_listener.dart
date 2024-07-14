import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/core/extensions/extention_navigator.dart';
import 'package:route_task/future/product/logic/product_cubit.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/utils/app_colors.dart';
import '../../logic/product_state.dart';

class ProductBlocListener extends StatelessWidget {
  const ProductBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColor.mainBlue,
                ),
              ),
            );
          },
          success: () {
            context.pop();
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
  // Widget setupSuccess(specializationsList) {
  //   return Expanded(
  //     child: Column(
  //       children: [
  //         DoctorsSpecialityListView(
  //           specializationDataList: specializationsList ?? [],
  //         ),
  //         verticalSpace(8),
  //         DoctorsListView(
  //           doctorsList: specializationsList?[0]?.doctorsList,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

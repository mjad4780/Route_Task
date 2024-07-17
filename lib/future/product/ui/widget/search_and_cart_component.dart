import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:route_task/future/product/logic/product_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class SearchAndCartComponent extends StatelessWidget {
  const SearchAndCartComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 9,
          child: SizedBox(
              height: 55.h,
              child: AppTextFormField(
                hintText: AppStrings.hintSearch,
                onchange: (String? value) {
                  context.read<ProductCubit>().searchProducts(
                        value,
                      );
                  print('kkkkkkkkkkkkkkkkkkkkkkkkkkkk$value');
                },
                suffixIcon: Icon(
                  IconlyLight.search,
                  size: 35.sp,
                  color: AppColor.primary,
                ),
              )),
        ),
        Flexible(
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyLight.buy,
              size: 35.sp,
              color: AppColor.primary,
            ),
          ),
        ),
      ],
    );
  }
}

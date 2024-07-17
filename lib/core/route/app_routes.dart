import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/core/get_it/get_it.dart';
import 'package:route_task/future/product/logic/product_cubit.dart';

import '../../future/product/ui/product_screen.dart';

class Routes {
  static const String intitlRoute = '/';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ProductCubit>()..getproduct(),
                  child: const ProductScreen(),
                ));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not Found..!'),
            ),
          ),
        );
    }
  }
}

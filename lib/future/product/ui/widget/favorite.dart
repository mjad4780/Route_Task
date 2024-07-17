import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/get_it/get_it.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/utils/app_colors.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key, required this.id});
  final int id;
  @override
  State<Favorite> createState() => _FavoriteState();
}

favorite(
  int id,
) {
  if (getIt<CacheHelper>().getData(key: id.toString()) == true) {
    getIt<CacheHelper>().saveData(key: id.toString(), value: false);
  } else {
    getIt<CacheHelper>().saveData(key: id.toString(), value: true);
  }
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            setState(() {
              favorite(widget.id);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: getIt<CacheHelper>().getData(key: widget.id.toString()) ==
                      true
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
  }
}

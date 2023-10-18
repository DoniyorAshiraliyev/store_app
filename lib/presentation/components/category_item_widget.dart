import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/domain/models/category.dart';

class CategoryItem extends StatelessWidget {
  final void Function()? onTap;
  final Category category;
  final String? selectedId;

  const CategoryItem(
      {Key? key,
        required this.onTap,
        required this.category,
        required this.selectedId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        margin: const EdgeInsets.symmetric(horizontal: 5),

        height: 55,
        // width: 130,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2.5),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),
          color: selectedId != null && selectedId == category.id
              ? Colors.white
              : Colors.white,
        ),
        child: Text(category.name),
      ),
    );
  }
}
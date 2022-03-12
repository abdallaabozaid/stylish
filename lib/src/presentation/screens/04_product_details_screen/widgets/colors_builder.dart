import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/src/logic/products/cubit/single_product/cubit/product_cubit.dart';

import 'color_item.dart';

class ColorsBuilder extends StatefulWidget {
  const ColorsBuilder({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final List<Color> colors;

  @override
  State<ColorsBuilder> createState() => _ColorsBuilderState();
}

class _ColorsBuilderState extends State<ColorsBuilder> {
  @override
  Widget build(BuildContext context) {
    Color selectedColor = widget.colors[0];
    return SizedBox(
      height: 25.h,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: widget.colors.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 12.w,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<ProductCubit>(context)
                      .selectColor(widget.colors[index]);
                  selectedColor = widget.colors[index];
                },
                child: ColorItem(
                  color: widget.colors[index],
                  selected: selectedColor == widget.colors[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

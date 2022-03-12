import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/src/data/model/adress_model.dart';
import 'package:stylish/src/logic/user_info/adress/cubit/adress_cubit.dart';

class AdressCard extends StatelessWidget {
  const AdressCard({
    Key? key,
    required this.adress,
    required this.adressKey,
  }) : super(key: key);
  final AdressModel adress;
  final String adressKey;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(
          color: adress.selected ? themeData.colorScheme.primary : Colors.grey,
        ),
      ),
      borderOnForeground: false,
      color: adress.selected
          ? themeData.colorScheme.onPrimary
          : Colors.transparent,
      elevation: adress.selected ? 5 : 0,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        padding: EdgeInsets.all(12.w),
        height: 90.h,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black54),
        // ),
        child: Row(
          children: [
            _checkBox(context),
            _mainAdressInfo(themeData),
            const Spacer(),
            _editIcon()
          ],
        ),
      ),
    );
  }

  Widget _checkBox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25.w),
      child: SizedBox(
        width: 30.w,
        height: 30.h,
        child: Transform.scale(
          scale: 1.4,
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            value: adress.selected,
            onChanged: (newValue) {
              BlocProvider.of<AdressCubit>(context)
                  .selectAdress(adressKey, context);
            },
            shape: const CircleBorder(),
          ),
        ),
      ),
    );
  }

  Widget _mainAdressInfo(ThemeData themeData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          adressKey.toUpperCase(),
          style: themeData.textTheme.headline1!.copyWith(
            letterSpacing: 1.5,
            fontSize: 16.sp,
            fontWeight: adress.selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          "${adress.city},${adress.street}",
          style: themeData.textTheme.headline2!.copyWith(
            letterSpacing: 1.5,
            fontSize: 12.sp,
            fontWeight: adress.selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          adress.phoneNumber.toString(),
          style: themeData.textTheme.headline2!.copyWith(
            letterSpacing: 1.5,
            fontSize: 12.sp,
            fontWeight: adress.selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _editIcon() {
    return Opacity(
      opacity: adress.selected ? 0.8 : 0.5,
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.mode_edit_outlined,
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/src/data/model/adress_model.dart';
import 'package:stylish/src/logic/user_info/adress/cubit/adress_cubit.dart';

import 'adress_card.dart';

class DeliveryAdress extends StatelessWidget {
  const DeliveryAdress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleText(themeData),
        _adressOptions(context),
      ],
    );
  }

  Widget _titleText(ThemeData themeData) {
    return Text(
      'Delivery address',
      style: themeData.textTheme.headline1!.copyWith(fontSize: 18.sp),
    );
  }

  Widget _adressOptions(BuildContext context) {
    return BlocBuilder<AdressCubit, AdressState>(
      builder: (context, state) {
        List<AdressModel> adresses = state.adressModel.values.toList();

        return ListView.builder(
          shrinkWrap: true,
          itemCount: adresses.length,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            final String adressKey = index == 0 ? 'home' : 'office';
            return AdressCard(
              adress: adresses[index],
              adressKey: adressKey,
            );
          },
        );
      },
    );
  }
}

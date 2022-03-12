import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/src/data/model/adress_model.dart';

import '../../user_info_cubit/user_info_cubit.dart';

part 'adress_state.dart';

class AdressCubit extends Cubit<AdressState> {
  AdressCubit(this.adressModel)
      : super(AdressState(adressModel: adressModel, selectedAdressKey: 'home'));
  Map<String, AdressModel> adressModel;

  void selectAdress(String key, BuildContext context) {
    if (key == 'home') {
      adressModel = {
        'home': adressModel['home']!.copyWith(
          selected: true,
        ),
        'office': adressModel['office']!.copyWith(
          selected: false,
        ),
      };
    } else {
      adressModel = {
        'home': adressModel['home']!.copyWith(
          selected: false,
        ),
        'office': adressModel['office']!.copyWith(
          selected: true,
        ),
      };
      BlocProvider.of<UserInfoCubit>(context).selectedAdress('office');
    }

    // print(adressModel[key]!.selected);

    emit(AdressState(adressModel: adressModel, selectedAdressKey: key));
  }
}

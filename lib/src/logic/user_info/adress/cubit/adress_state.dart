part of 'adress_cubit.dart';

class AdressState extends Equatable {
  const AdressState(
      {required this.adressModel, required this.selectedAdressKey});
  final String selectedAdressKey;

  final Map<String, AdressModel> adressModel;

  @override
  List<Object> get props => [selectedAdressKey];
}

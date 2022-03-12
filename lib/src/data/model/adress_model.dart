class AdressModel {
  String city;
  String street;
  int zipCode;
  int phoneNumber;
  bool selected;
  AdressModel({
    required this.city,
    required this.street,
    required this.zipCode,
    required this.phoneNumber,
    required this.selected,
  });

  AdressModel copyWith({
    String? city,
    String? street,
    int? zipCode,
    int? phoneNumber,
    bool? selected,
  }) {
    return AdressModel(
      city: city ?? this.city,
      street: street ?? this.street,
      zipCode: zipCode ?? this.zipCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      selected: selected ?? this.selected,
    );
  }
}

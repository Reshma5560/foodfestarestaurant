import 'package:flutter/material.dart';

class VariationControllerModel {
  TextEditingController? nameController;
  List<AdditionalModel>? additionalController;

  VariationControllerModel({this.nameController, this.additionalController});
}

class AdditionalModel {
  TextEditingController? optionName;
  TextEditingController? additionalPrice;

  AdditionalModel({this.optionName, this.additionalPrice});
}

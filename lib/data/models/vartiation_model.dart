import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariationControllerModel {
  TextEditingController? nameController;
  final RxList<RxList<InnerListModel>>? outerList;

  VariationControllerModel({this.nameController, this.outerList});
}

class InnerListModel {
  TextEditingController? optionName;
  TextEditingController? additionalPrice;

  InnerListModel({this.optionName, this.additionalPrice});
}

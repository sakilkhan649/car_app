import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  // Category checkboxes
  var categories = <String, RxBool>{
    'Engine Parts': false.obs,
    'Brake System': false.obs,
    'Transmission': false.obs,
    'Electrical': false.obs,
    'Suspension': false.obs,
    'Body Parts': false.obs,
  };

  // Condition checkboxes
  var conditions = <String, RxBool>{
    'New': false.obs,
    'Used': false.obs,
    'Refurbished': false.obs,
  };

  // Expand/collapse sections
  var expanded = <String, RxBool>{
    'Category': true.obs,
    'Price Range': true.obs,
    'Condition': true.obs,
    'Location': true.obs,
  };

  // Range slider
  Rx<RangeValues> priceRange = const RangeValues(50, 100000).obs;

  // Location section
  RxBool useLocation = false.obs;
  RxString locationText = 'Location Set (23.80,90.42)'.obs;
  RxString distanceKm = '10'.obs;
}

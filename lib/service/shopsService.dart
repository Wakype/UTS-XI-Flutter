import 'package:flutter/services.dart';
import '../model/shopsData.dart';

class FoodService {
  getData() async {
    final String response = await rootBundle.loadString('assets/json/shopList.json');

    DataShops data = dataShopsFromJson(response);
    return data.data;
  }
}

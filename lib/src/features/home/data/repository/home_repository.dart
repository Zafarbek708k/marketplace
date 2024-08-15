import 'dart:developer';

import 'package:marketplace/src/common/server/api/api_constants.dart';
import 'package:marketplace/src/features/home/data/entity/product_model.dart';

import '../../../../common/server/api/api.dart';

class HomeRepository{


  Future<void> getData()async{
    String? result = await ApiService.get(ApiConst.apiProduct, ApiParams.emptyParams());
    log(result ?? " home Repo result null");
    if(result != null){
      ProductModel productModel = productModelFromJson(result) as ProductModel;
    }else{
      log("result == null");
    }
  }
}
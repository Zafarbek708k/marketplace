import 'dart:developer';

import 'package:marketplace/src/common/server/api/api_constants.dart';
import 'package:marketplace/src/features/home/data/entity/product_model.dart';
import 'package:marketplace/src/features/home/data/entity/product_post_model.dart';

import '../../../../common/server/api/api.dart';

class HomeRepository{


  static Future<List<ProductModel>>getData()async{
    List <ProductModel> list = [];
    String? result = await ApiService.get(api: ApiConst.apiProduct,baseUrl: ApiConst.baseUrl, params:  ApiParams.emptyParams());
    log(result ?? " home Repo result null");
    if(result != null){
       list = productModelFromJson(result);
       return list;
    }else{
      return [];
    }
  }


  static Future<List<ProductPostModel>>getBasketData()async{
    List <ProductPostModel> list = [];
    String? result = await ApiService.get(api: ApiConst.apiBasket,baseUrl: ApiConst.baseUrlPost, params:  ApiParams.emptyParams());
    if(result != null){
      list = productPostModelFromJson(result);
      log("list ketti home repo get basket ");
      return list;
    }else{
      return [];
    }
  }

  static Future<void>deleteProduct({required String id})async{
   String? result =  await ApiService.delete(api: ApiConst.apiBasket,id: id, baseUrl: ApiConst.baseUrlPost, params: ApiParams.emptyParams());
   log(result ?? "delete result is null");

  }



  static Future<void>postData({required ProductModel product})async{
    String? result = await ApiService.post(api: ApiConst.apiBasket,baseUrl: ApiConst.baseUrlPost, data: product.toJson());
    log(result ?? "null keldi ");
    if(result != null){

    }else{

    }
  }
}
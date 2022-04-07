import 'package:bloc/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part "upd_new_store.g.dart";
class UpdNew = _UpdNew with _$UpdNew;

abstract class _UpdNew with Store{
  
 @observable final titleController = TextEditingController();
 @observable final bodyController = TextEditingController();
 @observable final userIdController = TextEditingController();
 @observable final idController = TextEditingController();
  
  apiPostAdd(String title,String id)async{
    if(title=="Add"){
      Map<String,String> params = {
      "title":titleController.text.trim(),
      "body":bodyController.text.trim(),
      "userId":userIdController.text.trim()
    };

  var respons = await Network.POST(Network.API_CREATE, params);
  if(respons!=null){
   
  }
    }else{
     
     Map<String,String> params = {
      "id":idController.text.trim(),
      "title":titleController.text.trim(),
      "body":bodyController.text.trim(),
      "userId":userIdController.text.trim()
    };
    
    var respons = await Network.PUT(Network.API_UPDATE+id, params);
  if(respons!=null){
   
  }

    }
  }

}
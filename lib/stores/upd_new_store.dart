import 'dart:convert';

import 'package:bloc/model/post_model.dart';
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
 @observable bool loading = false; 
  apiPostAdd(String title,String id,context)async{
    if(title=="Add"){
      loading = true;
       Map<String,String> params1 = {
      "title":titleController.text.trim(),
      "body":bodyController.text.trim(),
      "userId":userIdController.text.trim()
    };
    
  var respons = await Network.POST(Network.API_CREATE, params1);
  if(respons!=null){
   loading = false;
    Navigator.pop(context,true);
  }
    }
  else{
    loading = true;
     Map<String,String> params2 = {
      "id":idController.text.trim(),
      "title":titleController.text.trim(),
      "body":bodyController.text.trim(),
      "userId":userIdController.text.trim()
    };
    var respons = await Network.PUT(Network.API_UPDATE+id, params2);
  if(respons!=null){
   loading = false;
    Navigator.pop(context,true);
  }
    }
  }

  choose(Post post){
      titleController.text = post.title;
      bodyController.text = post.body;
      userIdController.text = post.userId.toString();
      idController.text = post.id.toString();
  }

}
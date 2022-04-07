// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:bloc/services/http_service.dart';
import 'package:bloc/stores/upd_new_store.dart';
import 'package:flutter/material.dart';

class UpdateAndAdd extends StatefulWidget {
  const UpdateAndAdd({ Key? key, required this.title, required this.id, this.post }) : super(key: key);
  final String title;
  final String id;
  final dynamic post;
  @override
  State<UpdateAndAdd> createState() => _UpdateAndAddState();
}

class _UpdateAndAddState extends State<UpdateAndAdd> {
  
  UpdNew updnew = UpdNew();
   
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updnew.choose(widget.post);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(widget.title),
      centerTitle: true,
      ),
      body: updnew.loading?Center(child: CircularProgressIndicator(),):Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: updnew.titleController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                labelText: "title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 1
                  )
                )
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: updnew.bodyController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                labelText: "body",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 1
                  )
                )
              ),
            ),
             SizedBox(height: 10,),
            TextField(
              controller: updnew.userIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                labelText: "userId",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 1
                  )
                )
              ),
            ),
            widget.title!="Add"?Column(
              children: [
                SizedBox(height: 10,),
            TextField(
              controller: updnew.idController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                labelText: "id",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 1
                  )
                )
              ),
            ),
              ],
            ):Container(),
            SizedBox(height: 20,),
            FlatButton(
              height: 50,
              minWidth: double.infinity,
              onPressed: (){
                
              updnew.apiPostAdd(widget.title,widget.id);
            },
             child: Text("Ok",style: TextStyle(color: Colors.white),),
             color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}
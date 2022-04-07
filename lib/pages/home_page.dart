// ignore_for_file: prefer_const_constructors

import 'package:bloc/model/post_model.dart';
import 'package:bloc/pages/update_and_newAdd_post.dart';
import 'package:bloc/services/http_service.dart';
import 'package:bloc/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
 HomeStore store =  HomeStore();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("setState"),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_)=>Stack(
        children: [
          ListView.builder(
            itemCount: store.items.length,
            itemBuilder:(context,index){
              return itemOfPost(store.items[index]);
            } ),
           store.loading?Center(child: CircularProgressIndicator(),):SizedBox.shrink() 
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateAndAdd(title: "Add",id: "0",))).then((value){
             if(value){
               store.apiPostList();
             }
           });
        },
        child: Icon(Icons.add),
      ),
    );
  }
  Widget itemOfPost(Post post){

    return Slidable(
      direction: Axis.horizontal,
      startActionPane: ActionPane(
      extentRatio: 0.25,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (value){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateAndAdd(title: "Update",id: post.id.toString(),post:post))).then((value){
             if(value){
               store.apiPostList();
             }
           });
          },
         backgroundColor: Colors.indigo,
         icon: Icons.edit,
         label: "Update", 
          )
      ],),
      endActionPane: ActionPane(
      extentRatio: 0.25,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (value){
          store.apiPostdelete(post);
          },
         backgroundColor: Colors.red,
         icon: Icons.delete,
         label: "delete", 
          )
      ],),
      child:Container(
      padding: EdgeInsets.only(top: 20,left: 20,right: 20),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(post.title.toUpperCase(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text(post.body)
        ],
      ),
    ) );
  }
}
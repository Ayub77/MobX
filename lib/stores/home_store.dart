

import 'package:bloc/model/post_model.dart';
import 'package:bloc/services/http_service.dart';
import 'package:mobx/mobx.dart';
part "home_store.g.dart";
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{
  
 @observable bool loading = false;
 @observable List<Post> items = [];
 
Future apiPostList()async{
     loading = true;
    var respons = await Network.GET(Network.API_LIST, Network.paramsEmpty());
     if(respons!=null){
      items = Network.parsePostList(respons);
    }else{
      items = [];
    }
    loading = false;
 }


 Future<bool> apiPostdelete(Post post)async{
   loading = true;
  var respons = await Network.DEL(Network.API_DELETE+post.id.toString(), Network.paramsEmpty());
    loading = false;
    return respons!=null;

 }

}

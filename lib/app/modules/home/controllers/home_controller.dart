//import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:final_project/app/data/response/home_response.dart';
import 'package:final_project/app/utilities/auth_repo.dart';


class HomeController extends GetxController {
  
bool favorite = false;
  static int selectedIndex = 0;
 
  List<int> likedIndex =[];
  AuthRepo authRepo = AuthRepo();
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<Posts>?> viewData() async {

    HomeResponse? homePageResponse =await authRepo.userData();
    if (homePageResponse != null) {

        return homePageResponse.posts;
    }else{
      Get.snackbar('Failed!','No Data');
    }

 }
 void toggleLike(Posts post,int index) {
  // print("index:$post");
  // post.likesCount++;
    if (likedIndex.contains(index)) {
      likedIndex.remove(index);
      post.likesCount=post.likesCount!-1;
    } else {
      likedIndex.add(index);
      post.likesCount=post.likesCount!+1;
    }
    update();
  }
}

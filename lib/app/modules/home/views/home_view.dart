import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/app/common_widgets/circular_image_view.dart';
import 'package:final_project/app/common_widgets/common_divider.dart';
import 'package:final_project/app/common_widgets/image_description.dart';
import 'package:final_project/app/common_widgets/image_view.dart';
import 'package:final_project/app/common_widgets/text_view.dart';
import 'package:final_project/app/data/response/home_response.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(text: 'Helooo , ', 
              fontSize: 23, 
              color: Colors.black,
              fontWeight: FontWeight.w500,
              left: 25.0,),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Image.asset('assets/images/message_circle.png',width: 34,height: 34,),
              )],),
          SizedBox(height: 20,),
         
          FutureBuilder <List<Posts>?>(
            future: controller.viewData(),
            builder: (context,AsyncSnapshot<List<Posts>?> snapshot){
              if(snapshot.connectionState != ConnectionState.done){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                return Column(
                  children: [
                    SizedBox(
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Column(
                            children:[
                              ImageView(imageUrl:snapshot.data?[index].profileImageUrl ?? "", 
                              radius: 360,left: 18.0,width: 75,height: 75,
                              ),
                            SizedBox(height: 10,),
                            TextView(text: snapshot.data?[index].profileName ?? "", 
                            fontSize: 14, 
                            color: Colors.black),
                            ],
                            );
                        },itemCount: snapshot.data?.length ?? 0,),
                        ),
                   
                    CommonDivider(color: Colors.grey, endIndent: 20.0, indent: 20.0),
                    SizedBox(
                      height: MediaQuery.of(context).size.height-300,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){

                        return Column(
                          children: [
                            Row(
                              children: [CircularImageView(pathUrl: snapshot.data?[index].profileImageUrl ?? "", width: 41, height: 41, radius: 360),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: SizedBox(
                                    height: 40,
                                    child: Column(
                                      children: [
                                        TextView(text: 'Posted By',fontSize: 13,fontWeight: FontWeight.w400,fontFamily: 'inter',color: Colors.grey,),
                                        TextView(text:snapshot.data?[index].profileName ?? "",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black,fontFamily: 'inter',),
                                      ],
                                    ),

                                    // Text('Posted By',style: TextStyle(fontFamily: 'inter',fontWeight: FontWeight.w400,fontSize: 13,color: Colors.grey),),
                                  ),
                                )],
                            ),
                            SizedBox(height: 10,),
                            ImageDescription(left: 25.0, radius: 9.0, width: 350, height: 227, postImage: snapshot.data?[index].postImage ?? "",),
                            SizedBox(height: 10,),
                            TextView(text: snapshot.data?[index].postDescription ?? "", fontSize: 14, color:Colors.black,fontWeight: FontWeight.w400,fontFamily: 'inter'),
                            SizedBox(height: 20,),
                            
                            
                            Row(
                              children: [Padding(
                              padding: const EdgeInsets.only(left: 25.0,right: 5),
                              child: Icon(Icons.chat_bubble_outline,size: 24,),
                            ),
                              Text(snapshot.data?[index].commentsCount.toString() ?? "0",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'inter',color: Colors.black,),),
                              SizedBox(width: 100,),
                              GestureDetector(

                                onTap: (){
                                   controller.toggleLike(snapshot.data![index],index);

                                },
                                child:controller.likedIndex.contains(index) ?Icon(Icons.favorite_border_outlined,color: Colors.red):Icon(Icons.favorite_border_outlined),

                              ),
                              SizedBox(width: 5,),
                              TextView(text:snapshot.data?[index].likesCount.toString() ?? "0",
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black,
                              ),
                            ],
                            ),
                            SizedBox(height: 20,),
                            Divider(color: Colors.grey,endIndent: 20.0,indent: 20.0,),
                          ],
                        );

                      },itemCount: snapshot.data?.length ?? 0,),
                    )

                  ],
                );
              }
            },
          )

        ],
      ),

    );
  }
}

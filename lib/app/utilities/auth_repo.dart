import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:final_project/app/data/response/home_response.dart';
import 'package:final_project/app/data/response/login_response.dart';
import 'package:final_project/app/data/response/reg_response.dart';
import 'package:final_project/app/utilities/dio_client.dart';



class AuthRepo{
  DioClient dioClient = GetIt.instance<DioClient>();
  Future<LoginResponse?> login({required String email ,required String password}) async{
   try {
      
      Response response = await dioClient.request({'email':email,'password':password}, RequestType.post, 'https://reqres.in/api/login');
      print(response);
      // Handle the response based on your API
      if (response.statusCode == 200) {
        // Login successful
        // Do something with the response data
        //_ShowDailaogeLogin(email);
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(email: email,)));
       LoginResponse loginResponse = LoginResponse.fromJson(response.data);
       return loginResponse;
      }
      else{
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
       return loginResponse;  
      }
    } on DioException catch(e){
      if (e.response?.statusCode != 400){
       LoginResponse loginResponse = LoginResponse.fromJson(e.response!.data);
       return loginResponse;
      }
      if (e.response != null) {
        // Server responded with a bad status code
        print('Error: ${e.response!.statusCode}');
        print('Message: ${e.response!.data}');
        return null;

      } else {
        // Request failed before getting a response
        print('Error: ${e.message}');
        return null;
      }
    }
  }
  
  
  Future<RegResponse?> registraion({required String email ,required String password}) async{
   try {
      
      Response response = await dioClient.request({'email':email,'password':password}, RequestType.post, 'https://reqres.in/api/register');
      print(response);
      // Handle the response based on your API 
      if (response.statusCode == 200) {
        // Login successful
        // Do something with the response data
        //_ShowDailaogeLogin(email);
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(email: email,)));
       RegResponse regResponse = RegResponse.fromJson(response.data);
       return regResponse;
      }
      else{
      RegResponse regResponse = RegResponse.fromJson(response.data);
       return regResponse;  
      }
    } on DioException catch(e){
      if (e.response?.statusCode != 400){
       RegResponse regResponse = RegResponse.fromJson(e.response!.data);
       return regResponse;
      }
      if (e.response != null) {
        // Server responded with a bad status code
        print('Error: ${e.response!.statusCode}');
        print('Message: ${e.response!.data}');
        return null;

      } else {
        // Request failed before getting a response
        print('Error: ${e.message}');
        return null;
      }
    }
  }

  Future<HomeResponse?> userData() async{
    try{
      Response response = await dioClient.request({}, RequestType.get, 'https://mocki.io/v1/704d9b75-8533-4e21-8879-8f15585495c0');
      print(response);
      if (response.statusCode == 200) {
        // Login successful
        // Do something with the response data
        // _ShowDailaogeLogin(email);
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(email: email,)));
        HomeResponse homePageResponse = HomeResponse.fromJson(response.data);
        return homePageResponse;
      }
      else{
        HomeResponse homePageResponse = HomeResponse.fromJson(response.data);
        return homePageResponse;
      }
    } on DioException catch(e){
      if (e.response?.statusCode==400) {
        HomeResponse homePageResponse = HomeResponse.fromJson(e.response?.data);
        return homePageResponse;
      }
      if (e.response != null) {
        // Server responded with a bad status code
        print('Error: ${e.response!.statusCode}');
        print('Message: ${e.response!.data}');
        return null;
      } else {
        // Request failed before getting a response
        print('Error: ${e.message}');
        return null;


      }
    }

  }
  
  }

  
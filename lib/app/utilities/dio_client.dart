import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class DioClient{
  final Dio dio;
  DioClient(this.dio){
  dio.interceptors.add(PrettyDioLogger());
// final  Dio dio = Dio();
  }
  Future<Response> request(Map<String,String>? queryParameters,RequestType requestType,String url) async{
    Response response;
    try{
      switch(requestType){
        case RequestType.post:
          response  = await dio.post(url,data: queryParameters);
          break;
        case RequestType.get:
          response = await dio.get(url,queryParameters: queryParameters);
          break;
      }
    }on DioException catch(e){
      if(e.response != null){
      response = Response(requestOptions: e.requestOptions,
      statusCode: e.response?.statusCode ,
      statusMessage: e.message,
      data: e.response?.data
      );
      
      }else {
      response = Response(requestOptions: RequestOptions(),
      statusCode: 999,
      statusMessage: e.message ,
      );
    }
    }
    return response;
  }

}
enum RequestType{
  get,
  post,
}

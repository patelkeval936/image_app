import 'package:dio/dio.dart';
import 'package:image_app/models/app_image.dart';
import '../values/app_constants.dart';

class APIClient {

  Dio _dio = Dio();

  Future<List<AppImage>> getImages()async{
    Response response = await _dio.get(AppConstants.api,
    options: Options(

      headers: {
        'Authorization' : AppConstants.apiKey
      }
    ));

    List<AppImage> images = [];

    List responseData = response.data['photos'];
    print(responseData);
    print(responseData.length);
    responseData.forEach((element) {
      images.add(AppImage(element['src']['original']));
    });

    return images;
  }

}
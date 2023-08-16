import 'package:bloc/bloc.dart';
import 'package:image_app/API/api_client.dart';
import 'package:image_app/models/app_image.dart';


class ImageCubit extends Cubit<List<AppImage>> {
  ImageCubit() : super([]);

  void getImages() async {
    APIClient _client = APIClient();
    List<AppImage> images = await _client.getImages();
    emit(images);
  }

}
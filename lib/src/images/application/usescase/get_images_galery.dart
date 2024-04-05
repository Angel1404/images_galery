import 'package:gelery_images/src/images/domain/domain.dart';

import '../application.dart';

class GetImageGalery implements AppplicationI<List<ImageResponse>, ParamModel> {
  final ImageGaleryI _imageGaleryimple;

  GetImageGalery({required ImageGaleryI imageGaleryimple}) : _imageGaleryimple = imageGaleryimple;

  @override
  Future<List<ImageResponse>> call(ParamModel data) async {
    try {
      return await _imageGaleryimple.get(page: data.page, perPage: data.pagePer);
    } catch (e) {
      throw e.toString();
    }
  }
}

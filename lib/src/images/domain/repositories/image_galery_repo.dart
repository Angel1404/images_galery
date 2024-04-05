import '../../infrastructure/infrastructure.dart';
import '../domain.dart';

class ImageGaleryRepo implements ImageGaleryI {
  final ImageGaleryService _imageGaleryService;

  ImageGaleryRepo({required ImageGaleryService imageGaleryService}) : _imageGaleryService = imageGaleryService;

  @override
  Future<List<ImageResponse>> get({int page = 1, int perPage = 10}) async {
    try {
      final response = await _imageGaleryService.get(page: page, perPage: perPage);
      if (response.isEmpty) return [];
      return response.map((e) => ImageResponse.fromJson(e)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}

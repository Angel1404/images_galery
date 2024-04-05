import '../domain.dart';

abstract class ImageGaleryI {
  Future<List<ImageResponse>> get({int page = 1, int perPage = 10});
}

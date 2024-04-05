import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gelery_images/src/src.dart';

class ImageGaleryController extends StateNotifier<ImageGaleryState> {
  ImageGaleryController(this._getImagesGaleryUC) : super(ImageGaleryState());

  final GetImageGalery _getImagesGaleryUC;

  set isLoading(bool value) => state = state.copyWith(isLoading: value);
  set isLoadingFinish(bool value) => state = state.copyWith(isLoadingFinish: value);
  set addPage(int value) => state = state.copyWith(page: value);
  set errorText(String value) => state = state.copyWith(errorText: value);
  set imagesGalery(List<ImageResponse> data) => state = state.copyWith(imagesGalery: data);
  set imagesGaleryFilter(List<ImageResponse> data) => state = state.copyWith(imagesGaleryFilter: data);

//Metodo para obtener las imagenes de la api y hacer el scroll infinito
  Future getImages() async {
    try {
      if (state.isLoadingFinish) return;
      isLoading = true;
      final pageNew = state.page + 1;
      addPage = pageNew;
      final response = await _getImagesGaleryUC.call(ParamModel(page: pageNew));
      if (response.isEmpty) {
        isLoadingFinish = true;
      } else {
        List<ImageResponse> imagesGaneryNow = [...state.imagesGalery];
        imagesGaneryNow.addAll(response);
        imagesGalery = imagesGaneryNow;
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;

      errorText = e.toString();
    }
  }

  //Metodo para filtrar las imagenes por descripcion.
  filterImage(String input) async {
    if (input.isEmpty) {
      imagesGaleryFilter = [];
      return;
    }
    imagesGaleryFilter = state.imagesGalery.where((imegen) => imegen.alternativeSlugs.es.contains(input)).toList();
  }
}

class ImageGaleryState {
  final int page;
  final int pagePer;
  final bool isLoading;
  final bool isLoadingFinish;
  final String errorText;
  final List<ImageResponse> imagesGalery;
  final List<ImageResponse> imagesGaleryFilter;

  ImageGaleryState({
    this.page = 0,
    this.pagePer = 10,
    this.imagesGalery = const [],
    this.imagesGaleryFilter = const [],
    this.isLoading = false,
    this.isLoadingFinish = false,
    this.errorText = "",
  });

  ImageGaleryState copyWith({
    int? page,
    int? pagePer,
    bool? isLoading,
    bool? isLoadingFinish,
    String? errorText,
    List<ImageResponse>? imagesGalery,
    List<ImageResponse>? imagesGaleryFilter,
  }) {
    return ImageGaleryState(
      page: page ?? this.page,
      pagePer: pagePer ?? this.pagePer,
      imagesGalery: imagesGalery ?? this.imagesGalery,
      imagesGaleryFilter: imagesGaleryFilter ?? this.imagesGaleryFilter,
      isLoading: isLoading ?? this.isLoading,
      isLoadingFinish: isLoadingFinish ?? this.isLoadingFinish,
      errorText: errorText ?? this.errorText,
    );
  }
}

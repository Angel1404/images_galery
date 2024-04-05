import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../src.dart';

//PROVIDER
//Para la inyección de dependencias en las clases y no tener una instancia en ellas de la clase que vayamos a necesitar.
final imageServiceProvider = Provider((ref) => ImageGaleryService()); // Provider of service
final imageGaleryRepoProvider = Provider((ref) => ImageGaleryRepo(imageGaleryService: ref.read(imageServiceProvider))); // Provider of Repo
final getImageGaleryUCProvider =
    Provider((ref) => GetImageGalery(imageGaleryimple: ref.read(imageGaleryRepoProvider))); // Provider of  GetImageGaleryUsesCase

//STATESPROVIDER
//Estados de nuestros provider o controller.
final homeProvider = StateNotifierProvider<HomeController, HomeState>((ref) => HomeController());
final imageGaleryProvider =
    StateNotifierProvider.autoDispose<ImageGaleryController, ImageGaleryState>((ref) => ImageGaleryController(ref.read(getImageGaleryUCProvider)));

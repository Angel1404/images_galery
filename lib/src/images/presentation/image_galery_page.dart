import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src.dart';

class ListImageGaleryPage extends ConsumerStatefulWidget {
  const ListImageGaleryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListImageGaleryPageState();
}

class _ListImageGaleryPageState extends ConsumerState<ListImageGaleryPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    final imageGProvider = ref.read(imageGaleryProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      imageGProvider.getImages();
    });

    //Estamos pendiente del scroll que se haga en el Grid para asi saber cuando llamar a los demas datos.
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      //Validamos que cuando estemos a menos 10 pixeles del final, hacer la llamada a la otra paginacóon
      if (currentScroll >= (maxScroll - 10)) {
        imageGProvider.getImages();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageGaleryState = ref.watch(imageGaleryProvider);
    final listImagenesGalery = imageGaleryState.imagesGaleryFilter.isEmpty ? imageGaleryState.imagesGalery : imageGaleryState.imagesGaleryFilter;
    return Column(
      children: [
        if (imageGaleryState.errorText.isNotEmpty) ...[
          Center(
            child: Text(
              "Ups... Hubo un error - ${imageGaleryState.errorText}",
              style: const TextStyle(color: Colors.red, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          )
        ],
        if (imageGaleryState.imagesGalery.isNotEmpty)
          Flexible(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              controller: _scrollController,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(
                listImagenesGalery.length,
                (index) {
                  final image = listImagenesGalery[index];
                  return ItemsImages(image: image);
                },
              ),
            ),
          ),
        if (imageGaleryState.isLoading && !imageGaleryState.isLoadingFinish) ...[
          const SizedBox(
            width: double.maxFinite,
            child: Center(child: CircularProgressIndicator.adaptive()),
          )
        ] else if (imageGaleryState.isLoadingFinish) ...[
          const SizedBox(
            width: double.maxFinite,
            child: Center(child: Text("No hay mas imagenes para mostrar")),
          )
        ]
      ],
    );
  }
}

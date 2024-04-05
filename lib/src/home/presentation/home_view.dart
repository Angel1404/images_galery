import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gelery_images/src/src.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final homeState = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: AnimatedSwitcher(
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          duration: const Duration(milliseconds: 450),
          child: homeState.indexSeleted == 1
              ? const SearchInput()
              : const Text(
                  "Pantalla de inicio",
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: selectedBody(homeState.indexSeleted),
      ),
      bottomNavigationBar: const BtnNavBar(),
    );
  }

  Widget selectedBody(int index) {
    switch (index) {
      case 1:
        return const ListImageGaleryPage();

      default:
        return const SizedBox();
    }
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class SearchInput extends ConsumerStatefulWidget {
  const SearchInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchInputState();
}

class _SearchInputState extends ConsumerState<SearchInput> {
  Timer? _debounceTimer;

  //Metodo para poder hacer la busqueda de la imagen cuando el usuario deje de escribir por medio segundo
  void _onTypingFinished(String text) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      ref.read(imageGaleryProvider.notifier).filterImage(text);
    });
  }

  @override
  void dispose() {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: "Busca imagenes x descripción",
        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        constraints: BoxConstraints(
          maxHeight: 45,
          minWidth: 150,
          maxWidth: 250,
        ),
      ),
      onChanged: _onTypingFinished,
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState());

  set seletedIndex(int index) => state = state.copyWith(indexSeleted: index);
}

class HomeState {
  final int indexSeleted;

  HomeState({this.indexSeleted = 0});

  HomeState copyWith({int? indexSeleted}) => HomeState(
        indexSeleted: indexSeleted ?? this.indexSeleted,
      );
}

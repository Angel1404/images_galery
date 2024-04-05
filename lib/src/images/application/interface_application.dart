abstract class AppplicationI<T, Param> {
  Future<T> call(Param data);
}

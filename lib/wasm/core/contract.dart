abstract class WasmContract {
  WasmContract.loadFromAsset(String path);
  Future<bool> initialized();

  Object callfunc(String name, List<int> input);

  bool get isLoaded;
}

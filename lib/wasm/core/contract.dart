abstract class WasmContract {
  WasmContract.loadFromAsset(String path);
  Future<bool> initialized();

  bool get isLoaded;
}

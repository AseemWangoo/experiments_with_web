import 'package:experiments_with_web/wasm/core/contract.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:wasm_interop/wasm_interop.dart';

class WasmLoader extends WasmContract {
  Instance _wasmInstance;
  String _path;

  WasmLoader.loadFromAsset(String path)
      : _path = path,
        super.loadFromAsset(path);

  @override
  Future<bool> initialized() async {
    assert(_path != null);

    try {
      final bytes = await rootBundle.load(_path);
      _wasmInstance = await Instance.fromBufferAsync(bytes.buffer);

      return isLoaded;
    } catch (exc) {
      print('ERROR WHILE INITIALIZING ${exc.toString()}');
    }

    return false;
  }

  @override
  bool get isLoaded => _wasmInstance != null;

  @override
  Object callfunc(String name, List<int> input) {
    final _func = _wasmInstance.functions[name];
    return _func.call(input.first, input.last);
  }
}

@JS()
library stringify;

import 'package:js/js.dart';

// Calls invoke JavaScript `JSON.stringify(obj)`.
@JS('JSON.stringify')
external String stringify(Object obj);

// IF removed line 1,2 gives the error at line 13

// IF named incorrectly `at line 7` then gives error as
// Uncaught Bad state: Source maps are not done loading.

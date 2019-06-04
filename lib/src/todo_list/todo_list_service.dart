import 'dart:async';

import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  Future<String> getNewTodo() async =>
      Future.delayed(Duration(seconds: 2), () => 'getNewTodo');
}

import 'package:angular/angular.dart';

import 'src/todo_list/todo_list_component.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [TodoListComponent],
)
class AppComponent {}

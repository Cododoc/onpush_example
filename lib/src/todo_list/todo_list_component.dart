import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'todo_list_service.dart';

@Component(
    selector: 'todo-list',
    styleUrls: ['todo_list_component.css'],
    templateUrl: 'todo_list_component.html',
    directives: [NgClass, formDirectives],
    providers: [ClassProvider(TodoListService)],
    changeDetection: ChangeDetectionStrategy.OnPush)
class TodoListComponent implements OnInit {
  TodoListComponent(this.todoListService, this._cdr);

  final TodoListService todoListService;
  final ChangeDetectorRef _cdr;

  String newTodo = '';

  Map<String, bool> setCssValidityClass(NgControl control) {
    print(
        'setCssValidityClass: newTodo = $newTodo; control.valid = ${control.valid}; control.value = ${control.value}');

    if (control.control != null) {
      print(control.validator(control.control));
    }

    final validityClass = control.valid == true ? 'is-valid' : 'is-invalid';
    return {validityClass: true};
  }

  Future<void> readItems() async {
    newTodo = await todoListService.getNewTodo();
    print('Set data to newTodo');
    _cdr.markForCheck();
  }

  @override
  Future<Null> ngOnInit() async {
    print('OnInit: newTodo = $newTodo');
    await readItems();
  }
}

// Copyright (c) 2017, isdsw. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';
import 'dart:js' as js;

import 'todo_list/todo_list_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, TodoListComponent, COMMON_DIRECTIVES],
  providers: const [materialProviders],
)
class AppComponent implements OnInit{
  String date;

  @override
  ngOnInit() {
    var function = new js.JsFunction.withThis((input,val,object) {
      date = val;
      print(input);
      print(val);
      print(object);
    });
    js.context.callMethod(r'$', ['#datepicker'])
        .callMethod('datepicker', [new js.JsObject.jsify({'onSelect':function})]);
  }

}

import 'package:angular/angular.dart';

import 'main.template.dart' as ng;

// ignore: strong_mode_implicit_dynamic_function, strong_mode_implicit_dynamic_function, argument_type_not_assignable
void main() => runApp(ng.AppComponentNgFactory);

@Component(
  selector: 'app',
  template: 'Hello World',
)
class AppComponent {}

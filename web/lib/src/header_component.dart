import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:web/movies_service.dart';

@Component(
  selector: 'header',
  templateUrl: 'header_component.html',
  styleUrls: const ['header_component.css'],
  directives: const [NgStyle],
)
class HeaderComponent {
  final MoviesService _service;
  final Router _router;

  HeaderComponent(this._service, this._router) {
    this._router.onRouteActivated.listen((RouterState state) async {
      if(state.path.startsWith('/movie/')) {
        var id = state.parameters['id'];
        var item = await _service.getMovie(int.parse(id));
        setBackground(item['hero_image']);
      }
      else {
        setBackground();
      }
    });
    setBackground();
  }

  Map<String, String> currentStyle = <String, String>{};
  String movieName = 'STAR WARS MOVIES';

  void setBackground([String bg ='static/images/death_star_image.jpg']) {
    currentStyle = <String, String>{
      'background-image': 'url(\'$bg\')'
    };
  }

}

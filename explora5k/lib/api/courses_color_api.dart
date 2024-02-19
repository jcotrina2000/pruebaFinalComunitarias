import 'package:explora5k/helpers/http.dart';
import 'package:explora5k/helpers/http_response.dart';
import 'package:explora5k/services/authentication_client.dart';

//clase con metodo para obtener cursos activos del estudiante
class CoursesColorsAPI {
  final Http _http;
  final AuthenticationClient _authenticationClient;

  CoursesColorsAPI(this._http, this._authenticationClient);

  Future<HttpResponse> getColors() async {
    final userData = await _authenticationClient.userData;
    return _http.request('/api/v1/users/self/colors',
        method: 'GET', headers: {"Authorization": "Bearer " + userData.token});
  }
}
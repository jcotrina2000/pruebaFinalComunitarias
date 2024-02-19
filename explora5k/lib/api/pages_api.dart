import 'package:explora5k/helpers/http.dart';
import 'package:explora5k/helpers/http_response.dart';
import 'package:explora5k/services/authentication_client.dart';

//clase con metodo para obtener cursos activos del estudiante
class PagesAPI {
  final Http _http;
  final AuthenticationClient _authenticationClient;

  PagesAPI(this._http, this._authenticationClient);

  Future<HttpResponse> getPages(int courseId) async {
    final userData = await _authenticationClient.userData;
    return _http.request('/api/v1/courses/$courseId/front_page',
        method: 'GET', headers: {"Authorization": "Bearer " + userData.token});
  }
}